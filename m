From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2016 09:55:58 +0100
Subject: [Buildroot] [git commit] package/linux-headers: add option to use
	same sources as the kernel
Message-ID: <20160202090739.5895781696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63abfb7210313fcc84b912ff2884b1357beff4b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some heavily (and most often improperly) modified Linux kernels may export
new APIs to userland, so as to speak to custom hardware or custom kernel
facilities.

However, we currently have no easy way to use such kernels as a source
for the linux-headers package, which precludes having those userland
headers intalled for userland applications to use them.

We do have a way for the kernel to use the same version as for the
headers, but that is definitely not enough, as the linux-headers package
has a version choice that is far less versatile and capable than that of
the linux package.

Add a new option for the linux-headers package, for the user to specify
that the version (really, the sources) of the kernel be used to install
the headers from.

We do that by making linux-headers patch-depend on the linux package.

We can't have linux-header simply depend on linux, because the simple
dependency means the the dependee will be configured, built and installed
before the dependent is configured. And since linux is a target package,
it depends on the toolchain, which internally dependes on linux-headers,
which would depend on linux, and we'd get a circular dependency.

Using patch-depend will ensure that linux is extracted and patched
before linux-headers is extracted, which is really all we need.

Then, we install the headers from the linux source tree, rather than
from linux-headers' source tree (as there's nothing in there!).

Since we need to install a private set for uClibc (see cde947f, uclibc:
prevent rebuilding after installation to staging), we explicitly set
INSTALL_HDR_PATH when calling the kernel' install-headers rule in
LINUX_HEADERS_CONFIGURE_CMDS, so that the headers are installed in
linux-headers' $(@D) instead of linux' $(@D).

Finally, as there is no way to know the kernel version in this case, we
must still prompt the user for the kernel series the headers are from
(like we do for a custom version) and check for consistency at build
time.

Note however that this still leaves users that want to built their
such-kernel outside of Buildroot out in the cold.

[Peter: drop comment as suggested by Thomas]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Karoly Kasza <kaszak@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                        |  1 +
 package/linux-headers/Config.in.host   |  7 ++++++-
 package/linux-headers/linux-headers.mk | 25 ++++++++++++++++++++++---
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 40d7844..8971192 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,6 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
+	depends on !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_TOOLCHAIN_BUILDROOT
 	help
 	  This option will re-use the same kernel sources as the one
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e556bbf..ad5ee2e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,12 +5,17 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
+	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
 	default BR2_KERNEL_HEADERS_4_4
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
 	  the kernel you intend to use on your target system.
 
+	config BR2_KERNEL_HEADERS_AS_KERNEL
+		bool "Same as kernel"
+		depends on BR2_LINUX_KERNEL
+
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
 		depends on !BR2_arc && !BR2_nios2
@@ -87,7 +92,7 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 choice
 	bool "Custom kernel headers series"
-	depends on BR2_KERNEL_HEADERS_VERSION
+	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	help
 	  Set to the kernel headers series you manually set above.
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 1b8b81b..6339280 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -7,6 +7,19 @@
 # This package is used to provide Linux kernel headers for the
 # internal toolchain backend.
 
+ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
+
+LINUX_HEADERS_VERSION = none
+LINUX_HEADERS_SOURCE =
+
+LINUX_HEADERS_LICENSE = $(LINUX_LICENSE)
+LINUX_HEADERS_LICENSE_FILES = $(LINUX_LICENSE_FILES)
+
+LINUX_HEADERS_PATCH_DEPENDENCIES = linux
+LINUX_HEADERS_REAL_DIR = $(LINUX_DIR)
+
+else # ! BR2_KERNEL_HEADERS_AS_KERNEL
+
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
@@ -16,9 +29,14 @@ else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
+
 LINUX_HEADERS_LICENSE = GPLv2
 LINUX_HEADERS_LICENSE_FILES = COPYING
 
+LINUX_HEADERS_REAL_DIR = $(@D)
+
+endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
+
 LINUX_HEADERS_INSTALL_STAGING = YES
 
 # linux-headers is part of the toolchain so disable the toolchain dependency
@@ -35,17 +53,18 @@ LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
 # uClibc building. This way uClibc doesn't modify linux headers on installation
 # of "its" headers
 define LINUX_HEADERS_CONFIGURE_CMDS
-	(cd $(@D); \
+	(cd $(LINUX_HEADERS_REAL_DIR); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
 			HOSTCXX="$(HOSTCXX)" \
+			INSTALL_HDR_PATH=$(@D)/usr \
 			headers_install)
 endef
 
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
-	(cd $(@D); \
+	(cd $(LINUX_HEADERS_REAL_DIR); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
@@ -55,7 +74,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			headers_install)
 endef
 
-ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
 define LINUX_HEADERS_CHECK_VERSION
 	$(call check_kernel_headers_version,\
 		$(STAGING_DIR),\

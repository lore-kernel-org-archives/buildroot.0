From: Karoly Kasza <kaszak@gmail.com>
Date: Tue, 28 Oct 2014 14:33:31 +0100
Subject: [Buildroot] [PATCH 1/1] linux-headers: allow use of headers from
	kernel "package" selected
Message-ID: <1414503211-38141-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change makes it possible to use exactly the same sources for both
headers during toolchain building and for kernel building itself, even
if custom kernel is selected.

That way user might be sure that ABI mismatch won't happen between toolchain
and kernel.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes v2 -> v3:
  - Forbid KERNEL_SAME_AS_HEADERS w/ HEADERS_SAME_AS_KERNEL
  - Made the calculation of LINUX_ variables to be a subroutine,
    which can be called compulsorily when needed

 linux/Config.in                        |    1 +
 linux/linux.mk                         |    7 +++++++
 package/linux-headers/Config.in.host   |   14 ++++++++++++--
 package/linux-headers/linux-headers.mk |    9 +++++++++
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 718afb5..a523f85 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,6 +26,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
 	depends on BR2_TOOLCHAIN_BUILDROOT
+	depends on !BR2_KERNEL_HEADERS_SAME_AS_KERNEL
 	help
 	  This option will re-use the same kernel sources as the one
 	  that have been used for the kernel headers of the
diff --git a/linux/linux.mk b/linux/linux.mk
index 6740d01..448952e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -8,6 +8,9 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
 
+# Compute variables as a function, so linux-headers can call it when needed
+define BR2_LINUX_COMPUTE_VARS
+
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
@@ -38,6 +41,10 @@ LINUX_SITE := $(LINUX_SITE)/testing/
 endif # -rc
 endif
 
+endef
+
+$(eval $(BR2_LINUX_COMPUTE_VARS))
+
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b494885..e6e3730 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,6 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
+	default BR2_KERNEL_HEADERS_SAME_AS_KERNEL if BR2_LINUX_KERNEL
 	default BR2_KERNEL_HEADERS_3_17
 	help
 	  Select the version of kernel header files you wish to use.
@@ -69,6 +70,13 @@ choice
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
+
+	config BR2_KERNEL_HEADERS_SAME_AS_KERNEL
+		bool "Use Linux kernel specified for target"
+		depends on BR2_LINUX_KERNEL
+		help
+		  Use the Linux kernel specified for the target in
+		  the Kernel menu.
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
@@ -80,10 +88,12 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 choice
 	bool "Custom kernel headers series"
-	depends on BR2_KERNEL_HEADERS_VERSION
+	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_SAME_AS_KERNEL
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	help
-	  Set to the kernel headers series you manually set above.
+	  Set to the kernel headers series you manually entered in
+	  "linux version" field or matching version of specific kernel selected
+	  for building in "kernel" section.
 
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index d770927..b4a1c8d 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -7,6 +7,14 @@
 # This package is used to provide Linux kernel headers for the
 # internal toolchain backend.
 
+ifeq ($(BR2_KERNEL_HEADERS_SAME_AS_KERNEL),y)
+# Force computing the variables from the Kernel package
+$(eval $(BR2_LINUX_COMPUTE_VARS))
+LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_HEADERS_SOURCE = $(LINUX_SOURCE)
+LINUX_HEADERS_SITE = $(LINUX_SITE)
+LINUX_HEADERS_SITE_METHOD = $(LINUX_SITE_METHOD)
+else
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
@@ -14,6 +22,7 @@ else
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
+endif
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
-- 
1.7.10.4

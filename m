From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 10:58:24 +0100
Subject: [Buildroot] [git commit] linux: drop the option to use the same
	version as that of the headers
Message-ID: <20160206095926.DCD8E803FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3e0583f9085eff4cd6d58460f4d044e895d6775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is no longer meaningful, now that we have the option to use the
kernel version for the linux headers, as it is more logical and more
versatile.

Add it to legacy.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 10 ++++++++++
 linux/Config.in  | 13 -------------
 linux/linux.mk   |  3 ---
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 793b116..b38cf90 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_LINUX_KERNEL_SAME_AS_HEADERS
+	bool "using the linux headers version for the kernel has been removed"
+	select BR2_LEGACY
+	help
+	  The option to use the version of the kernel headers for the
+	  kernel to build has been removed.
+
+	  There is now the converse, better-suited and more versatile
+	  option to use the kernel version for the linux headers.
+
 config BR2_PACKAGE_CUPS_PDFTOPS
 	bool "Pdftops support has been removed from Cups"
 	select BR2_LEGACY
diff --git a/linux/Config.in b/linux/Config.in
index 8971192..4d972e1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,18 +29,6 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "4.4.1"
 
-config BR2_LINUX_KERNEL_SAME_AS_HEADERS
-	bool "Same as toolchain kernel headers"
-	depends on !BR2_KERNEL_HEADERS_AS_KERNEL
-	depends on BR2_TOOLCHAIN_BUILDROOT
-	help
-	  This option will re-use the same kernel sources as the one
-	  that have been used for the kernel headers of the
-	  cross-compiling toolchain. Having the same version for the
-	  kernel running on the system and for the kernel headers is
-	  not a requirement, but using the same version allows to
-	  download only one tarball of the kernel sources.
-
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
 	help
@@ -117,7 +105,6 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.4.1" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index c9986cd..578fea1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -28,9 +28,6 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
-ifeq ($(BR2_LINUX_KERNEL_SAME_AS_HEADERS)$(BR2_KERNEL_HEADERS_VERSION),yy)
-BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
-endif
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.

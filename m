From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Jan 2016 19:34:30 +0100
Subject: [Buildroot] [PATCH 3/3] linux: drop the option to use the same
	version as that of the headers
In-Reply-To: <cover.1453314776.git.yann.morin.1998@free.fr>
References: <cover.1453314776.git.yann.morin.1998@free.fr>
Message-ID: <f222817257d3ddfbedb60edb0f259ba4ec35e003.1453314776.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is no longer meaningful, now that we have the option to use the
kernel version for the linux headers, as it is more logical and more
versatile.

Add it to legacy.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy | 10 ++++++++++
 linux/Config.in  | 13 -------------
 linux/linux.mk   |  3 ---
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2e6062c..2476b1a 100644
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
 config BR2_PACKAGE_PYTHON_PYXML
 	bool "python-pyxml package has been removed"
 	select BR2_LEGACY
diff --git a/linux/Config.in b/linux/Config.in
index f5865f3..386e1d7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,18 +29,6 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "4.4"
 
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
 	default "4.4" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index 3c53a0b..936d68d 100644
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
-- 
1.9.1

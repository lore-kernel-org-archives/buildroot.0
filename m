From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 17 May 2019 14:50:17 +0200
Subject: [Buildroot] [PATCH 1/1] linux: xenomai: use URL for the ADEOS/IPIPE
 patch
Message-ID: <20190517125017.15685-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With an URL Buildroot will be able to download the patch automatically.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 Config.in.legacy           | 16 ++++++++++++++++
 linux/Config.ext.in        | 16 ++++++++++------
 linux/linux-ext-xenomai.mk | 12 +++++++++---
 3 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a32cbcb6f2..f77ac1b828 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,22 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2019.08"
+
+config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
+	string "The BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH option has been removed"
+	help
+	  The BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH has been removed in
+	  favour of BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_URL.
+
+config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_WRAP
+	bool
+	default y if BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH != ""
+	select BR2_LEGACY
+
+# Note: BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH is still referenced from
+# linux/Config.ext.in
+
 comment "Legacy options removed in 2019.05"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 32dacbdf06..4db694c2b8 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -22,18 +22,22 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 
 	  However, it is recommended to use the latest version of the
 	  Adeos/Ipipe patch available at
-	  http://download.gna.org/adeos/patches
+	  https://xenomai.org/downloads/ipipe/
 
 	  Xenomai is know to support Blackfin, SH4, x86, ARM, NIOS2
 	  and PowerPC architectures.
 
-config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
-	string "Path for Adeos patch file"
+config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_URL
+	string "Path/URL for Adeos patch file"
+	default BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH if BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH != "" # legacy
 	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
 	help
-	  Optionally, explicitly specify the Adeos patch to use.
-	  Download it at http://download.gna.org/adeos/patches
-	  and verify that your kernel version in buildroot matches.
+	  Optionally, explicitly specify where to find the Adeos
+	  patch to use.
+	  Examples:
+	  https://xenomai.org/downloads/ipipe/v4.x/arm/ipipe-core-4.19.33-arm-2.patch
+	  or file:///home/foo/ipipe-core-4.19.33-arm-2.patch
+	  Please verify that your kernel version in Buildroot matches.
 
 comment "xenomai needs a uClibc or glibc toolchain w/ threads"
 	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index d066bb32ac..e16f76ffb5 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -7,11 +7,17 @@
 LINUX_EXTENSIONS += xenomai
 
 # Adeos patch version
-XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
-ifeq ($(XENOMAI_ADEOS_PATCH),)
+XENOMAI_ADEOS_PATCH_URL = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_URL))
+ifneq ($(XENOMAI_ADEOS_PATCH_URL),)
+XENOMAI_ADEOS_PATCH = $(shell basename $(XENOMAI_ADEOS_PATCH_URL))
+LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH_URL)
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH)
+endif
+
+ifeq ($(XENOMAI_ADEOS_PATCH_URL),)
 XENOMAI_ADEOS_OPTS = --default
 else
-XENOMAI_ADEOS_OPTS = --adeos=$(XENOMAI_ADEOS_PATCH)
+XENOMAI_ADEOS_OPTS = --adeos=$(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH)
 endif
 
 # Prepare kernel patch
-- 
2.19.2

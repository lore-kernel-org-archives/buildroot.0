From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 17 May 2019 14:50:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] linux: xenomai: allow URL for the
 ADEOS/IPIPE patch
Message-ID: <20190517125049.15774-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With an URL Buildroot will be able to download the patch automatically.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---

Changes for v2:
 - don't rename BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH to BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_URL
 - use $(notdir ...) instead of $(shell basename)
 - be backward compatbile with paths

 linux/Config.ext.in        | 13 ++++++++-----
 linux/linux-ext-xenomai.mk | 12 +++++++++++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 32dacbdf06..14140d352c 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -22,18 +22,21 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 
 	  However, it is recommended to use the latest version of the
 	  Adeos/Ipipe patch available at
-	  http://download.gna.org/adeos/patches
+	  https://xenomai.org/downloads/ipipe/
 
 	  Xenomai is know to support Blackfin, SH4, x86, ARM, NIOS2
 	  and PowerPC architectures.
 
 config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
-	string "Path for Adeos patch file"
+	string "Path/URL for Adeos patch file"
 	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
 	help
-	  Optionally, explicitly specify the Adeos patch to use.
-	  Download it at http://download.gna.org/adeos/patches
-	  and verify that your kernel version in buildroot matches.
+	  Optionally, explicitly specify where to find the Adeos
+	  patch to use.
+	  Examples:
+	  https://xenomai.org/downloads/ipipe/v4.x/arm/ipipe-core-4.19.33-arm-2.patch
+	  or /home/foo/ipipe-core-4.19.33-arm-2.patch
+	  Please verify that your kernel version in Buildroot matches.
 
 comment "xenomai needs a uClibc or glibc toolchain w/ threads"
 	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index d066bb32ac..ed29943e6c 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -8,10 +8,20 @@ LINUX_EXTENSIONS += xenomai
 
 # Adeos patch version
 XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
+
+ifneq ($(filter ftp://% http://% https://%, $(XENOMAI_ADEOS_PATCH)),)
+XENOMAI_ADEOS_PATCH_NAME = $(notdir $(XENOMAI_ADEOS_PATCH))
+XENOMAI_ADEOS_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH_NAME)
+LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH)
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH_NAME)
+else
+XENOMAI_ADEOS_PATCH_PATH = $(subst file://,,$(XENOMAI_ADEOS_PATCH))
+endif
+
 ifeq ($(XENOMAI_ADEOS_PATCH),)
 XENOMAI_ADEOS_OPTS = --default
 else
-XENOMAI_ADEOS_OPTS = --adeos=$(XENOMAI_ADEOS_PATCH)
+XENOMAI_ADEOS_OPTS = --adeos=$(XENOMAI_ADEOS_PATCH_PATH)
 endif
 
 # Prepare kernel patch
-- 
2.19.2

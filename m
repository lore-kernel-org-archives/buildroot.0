From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 24 Jan 2016 21:49:33 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/gutenprint: Un-deprecate and
	bump version to 5.2.11
Message-ID: <1453664973-21165-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
Changes V4 -> V5
Updated Gutenprint with recently released 5.2.11
Added patch to fix endianness detection. Will submit upstream
 ...-print-olympus.c-fix-endianness-detection.patch | 33 ++++++++++++++++++++++
 package/gutenprint/Config.in                       |  2 --
 package/gutenprint/gutenprint.hash                 |  2 +-
 package/gutenprint/gutenprint.mk                   |  2 +-
 4 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch

diff --git a/package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch b/package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch
new file mode 100644
index 0000000..a8ac272
--- /dev/null
+++ b/package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch
@@ -0,0 +1,33 @@
+From e0dad4bb237f1155e920c30c6fd3412e96a3e84d Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Sun, 24 Jan 2016 17:14:21 +0200
+Subject: [PATCH 1/1] print-olympus.c: fix endianness detection
+
+The __LITTLE_ENDIAN__ and __BIG_ENDIAN__ macros are not a reliable way to
+detect endianness. Instead, rely on __BYTE_ORDER like we do in the rest of
+the code.
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ src/main/print-olympus.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/main/print-olympus.c b/src/main/print-olympus.c
+index 42c4897..8b2aa80 100644
+--- a/src/main/print-olympus.c
++++ b/src/main/print-olympus.c
+@@ -4901,9 +4901,9 @@ dyesub_do_print(stp_vars_t *v, stp_image_t *image)
+   }
+ 
+   if (pv.bytes_per_ink_channel > 1) {
+-#if defined(__LITTLE_ENDIAN) || defined(__LITTLE_ENDIAN__)
++#if (__BYTE_ORDER == __LITTLE_ENDIAN)
+     pv.byteswap = dyesub_feature(caps, DYESUB_FEATURE_BIGENDIAN);
+-#elif defined (__BIG_ENDIAN) || defined(__BIG_ENDIAN__)
++#elif (__BYTE_ORDER == __BIG_ENDIAN)
+     pv.byteswap = !dyesub_feature(caps, DYESUB_FEATURE_BIGENDIAN);
+ #else
+ #error "Unable to determine endianness, aborting compilation!"
+-- 
+1.9.1
+
diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
index 686dbce..f93717c 100644
--- a/package/gutenprint/Config.in
+++ b/package/gutenprint/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_GUTENPRINT
 	bool "gutenprint"
-	# because of cups security issues
-	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
diff --git a/package/gutenprint/gutenprint.hash b/package/gutenprint/gutenprint.hash
index 3cfe0e1..a52cc7d 100644
--- a/package/gutenprint/gutenprint.hash
+++ b/package/gutenprint/gutenprint.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  4b27e4f06f32d30271df89ecb6089bb11bcf2caec5f60b0909e083095354bca0  gutenprint-5.2.9.tar.bz2
+sha256  c1a34cd2e02527de4d2a9bf6c14732cb9aa11b333f771eb6043fdc974de24df9  gutenprint-5.2.11.tar.bz2
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 3ff05b6..0585a5e 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUTENPRINT_VERSION_MAJOR = 5.2
-GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).9
+GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).11
 GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-$(GUTENPRINT_VERSION_MAJOR)/$(GUTENPRINT_VERSION)
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPLv2+
-- 
1.9.1

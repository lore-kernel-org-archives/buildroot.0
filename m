From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 09:33:56 +0200
Subject: [Buildroot] [git commit] package/gutenprint: bump to version 5.2.14
Message-ID: <20190506073032.97E15884D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91f8fa67ceaaaf9a1a18b5c0467fbd094d0b8bd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove third and fourth patches (already in version)
- Add hash for license file
- Remove --without-foomatic options (not available anymore)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-print-olympus.c-fix-endianness-detection.patch | 33 -----------------
 ...-allow-USB-backends-to-be-built-if-CUPS-i.patch | 41 ----------------------
 package/gutenprint/gutenprint.hash                 |  3 +-
 package/gutenprint/gutenprint.mk                   |  6 ++--
 4 files changed, 4 insertions(+), 79 deletions(-)

diff --git a/package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch b/package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch
deleted file mode 100644
index fc1746ca00..0000000000
--- a/package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e0dad4bb237f1155e920c30c6fd3412e96a3e84d Mon Sep 17 00:00:00 2001
-From: Olivier Schonken <olivier.schonken@gmail.com>
-Date: Sun, 24 Jan 2016 17:14:21 +0200
-Subject: [PATCH 1/1] print-olympus.c: fix endianness detection
-
-The __LITTLE_ENDIAN__ and __BIG_ENDIAN__ macros are not a reliable way to
-detect endianness. Instead, rely on __BYTE_ORDER like we do in the rest of
-the code.
-
-Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
----
- src/main/print-olympus.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/main/print-olympus.c b/src/main/print-olympus.c
-index 42c4897..8b2aa80 100644
---- a/src/main/print-olympus.c
-+++ b/src/main/print-olympus.c
-@@ -4901,9 +4901,9 @@ dyesub_do_print(stp_vars_t *v, stp_image_t *image)
-   }
- 
-   if (pv.bytes_per_ink_channel > 1) {
--#if defined(__LITTLE_ENDIAN) || defined(__LITTLE_ENDIAN__)
-+#if (__BYTE_ORDER == __LITTLE_ENDIAN)
-     pv.byteswap = dyesub_feature(caps, DYESUB_FEATURE_BIGENDIAN);
--#elif defined (__BIG_ENDIAN) || defined(__BIG_ENDIAN__)
-+#elif (__BYTE_ORDER == __BIG_ENDIAN)
-     pv.byteswap = !dyesub_feature(caps, DYESUB_FEATURE_BIGENDIAN);
- #else
- #error "Unable to determine endianness, aborting compilation!"
--- 
-1.9.1
-
diff --git a/package/gutenprint/0004-build-Don-t-allow-USB-backends-to-be-built-if-CUPS-i.patch b/package/gutenprint/0004-build-Don-t-allow-USB-backends-to-be-built-if-CUPS-i.patch
deleted file mode 100644
index 1ecc89ede8..0000000000
--- a/package/gutenprint/0004-build-Don-t-allow-USB-backends-to-be-built-if-CUPS-i.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b5e8dc446572c1198a24eff105a394d0f307951e Mon Sep 17 00:00:00 2001
-From: Solomon Peachy <pizza@shaftnet.org>
-Date: Fri, 15 Apr 2016 23:05:43 -0400
-Subject: [PATCH] build:  Don't allow USB backends to be built if CUPS is not
- enabled.
-
-[Waldemar: backport from upstream commit
-fc1713589fed645f2c8002c3f66dfb69af314716.]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- configure.ac | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 800794b..ba30019 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -442,12 +442,14 @@ dnl if test -z "${[EXTRA_LIBREADLINE_DEPS]}" ; then
- dnl   [EXTRA_LIBREADLINE_DEPS]=""
- dnl fi
- 
--# libusb-1.0 (For CUPS backends)
--PKG_CHECK_MODULES([LIBUSB], [libusb-1.0],
--                  [HAVE_LIBUSB=yes
--                   BUILD_LIBUSB_BACKENDS=yes],
--                  [HAVE_LIBUSB=no
--	           BUILD_LIBUSB_BACKENDS=no])
-+# libusb-1.0 (For CUPS backends, but only bother if CUPS is enabled)
-+if test "x$BUILD_CUPS" = "xyes" ; then
-+ PKG_CHECK_MODULES([LIBUSB], [libusb-1.0],
-+                   [HAVE_LIBUSB=yes
-+                    BUILD_LIBUSB_BACKENDS=yes],
-+                   [HAVE_LIBUSB=no
-+	            BUILD_LIBUSB_BACKENDS=no])
-+fi
- 
- AC_PATH_PROGS([GIMPTOOL2_CHECK], [gimptool-2.0 gimptool])
- if test -z "${GIMPTOOL2_CHECK}" ; then
--- 
-2.6.4
-
diff --git a/package/gutenprint/gutenprint.hash b/package/gutenprint/gutenprint.hash
index a52cc7d42d..8118884989 100644
--- a/package/gutenprint/gutenprint.hash
+++ b/package/gutenprint/gutenprint.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  c1a34cd2e02527de4d2a9bf6c14732cb9aa11b333f771eb6043fdc974de24df9  gutenprint-5.2.11.tar.bz2
+sha256  45bf0766f196a764c113bfad7ab1ea748f1d5ff9ebb0d3a2206705fe52e82389  gutenprint-5.2.14.tar.bz2
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 6c42319977..3465ec8b85 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -5,13 +5,13 @@
 ################################################################################
 
 GUTENPRINT_VERSION_MAJOR = 5.2
-GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).11
+GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).14
 GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-$(GUTENPRINT_VERSION_MAJOR)/$(GUTENPRINT_VERSION)
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPL-2.0+
 GUTENPRINT_LICENSE_FILES = COPYING
 
-# Needed, as we touch Makefile.am and configure.ac
+# Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
 
 GUTENPRINT_DEPENDENCIES = \
@@ -33,8 +33,6 @@ GUTENPRINT_CONF_OPTS = \
 	--disable-samples \
 	--without-doc \
 	--without-gimp2 \
-	--without-foomatic \
-	--without-foomatic3 \
 	--disable-escputil \
 	--disable-test \
 	--disable-testpattern \

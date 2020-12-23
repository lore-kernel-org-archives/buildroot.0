From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Dec 2020 21:26:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/vdr: bump to version 2.4.6
Message-ID: <20201223202608.3051064-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patches (already in version)
- pkg-config can be used to retrieve dependencies since
  https://projects.vdr-developer.org/git/vdr.git/commit?id=f5dba03447fa73da6e181ead7fb98c2b0a2fed41
  so use it and drop unneeded workarounds such as VDR_INCLUDE_DIRS
- Update indentation in hash file (two spaces)

https://projects.vdr-developer.org/git/vdr.git/tree/HISTORY?id=V20406

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vdr/0001-libjpeg.patch                | 40 -------------------
 ...ility-with-current-versions-of-glibc.patch | 27 -------------
 package/vdr/vdr.hash                          |  8 ++--
 package/vdr/vdr.mk                            |  8 ++--
 4 files changed, 7 insertions(+), 76 deletions(-)
 delete mode 100644 package/vdr/0001-libjpeg.patch
 delete mode 100644 package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch

diff --git a/package/vdr/0001-libjpeg.patch b/package/vdr/0001-libjpeg.patch
deleted file mode 100644
index dbd1f12838..0000000000
--- a/package/vdr/0001-libjpeg.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Fix compilation with libjpeg
-
-Patch inspired by upstream board:
-http://www.vdr-portal.de/board16-video-disk-recorder/board4-vdr-installation/p1189959-vdr-2-05-mit-libjpeg-9a-kommt-nicht-aus/#post1189959
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr vdr-2.3.1.org/tools.c vdr-2.3.1/tools.c
---- vdr-2.3.1.org/tools.c	2015-09-10 15:17:55.000000000 +0200
-+++ vdr-2.3.1/tools.c	2016-08-01 06:37:44.000000000 +0200
-@@ -1254,15 +1254,15 @@
-         }
-      else {
-         esyslog("ERROR: out of memory");
--        return false;
-+        return FALSE;
-         }
-      if (jcd->mem) {
-         cinfo->dest->next_output_byte = jcd->mem + Used;
-         cinfo->dest->free_in_buffer = jcd->size - Used;
--        return true;
-+        return TRUE;
-         }
-      }
--  return false;
-+  return FALSE;
- }
- 
- static void JpegCompressTermDestination(j_compress_ptr cinfo)
-@@ -1307,8 +1307,8 @@
-   cinfo.in_color_space = JCS_RGB;
- 
-   jpeg_set_defaults(&cinfo);
--  jpeg_set_quality(&cinfo, Quality, true);
--  jpeg_start_compress(&cinfo, true);
-+  jpeg_set_quality(&cinfo, Quality, TRUE);
-+  jpeg_start_compress(&cinfo, TRUE);
- 
-   int rs = Width * 3;
-   JSAMPROW rp[Height];
diff --git a/package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch b/package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch
deleted file mode 100644
index 32c0e97ac1..0000000000
--- a/package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 930c2cd2eb8947413e88404fa94c66e4e1db5ad6 Mon Sep 17 00:00:00 2001
-From: Klaus Schmidinger <vdr@tvdr.de>
-Date: Mon, 4 May 2020 12:28:31 +0200
-Subject: Fixed compatibility with current versions of glibc
-
-[Retrieved (and updated to remove CONTRIBUTORS and HISTORY) from:
-https://projects.vdr-developer.org/git/vdr.git/commit?id=930c2cd2eb8947413e88404fa94c66e4e1db5ad6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff --git a/eit.c b/eit.c
-index 72a45e5..d437b44 100644
---- a/eit.c
-+++ b/eit.c
-@@ -391,7 +391,9 @@ cTDT::cTDT(const u_char *Data)
-   if (abs(diff) > MAX_TIME_DIFF) {
-      mutex.Lock();
-      if (abs(diff) > MAX_ADJ_DIFF) {
--        if (stime(&dvbtim) == 0)
-+        timespec ts = { 0 };
-+        ts.tv_sec = dvbtim;
-+        if (clock_settime(CLOCK_REALTIME, &ts) == 0)
-            isyslog("system time changed from %s (%ld) to %s (%ld)", *TimeToString(loctim), loctim, *TimeToString(dvbtim), dvbtim);
-         else
-            esyslog("ERROR while setting system time: %m");
--- 
-cgit v0.10.2
-
diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 99f6ba822d..3d0dc443e2 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,5 +1,5 @@
-# From https://www.linuxtv.org/pipermail/vdr/2019-June/029497.html
-md5 b2897fe6b6e6711d512a69642b1b8ec1  vdr-2.4.1.tar.bz2
+# From https://www.linuxtv.org/pipermail/vdr/2020-December/029578.html
+md5  aa91614159ae2db45655d35918e2c24e  vdr-2.4.6.tar.bz2
 # Locally computed
-sha256 25c3f835c4f3ff92cd2db10c004439ef22c2e895193c77fbe8cc7eac4858a1dc  vdr-2.4.1.tar.bz2
-sha256 ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
+sha256  c8993babf2a878a0fba84558de1e35f042c3c66f7c1ec569eea00a3af1014e4b  vdr-2.4.6.tar.bz2
+sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 83cdede307..fc456c2a30 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,22 +4,23 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.4.1
+VDR_VERSION = 2.4.6
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
 VDR_INSTALL_STAGING = YES
 VDR_DEPENDENCIES = \
+	host-pkgconf \
 	freetype \
 	fontconfig \
 	jpeg \
 	libcap \
 	$(TARGET_NLS_DEPENDENCIES)
 
-VDR_INCLUDE_DIRS = -I$(STAGING_DIR)/usr/include/freetype2
 VDR_MAKE_FLAGS = \
 	NO_KBD=yes \
+	PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY) \
 	PLUGINLIBDIR=/usr/lib/vdr \
 	PREFIX=/usr \
 	VIDEODIR=/var/lib/vdr
@@ -27,8 +28,6 @@ VDR_LDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
 VDR_DEPENDENCIES += libfribidi
-VDR_INCLUDE_DIRS += -I$(STAGING_DIR)/usr/include/fribidi
-VDR_LDFLAGS += -lfribidi
 VDR_MAKE_FLAGS += BIDI=1
 endif
 
@@ -38,7 +37,6 @@ VDR_LDFLAGS += -liconv
 endif
 
 VDR_MAKE_ENV = \
-	INCLUDES="$(VDR_INCLUDE_DIRS)" \
 	LDFLAGS="$(VDR_LDFLAGS)" \
 	$(VDR_MAKE_FLAGS)
 
-- 
2.29.2

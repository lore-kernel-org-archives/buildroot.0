From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Aug 2017 09:31:55 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/fontconfig: bump version to
	2.12.4
Message-ID: <20170806073155.18409-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://cgit.freedesktop.org/fontconfig/commit/?id=1ab5258f7c2abfafcd63a760ca08bf93591912da

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ts-with-integer-width-macros-from-TS-1866.patch | 50 ----------------------
 package/fontconfig/fontconfig.hash                 |  4 +-
 package/fontconfig/fontconfig.mk                   | 10 ++---
 3 files changed, 5 insertions(+), 59 deletions(-)
 delete mode 100644 package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch

diff --git a/package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch b/package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch
deleted file mode 100644
index 80bf7a7b3..000000000
--- a/package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 1ab5258f7c2abfafcd63a760ca08bf93591912da Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Dec 2016 16:11:05 -0800
-Subject: [PATCH] Avoid conflicts with integer width macros from TS
- 18661-1:2014
-
-glibc 2.25+ has now defined these macros in <limits.h>
-https://sourceware.org/git/?p=glibc.git;a=commit;h=5b17fd0da62bf923cb61d1bb7b08cf2e1f1f9c1a
-
-Create an alias for FC_CHAR_WIDTH for ABI compatibility
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: upstream
-
- fontconfig/fontconfig.h | 3 ++-
- src/fcobjs.h            | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h
-index 5c72b22..070a557 100644
---- a/fontconfig/fontconfig.h
-+++ b/fontconfig/fontconfig.h
-@@ -128,7 +128,8 @@ typedef int		FcBool;
- #define FC_USER_CACHE_FILE	    ".fonts.cache-" FC_CACHE_VERSION
- 
- /* Adjust outline rasterizer */
--#define FC_CHAR_WIDTH	    "charwidth"	/* Int */
-+#define FC_CHARWIDTH	    "charwidth"	/* Int */
-+#define FC_CHAR_WIDTH	    FC_CHARWIDTH
- #define FC_CHAR_HEIGHT	    "charheight"/* Int */
- #define FC_MATRIX	    "matrix"    /* FcMatrix */
- 
-diff --git a/src/fcobjs.h b/src/fcobjs.h
-index 1fc4f65..d27864b 100644
---- a/src/fcobjs.h
-+++ b/src/fcobjs.h
-@@ -51,7 +51,7 @@ FC_OBJECT (DPI,			FcTypeDouble,	NULL)
- FC_OBJECT (RGBA,		FcTypeInteger,	NULL)
- FC_OBJECT (SCALE,		FcTypeDouble,	NULL)
- FC_OBJECT (MINSPACE,		FcTypeBool,	NULL)
--FC_OBJECT (CHAR_WIDTH,		FcTypeInteger,	NULL)
-+FC_OBJECT (CHARWIDTH,		FcTypeInteger,	NULL)
- FC_OBJECT (CHAR_HEIGHT,		FcTypeInteger,	NULL)
- FC_OBJECT (MATRIX,		FcTypeMatrix,	NULL)
- FC_OBJECT (CHARSET,		FcTypeCharSet,	FcCompareCharSet)
--- 
-2.10.2
-
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index ad3582557..e9963f6f3 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/fontconfig/2016-August/005794.html
-sha256	b449a3e10c47e1d1c7a6ec6e2016cca73d3bd68fbbd4f0ae5cc6b573f7d6c7f3	fontconfig-2.12.1.tar.bz2
+# From https://lists.freedesktop.org/archives/fontconfig/2017-July/005961.html
+sha256 668293fcc4b3c59765cdee5cee05941091c0879edcc24dfec5455ef83912e45c  fontconfig-2.12.4.tar.bz2
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 8d395bccd..d8a2f5491 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,16 +4,12 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.12.1
+FONTCONFIG_VERSION = 2.12.4
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
-
-# When
-# 0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch is
-# removed, the host-gperf dependency should be removed.
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf host-gperf
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
-- 
2.11.0

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 19:02:06 +0200
Subject: [Buildroot] [git commit] Revert "package/fontconfig: bump version
	to 2.12.4"
Message-ID: <20170902165543.8CCEF819D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f644a9604bd5449f6efb87d9cb376fcda2baa20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 72e89edfcb9821121a2785ddf193a1d836ae0b8f. Due to
some change in fontconfig, it tries to re-generate a file using
gperf. Adding a dependency on host-gperf would solve the problem, but
really this is an upstream bug that should be reported and fixed
rather than worked around by adding the host-gperf dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ts-with-integer-width-macros-from-TS-1866.patch | 50 ++++++++++++++++++++++
 package/fontconfig/fontconfig.hash                 |  4 +-
 package/fontconfig/fontconfig.mk                   | 10 +++--
 3 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch b/package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch
new file mode 100644
index 0000000..80bf7a7
--- /dev/null
+++ b/package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch
@@ -0,0 +1,50 @@
+From 1ab5258f7c2abfafcd63a760ca08bf93591912da Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Dec 2016 16:11:05 -0800
+Subject: [PATCH] Avoid conflicts with integer width macros from TS
+ 18661-1:2014
+
+glibc 2.25+ has now defined these macros in <limits.h>
+https://sourceware.org/git/?p=glibc.git;a=commit;h=5b17fd0da62bf923cb61d1bb7b08cf2e1f1f9c1a
+
+Create an alias for FC_CHAR_WIDTH for ABI compatibility
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: upstream
+
+ fontconfig/fontconfig.h | 3 ++-
+ src/fcobjs.h            | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h
+index 5c72b22..070a557 100644
+--- a/fontconfig/fontconfig.h
++++ b/fontconfig/fontconfig.h
+@@ -128,7 +128,8 @@ typedef int		FcBool;
+ #define FC_USER_CACHE_FILE	    ".fonts.cache-" FC_CACHE_VERSION
+ 
+ /* Adjust outline rasterizer */
+-#define FC_CHAR_WIDTH	    "charwidth"	/* Int */
++#define FC_CHARWIDTH	    "charwidth"	/* Int */
++#define FC_CHAR_WIDTH	    FC_CHARWIDTH
+ #define FC_CHAR_HEIGHT	    "charheight"/* Int */
+ #define FC_MATRIX	    "matrix"    /* FcMatrix */
+ 
+diff --git a/src/fcobjs.h b/src/fcobjs.h
+index 1fc4f65..d27864b 100644
+--- a/src/fcobjs.h
++++ b/src/fcobjs.h
+@@ -51,7 +51,7 @@ FC_OBJECT (DPI,			FcTypeDouble,	NULL)
+ FC_OBJECT (RGBA,		FcTypeInteger,	NULL)
+ FC_OBJECT (SCALE,		FcTypeDouble,	NULL)
+ FC_OBJECT (MINSPACE,		FcTypeBool,	NULL)
+-FC_OBJECT (CHAR_WIDTH,		FcTypeInteger,	NULL)
++FC_OBJECT (CHARWIDTH,		FcTypeInteger,	NULL)
+ FC_OBJECT (CHAR_HEIGHT,		FcTypeInteger,	NULL)
+ FC_OBJECT (MATRIX,		FcTypeMatrix,	NULL)
+ FC_OBJECT (CHARSET,		FcTypeCharSet,	FcCompareCharSet)
+-- 
+2.10.2
+
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index e9963f6..ad35825 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/fontconfig/2017-July/005961.html
-sha256 668293fcc4b3c59765cdee5cee05941091c0879edcc24dfec5455ef83912e45c  fontconfig-2.12.4.tar.bz2
+# From https://lists.freedesktop.org/archives/fontconfig/2016-August/005794.html
+sha256	b449a3e10c47e1d1c7a6ec6e2016cca73d3bd68fbbd4f0ae5cc6b573f7d6c7f3	fontconfig-2.12.1.tar.bz2
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d8a2f54..8d395bc 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.12.4
+FONTCONFIG_VERSION = 2.12.1
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf
+
+# When
+# 0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch is
+# removed, the host-gperf dependency should be removed.
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf host-gperf
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 

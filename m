From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Feb 2017 21:34:48 -0300
Subject: [Buildroot] [PATCH next 4/4] fontconfig: add build fix for glibc
	2.25
In-Reply-To: <20170225003448.32459-1-gustavo@zacarias.com.ar>
References: <20170225003448.32459-1-gustavo@zacarias.com.ar>
Message-ID: <20170225003448.32459-4-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ts-with-integer-width-macros-from-TS-1866.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch

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
-- 
2.10.2

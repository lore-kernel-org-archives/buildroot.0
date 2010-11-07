From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Nov 2010 21:52:13 +0100
Subject: [Buildroot] [PATCH] directfb: Fix missing -lm flag again
Message-ID: <1289163133-8637-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

(aka fix the fix)

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 ...directfb-1.4.10-add-missing-lm-flag-patch.patch |   86 ++++++++++----------
 1 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch b/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
index 22f91e3..b07f0c5 100644
--- a/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
+++ b/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
@@ -1,51 +1,49 @@
-From 5a91f329f490ae3d63c239e37f3899e703e303ee Mon Sep 17 00:00:00 2001
+From dbf8fd1d097420d02f0603155ca81fcc7e232a0a Mon Sep 17 00:00:00 2001
 From: Lionel Landwerlin <llandwerlin@gmail.com>
-Date: Fri, 5 Nov 2010 18:05:54 +0100
-Subject: [PATCH] directfb: add missing -lm flag patch
+Date: Sun, 7 Nov 2010 21:45:19 +0100
+Subject: [PATCH] Add -lm flag when nedded
 
 Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 ---
- ....10-add-lm-to-link-flags-when-freetype-is.patch |   31 ++++++++++++++++++++
- 1 files changed, 31 insertions(+), 0 deletions(-)
- create mode 100644 package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch
+ configure.in          |   14 ++++++++++++++
+ src/media/Makefile.am |    2 +-
+ 2 files changed, 15 insertions(+), 1 deletions(-)
 
-diff --git a/package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch b/package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch
-new file mode 100644
-index 0000000..dc84f53
---- /dev/null
-+++ b/package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch
-@@ -0,0 +1,31 @@
-+From 9103055ed56999bb42cdf8fc5f08f2ad42e28426 Mon Sep 17 00:00:00 2001
-+From: Lionel Landwerlin <llandwerlin@gmail.com>
-+Date: Fri, 5 Nov 2010 18:00:20 +0100
-+Subject: [PATCH] configure.in: add -lm to link flags when freetype is used
-+
-+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
-+---
-+ configure.in |    7 +++++++
-+ 1 files changed, 7 insertions(+), 0 deletions(-)
-+
-+diff --git a/configure.in b/configure.in
-+index 78c842d..3f97b22 100644
-+--- a/configure.in
-++++ b/configure.in
-+@@ -830,6 +830,13 @@ AC_ARG_ENABLE(freetype,
-+ if test "$enable_freetype" = "yes"; then
-+   PKG_CHECK_MODULES(FREETYPE, freetype2, FREETYPE="yes", [FREETYPE="no",
-+     AC_MSG_WARN([*** no freetype -- FreeType font provider will not be built.])])
-++  if test "$enable_shared" = "yes"; then
-++    AC_CHECK_LIB(m, sinf, ,
-++      AC_MSG_ERROR([
-++*** DirectFB requires libm.]))
-++    DYNLIB+=" -lm"
-++  fi
-++  AC_SUBST(DYNLIB)
-+ fi
-+ 
-+ AM_CONDITIONAL(FREETYPE_PROVIDER, test "$FREETYPE" = "yes")
-+-- 
-+1.6.0.6
-+
+diff --git a/configure.in b/configure.in
+index 78c842d..aa608d4 100644
+--- a/configure.in
++++ b/configure.in
+@@ -533,6 +533,20 @@ AM_CONDITIONAL(DIRECTFB_BUILD_PURE_VOODOO, test "$DIRECTFB_BUILD_PURE_VOODOO" =
+ 
+ AC_SUBST(DEP_VOODOO)
+ 
++dnl If we're not building a pure voodoo lib, we need the sqrt symbol
++dnl for src/media/idirectfbfont.c
++MEDIALIB=""
++if test "$enable_pure_voodoo" = "no"; then
++  AC_CHECK_LIB(m, sqrt,
++    MEDIALIB="-lm",
++    AC_MSG_ERROR([
++*** DirectFB requires libm.]))
++  if test "$enable_shared" = "yes"; then
++    DYNLIB+=" $MEDIALIB"
++    AC_SUBST(DYNLIB)
++  fi
++fi
++AC_SUBST(MEDIALIB)
+ 
+ AM_CONDITIONAL(ENABLE_MULTI, test "$enable_multi" = "yes")
+ 
+diff --git a/src/media/Makefile.am b/src/media/Makefile.am
+index 1a39a25..a4bdb10 100644
+--- a/src/media/Makefile.am
++++ b/src/media/Makefile.am
+@@ -35,4 +35,4 @@ libdirectfb_media_la_SOURCES = \
+ 	idirectfbdatabuffer_file.c	\
+ 	idirectfbdatabuffer_memory.c	\
+ 	idirectfbdatabuffer_streamed.c
+-
++libdirectfb_media_la_LDFLAGS = $(MEDIALIB)
 -- 
-1.6.0.6
+1.7.2.3
 
-- 
1.7.2.3

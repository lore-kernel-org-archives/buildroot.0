From: Thomas Ehrhardt <e.thomas@gmx.de>
Date: Wed, 25 Jul 2018 08:08:11 -0500 (CDT)
Subject: [Buildroot] [PATCH] ghostscript: not compiled to use freetype lib
Message-ID: <1532524091103-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this patch ghostscript 9.23 use the freetype lib.

--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -10,6 +10,7 @@
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
 # 0001-Fix-cross-compilation-issue.patch
+# 0002-Fix-shared-lib-freetype.patch
 GHOSTSCRIPT_AUTORECONF = YES
 GHOSTSCRIPT_DEPENDENCIES = \
        host-lcms2 \
@@ -32,9 +33,15 @@
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS

+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+GHOSTSCRIPT_DEPENDENCIES += host-freetype
+HOST_CXXFLAGS += -I$(HOST_DIR)/usr/include/freetype2
+endif
+
 GHOSTSCRIPT_CONF_ENV = \
        CCAUX="$(HOSTCC)" \
-       CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)"
+        CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+        CXXFLAGS="$(HOST_CXXFLAGS)"

 GHOSTSCRIPT_CONF_OPTS = \
        --disable-compile-inits \

---
file package/ghostscript/0002-Fix-shared-lib-freetype.patch

--- a/configure.ac
+++ b/configure.ac
@@ -967,21 +967,12 @@

     if test x"$FTSRCDIR" = x"src"; then
       AC_MSG_RESULT([no])
-      if test "x$PKGCONFIG" != x; then
-        AC_MSG_CHECKING(for system freetype2 >= 2.4.2 with pkg-config)
-            # pkg-config needs the libtool version, which != the freetype2
version <sigh!>
-            # There is a table of corresponding ft2<->libtool numbers in
freetype/docs/VERSION.DLL
-            if $PKGCONFIG --atleast-version=12.0.6 freetype2; then
-                AC_MSG_RESULT(yes)
-                FT_CFLAGS="$CFLAGS `$PKGCONFIG --cflags freetype2`"
-                FT_LIBS="`$PKGCONFIG --libs freetype2`"
-                FT_BRIDGE=1
-                SHARE_FT=1
-            else
-                AC_MSG_RESULT(no)
-                AC_MSG_WARN([freetype library source not found...using
native rasterizer])
-                AFS=1
-            fi
+      if test "x$BUILD_PKGCONFIG" != x; then
+       AC_MSG_RESULT(yes)
+       FT_CFLAGS="$CFLAGS `$BUILD_PKGCONFIG --cflags freetype2`"
+       FT_LIBS="`$BUILD_PKGCONFIG --libs freetype2`"
+       FT_BRIDGE=1
+       SHARE_FT=1
       else
         AC_CHECK_HEADER([ft2build.h], [FT_BRIDGE=1], [AFS=1])




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/

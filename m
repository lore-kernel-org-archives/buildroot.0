From: Thomas Ehrhardt <tehrhardt@innovaphone.com>
Date: Thu, 26 Jul 2018 07:51:59 -0500 (CDT)
Subject: [Buildroot] [PATCH] ghostscript: not compiled to use freetype
 lib
In-Reply-To: <20180725163612.7ccaef8e@windsurf>
References: <1532524091103-0.post@n4.nabble.com>
 <20180725163612.7ccaef8e@windsurf>
Message-ID: <1532609519336-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

the ghostscript isn't compiled against the freetype lib although it is
switched on. Ghostscript doesn't support cross compiling and the old
freetype sources within ghostscript are deleted. So the headers of the
freetype package must be included, and the ghostscript configure is changed
to use the host pkgconfig.

Thomas

Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com>
---
diff -Nu a/package/ghostscript/0002-Fix-shared-lib-freetype.patch
b/package/ghostscript/0002-Fix-shared-lib-freetype.patch
--- a/package/ghostscript/0002-Fix-shared-lib-freetype.patch
+++ b/package/ghostscript/0002-Fix-shared-lib-freetype.patch
@@ -0,0 +1,30 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -967,21 +967,12 @@
+
+     if test x"$FTSRCDIR" = x"src"; then
+       AC_MSG_RESULT([no])
+-      if test "x$PKGCONFIG" != x; then
+-        AC_MSG_CHECKING(for system freetype2 >= 2.4.2 with pkg-config)
+-            # pkg-config needs the libtool version, which != the freetype2
version <sigh!>
+-            # There is a table of corresponding ft2<->libtool numbers in
freetype/docs/VERSION.DLL
+-            if $PKGCONFIG --atleast-version=12.0.6 freetype2; then
+-                AC_MSG_RESULT(yes)
+-                FT_CFLAGS="$CFLAGS `$PKGCONFIG --cflags freetype2`"
+-                FT_LIBS="`$PKGCONFIG --libs freetype2`"
+-                FT_BRIDGE=1
+-                SHARE_FT=1
+-            else
+-                AC_MSG_RESULT(no)
+-                AC_MSG_WARN([freetype library source not found...using
native rasterizer])
+-                AFS=1
+-            fi
++      if test "x$BUILD_PKGCONFIG" != x; then
++       AC_MSG_RESULT(yes)
++      FT_CFLAGS="$CFLAGS `$BUILD_PKGCONFIG --cflags freetype2`"
++      FT_LIBS="`$BUILD_PKGCONFIG --libs freetype2`"
++      FT_BRIDGE=1
++      SHARE_FT=1
+       else
+         AC_CHECK_HEADER([ft2build.h], [FT_BRIDGE=1], [AFS=1])
+
diff -Nu a/package/ghostscript/ghostscript.mk
b/package/ghostscript/ghostscript.mk
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
@@ -32,9 +33,17 @@
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS

+GHOSTSCRIPT_CXXFLAGS = $(HOST_CXXFLAGS)
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+GHOSTSCRIPT_DEPENDENCIES += freetype
+GHOSTSCRIPT_CXXFLAGS += -I$(HOST_DIR)/usr/include/freetype2
+endif
+
 GHOSTSCRIPT_CONF_ENV = \
        CCAUX="$(HOSTCC)" \
-       CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)"
+       CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+       CXXFLAGS="$(GHOSTSCRIPT_CXXFLAGS)"

 GHOSTSCRIPT_CONF_OPTS = \
        --disable-compile-inits \
--



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/

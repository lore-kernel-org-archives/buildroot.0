From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Fri,  1 May 2020 11:26:17 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/ghostscript: add cups support
Message-ID: <20200501082617.14510-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ghostscript can be used for cups printing.

In current version it's disabled, but may be needed for some customers.

This patch add cups support if cups enabled.
Also patch fix configure.ac for cross-compilation.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>

---
Changes v1 -> v2:
 - use $(STAGING_DIR) for GHOSTSCRIPT_CUPS_CONFIG_FIX
---
 .../ghostscript/0002-add-cups-support.patch   | 54 +++++++++++++++++++
 package/ghostscript/ghostscript.mk            | 13 +++++
 2 files changed, 67 insertions(+)
 create mode 100644 package/ghostscript/0002-add-cups-support.patch

diff --git a/package/ghostscript/0002-add-cups-support.patch b/package/ghostscript/0002-add-cups-support.patch
new file mode 100644
index 0000000000..262a06c102
--- /dev/null
+++ b/package/ghostscript/0002-add-cups-support.patch
@@ -0,0 +1,54 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -199,30 +199,6 @@
+ 
+ dnl pkg-config is used for several tests now...
+ AC_PATH_TOOL(PKGCONFIG, pkg-config)
+-
+-# this is an unpleasant hack
+-# but if we are cross compiling, and there isn't a matching
+-# pkconfig for the --host setting, then don't use the 'local'
+-# pkconfig at all
+-if test x"$cross_compiling" = x"yes"; then
+-  AC_PATH_PROG(BUILD_PKGCONFIG, pkg-config)
+-  if test x"$BUILD_PKGCONFIG" = x"$PKGCONFIG" ; then
+-    PKGCONFIG=
+-  fi
+-fi
+-
+-AC_PATH_TOOL(STRIP_XE, strip)
+-
+-# this is an unpleasant hack
+-# but if we are cross compiling, and there isn't a matching
+-# pkconfig for the --host setting, then don't use the 'local'
+-# pkconfig at all
+-if test x"$cross_compiling" = x"yes"; then
+-  AC_PATH_PROG(BUILD_STRIP_XE, strip)
+-  if test x"$BUILD_STRIP_XE" = x"$STRIP_XE" ; then
+-    STRIP_XE=
+-  fi
+-fi
+ 
+ dnl --------------------------------------------------  
+ dnl Allow excluding the contributed drivers
+@@ -1432,12 +1408,6 @@
+         if test x$with_local_cups != xyes; then
+             if test x"$CUPSCONFIG" = x""; then
+               AC_PATH_TOOL(CUPSCONFIG,cups-config)
+-              if test x"$cross_compiling" = x"yes"; then
+-                AC_PATH_PROG(BUILD_CUPSCONFIG, cups-config)
+-                if test x"$BUILD_CUPSCONFIG" = x"$CUPSCONFIG" ; then
+-                  CUPSCONFIG=
+-                fi
+-              fi
+             fi
+             # check for a libcups header
+             AC_CHECK_HEADER([cups/cups.h],[],[CUPSCONFIG=""])
+@@ -1473,7 +1443,6 @@
+                 else
+                   CUPSDATA="`$CUPSCONFIG --datadir`"
+                 fi
+-
+                 CUPSINCLUDE="include $srcdir/cups/cups.mak"
+                 CUPSDEV="cups"
+ 
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 1d6f8d04a0..b515d8987a 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -10,6 +10,7 @@ GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
 # 0001-Fix-cross-compilation-issue.patch
+GHOSTSCRIPT_INSTALL_STAGING = YES
 GHOSTSCRIPT_AUTORECONF = YES
 GHOSTSCRIPT_DEPENDENCIES = \
 	host-lcms2 \
@@ -68,6 +69,18 @@ else
 GHOSTSCRIPT_CONF_OPTS += --disable-openjpeg
 endif
 
+define GHOSTSCRIPT_CUPS_CONFIG_FIX
+cp $(STAGING_DIR)/usr/bin/cups-config  $(HOST_DIR)/usr/bin/
+endef
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+GHOSTSCRIPT_DEPENDENCIES += cups
+GHOSTSCRIPT_PRE_CONFIGURE_HOOKS += GHOSTSCRIPT_CUPS_CONFIG_FIX
+GHOSTSCRIPT_CONF_OPTS += --enable-cups
+else
+GHOSTSCRIPT_CONF_OPTS += --disable-cups
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
 GHOSTSCRIPT_CONF_OPTS += --with-x
-- 
2.17.1

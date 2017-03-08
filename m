From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 Mar 2017 22:53:10 +0100
Subject: [Buildroot] [PATCH v1] libxkbcommon: add support for
	interactive-wayland test program
Message-ID: <20170308215310.12819-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case of enabled wayland support add an option for the
interactive-wayland test program. Otherwise disable
wayland support. This fixes a compile failure in case wayland
support is autodetected:

    GEN      xdg-shell-unstable-v5-protocol.c
  /bin/sh: /usr/bin/wayland-scanner: No such file or directory
  Makefile:2426: recipe for target 'xdg-shell-unstable-v5-protocol.c' failed
  make[3]: *** [xdg-shell-unstable-v5-protocol.c] Error 127
  make[3]: *** Waiting for unfinished jobs....
    GEN      xdg-shell-unstable-v5-client-protocol.h
  /bin/sh: /usr/bin/wayland-scanner: No such file or directory
  Makefile:2428: recipe for target 'xdg-shell-unstable-v5-client-protocol.h' failed
  make[3]: *** [xdg-shell-unstable-v5-client-protocol.h] Error 127

Patch 0001-configure.ac-prefere-AC_PATH_PROG-for-wayland-scanne.patch
is inspired from mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...c-prefere-AC_PATH_PROG-for-wayland-scanne.patch | 33 ++++++++++++++++++++++
 package/libxkbcommon/Config.in                     | 12 ++++++++
 package/libxkbcommon/libxkbcommon.mk               | 22 +++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 package/libxkbcommon/0001-configure.ac-prefere-AC_PATH_PROG-for-wayland-scanne.patch

diff --git a/package/libxkbcommon/0001-configure.ac-prefere-AC_PATH_PROG-for-wayland-scanne.patch b/package/libxkbcommon/0001-configure.ac-prefere-AC_PATH_PROG-for-wayland-scanne.patch
new file mode 100644
index 000000000..630e45d3c
--- /dev/null
+++ b/package/libxkbcommon/0001-configure.ac-prefere-AC_PATH_PROG-for-wayland-scanne.patch
@@ -0,0 +1,33 @@
+From b44b0d5323985661b508948eac725048affd3221 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 8 Mar 2017 09:36:39 +0100
+Subject: [PATCH] configure.ac: prefere AC_PATH_PROG for wayland-scanner
+
+Prefere AC_PATH_PROG result for wayland-scanner over the
+pkg-config version (when cross-compiling the .pc file might
+point to the wrong wayland-scanner binary (target rather than
+host) resulting in a non-executable and wrong scanner).
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 725915b..e4ff9d2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -194,7 +194,9 @@ AS_IF([test "x$enable_wayland" = xyes], [
+         [AC_MSG_ERROR([Wayland utilities require libwayland-client >= 1.2 which was not found. \
+ You can disable Wayland support with --disable-wayland.])])
+     AC_PATH_PROG([wayland_scanner], [wayland-scanner])
+-    wayland_scanner=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
++    if test "x$wayland_scanner" = x; then
++        wayland_scanner=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
++    fi
+     ac_wayland_protocols_pkgdatadir=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
+     AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
+ ], [enable_wayland=no])
+-- 
+2.11.0
+
diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index 4da12897f..9c15d5d41 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -1,9 +1,21 @@
 config BR2_PACKAGE_LIBXKBCOMMON
 	bool "libxkbcommon"
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	help
 	  xkbcommon is a keymap compiler and support library which
 	  processes a reduced subset of keymaps as defined by the XKB
 	  specification.
 
 	  http://xkbcommon.org/
+
+if BR2_PACKAGE_LIBXKBCOMMON && BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_LIBXKBCOMMON_INTERACTIVE_WAYLAND
+	bool "interactive-wayland"
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  interactive-wayland is a wayland test application
+	  for libxkbcommon.
+
+endif
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index c39a7c0c5..d1df7a678 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -11,6 +11,11 @@ LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
+
+# patch 0001-configure.ac-prefere-AC_PATH_PROG-for-wayland-scanne.patch
+# touches configure.ac
+LIBXKBCOMMON_AUTORECONF = YES
+
 # uses C99 features
 LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
@@ -21,4 +26,21 @@ else
 LIBXKBCOMMON_CONF_OPTS += --disable-x11
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_INTERACTIVE_WAYLAND),y)
+LIBXKBCOMMON_CONF_OPTS += --enable-wayland
+LIBXKBCOMMON_DEPENDENCIES += wayland wayland-protocols
+LIBXKBCOMMON_CONF_ENV += ac_cv_path_wayland_scanner=$(HOST_DIR)/usr/bin/wayland-scanner
+define LIBXKBCOMMON_BUILD_INTERACTIVE_WAYLAND
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) test/interactive-wayland
+endef
+LIBXKBCOMMON_POST_BUILD_HOOKS = LIBXKBCOMMON_BUILD_INTERACTIVE_WAYLAND
+define LIBXKBCOMMON_INSTALL_INTERACTIVE_WAYLAND
+	$(INSTALL) -D -m 0755 $(@D)/test/interactive-wayland \
+		$(TARGET_DIR)/usr/bin/interactive-wayland
+endef
+LIBXKBCOMMON_POST_INSTALL_TARGET_HOOKS = LIBXKBCOMMON_INSTALL_INTERACTIVE_WAYLAND
+else
+LIBXKBCOMMON_CONF_OPTS += --disable-wayland
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0

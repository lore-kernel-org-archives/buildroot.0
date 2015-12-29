From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 28 Dec 2015 23:59:27 -0200
Subject: [Buildroot] [PATCH 1/1] xdotool: new package
Message-ID: <1451354367-26073-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xdotool is a command-line X11 automation tool.

http://www.semicomplete.com/projects/xdotool

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/Config.in            |  1 +
 package/xdotool/Config.in    | 11 +++++++++++
 package/xdotool/xdotool.hash |  2 ++
 package/xdotool/xdotool.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/xdotool/Config.in
 create mode 100644 package/xdotool/xdotool.hash
 create mode 100644 package/xdotool/xdotool.mk

diff --git a/package/Config.in b/package/Config.in
index a024d3d..973fae1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -304,6 +304,7 @@ comment "X applications"
 	source "package/torsmo/Config.in"
 	source "package/wmctrl/Config.in"
 	source "package/x11vnc/Config.in"
+	source "package/xdotool/Config.in"
 	source "package/xscreensaver/Config.in"
 	source "package/xterm/Config.in"
 	source "package/xvkbd/Config.in"
diff --git a/package/xdotool/Config.in b/package/xdotool/Config.in
new file mode 100644
index 0000000..4d5f590
--- /dev/null
+++ b/package/xdotool/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDOTOOL
+	bool "xdotool"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Command-line X11 automation tool
+
+	  http://www.semicomplete.com/projects/xdotool
diff --git a/package/xdotool/xdotool.hash b/package/xdotool/xdotool.hash
new file mode 100644
index 0000000..f8adcd5
--- /dev/null
+++ b/package/xdotool/xdotool.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 b097ef0e3897d1a24e3f45f0faed58329742d3d9434b9b46eb97eb1040f999bf  xdotool-v3.20150503.1.tar.gz
diff --git a/package/xdotool/xdotool.mk b/package/xdotool/xdotool.mk
new file mode 100644
index 0000000..7e9ae0a
--- /dev/null
+++ b/package/xdotool/xdotool.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# xdotool
+#
+################################################################################
+
+XDOTOOL_VERSION = v3.20150503.1
+XDOTOOL_SITE = $(call github,jordansissel,xdotool,$(XDOTOOL_VERSION))
+XDOTOOL_LICENSE = custom
+XDOTOOL_LICENSE_FILES = COPYRIGHT
+XDOTOOL_DEPENDENCIES = xlib_libXtst xlib_libXinerama libxkbcommon xlib_libX11
+
+define XDOTOOL_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+# Avoid 'install' target to skip 'post-install' which runs ldconfig on host
+define XDOTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		pre-install installlib installprog installheader \
+		PREFIX="$(TARGET_DIR)/usr"
+endef
+
+$(eval $(generic-package))
-- 
2.6.4

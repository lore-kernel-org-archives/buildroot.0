From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu,  2 Jan 2014 22:29:40 +0100
Subject: [Buildroot] [PATCH v2] wmctrl: new package
Message-ID: <1388698180-33026-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provides command line access to almost all the features defined in
the EWMH specification. It can be used, for example, to get
information about the window manager, to get a detailed list of
desktops and managed windows, to switch and resize desktops, to
make windows full-screen, always-above or sticky, and to activate,
close, move, resize, maximize and minimize them.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
v2:
 Fix alphabetical order
 Fix dependencies

 package/Config.in        |  1 +
 package/wmctrl/Config.in | 22 ++++++++++++++++++++++
 package/wmctrl/wmctrl.mk | 14 ++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/wmctrl/Config.in
 create mode 100644 package/wmctrl/wmctrl.mk

diff --git a/package/Config.in b/package/Config.in
index 311cc6c..1ee60c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -230,6 +230,7 @@ source "package/rdesktop/Config.in"
 source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
+source "package/wmctrl/Config.in"
 source "package/x11vnc/Config.in"
 source "package/xscreensaver/Config.in"
 source "package/xstroke/Config.in"
diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
new file mode 100644
index 0000000..c1ae6ac
--- /dev/null
+++ b/package/wmctrl/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_WMCTRL
+	bool "wmctrl"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  Provides command line access to almost all the features defined in 
+	  the EWMH specification. It can be used, for example, to get 
+	  information about the window manager, to get a detailed list of 
+	  desktops and managed windows, to switch and resize desktops, to 
+	  make windows full-screen, always-above or sticky, and to activate, 
+	  close, move, resize, maximize and minimize them. 
+
+	  http://tomas.styblo.name/wmctrl/
+
+comment "libglib2 needs a toolchain w/ mmu, wchar, threads"
+	depends on !BR2_USE_MMU || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
new file mode 100644
index 0000000..d54e062
--- /dev/null
+++ b/package/wmctrl/wmctrl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# wmctrl
+#
+################################################################################
+
+WMCTRL_VERSION = 1.07
+WMCTRL_SITE = http://tomas.styblo.name/wmctrl/dist
+WMCTRL_LICENSE = GPLv2
+WMCTRL_LICENSE_FILES = COPYING
+
+WMCTRL_DEPENDENCIES = libglib2 xlib_libX11 xlib_libXmu
+
+$(eval $(autotools-package))
-- 
1.8.3.2

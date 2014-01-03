From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 22:38:33 +0100
Subject: [Buildroot] [git commit] wmctrl: new package
Message-ID: <20140103213916.05F349C38D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac5473849c000d62ad3edee59c13f5451c4ac56f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides command line access to almost all the features defined in
the EWMH specification. It can be used, for example, to get
information about the window manager, to get a detailed list of
desktops and managed windows, to switch and resize desktops, to
make windows full-screen, always-above or sticky, and to activate,
close, move, resize, maximize and minimize them.

[Thomas:
 - fixed license, which is GPLv2+, not GPLv2
 - fixed wrapping of the Config.in help text
 - removed Config.in comment related to MMU dependency.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/wmctrl/Config.in |   23 +++++++++++++++++++++++
 package/wmctrl/wmctrl.mk |   14 ++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 429b519..73d64bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -229,6 +229,7 @@ source "package/rdesktop/Config.in"
 source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
+source "package/wmctrl/Config.in"
 source "package/x11vnc/Config.in"
 source "package/xscreensaver/Config.in"
 source "package/xstroke/Config.in"
diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
new file mode 100644
index 0000000..334f47d
--- /dev/null
+++ b/package/wmctrl/Config.in
@@ -0,0 +1,23 @@
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
+	  Provides command line access to almost all the features
+	  defined in the EWMH specification. It can be used, for
+	  example, to get information about the window manager, to get
+	  a detailed list of desktops and managed windows, to switch
+	  and resize desktops, to make windows full-screen,
+	  always-above or sticky, and to activate, close, move,
+	  resize, maximize and minimize them.
+
+	  http://tomas.styblo.name/wmctrl/
+
+comment "libglib2 needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
new file mode 100644
index 0000000..a4e0d8e
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
+WMCTRL_LICENSE = GPLv2+
+WMCTRL_LICENSE_FILES = COPYING
+
+WMCTRL_DEPENDENCIES = libglib2 xlib_libX11 xlib_libXmu
+
+$(eval $(autotools-package))

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:29:02 +0200
Subject: [Buildroot] [git commit] vte: new package
Message-ID: <20180428213246.103A9890D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dabaee179388297722c2e5d6fa357aa5d6f8615d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VTE package contains a termcap file implementation for
terminal emulators.

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
[Thomas: fix encoding of license name.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/vte/Config.in | 33 +++++++++++++++++++++++++++++++++
 package/vte/vte.hash  |  3 +++
 package/vte/vte.mk    | 15 +++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 45a8979e97..f270db5bb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1768,6 +1768,7 @@ N:	Stefan Fr??berg <stefan.froberg@petroprogram.com>
 F:	package/elfutils/
 F:	package/libtasn1/
 F:	package/proxychains-ng/
+F:	package/vte/
 F:	package/yasm/
 F:	package/zlib-ng/
 
diff --git a/package/Config.in b/package/Config.in
index 8be48816e6..d3b67d40de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -340,6 +340,7 @@ comment "X applications"
 	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
 	source "package/synergy/Config.in"
+	source "package/vte/Config.in"
 	source "package/wmctrl/Config.in"
 	source "package/x11vnc/Config.in"
 	source "package/xdotool/Config.in"
diff --git a/package/vte/Config.in b/package/vte/Config.in
new file mode 100644
index 0000000000..7410624c0a
--- /dev/null
+++ b/package/vte/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_VTE
+	bool "vte"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PCRE2
+	help
+	  VTE is a library (libvte) implementing a terminal emulator
+	  widget for GTK+, and a minimal sample application (vte)
+	  using that. Vte is mainly used in gnome-terminal, but
+	  can also be used to embed a console/terminal in games,
+	  editors, IDEs, etc.
+
+	  http://github.com/GNOME/vte
+
+comment "vte needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
+		!BR2_PACKAGE_HAS_LIBGL
diff --git a/package/vte/vte.hash b/package/vte/vte.hash
new file mode 100644
index 0000000000..3fbc5acab0
--- /dev/null
+++ b/package/vte/vte.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	a3a9fb182740b392a45cd3f46fa61a985f68bb6b1817b52daec22034c46158c3  vte-0.48.3.tar.xz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/vte/vte.mk b/package/vte/vte.mk
new file mode 100644
index 0000000000..90853cb4a5
--- /dev/null
+++ b/package/vte/vte.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# vte
+#
+################################################################################
+
+VTE_VERSION = 0.48.3
+VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
+VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
+VTE_DEPENDENCIES = host-pkgconf libgtk3 libxml2 pcre2
+VTE_LICENSE = LGPL-2.1+
+VTE_LICENSE_FILES = COPYING
+VTE_CONF_OPTS += --disable-introspection --without-gnutls --disable-vala
+
+$(eval $(autotools-package))

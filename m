From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 16 Jan 2018 17:23:33 +0200
Subject: [Buildroot] [PATCH 1/1] vte: new package
Message-ID: <20180116152333.29596-1-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The VTE package contains a termcap file implementation for terminal emulators. 

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/vte/Config.in | 15 +++++++++++++++
 package/vte/vte.mk    | 15 +++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/vte/Config.in
 create mode 100644 package/vte/vte.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f7d051e8a..0f81b7093b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1642,6 +1642,7 @@ N:	Stefan Fr?berg <stefan.froberg@petroprogram.com>
 F:	package/elfutils/
 F:	package/libtasn1/
 F:	package/proxychains-ng/
+F:	package/vte/
 F:	package/yasm/
 F:	package/zlib-ng/
 
diff --git a/package/Config.in b/package/Config.in
index 01f4095be5..be0304442a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -333,6 +333,7 @@ comment "X applications"
 	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
 	source "package/synergy/Config.in"
+	source "package/vte/Config.in"
 	source "package/wmctrl/Config.in"
 	source "package/x11vnc/Config.in"
 	source "package/xdotool/Config.in"
diff --git a/package/vte/Config.in b/package/vte/Config.in
new file mode 100644
index 0000000000..e448477d69
--- /dev/null
+++ b/package/vte/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_VTE
+	bool "vte"
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PCRE2
+	depends on BR2_PACKAGE_XORG7
+	help
+	  VTE is a library (libvte) implementing a terminal emulator
+	  widget for GTK+, and a minimal sample application (vte)
+	  using that. Vte is mainly used in gnome-terminal, but
+	  can also be used to embed a console/terminal in games,
+	  editors, IDEs, etc.
+
+	  http://github.com/GNOME/vte
+
diff --git a/package/vte/vte.mk b/package/vte/vte.mk
new file mode 100644
index 0000000000..e62f807efc
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
+VTE_LICENSE = LGPL-2.0+
+VTE_LICENSE_FILES = COPYING
+VTE_CONF_OPTS += --disable-introspection --without-gnutls --disable-vala
+
+$(eval $(autotools-package))
-- 
2.13.6

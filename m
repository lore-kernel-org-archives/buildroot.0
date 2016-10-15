From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:51:03 +0200
Subject: [Buildroot] [PATCH 09/13] torsmo: remove deprecated package
In-Reply-To: <20161015145107.18264-1-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
Message-ID: <20161015145107.18264-10-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy           |  7 +++++++
 package/Config.in          |  1 -
 package/torsmo/Config.in   | 11 -----------
 package/torsmo/torsmo.hash |  2 --
 package/torsmo/torsmo.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 32 deletions(-)
 delete mode 100644 package/torsmo/Config.in
 delete mode 100644 package/torsmo/torsmo.hash
 delete mode 100644 package/torsmo/torsmo.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1fcedfe..a372052 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_TORSMO
+	bool "torsmo removed"
+	select BR2_LEGACY
+	help
+	  torsmo has been unmaintained for a long time, and nobody
+	  seems to be interested in it.
+
 config BR2_PACKAGE_SSTRIP
 	bool "sstrip removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 47c0801..0a17ce0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -305,7 +305,6 @@ comment "X applications"
 	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
 	source "package/synergy/Config.in"
-	source "package/torsmo/Config.in"
 	source "package/wmctrl/Config.in"
 	source "package/x11vnc/Config.in"
 	source "package/xdotool/Config.in"
diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
deleted file mode 100644
index 5c18ac6..0000000
--- a/package/torsmo/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_TORSMO
-	bool "torsmo"
-	depends on BR2_DEPRECATED_SINCE_2015_11
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	help
-	  Torsmo is a system monitor that sits in the corner of your desktop.
-
-	  http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
diff --git a/package/torsmo/torsmo.hash b/package/torsmo/torsmo.hash
deleted file mode 100644
index 8bbf9dc..0000000
--- a/package/torsmo/torsmo.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 6a6bc82e71c841ba9359f0ffe370e57ef7b04b49a448252bb0c1c28fc10e964c  torsmo-0.18.tar.gz
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
deleted file mode 100644
index 96a7976..0000000
--- a/package/torsmo/torsmo.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# torsmo
-#
-################################################################################
-
-TORSMO_VERSION = 0.18
-TORSMO_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
-TORSMO_LICENSE = BSD-3c
-TORSMO_LICENSE_FILES = COPYING
-
-# help2man doesn't work when cross compiling
-TORSMO_CONF_ENV = ac_cv_path_HELP2MAN=''
-TORSMO_CONF_OPTS = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
-
-TORSMO_DEPENDENCIES = xlib_libX11 xlib_libXext
-
-$(eval $(autotools-package))
-- 
2.9.3

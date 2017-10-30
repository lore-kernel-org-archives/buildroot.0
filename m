From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 30 Oct 2017 07:09:36 +0000
Subject: [Buildroot] [PATCH 1/1] turbovnc: new package
Message-ID: <1509347376-12231-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TurboVNC, a high-performance VNC.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in              |  1 +
 package/turbovnc/Config.in     | 16 ++++++++++++++++
 package/turbovnc/turbovnc.hash |  5 +++++
 package/turbovnc/turbovnc.mk   | 21 +++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/turbovnc/Config.in
 create mode 100644 package/turbovnc/turbovnc.hash
 create mode 100644 package/turbovnc/turbovnc.mk

diff --git a/package/Config.in b/package/Config.in
index dbfb288..2ab14bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -330,6 +330,7 @@ comment "X applications"
 	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
 	source "package/synergy/Config.in"
+	source "package/turbovnc/Config.in"
 	source "package/wmctrl/Config.in"
 	source "package/x11vnc/Config.in"
 	source "package/xdotool/Config.in"
diff --git a/package/turbovnc/Config.in b/package/turbovnc/Config.in
new file mode 100644
index 0000000..6ea2882
--- /dev/null
+++ b/package/turbovnc/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TURBOVNC
+	bool "turbovnc"
+	help
+	  TurboVNC is a high-performance, enterprise-quality version 
+	  of VNC based on TightVNC, TigerVNC, and X.org.
+	  It contains a variant of Tight encoding that is tuned for
+	  maximum performance and compression with 3D applications
+	  (VirtualGL), video, and other image-intensive workloads.
+	  TurboVNC, in combination with VirtualGL, provides a 
+	  complete solution for remotely displaying 3D applications
+	  with interactive performance. TurboVNC's high-speed encoding
+	  methods have been adopted by TigerVNC and libvncserver,
+	  and TurboVNC is also compatible with any other TightVNC
+	  derivative.
+
+	  https://turbovnc.org
diff --git a/package/turbovnc/turbovnc.hash b/package/turbovnc/turbovnc.hash
new file mode 100644
index 0000000..0cad264
--- /dev/null
+++ b/package/turbovnc/turbovnc.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/turbovnc/files/2.1.2/
+md5	9d04b26d40664d0d8072e8b1828f69c4  turbovnc-2.1.2.tar.gz
+sha1	cd99a27cee86f0680410133beb25da1d6f35a3ea  turbovnc-2.1.2.tar.gz
+# Locally computed
+sha256	2389f76eafc48412b980a61280ffb8d111dacd9e51d5e3df2112f505558b48d4  turbovnc-2.1.2.tar.gz
diff --git a/package/turbovnc/turbovnc.mk b/package/turbovnc/turbovnc.mk
new file mode 100644
index 0000000..a861f78
--- /dev/null
+++ b/package/turbovnc/turbovnc.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# turbovnc
+#
+################################################################################
+
+TURBOVNC_VERSION = 2.1.2
+TURBOVNC_SOURCE = turbovnc-$(TURBOVNC_VERSION).tar.gz
+TURBOVNC_SITE = https://downloads.sourceforge.net/project/turbovnc/$(TURBOVNC_VERSION)
+TURBOVNC_DEPENDENCIES = jpeg-turbo linux-pam openssl perl xfont_font-misc-misc xlib_libICE xlib_libSM xlib_libX11 \
+			xlib_libXext xlib_libXau xlib_libXdmcp 
+TURBOVNC_LICENSE = GPL-2.0, MIT (putty), Dual FTL/GPL-2.0+ (freetype) \
+		   bzip2 license (bzip2)
+TURBOVNC_LICENSE_FILES = doc/LICENSE.txt doc/LICENSE-PuTTY.txt \
+			 unix/Xvnc/extras/freetype2/doc/LICENSE.txt \
+			 unix/Xvnc/lib/bzip2/LICENSE
+
+# Build just server
+TURBOVNC_CONF_OPTS += -DTVNC_BUILDJAVA=0 -DTVNC_BUILDNATIVE=0
+
+$(eval $(cmake-package))
-- 
2.7.3

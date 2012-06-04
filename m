From: Julian Lunz <git@jlunz.de>
Date: Mon,  4 Jun 2012 17:57:40 +0200
Subject: [Buildroot] [PATCH] freerdp: new package Signed-off-by: Julian Lunz
	<git@jlunz.de>
Message-ID: <1338825460-6596-1-git-send-email-git@jlunz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in          |    1 +
 package/freerdp/Config.in  |   13 +++++++++++++
 package/freerdp/freerdp.mk |   41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 package/freerdp/Config.in
 create mode 100644 package/freerdp/freerdp.mk

diff --git a/package/Config.in b/package/Config.in
index dde5800..2b69c57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -145,6 +145,7 @@ comment "X applications"
 source "package/alsamixergui/Config.in"
 source "package/docker/Config.in"
 source "package/feh/Config.in"
+source "package/freerdp/Config.in"
 source "package/gqview/Config.in"
 source "package/gmpc/Config.in"
 source "package/gob2/Config.in"
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
new file mode 100644
index 0000000..2039c4a
--- /dev/null
+++ b/package/freerdp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FREERDP
+	bool "freerdp"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_XORG7
+	help
+	  FreeRDPFreeRDP is a free implementation of the 
+	  Remote Desktop Protocol (RDP), released under the Apache license
+
+	  http://www.freerdp.com/
+	  
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
new file mode 100644
index 0000000..97501a1
--- /dev/null
+++ b/package/freerdp/freerdp.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# FreeRDP
+#
+#############################################################
+
+FREERDP_VERSION = 1.0.1
+FREERDP_SOURCE = freerdp-$(FREERDP_VERSION).tar.gz
+FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+FREERDP_CONF_OPT += -DWITH_CUPS=ON
+FREERDP_DEPENDENCIES += cups
+else
+FREERDP_CONF_OPT += -DWITH_CUPS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+FREERDP_CONF_OPT += -DWITH_FFMPEG=ON
+FREERDP_DEPENDENCIES += ffmpeg
+else
+FREERDP_CONF_OPT += -DWITH_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FREERDP_CONF_OPT += -DWITH_ALSA=ON
+FREERDP_DEPENDENCIES += alsa-lib
+else
+FREERDP_CONF_OPT += -DWITH_ALSA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+FREERDP_CONF_OPT += -DWITH_XINERAMA=ON
+FREERDP_DEPENDENCIES += xlib_libXinerama
+else
+FREERDP_CONF_OPT += -DWITH_XINERAMA=OFF
+endif
+
+FREERDP_DEPENDENCIES += openssl xlib_libX11 xlib_libXt zlib
+
+$(eval $(call CMAKETARGETS))
-- 
1.7.0.4

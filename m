From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Jun 2012 00:34:16 +0200
Subject: [Buildroot] [git commit] freerdp: new package
Message-ID: <20120605223754.B9F5496E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9f72abf4bab4e01c5e5848c8b8f05ff6065668a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix help, required and optional dependencies]
Signed-off-by: Julian Lunz <git@jlunz.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/freerdp/Config.in  |   14 ++++++++++
 package/freerdp/freerdp.mk |   62 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 0 deletions(-)

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
index 0000000..c5ff769
--- /dev/null
+++ b/package/freerdp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FREERDP
+	bool "freerdp"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_XORG7
+	help
+	  FreeRDP is a free implementation of the Remote Desktop
+	  Protocol (RDP), released under the Apache license
+
+	  http://www.freerdp.com/
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
new file mode 100644
index 0000000..aeef3fc
--- /dev/null
+++ b/package/freerdp/freerdp.mk
@@ -0,0 +1,62 @@
+#############################################################
+#
+# FreeRDP
+#
+#############################################################
+
+FREERDP_VERSION = 1.0.1
+FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
+
+FREERDP_DEPENDENCIES = openssl zlib \
+	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
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
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+FREERDP_CONF_OPT += -DWITH_PULSEAUDIO=ON
+FREERDP_DEPENDENCIES += pulseaudio
+else
+FREERDP_CONF_OPT += -DWITH_PULSEAUDIO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+FREERDP_CONF_OPT += -DWITH_XINERAMA=ON
+FREERDP_DEPENDENCIES += xlib_libXinerama
+else
+FREERDP_CONF_OPT += -DWITH_XINERAMA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
+FREERDP_CONF_OPT += -DWITH_XKBFILE=ON
+FREERDP_DEPENDENCIES += xlib_libxkbfile
+else
+FREERDP_CONF_OPT += -DWITH_XKBFILE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
+FREERDP_CONF_OPT += -DWITH_XV=ON
+FREERDP_DEPENDENCIES += xlib_libXv
+else
+FREERDP_CONF_OPT += -DWITH_XV=OFF
+endif
+
+$(eval $(call CMAKETARGETS))

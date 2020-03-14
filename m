From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Mar 2020 23:36:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: use --with-sound option
Message-ID: <20200314223641.2552635-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --with-sound option as requested by Thomas Petazzoni in review of
https://patchwork.ozlabs.org/patch/1254693

alsa, libao and pulseaudio are not exclusive, the order of registrations
in rdpsnd_register_drivers define the probe-order when opening the
device for the first time

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rdesktop/rdesktop.mk | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 672d85b5c5..1922c08edc 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -15,20 +15,32 @@ RDESKTOP_DEPENDENCIES = \
 	xlib_libX11 \
 	xlib_libXcursor \
 	xlib_libXt \
-	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
-	$(if $(BR2_PACKAGE_LIBAO),libao) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
-	$(if $(BR2_PACKAGE_PULSEAUDIO),pulseaudio) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr)
 RDESKTOP_CONF_OPTS = --disable-credssp
 RDESKTOP_LICENSE = GPL-3.0+
 RDESKTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+RDESKTOP_DEPENDENCIES += alsa-lib
+RDESKTOP_CONF_OPTS += --with-sound=alsa
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAO),y)
+RDESKTOP_DEPENDENCIES += libao
+RDESKTOP_CONF_OPTS += --with-sound=libao
+endif
+
 ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
 RDESKTOP_DEPENDENCIES += pcsc-lite
 else
 RDESKTOP_CONF_OPTS += --disable-smartcard
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+RDESKTOP_DEPENDENCIES += pulseaudio
+RDESKTOP_CONF_OPTS += --with-sound=pulse
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

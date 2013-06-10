From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Mon, 10 Jun 2013 09:56:14 +0200
Subject: [Buildroot] [PATCH v2] pulseaudio : bump to version 4.0
Message-ID: <1370850974-7849-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

removes a patch that was integrated upstream

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
--
v2 : add license information
     remove dependency on gtk2 since upstream only supports gtk3
---
 .../pulseaudio-compat-with-json-c-0.11.patch       |   26 --------------------
 package/multimedia/pulseaudio/pulseaudio.mk        |   15 +++--------
 2 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch

diff --git a/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch b/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
deleted file mode 100644
index 86efdfd..0000000
--- a/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 759c0bc6f990240287a14fa6dec029ecea581463 Mon Sep 17 00:00:00 2001
-From: Arun Raghavan <arun.raghavan@collabora.co.uk>
-Date: Sat, 27 Apr 2013 03:27:05 +0000
-Subject: build-sys: json-c changed everything :(
-
-json-c 0.11 ships a pkg-config file with a different name, and changes
-the name of its library as well.
----
-(limited to 'configure.ac')
-
-diff --git a/configure.ac b/configure.ac
-index c8161a4..b1bd21a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -624,7 +624,8 @@ AM_CONDITIONAL([HAVE_TESTS], [test "x$HAVE_LIBCHECK" = x1])
- 
- #### json parsing ####
- 
--PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])
-+PKG_CHECK_MODULES(LIBJSON, [ json-c >= 0.11 ], [],
-+		  [PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])])
- AC_SUBST(LIBJSON_CFLAGS)
- AC_SUBST(LIBJSON_LIBS)
- 
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index c789fc8..24a4ef4 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 3.0
+PULSEAUDIO_VERSION = 4.0
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 PULSEAUDIO_INSTALL_STAGING = YES
+PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
+PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL 
 PULSEAUDIO_CONF_OPT = \
 	--localstatedir=/var \
 	--disable-default-build-tests \
@@ -21,7 +23,6 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
-	$(if $(BR2_PACKAGE_LIBGTK2),libgtk2) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
 	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
@@ -31,11 +32,6 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
-# One patch touches configure.ac. We unconditionnally need libglib2
-# because configure.ac uses AM_GLIB_GNU_GETTEXT. This unconditionnal
-# dependency can be removed once the patch is removed.
-PULSEAUDIO_AUTORECONF = YES
-PULSEAUDIO_DEPENDENCIES += libglib2
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
@@ -66,11 +62,6 @@ ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 PULSEAUDIO_CONF_OPT += --disable-alsa
 endif
 
-# gtk support needs x backend
-ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG),yy)
-PULSEAUDIO_CONF_OPT += --disable-gtk2
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_XLIB_LIBSM)$(BR2_PACKAGE_XLIB_LIBXTST),yyy)
 PULSEAUDIO_DEPENDENCIES += libxcb xlib_libSM xlib_libXtst
 
-- 
1.7.10.4

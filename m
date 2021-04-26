From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Apr 2021 21:17:41 +0200
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.26
Message-ID: <20210426185108.DBE3A81076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add pipewire optional dependencies/configurations.

This bump will fix a build failure with bluez plugin and gcc 10

Fixes:
 - http://autobuild.buildroot.org/results/ab2edff9ae6b67d17bee2a11098b046ad754eee1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pipewire/Config.in       |  22 +++++---
 package/pipewire/pipewire.hash   |   6 +-
 package/pipewire/pipewire.mk     | 115 +++++++++++++++++++++++++++++++--------
 package/pulseaudio/pulseaudio.mk |   1 +
 4 files changed, 111 insertions(+), 33 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 9c6b6eb881..ff26e4e361 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
-	depends on BR2_PACKAGE_HAS_UDEV # libudev
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_DBUS
 	help
 	  PipeWire is a server and user space API to deal with
@@ -29,10 +26,19 @@ comment "pipewire gstreamer support needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
-endif
+config BR2_PACKAGE_PIPEWIRE_V4L2
+	bool "pipewire v4l2 plugin"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	help
+	  Build v4l2 plugin
 
-comment "pipewire needs udev and a toolchain w/ threads, headers >= 3.18"
-	depends on BR2_USE_MMU
+comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 	depends on !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
+endif
+
+comment "pipewire needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 81c53867e2..4d2548e3ab 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 bfaa0f6ae6c0791e2e0b59234d399753bf24f1b33dbf587682363a8463dd8df1  pipewire-0.2.7.tar.gz
-sha256 88c0ca786c735a11e0eb508196d3aa1389fbaacb8d5de9adb5ccb15bcd4009d9  LICENSE
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
+sha256  05cc9d25de45290c025da5da1b94fc705bddacd93cf3690d0b2988c1ac501ee1  pipewire-0.3.26.tar.gz
+sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
+sha256  7db6138b0385e260ae8f09f050ea66c4e4fe775a11060d7f6ca2beb47f192d6f  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index df159c5ef4..23bfcdb9ec 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,45 +4,116 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.2.7
+PIPEWIRE_VERSION = 0.3.26
 PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
-PIPEWIRE_LICENSE = LGPL-2.1+
-PIPEWIRE_LICENSE_FILES = LICENSE LGPL
+PIPEWIRE_LICENSE = MIT
+PIPEWIRE_LICENSE_FILES = COPYING LICENSE
 PIPEWIRE_INSTALL_STAGING = YES
-PIPEWIRE_DEPENDENCIES = host-pkgconf alsa-lib dbus udev
+PIPEWIRE_DEPENDENCIES = host-pkgconf dbus
 
-ifeq ($(BR2_PACKAGE_FFMPEG),y)
-PIPEWIRE_DEPENDENCIES += ffmpeg
+PIPEWIRE_CONF_OPTS += \
+	-Ddocs=disabled \
+	-Dexamples=disabled \
+	-Dman=disabled \
+	-Dtests=disabled \
+	-Dspa-plugins=enabled \
+	-Daudiomixer=enabled \
+	-Daudioconvert=enabled \
+	-Dcontrol=enabled \
+	-Daudiotestsrc=enabled \
+	-Dsupport=enabled \
+	-Devl=disabled \
+	-Dtest=disabled \
+	-Dvideoconvert=enabled \
+	-Dvideotestsrc=enabled \
+	-Dvolume=enabled
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+PIPEWIRE_CONF_OPTS += -Dudev=enabled
+PIPEWIRE_DEPENDENCIES += udev
+else
+PIPEWIRE_CONF_OPTS += -Dudev=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-PIPEWIRE_DEPENDENCIES += libva
+ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
+PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
+PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
+else
+PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SBC),y)
-PIPEWIRE_DEPENDENCIES += sbc
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PIPEWIRE_CONF_OPTS += -Dsystemd=enabled
+PIPEWIRE_DEPENDENCIES += systemd
+else
+PIPEWIRE_CONF_OPTS += -Dsystemd=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SDL2),y)
-PIPEWIRE_DEPENDENCIES += sdl2
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
+PIPEWIRE_DEPENDENCIES += alsa-lib
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+PIPEWIRE_CONF_OPTS += -Dalsa=enabled
+else
+PIPEWIRE_CONF_OPTS += -Dalsa=disabled
+endif
+else
+PIPEWIRE_CONF_OPTS += -Dalsa=disabled -Dpipewire-alsa=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-PIPEWIRE_DEPENDENCIES += xlib_libX11
+ifeq ($(BR2_PACKAGE_JACK2),y)
+PIPEWIRE_CONF_OPTS += -Dpipewire-jack=enabled -Djack=enabled
+PIPEWIRE_DEPENDENCIES += jack2
+else
+PIPEWIRE_CONF_OPTS += -Dpipewire-jack=disabled -Djack=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
-PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
-PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
+PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
+PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
 else
-PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
+PIPEWIRE_CONF_OPTS += -Dbluez5=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-PIPEWIRE_CONF_OPTS += -Dsystemd=true
-PIPEWIRE_DEPENDENCIES += systemd
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+PIPEWIRE_CONF_OPTS += -Dffmpeg=enabled
+PIPEWIRE_DEPENDENCIES += ffmpeg
+else
+PIPEWIRE_CONF_OPTS += -Dffmpeg=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_PIPEWIRE_V4L2),y)
+PIPEWIRE_CONF_OPTS += -Dv4l2=enabled
+else
+PIPEWIRE_CONF_OPTS += -Dv4l2=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_HAS_UDEV),yy)
+PIPEWIRE_CONF_OPTS += -Dlibcamera=enabled
+PIPEWIRE_DEPENDENCIES += libcamera
+else
+PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+PIPEWIRE_CONF_OPTS += -Dvulkan=enabled
+PIPEWIRE_DEPENDENCIES += mesa3d
+else
+PIPEWIRE_CONF_OPTS += -Dvulkan=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+PIPEWIRE_CONF_OPTS += -Dpw-cat=enabled -Dsndfile=enabled
+PIPEWIRE_DEPENDENCIES += libsndfile
+else
+PIPEWIRE_CONF_OPTS += -Dpw-cat=disabled -Dsndfile=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2),y)
+PIPEWIRE_DEPENDENCIES += sdl2
+PIPEWIRE_CONF_OPTS += -Dsdl2=enabled
 else
-PIPEWIRE_CONF_OPTS += -Dsystemd=false
+PIPEWIRE_CONF_OPTS += -Dsdl2=disabled
 endif
 
 $(eval $(meson-package))
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index ad1710c6f7..6dfb1f8647 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -22,6 +22,7 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
+	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)

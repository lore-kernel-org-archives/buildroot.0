From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Jul 2020 19:04:44 -0600
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.6
Message-ID: <20200706010444.537633-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add pipewire optional dependencies/configurations.

Remove BR2_PACKAGE_PIPEWIRE_GSTREAMER config option and enable
automatically based on dependencies to avoid recursive dependency
error caused by the gobject-introspection python3 dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Config.in.legacy               |  10 +++
 package/pipewire/Config.in     |  27 +-------
 package/pipewire/pipewire.hash |   6 +-
 package/pipewire/pipewire.mk   | 114 +++++++++++++++++++++++++++------
 4 files changed, 110 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7a5435188b..4541acc979 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
+config BR2_PACKAGE_PIPEWIRE_GSTREAMER
+	bool "pipewire gstreamer option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  This option is now automatically selected when the required
+	  dependencies are present.
+
 config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils version 2.31.1 support removed"
 	select BR2_LEGACY
diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 57e70d65f8..9b8416e27a 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
-	depends on BR2_PACKAGE_HAS_UDEV # libudev
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_DBUS
 	help
 	  PipeWire is a server and user space API to deal with
@@ -11,25 +9,6 @@ config BR2_PACKAGE_PIPEWIRE
 
 	  https://pipewire.org/
 
-if BR2_PACKAGE_PIPEWIRE
-
-config BR2_PACKAGE_PIPEWIRE_GSTREAMER
-	bool "pipewire gstreamer plugins"
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GSTREAMER1
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	help
-	  Build GStreamer plugins
-
-comment "pipewire gstreamer support needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-endif
-
-comment "pipewire needs udev and a toolchain w/ threads"
+comment "pipewire needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 81c53867e2..bce319dda7 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 bfaa0f6ae6c0791e2e0b59234d399753bf24f1b33dbf587682363a8463dd8df1  pipewire-0.2.7.tar.gz
-sha256 88c0ca786c735a11e0eb508196d3aa1389fbaacb8d5de9adb5ccb15bcd4009d9  LICENSE
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
+sha256  927301640f87d68e52f4480667977bc6f47186ee7877f7aa86ce9172ff144edc  pipewire-0.3.6.tar.gz
+sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
+sha256  7db6138b0385e260ae8f09f050ea66c4e4fe775a11060d7f6ca2beb47f192d6f  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index df159c5ef4..14670976f6 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,45 +4,119 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.2.7
+PIPEWIRE_VERSION = 0.3.6
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
+	-Ddocs=false \
+	-Dexamples=false \
+	-Dman=false \
+	-Dtests=false \
+	-Dspa-plugins=true \
+	-Daudiomixer=true \
+	-Daudioconvert=true \
+	-Dcontrol=true \
+	-Daudiotestsrc=true \
+	-Dsupport=true \
+	-Devl=false \
+	-Dtest=false \
+	-Dvideoconvert=true \
+	-Dvideotestsrc=true \
+	-Dvolume=true
+
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+PIPEWIRE_DEPENDENCIES += valgrind
 endif
 
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-PIPEWIRE_DEPENDENCIES += libva
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
+PIPEWIRE_CONF_OPTS += -Dgstreamer=true
+PIPEWIRE_DEPENDENCIES += gobject-introspection gst1-plugins-base
+else
+PIPEWIRE_CONF_OPTS += -Dgstreamer=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PIPEWIRE_CONF_OPTS += -Dsystemd=true
+PIPEWIRE_DEPENDENCIES += systemd
+else
+PIPEWIRE_CONF_OPTS += -Dsystemd=false
 endif
 
-ifeq ($(BR2_PACKAGE_SBC),y)
-PIPEWIRE_DEPENDENCIES += sbc
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=true
+PIPEWIRE_DEPENDENCIES += alsa-lib
+else
+PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=false
 endif
 
+ifeq ($(BR2_PACKAGE_JACK2),y)
+PIPEWIRE_CONF_OPTS += -Dpipewire-jack=true -Djack=true
+PIPEWIRE_DEPENDENCIES += jack2
 ifeq ($(BR2_PACKAGE_SDL2),y)
 PIPEWIRE_DEPENDENCIES += sdl2
 endif
+else
+PIPEWIRE_CONF_OPTS += -Dpipewire-jack=false -Djack=false
+endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-PIPEWIRE_DEPENDENCIES += xlib_libX11
+ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
+PIPEWIRE_CONF_OPTS += -Dpipewire-pulseaudio=true
+PIPEWIRE_DEPENDENCIES += libglib2 pulseaudio
+else
+PIPEWIRE_CONF_OPTS += -Dpipewire-pulseaudio=false
 endif
 
-ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
-PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
-PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_HAS_UDEV),yy)
+PIPEWIRE_CONF_OPTS += -Dalsa=true
+PIPEWIRE_DEPENDENCIES += alsa-lib udev
 else
-PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
+PIPEWIRE_CONF_OPTS += -Dalsa=false
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-PIPEWIRE_CONF_OPTS += -Dsystemd=true
-PIPEWIRE_DEPENDENCIES += systemd
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
+PIPEWIRE_CONF_OPTS += -Dbluez5=true
+PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
 else
-PIPEWIRE_CONF_OPTS += -Dsystemd=false
+PIPEWIRE_CONF_OPTS += -Dbluez5=false
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+PIPEWIRE_CONF_OPTS += -Dffmpeg=true
+PIPEWIRE_DEPENDENCIES += ffmpeg
+else
+PIPEWIRE_CONF_OPTS += -Dffmpeg=false
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+PIPEWIRE_CONF_OPTS += -Dv4l2=true
+PIPEWIRE_DEPENDENCIES += udev
+else
+PIPEWIRE_CONF_OPTS += -Dv4l2=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_HAS_UDEV),yy)
+PIPEWIRE_CONF_OPTS += -Dlibcamera=true
+PIPEWIRE_DEPENDENCIES += libcamera udev
+else
+PIPEWIRE_CONF_OPTS += -Dlibcamera=false
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+PIPEWIRE_CONF_OPTS += -Dvulkan=true
+PIPEWIRE_DEPENDENCIES += mesa3d
+else
+PIPEWIRE_CONF_OPTS += -Dvulkan=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+PIPEWIRE_CONF_OPTS += -Dpw-cat=true
+PIPEWIRE_DEPENDENCIES += libsndfile
+else
+PIPEWIRE_CONF_OPTS += -Dpw-cat=false
 endif
 
 $(eval $(meson-package))
-- 
2.25.1

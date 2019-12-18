From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:33:08 +0100
Subject: [Buildroot] [git commit] package/pipewire: add missing
 dependencies/plugins
Message-ID: <20191218222548.D10068125F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac92146ebb7627378c0a8c92f6490e55333eb6bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added missing required and optional dependencies.
Provide option to enable gstreamer plugin.

Fixes:

  http://autobuild.buildroot.net/results/9671ad63b1ae147a6f660337cb4b3dc38209067c/
  http://autobuild.buildroot.net/results/0e80841fe9937d7a5142035c2a41158166bcf8df/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Thomas:
 - enclose new option in if ... endif block
 - add missing Config.in comment
 - add dependency on gstreamer1 in .mk file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/Config.in   | 23 ++++++++++++++++++++++-
 package/pipewire/pipewire.mk | 22 ++++++++++++++++++++--
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index ca23e6cff0..d7a4a51b38 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,7 +1,9 @@
 menuconfig BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_HAS_UDEV # libudev
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_DBUS
 	help
 	  PipeWire is a server and user space API to deal with
@@ -9,6 +11,25 @@ menuconfig BR2_PACKAGE_PIPEWIRE
 
 	  https://pipewire.org/
 
+if BR2_PACKAGE_PIPEWIRE
+
+config BR2_PACKAGE_PIPEWIRE_GSTREAMER
+	bool "pipewire gstreamer plugins"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  Build GStreamer plugins
+
+comment "pipewire gstreamer support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
+
 comment "pipewire needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 7717095535..ed98ff7f3b 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -9,8 +9,26 @@ PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
 PIPEWIRE_LICENSE = LGPL-2.1+
 PIPEWIRE_LICENSE_FILES = LICENSE LGPL
 PIPEWIRE_INSTALL_STAGING = YES
-PIPEWIRE_DEPENDENCIES = host-pkgconf dbus
-PIPEWIRE_CONF_OPTS = -Dgstreamer=disabled
+PIPEWIRE_DEPENDENCIES = host-pkgconf alsa-lib dbus udev
+
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+PIPEWIRE_DEPENDENCIES += ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_SBC),y)
+PIPEWIRE_DEPENDENCIES += sbc
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2),y)
+PIPEWIRE_DEPENDENCIES += sdl2
+endif
+
+ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
+PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
+PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
+else
+PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
+endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PIPEWIRE_CONF_OPTS += -Dsystemd=true

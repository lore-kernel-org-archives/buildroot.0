From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Jan 2020 17:32:44 -0700
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.2.92
Message-ID: <20200121003244.69514-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add pipewire optional dependencies/configurations.

Add patch to fix ERROR: Unknown variable "alsa_dep". when building
without alsa-lib.

Disable Simple Plugin integration for now.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-meson-add-examples-option.patch      | 69 +++++++++++++++++++
 package/pipewire/pipewire.hash                |  2 +-
 package/pipewire/pipewire.mk                  | 42 ++++++++++-
 3 files changed, 109 insertions(+), 4 deletions(-)
 create mode 100644 package/pipewire/0001-meson-add-examples-option.patch

diff --git a/package/pipewire/0001-meson-add-examples-option.patch b/package/pipewire/0001-meson-add-examples-option.patch
new file mode 100644
index 0000000000..2a96dbb55c
--- /dev/null
+++ b/package/pipewire/0001-meson-add-examples-option.patch
@@ -0,0 +1,69 @@
+From 54f4edcbaccbc3bdf6ce262c53e625032b22d3e8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 18 Jan 2020 13:59:28 +0100
+Subject: [PATCH] meson: add examples option
+
+Add an option to allow the user to disable examples, this will allow to
+build pipewire without alsa. Without this option, build with
+-Dpipewire-alsa=false -Dalsa=false fails on:
+
+src/examples/meson.build:47:0: ERROR: Unknown variable "alsa_dep".
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/pipewire/pipewire/merge_requests/217]
+---
+ meson_options.txt | 4 ++++
+ spa/meson.build   | 4 +++-
+ src/meson.build   | 4 +++-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 5a738ddb..e8eece7f 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -2,6 +2,10 @@ option('docs',
+        description: 'Build documentation',
+        type: 'boolean',
+        value: false)
++option('examples',
++       description: 'Build examples',
++       type: 'boolean',
++       value: true)
+ option('man',
+        description: 'Build manpages',
+        type: 'boolean',
+diff --git a/spa/meson.build b/spa/meson.build
+index 42780a8c..37c034a4 100644
+--- a/spa/meson.build
++++ b/spa/meson.build
+@@ -39,7 +39,9 @@ endif
+ 
+ subdir('tools')
+ subdir('tests')
+-subdir('examples')
++if get_option('examples')
++  subdir('examples')
++endif
+ 
+ pkgconfig.generate(filebase : 'libspa- at 0@'.format(spaversion),
+   name : 'libspa',
+diff --git a/src/meson.build b/src/meson.build
+index 41f03ac6..1b43663a 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -4,7 +4,9 @@ subdir('extensions')
+ subdir('daemon')
+ subdir('tools')
+ subdir('modules')
+-subdir('examples')
++if get_option('examples')
++  subdir('examples')
++endif
+ subdir('tests')
+ 
+ if get_option('gstreamer')
+-- 
+2.20.1
+
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 81c53867e2..fa21c0c303 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 bfaa0f6ae6c0791e2e0b59234d399753bf24f1b33dbf587682363a8463dd8df1  pipewire-0.2.7.tar.gz
+sha256 e50512c888209100047d9075445c650c0fbe55a1bcc8ed122713b67150062068  pipewire-0.2.92.tar.gz
 sha256 88c0ca786c735a11e0eb508196d3aa1389fbaacb8d5de9adb5ccb15bcd4009d9  LICENSE
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index df159c5ef4..7405872a2d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,13 +4,28 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.2.7
+PIPEWIRE_VERSION = 0.2.92
 PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
 PIPEWIRE_LICENSE = LGPL-2.1+
 PIPEWIRE_LICENSE_FILES = LICENSE LGPL
 PIPEWIRE_INSTALL_STAGING = YES
 PIPEWIRE_DEPENDENCIES = host-pkgconf alsa-lib dbus udev
 
+PIPEWIRE_CONF_OPTS += \
+	-Dman=false \
+	-Dspa-plugins=false \
+	-Dalsa=false \
+	-Daudiomixer=false \
+	-Daudioconvert=false \
+	-Dbluez5=false \
+	-Dcontrol=false \
+	-Djack=false \
+	-Dsupport=false \
+	-Dv4l2=false \
+	-Dvideoconvert=false \
+	-Dvulkan=false \
+	-Dexamples=false
+
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 PIPEWIRE_DEPENDENCIES += ffmpeg
 endif
@@ -31,11 +46,32 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 PIPEWIRE_DEPENDENCIES += xlib_libX11
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=true
+PIPEWIRE_DEPENDENCIES += alsa-lib
+else
+PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=false
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2),y)
+PIPEWIRE_CONF_OPTS += -Dpipewire-jack=true
+PIPEWIRE_DEPENDENCIES += jack2
+else
+PIPEWIRE_CONF_OPTS += -Dpipewire-jack=false
+endif
+
 ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
-PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
+PIPEWIRE_CONF_OPTS += -Dgstreamer=true
 PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
 else
-PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
+PIPEWIRE_CONF_OPTS += -Dgstreamer=false
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+PIPEWIRE_CONF_OPTS += -Dpipewire-pulseaudio=true
+PIPEWIRE_DEPENDENCIES += pulseaudio
+else
+PIPEWIRE_CONF_OPTS += -Dpipewire-pulseaudio=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.20.1

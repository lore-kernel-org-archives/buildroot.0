From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  2 Nov 2017 11:20:15 -0400
Subject: [Buildroot] [PATCH v4 1/1] gstreamer1-mm: new package
Message-ID: <20171102152015.30318-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gstreamermm provides C++ bindings for gstreamer.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Changed the name of the package from gst1-mm to gstreamer1-mm (Arnout)
  - Added upstream author information to the patches (Arnout)
  - Changed the upstream repo from github to git.gnome.org (Arnout)
  - Added myself to the DEVELOPERS file.
  - Added --enable-unittests=no to the mk file, as the default is auto.

Changes v2 -> v3:
  - Added proper dependencies.
  - Added depenency explination.
  - Changed "Gstreamer C++ bindings" to "gstreamer1-mm"
  - Moved package selection to right below gstreamer1 selection in
    menuconfig.

Changes v3 -> v4:
  - Updated comments on dependencies (Baruch)
  - Updated gcc dependency to 4.9 (glibmm)
  - Updated to version 1.10
  - Removed upstreamed patches
  - Updated remove-gstreamer-check-dependency.patch to work with 1.10
  - Removed --disable-plugins-bad (no longer in 1.10)
  - Added --disable-deprecated-api (new to 1.10)
  - Added hash's for license files.
  - Updated license files.

 DEVELOPERS                                         |  1 +
 package/gstreamer1/Config.in                       |  1 +
 .../0001-remove-gstreamer-check-dependency.patch   | 29 ++++++++++++++++++++++
 package/gstreamer1/gstreamer1-mm/Config.in         | 28 +++++++++++++++++++++
 .../gstreamer1/gstreamer1-mm/gstreamer1-mm.hash    |  6 +++++
 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk  | 24 ++++++++++++++++++
 6 files changed, 89 insertions(+)
 create mode 100644 package/gstreamer1/gstreamer1-mm/0001-remove-gstreamer-check-dependency.patch
 create mode 100644 package/gstreamer1/gstreamer1-mm/Config.in
 create mode 100644 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
 create mode 100644 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 632d87a829..886dbd7961 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/gstreamer1/gst1-rtsp-server/
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/audit/
 F:	package/checkpolicy/
+F:	package/gstreamer1/gstreamer1-mm/
 F:	package/gstreamer1/gst1-vaapi/
 F:	package/janus-gateway/
 F:	package/libressl/
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index aef75b55bf..76c32bc6c6 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -2,6 +2,7 @@
 source "package/gstreamer1/gstreamer1/Config.in"
 
 if BR2_PACKAGE_GSTREAMER1
+source "package/gstreamer1/gstreamer1-mm/Config.in"
 source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
diff --git a/package/gstreamer1/gstreamer1-mm/0001-remove-gstreamer-check-dependency.patch b/package/gstreamer1/gstreamer1-mm/0001-remove-gstreamer-check-dependency.patch
new file mode 100644
index 0000000000..6f7acd7fb0
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-mm/0001-remove-gstreamer-check-dependency.patch
@@ -0,0 +1,29 @@
+From 34637fd7b5cb8cf817858f18d47dc156b52c04bc Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Thu, 2 Nov 2017 10:39:00 -0400
+Subject: [PATCH] remove gstreamer-check dependency
+
+gstreamer-check is disabled by default in buildroot and isn't required to
+build gstreamermm.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 45d92d4..903e00e 100755
+--- a/configure
++++ b/configure
+@@ -16633,7 +16633,7 @@ fi
+ # The format below is used so that the requirements appear nicely in the .pc
+ # file.
+ 
+-GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.10.0 gstreamer-base-1.0 >= 1.10.0 gstreamer-check-1.0 >= 1.10.0 gstreamer-controller-1.0 >= 1.10.0 gstreamer-net-1.0 >= 1.10.0 gstreamer-allocators-1.0 >= 1.10.0 gstreamer-app-1.0 >= 1.10.0 gstreamer-audio-1.0 >= 1.10.0 gstreamer-fft-1.0 >= 1.10.0 gstreamer-pbutils-1.0 >= 1.10.0 gstreamer-plugins-base-1.0 >= 1.10.0 gstreamer-riff-1.0 >= 1.10.0 gstreamer-rtp-1.0 >= 1.10.0 gstreamer-rtsp-1.0 >= 1.10.0 gstreamer-sdp-1.0 >= 1.10.0 gstreamer-tag-1.0 >= 1.10.0 gstreamer-video-1.0 >= 1.10.0'
++GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.10.0 gstreamer-base-1.0 >= 1.10.0 gstreamer-controller-1.0 >= 1.10.0 gstreamer-net-1.0 >= 1.10.0 gstreamer-allocators-1.0 >= 1.10.0 gstreamer-app-1.0 >= 1.10.0 gstreamer-audio-1.0 >= 1.10.0 gstreamer-fft-1.0 >= 1.10.0 gstreamer-pbutils-1.0 >= 1.10.0 gstreamer-plugins-base-1.0 >= 1.10.0 gstreamer-riff-1.0 >= 1.10.0 gstreamer-rtp-1.0 >= 1.10.0 gstreamer-rtsp-1.0 >= 1.10.0 gstreamer-sdp-1.0 >= 1.10.0 gstreamer-tag-1.0 >= 1.10.0 gstreamer-video-1.0 >= 1.10.0'
+ 
+ 
+ 
+-- 
+2.13.6
+
diff --git a/package/gstreamer1/gstreamer1-mm/Config.in b/package/gstreamer1/gstreamer1-mm/Config.in
new file mode 100644
index 0000000000..69ebddbf06
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-mm/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_GSTREAMER1_MM
+	bool "gstreamer1-mm"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # glibmm
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm
+	depends on BR2_USE_WCHAR # glibmm -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # glibmm -> libglib2
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GLIBMM
+	help
+	  gstreamermm provides C++ bindings for the GStreamer streaming
+	  multimedia library (http://gstreamer.freedesktop.org). With
+	  gstreamermm it is possible to	develop applications that work
+	  with multimedia in C++.
+
+	  gstreamermm is developed over glibmm, libsigc++ and libxml++
+	  and the functionalities they provide. This means that, among
+	  other things, referencing and unreferencing of GObjects is
+	  handled automatically via glibmm's automatic pointer class,
+	  Glib::RefPtr, and libsigc++'s slots are used for callbacks and
+	  signals.
+
+	  https://gstreamer.freedesktop.org/bindings/cplusplus.html
+
+comment "gstreamer1-mm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
new file mode 100644
index 0000000000..425cf05f39
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
@@ -0,0 +1,6 @@
+# From http://ftp.gnome.org/pub/gnome/sources/gstreamermm/1.10/gstreamermm-1.10.0.sha256sum
+sha256 be58fe9ef7d7e392568ec85e80a84f4730adbf91fb0355ff7d7c616675ea8d60 gstreamermm-1.10.0.tar.xz
+
+# Locally computed
+sha256 7c78a8d7fc6781d51402d5a6036bedda9cffb0e5d28757e25d54d6eacbb1949f  COPYING
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.examples
diff --git a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk
new file mode 100644
index 0000000000..539c9df1cb
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# gstreamer1-mm
+#
+################################################################################
+
+GSTREAMER1_MM_VERSION_MAJOR = 1.10
+GSTREAMER1_MM_VERSION = $(GSTREAMER1_MM_VERSION_MAJOR).0
+GSTREAMER1_MM_SITE = http://ftp.gnome.org/pub/gnome/sources/gstreamermm/$(GSTREAMER1_MM_VERSION_MAJOR)
+GSTREAMER1_MM_SOURCE = gstreamermm-$(GSTREAMER1_MM_VERSION).tar.xz
+GSTREAMER1_MM_LICENSE = LGPL-2.1+ (library), GPL-2.0 (examples)
+GSTREAMER1_MM_LICENSE_FILES = COPYING COPYING.examples
+GSTREAMER1_MM_INSTALL_STAGING = YES
+GSTREAMER1_MM_DEPENDENCIES += \
+	glibmm \
+	gstreamer1 \
+	gst1-plugins-base
+
+GSTREAMER1_MM_CONF_OPTS += \
+	--disable-gl \
+	--enable-unittests=no \
+	--disable-deprecated-api
+
+$(eval $(autotools-package))
-- 
2.13.6

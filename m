From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 16:37:56 +0100
Subject: [Buildroot] [git commit] gstreamer1-mm: new package
Message-ID: <20171214154102.F01B482BD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f087d9f861b2d5df24dcacb861d4c075348ea39b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gstreamermm provides C++ bindings for gstreamer.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/gstreamer1/Config.in                       |  1 +
 package/gstreamer1/gstreamer1-mm/Config.in         | 29 ++++++++++++++++++++++
 .../gstreamer1/gstreamer1-mm/gstreamer1-mm.hash    |  6 +++++
 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk  | 24 ++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8f94175..b476f4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,6 +35,7 @@ F:	package/busybox/
 F:	package/checkpolicy/
 F:	package/cppdb/
 F:	package/gstreamer1/gstreamer1/
+F:	package/gstreamer1/gstreamer1-mm/
 F:	package/gstreamer1/gst1-plugins-bad/
 F:	package/gstreamer1/gst1-plugins-base/
 F:	package/gstreamer1/gst1-plugins-good/
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index aef75b5..76c32bc 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -2,6 +2,7 @@
 source "package/gstreamer1/gstreamer1/Config.in"
 
 if BR2_PACKAGE_GSTREAMER1
+source "package/gstreamer1/gstreamer1-mm/Config.in"
 source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
diff --git a/package/gstreamer1/gstreamer1-mm/Config.in b/package/gstreamer1/gstreamer1-mm/Config.in
new file mode 100644
index 0000000..471c083
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-mm/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_GSTREAMER1_MM
+	bool "gstreamer1-mm"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # glibmm
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm
+	depends on BR2_USE_WCHAR # glibmm -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # glibmm -> libglib2
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_GSTREAMER1_CHECK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
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
index 0000000..425cf05
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
index 0000000..539c9df
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

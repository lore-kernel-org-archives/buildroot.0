From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 22:52:44 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: Add OpenAL dependency
Message-ID: <20151220215314.EFE01822F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9412dfe6c1e6ae3f4cd88c4adfdd6760873531c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 10 ++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index f771401..134e1aa 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -562,6 +562,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 	help
 	  lib neon http client src
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
+	bool "openal"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_OPENAL
+
+comment "openal plugin needs a toolchain w/ NPTL, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
 	depends on BR2_PACKAGE_OPENCV
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index a707df9..64760a8 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -57,7 +57,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-mplex \
 	--disable-nas \
 	--disable-ofa \
-	--disable-openal \
 	--disable-openexr \
 	--disable-openjpeg \
 	--disable-openni2 \
@@ -702,6 +701,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-neon
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-openal
+GST1_PLUGINS_BAD_DEPENDENCIES += openal
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-openal
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-opencv
 GST1_PLUGINS_BAD_DEPENDENCIES += opencv

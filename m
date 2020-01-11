From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:48:43 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 fluidsynth option
Message-ID: <20200111144129.316DE8A3FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24e7ae452130cfbd3cbe63adccdc54fd18f3c965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 13 +++++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  8 +++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 393950ef2f..d831f8072e 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -397,6 +397,19 @@ comment "fdk-aac needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
+	bool "fluidsynth"
+	depends on BR2_USE_WCHAR # fluidsynth
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fluidsynth
+	depends on BR2_USE_MMU # fluidsynth
+	select BR2_PACKAGE_FLUIDSYNTH
+	help
+	  Fluidsynth MIDI decoder plugin
+
+comment "fluidsynth needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	bool "gl"
 	default y
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 259f00cdbb..ef36e4dc0a 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -42,7 +42,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dfaac=disabled \
 	-Dflite=disabled \
 	-Dgsm=disabled \
-	-Dfluidsynth=disabled \
 	-Dkate=disabled \
 	-Dladspa=disabled \
 	-Dlv2=disabled \
@@ -526,6 +525,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dfdkaac=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfluidsynth=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += fluidsynth
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfluidsynth=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dgl=enabled
 else

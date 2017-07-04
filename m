From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 12:14:06 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: bump version to 1.12.0
Message-ID: <20170704113141.ED09580526@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76722342000dbe1062983c470ac7bc2bfe14e54d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove non-existant or unnecessary configure options:

  --disable-oggtest, --disable-vorbistest:
    It looks like these options will be taken into account by ogg.m4 and
    vorbis.m4 only when ogg and vobis are enabled. However, according to
    the code on those m4 files these two options are disabled by default.

  --disable-gio_unix_2_0:
    I don't know where this option comes from.

  --disable-freetypetest:
    https://github.com/GStreamer/gst-plugins-base/commit/183610c035dd6955c9b3540b940aec50474af031

[Peter: add rawparse plugin]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-base/Config.in              |  5 +++++
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash |  4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 12 +++++++-----
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index a17f2ad..6b08b68 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -66,6 +66,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 	help
 	  Resamples audio
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_RAWPARSE
+	bool "rawparse"
+	help
+	  Parses byte streams into raw frames
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE
 	bool "subparse"
 	help
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index b526b14..b0fc90a 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.10.4.tar.xz.sha256sum
-sha256 f6d245b6b3d4cb733f81ebb021074c525ece83db0c10e932794b339b8d935eb7  gst-plugins-base-1.10.4.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.0.tar.xz.sha256sum
+sha256 345fc6877f54b8b6e97aacf2996be37a51a0e369f53fc2cf83108af9f764364d  gst-plugins-base-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 08f53f7..9fb5b17 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.10.4
+GST1_PLUGINS_BASE_VERSION = 1.12.0
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -14,10 +14,6 @@ GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
 # gio_unix_2_0 is only used for tests
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
-	--disable-oggtest \
-	--disable-vorbistest \
-	--disable-gio_unix_2_0 \
-	--disable-freetypetest \
 	--disable-valgrind
 
 # Options which require currently unpackaged libraries
@@ -95,6 +91,12 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioresample
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_RAWPARSE),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-rawparse
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-rawparse
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-subparse
 else

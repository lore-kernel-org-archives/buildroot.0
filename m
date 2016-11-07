From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 21:50:38 +0100
Subject: [Buildroot] [git commit branch/next] gst1-plugins-bad: add srtp
	support
Message-ID: <20161107205050.2D1FB80AC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3295a5ef4d41f91fbe9d8d2e690768c8056f3fd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It's not new for 1.10.0 but hasn't been enabled when libsrtp was added
to buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 4 ++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 40bb283..16c0b7e 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -665,6 +665,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
 	bool "sndfile"
 	select BR2_PACKAGE_LIBSNDFILE
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SRTP
+	bool "srtp"
+	select BR2_PACKAGE_LIBSRTP
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 012b948..098cf2b 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -44,7 +44,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-ladspa \
 	--disable-lv2 \
 	--disable-libde265 \
-	--disable-srtp \
 	--disable-linsys \
 	--disable-modplug \
 	--disable-mimic \
@@ -780,6 +779,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-sndfile
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SRTP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-srtp
+GST1_PLUGINS_BAD_DEPENDENCIES += libsrtp
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-srtp
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-vcd
 else

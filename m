From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Nov 2016 06:58:40 -0300
Subject: [Buildroot] [PATCH 14/14] gst1-plugins-bad: add srtp support
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1478167120-3285-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not new for 1.10.0 but hasn't been enabled when libsrtp was added
to buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 4 ++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index ac081b5..4143f41 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -670,6 +670,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
 	bool "sndfile"
 	select BR2_PACKAGE_LIBSNDFILE
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SRTP
+	bool "srtp"
+	select BR2_PACKAGE_LIBSRTP
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index a42bb0c..9e61b86 100644
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
-- 
2.7.3

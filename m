From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 20:59:17 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix bluez plugin
	compilation on big endian
Message-ID: <20131005190419.AE9B59B955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c05e6357b08725acd83fe66a3df13a13ccb3c73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/5cd/5cdc28f3040b17f19d94f3b2a2bf669e2e921077/

Patch from upstream git.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uez-Fix-compilation-on-big-endian-systems.patch |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-bluez-Fix-compilation-on-big-endian-systems.patch b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-bluez-Fix-compilation-on-big-endian-systems.patch
new file mode 100644
index 0000000..1bcdeff
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-bluez-Fix-compilation-on-big-endian-systems.patch
@@ -0,0 +1,39 @@
+From 1ab90f259fee4fa9a7c10dac0a1e85799a15881b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <slomo@circular-chaos.org>
+Date: Wed, 25 Sep 2013 20:25:03 +0200
+Subject: [PATCH] bluez: Fix compilation on big endian systems
+
+---
+ sys/bluez/gstavdtputil.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sys/bluez/gstavdtputil.c b/sys/bluez/gstavdtputil.c
+index dea803a..ed5c276 100644
+--- a/sys/bluez/gstavdtputil.c
++++ b/sys/bluez/gstavdtputil.c
+@@ -611,11 +611,11 @@ gst_avdtp_util_parse_aac_raw (void *config)
+   GValue value = G_VALUE_INIT;
+   GValue value_str = G_VALUE_INIT;
+   GValue list = G_VALUE_INIT;
++  a2dp_aac_t aac_local = { 0 };
++  a2dp_aac_t *aac = &aac_local;
+ 
+ #if G_BYTE_ORDER == G_LITTLE_ENDIAN
+   uint8_t *raw = (uint8_t *) config;
+-  a2dp_aac_t aac_local = { 0 };
+-  a2dp_aac_t *aac = &aac_local;
+   aac->object_type = raw[0];
+   aac->frequency = (raw[1] << 4) | ((raw[2] & 0xFF) >> 4);
+   aac->channels = (raw[2] >> 2) & 0x3;
+@@ -624,7 +624,7 @@ gst_avdtp_util_parse_aac_raw (void *config)
+   aac->bitrate = (raw[4] << 16) | (raw[3] << 8) | raw[4];
+   aac->bitrate &= ~0x800000;
+ #elif G_BYTE_ORDER == G_BIG_ENDIAN
+-  *aac = (a2dp_aac_t *) config;
++  *aac = *((a2dp_aac_t *) config);
+ #else
+ #error "Unknown byte order"
+ #endif
+-- 
+1.7.10.4
+

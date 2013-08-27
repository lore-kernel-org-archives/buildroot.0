From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 21:12:09 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version
Message-ID: <20130831213337.88A579B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df4269e6d615de0d85e64a37fbb0f800b02f8802
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is now upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...dpsink-unbreak-on-IPv6-systems-after-1302.patch |   44 --------------------
 .../gst1-plugins-good/gst1-plugins-good.mk         |    2 +-
 2 files changed, 1 insertions(+), 45 deletions(-)

diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch b/package/multimedia/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch
deleted file mode 100644
index 68a9969..0000000
--- a/package/multimedia/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 118876702467d6063e9c9745b7d093682ad16472 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Fri, 19 Jul 2013 15:24:08 +0200
-Subject: [PATCH] (dyn|multi)udpsink: unbreak on !IPv6 systems after 130268bc
- (Bind socket before using it)
-
-The g_socket functions only touch the error argument on errors, so clear
-err back to NULL in case g_socket_new (G_SOCKET_FAMILY_IPV6) failed, as
-we check for err != NULL later on to know if g_socket_bind() failed,
-otherwise we errously fail on systems without IPv6 support.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=704553
----
- gst/udp/gstdynudpsink.c   |    1 +
- gst/udp/gstmultiudpsink.c |    1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/gst/udp/gstdynudpsink.c b/gst/udp/gstdynudpsink.c
-index 4690bde..fadbd7f 100644
---- a/gst/udp/gstdynudpsink.c
-+++ b/gst/udp/gstdynudpsink.c
-@@ -316,6 +316,7 @@ gst_dynudpsink_start (GstBaseSink * bsink)
-     if ((udpsink->used_socket =
-             g_socket_new (G_SOCKET_FAMILY_IPV6,
-                 G_SOCKET_TYPE_DATAGRAM, G_SOCKET_PROTOCOL_UDP, &err)) == NULL) {
-+      g_clear_error (&err);
-       udpsink->family = G_SOCKET_FAMILY_IPV4;
-       if ((udpsink->used_socket = g_socket_new (G_SOCKET_FAMILY_IPV4,
-                   G_SOCKET_TYPE_DATAGRAM, G_SOCKET_PROTOCOL_UDP, &err)) == NULL)
-diff --git a/gst/udp/gstmultiudpsink.c b/gst/udp/gstmultiudpsink.c
-index 92d1bac..69011c7 100644
---- a/gst/udp/gstmultiudpsink.c
-+++ b/gst/udp/gstmultiudpsink.c
-@@ -868,6 +868,7 @@ gst_multiudpsink_start (GstBaseSink * bsink)
-     if (sink->force_ipv4 || (sink->used_socket =
-             g_socket_new (G_SOCKET_FAMILY_IPV6,
-                 G_SOCKET_TYPE_DATAGRAM, G_SOCKET_PROTOCOL_UDP, &err)) == NULL) {
-+      g_clear_error (&err);
-       if ((sink->used_socket = g_socket_new (G_SOCKET_FAMILY_IPV4,
-                   G_SOCKET_TYPE_DATAGRAM, G_SOCKET_PROTOCOL_UDP, &err)) == NULL)
-         goto no_socket;
--- 
-1.7.10.4
-
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
index 614a006..4455d65 100644
--- a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.0.8
+GST1_PLUGINS_GOOD_VERSION = 1.0.9
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING

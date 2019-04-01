From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  2 Apr 2019 00:02:28 +0200
Subject: [Buildroot] [PATCH] package/gstreamer1/gst-omx: make variant
 mutually exclusive
Message-ID: <20190401220228.4923-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit cc419509506 added the GST_OMX_VARIANT option which gets a default
value that gets overridden by subsequent conditions. check-package
doesn't like that, so instead make the three cases explicitly mutually
exclusive.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index b8a8cd8457..bb325ad1d2 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -11,8 +11,6 @@ GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 GST_OMX_LICENSE = LGPL-2.1
 GST_OMX_LICENSE_FILES = COPYING
 
-GST_OMX_VARIANT = generic
-
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 GST_OMX_VARIANT = rpi
 GST_OMX_CONF_ENV = \
@@ -20,9 +18,7 @@ GST_OMX_CONF_ENV = \
 		-I$(STAGING_DIR)/usr/include/IL \
 		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
 		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
-endif
-
-ifeq ($(BR2_PACKAGE_BELLAGIO),y)
+else ifeq ($(BR2_PACKAGE_BELLAGIO),y)
 GST_OMX_VARIANT = bellagio
 GST_OMX_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) \
@@ -30,6 +26,8 @@ GST_OMX_CONF_ENV = \
 		-DOMX_VERSION_MINOR=1 \
 		-DOMX_VERSION_REVISION=2 \
 		-DOMX_VERSION_STEP=0"
+else
+GST_OMX_VARIANT = generic
 endif
 
 GST_OMX_CONF_OPTS += --with-omx-target=$(GST_OMX_VARIANT)
-- 
2.20.1

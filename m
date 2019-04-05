From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:36:08 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/gstreamer1/gst-omx: default to pass --with-omx-target=generic
Message-ID: <20190405153704.B8F7F8D785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ac0076598e09905e294585fe0a7eda26c13a421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

target defaults to none, which isn't a legal target:

configure: Using none as OpenMAX IL target
configure: error: invalid OpenMAX IL target, you must specify one of --with-omx-target={generic,rpi,bellagio,tizonia,zynqultrascaleplus}

Instead default to 'generic', fixing the build with E.G. nvidia-tegra23.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cc419509506573ed040dd4487c2d79ae36c24b13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 5dda1eb145..b8a8cd8457 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -11,9 +11,10 @@ GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 GST_OMX_LICENSE = LGPL-2.1
 GST_OMX_LICENSE_FILES = COPYING
 
+GST_OMX_VARIANT = generic
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-GST_OMX_CONF_OPTS = \
-	--with-omx-target=rpi
+GST_OMX_VARIANT = rpi
 GST_OMX_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) \
 		-I$(STAGING_DIR)/usr/include/IL \
@@ -22,8 +23,7 @@ GST_OMX_CONF_ENV = \
 endif
 
 ifeq ($(BR2_PACKAGE_BELLAGIO),y)
-GST_OMX_CONF_OPTS = \
-	--with-omx-target=bellagio
+GST_OMX_VARIANT = bellagio
 GST_OMX_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) \
 		-DOMX_VERSION_MAJOR=1 \
@@ -32,6 +32,8 @@ GST_OMX_CONF_ENV = \
 		-DOMX_VERSION_STEP=0"
 endif
 
+GST_OMX_CONF_OPTS += --with-omx-target=$(GST_OMX_VARIANT)
+
 GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
 
 # adjust library paths to where buildroot installs them

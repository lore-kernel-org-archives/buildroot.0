From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:25:16 +0200
Subject: [Buildroot] [git commit] package/gst1-vaapi: bump version to 1.18.0
 and convert to meson
Message-ID: <20200923201700.602E48756F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f98c491e81ee44441cae6f121b86791c0566578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  6 +++---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 21 ++++++++++++---------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index f9bec2483a..796e27eca7 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.16.2.tar.xz.sha256sum
-sha256 191de7b0ab64a85dd0875c990721e7be95518f60e2a9106beca162004ed7c601 gstreamer-vaapi-1.16.2.tar.xz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.0.tar.xz.sha256sum
+sha256  c6efeb8c736f75bb1b53ab18413c60c4321300e7aee66641bcc07d59c2fe9e31  gstreamer-vaapi-1.18.0.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 00a6ec5e0e..bcd854af5f 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.16.2
+GST1_VAAPI_VERSION = 1.18.0
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
@@ -18,16 +18,19 @@ GST1_VAAPI_DEPENDENCIES += \
 	libdrm
 
 GST1_VAAPI_CONF_OPTS += \
-	--disable-x11 \
-	--disable-glx \
-	--disable-wayland \
-	--disable-egl \
-	--disable-gtk-doc-html
+	-Dwith_drm=yes \
+	-Dwith_x11=no \
+	-Dwith_glx=no \
+	-Dwith_wayland=no \
+	-Dwith_egl=no \
+	-Dexamples=disabled \
+	-Dtest=disabled \
+	-Ddoc=disabled
 
 ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
-GST1_VAAPI_CONF_OPTS += --enable-encoders
+GST1_VAAPI_CONF_OPTS += -Dwith_encoders=yes
 else
-GST1_VAAPI_CONF_OPTS += --disable-encoders
+GST1_VAAPI_CONF_OPTS += -Dwith_encoders=no
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))

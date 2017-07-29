From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 29 Jul 2017 16:18:44 +0300
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Allow building with
	BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
Message-ID: <20170729131844.3502-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
missing feature dependency in the WebKitGTK+ build files.

Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index b200d23262..e30d07fc1d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -40,9 +40,13 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_WEB_AUDIO=ON
 WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
 else
+# ENABLE_MEDIA_STREAM has to be explicitly disabled because there is a missing
+# feature dependency in the WebKitGTK+ CMake files. This can be removed once
+# https://bugs.webkit.org/show_bug.cgi?id=174940 makes it into a release.
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF
+	-DENABLE_WEB_AUDIO=OFF \
+	-DENABLE_MEDIA_STREAM=OFF
 endif
 
 # Only one target platform can be built, assume X11 > Wayland
-- 
2.13.3

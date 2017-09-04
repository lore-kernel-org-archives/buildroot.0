From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 09:00:52 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] webkitgtk: Allow building
	with BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
Message-ID: <20170904205601.0635A8211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0658ea000b9adddf40303a44ddfc9a2692890ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
missing feature dependency in the WebKitGTK+ build files.

Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 9aceb8bfa8c39167b1c449301b7f00f16e4f816c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8329d52..fc51031 100644
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

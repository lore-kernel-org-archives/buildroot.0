From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:35:31 +0200
Subject: [Buildroot] [git commit] webkitgtk: Allow toggling WebDriver support
Message-ID: <20170924124819.C5AE78004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5df60d2197f08ec2dfc30e0a5f0cd04d39bb180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.18.x includes support for remotely controlling WebKitGTK+
based browsers using the standard WebDriver API. Typically this is used
by Web developers, and in most cases it will be desirable to disable it
from builds.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/webkitgtk/Config.in    | 6 ++++++
 package/webkitgtk/webkitgtk.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index e0b5947..65154db 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -82,4 +82,10 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	  This option pulls in all of the required dependencies
 	  to enable multimedia (video/audio) support.
 
+config BR2_PACKAGE_WEBKITGTK_WEBDRIVER
+	bool "WebDriver support"
+	help
+	  Enable support for WebDriver. This will build and install the
+	  WebKitWebDriver program in the target.
+
 endif
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bac1e71..7cdf28c 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -49,6 +49,12 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_MEDIA_STREAM=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK_WEBDRIVER),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=ON
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
+endif
+
 # Only one target platform can be built, assume X11 > Wayland
 
 # GTK3-X11 target gives OpenGL from newer libgtk3 versions

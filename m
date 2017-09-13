From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 13 Sep 2017 19:51:21 +0300
Subject: [Buildroot] [PATCH 2/2] webkitgtk: Allow toggling WebDriver support
In-Reply-To: <20170913165121.12406-1-aperez@igalia.com>
References: <20170913165121.12406-1-aperez@igalia.com>
Message-ID: <20170913165121.12406-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.18.x includes support for remotely controlling WebKitGTK+
based browsers using the standard WebDriver API. Typically this is used
by Web developers, and in most cases it will be desirable to disable it
from builds.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    | 6 ++++++
 package/webkitgtk/webkitgtk.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index e019fd05fd..d591935aff 100644
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
index bac1e715a5..7cdf28cd6f 100644
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
-- 
2.14.1

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Mar 2011 22:09:07 +0200
Subject: [Buildroot] [git commit master 1/1] webkit: prefer X11 backend if
	both directfb and x11 are available
Message-ID: <20110327201220.2EF0D819C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=07c469ed169e3ac8b6038a9699bc930de457405c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This shouldn't happen with any sane configuration, but is possible with
randpackageconfig builds, where it breaks the build as libgtk would prefer
X11 and webkit directfb, causing it to fail with:

No package 'gtk+-directfb-2.0' found

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 6ab609b..8483c0d 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -14,9 +14,7 @@ WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	WEBKIT_CONF_OPT += --with-target=x11
 	WEBKIT_DEPENDENCIES += xserver_xorg-server xlib_libXt
-endif
-
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+else
 	WEBKIT_CONF_OPT += --with-target=directfb
 	WEBKIT_DEPENDENCIES += directfb
 endif
-- 
1.7.3.4

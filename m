From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:46 +0100
Subject: [Buildroot] [PATCH 09/10] urg: make sdl support optional
In-Reply-To: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390073027-14239-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only enable SDL support if SDL and SDL_net are already enabled in the
configuration.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/urg/Config.in |  5 ++---
 package/urg/urg.mk    | 10 +++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/urg/Config.in b/package/urg/Config.in
index ded8204..232f4c4 100644
--- a/package/urg/Config.in
+++ b/package/urg/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_URG
 	bool "urg"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_SDL
-	select BR2_PACKAGE_SDL_NET
 	help
 	  Library to control Hokuyo's URG series sensors.
-	  Requires SDL & SDL_net.
+
+	  If SDL and SDL_net are enable, SDL support will be automatically added.
 
 	  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
 
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index e16393a..075a0b3 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -12,10 +12,14 @@ URG_LICENSE_FILES = COPYING
 
 URG_INSTALL_STAGING = YES
 
-URG_DEPENDENCIES = sdl sdl_net
-
-URG_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
+ifeq ($(BR2_PACKAGE_SDL)$(BR2_PACKAGE_SDL_NET),yy)
+URG_DEPENDENCIES += sdl sdl_net
+URG_CONF_OPT += --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
+else
+URG_CONF_OPT = --without-sdl
+URG_CONF_ENV += ac_cv_path_SDL_CONFIG=""
+endif
 
 URG_CONFIG_SCRIPTS = c_urg-config urg-config
 
-- 
1.8.5.3

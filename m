From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 21:31:02 +0100
Subject: [Buildroot] [git commit] urg: make sdl support optional
Message-ID: <20140119203153.498A49C551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0433603e3c7de5a0d7d6a434b4cb45ef5e5b533
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only enable SDL support if SDL and SDL_net are already enabled in the
configuration.

[Peter: drop SDL comment]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/urg/Config.in |    3 ---
 package/urg/urg.mk    |   10 +++++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/urg/Config.in b/package/urg/Config.in
index ded8204..9d57645 100644
--- a/package/urg/Config.in
+++ b/package/urg/Config.in
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_URG
 	bool "urg"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_SDL
-	select BR2_PACKAGE_SDL_NET
 	help
 	  Library to control Hokuyo's URG series sensors.
-	  Requires SDL & SDL_net.
 
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
 

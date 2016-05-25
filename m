From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 23:20:27 +0200
Subject: [Buildroot] [git commit] package/ltris: fix static linking with
	libmad
Message-ID: <20160525212052.9B43581E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14572af6932ada3850ee19c299d1c5124410d5b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/b06/b0671af6be81550221f5abf98c2c797787590199/

[Peter: add host-pkgconf to _DEPENDENCIES]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltris/ltris.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index e77f2ac..530e11e 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -12,18 +12,22 @@ LTRIS_LICENSE_FILES = COPYING
 LTRIS_DEPENDENCIES = sdl
 
 LTRIS_CONF_ENV = \
-	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
+	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
+	LIBS="$(LTRIS_LIBS)"
 
 ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
-LTRIS_DEPENDENCIES += sdl_mixer
+LTRIS_DEPENDENCIES += sdl_mixer host-pkgconf
 LTRIS_CONF_OPTS += --enable-audio=yes
+# configure script does NOT use pkg-config to figure out how to link
+# with sdl_mixer, breaking static linking as sdl_mixer can use libmad
+LTRIS_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs SDL_mixer`
 else
 LTRIS_CONF_OPTS += --disable-audio
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 LTRIS_DEPENDENCIES += gettext
-LTRIS_CONF_ENV += LIBS=-lintl
+LTRIS_LIBS += -lintl
 endif
 
 $(eval $(autotools-package))

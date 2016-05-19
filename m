From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 19 May 2016 07:52:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltris: fix static linking with
	libmad
Message-ID: <1463637133-28566-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/b06/b0671af6be81550221f5abf98c2c797787590199/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ltris/ltris.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index e77f2ac..8cff4c1 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -12,18 +12,22 @@ LTRIS_LICENSE_FILES = COPYING
 LTRIS_DEPENDENCIES = sdl
 
 LTRIS_CONF_ENV = \
-	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
+	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
+	LIBS="$(LTRIS_LIBS)"
 
 ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
 LTRIS_DEPENDENCIES += sdl_mixer
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
-- 
2.8.1

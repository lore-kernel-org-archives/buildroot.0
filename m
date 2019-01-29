From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:57:33 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/sdl_sound:
 actually use the optional CONF_OPTS
Message-ID: <20190129215632.4AF748128E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d7918195283c6fbf084ab79b1f84a3e1259fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Since "57ace26b6c package/sdl_sound: add optional support for
libmodplug" from 2016, optional CONF_OPTS are added but they do not
really take effect because there is an unconditional override below the
conditional append.

Currently this does not cause build failures, but it can lead to wrong
detection of dependencies because many explicit --enable/--disable are
not passed to configure.

Fix this by moving the unconditional code to the top.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit df0d7d1371d2916bf9b48968f0a2dcd471ea6d85)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_sound/sdl_sound.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 2544b598e9..c6028e7910 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -11,6 +11,11 @@ SDL_SOUND_LICENSE = LGPL-2.1+
 SDL_SOUND_LICENSE_FILES = COPYING
 SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
+SDL_SOUND_CONF_OPTS = \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+	--disable-sdltest \
+	--enable-static
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 SDL_SOUND_DEPENDENCIES += libiconv
@@ -52,12 +57,6 @@ else
 SDL_SOUND_CONF_OPTS += --disable-physfs
 endif
 
-SDL_SOUND_CONF_OPTS = \
-	--with-sdl-prefix=$(STAGING_DIR)/usr \
-	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-	--disable-sdltest \
-	--enable-static
-
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 SDL_SOUND_CONF_OPTS += --enable-mmx
 else

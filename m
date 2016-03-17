From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 10:14:58 +0100
Subject: [Buildroot] [git commit] sdl: disable rpath via configure option
Message-ID: <20160317091707.282F680215@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f259304b9816e2c40a358041370a14d6928eeee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -rpath option was being stripped from sdl-config via a post install
staging hook, but the same wasn't being done for sdl.pc. Because of
this, packages that detect SDL via pkg-config ended up passing
'-Wl,-rpath,/usr/lib' to the linker, which caused build failures under
certain circumstances since libraries were being looked for in the wrong
directory.

Fix by passing the --disable-rpath option to the SDL configure script,
which takes care of disabling -rpath everywhere. This also allows the
SDL_FIXUP_SDL_CONFIG hack to be completely removed.

Fixes:

  http://autobuild.buildroot.net/results/624/62499217eeaf3228b46652e3f65776d7ece8fce6/
  http://autobuild.buildroot.net/results/cc1/cc1f78f6c43e3a7bf3ed80d759d9c4d7363d0e48/

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index cc1ad06..38b4b97 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -80,6 +80,7 @@ SDL_DEPENDENCIES += mesa3d
 endif
 
 SDL_CONF_OPTS += \
+	--disable-rpath \
 	--enable-pulseaudio=no \
 	--disable-arts \
 	--disable-esd \
@@ -96,13 +97,5 @@ HOST_SDL_CONF_OPTS += \
 
 SDL_CONFIG_SCRIPTS = sdl-config
 
-# Remove the -Wl,-rpath option.
-define SDL_FIXUP_SDL_CONFIG
-	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
-		$(STAGING_DIR)/usr/bin/sdl-config
-endef
-
-SDL_POST_INSTALL_STAGING_HOOKS += SDL_FIXUP_SDL_CONFIG
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

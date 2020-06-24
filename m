From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:47:23 +0200
Subject: [Buildroot] [git commit] package/sdl2: remove sdl2-config.cmake
Message-ID: <20200624214816.1E25E82289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d59261836a2ae2d024645b1e286540dd4269b6c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are using autotools build system for sdl2, so the sdl2-config.cmake
include path are not resolved like for sdl2-config script [1].
Remove sdl2-config.cmake file and avoid unsafe include path if this
file is used by a cmake based package.

This trigger an issue with ogre 1.12.6 package that replaced
FindSDL2.cmake by sdl2-config.cmake [2].

Thanks to Pavel Rojtberg for the help [3].

[1] https://bugzilla.libsdl.org/show_bug.cgi?id=4597
[2] https://github.com/OGRECave/ogre/commit/6de6f9b4081a07c911932441700c54b72ec1ee1f
[3] https://github.com/OGRECave/ogre/issues/1568

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 830873c9e4..6ef530fb43 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -20,6 +20,16 @@ SDL2_CONF_OPTS += \
 	--disable-pulseaudio \
 	--disable-video-wayland
 
+# We are using autotools build system for sdl2, so the sdl2-config.cmake
+# include path are not resolved like for sdl2-config script.
+# Remove sdl2-config.cmake file and avoid unsafe include path if this
+# file is used by a cmake based package.
+# https://bugzilla.libsdl.org/show_bug.cgi?id=4597
+define SDL2_REMOVE_SDL2_CONFIG_CMAKE
+	rm -rf $(STAGING_DIR)/usr/lib/cmake/SDL2
+endef
+SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_REMOVE_SDL2_CONFIG_CMAKE
+
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
 

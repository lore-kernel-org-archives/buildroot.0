From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:00 +0200
Subject: [Buildroot] [PATCH 14/74] sdl_sound: convert old-style hooks to
	new-style hooks
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3d595a601606534bac4db9dd8ff0e9ca22beeafd.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/sdl_sound.mk |   23 +++++++++++++----------
 1 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 3a6b7e7..9234ab6 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -41,20 +41,23 @@ else
 SDL_SOUND_CONF_OPT += --disable-mmx
 endif
 
-$(eval $(call AUTOTARGETS,package,sdl_sound))
+define SDL_SOUND_REMOVE_PLAYSOUND
+	rm $(addprefix $(TARGET_DIR)/usr/bin/,playsound playsound_simple)
+endef
 
 ifneq ($(BR2_PACKAGE_SDL_SOUND_PLAYSOUND),y)
-$(SDL_SOUND_HOOK_POST_INSTALL):
-	rm $(addprefix $(TARGET_DIR)/usr/bin/,playsound playsound_simple)
-	touch $@
+SDL_SOUND_POST_INSTALL_TARGET_HOOKS += SDL_SOUND_REMOVE_PLAYSOUND
 endif
 
-# target shared libs doesn't get removed by make uninstall if the .la files
-# are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
-$(SDL_SOUND_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define SDL_SOUND_UNINSTALL_STAGING_CMDS
 	$(MAKE) DESTDIR=$(STAGING_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
-	rm -f $(@D)/.stamp_staging_installed
+endef
+
+# target shared libs doesn't get removed by make uninstall if the .la
+# files are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
+define SDL_SOUND_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
-	rm -f $(SDL_SOUND_TARGET_INSTALL_TARGET) $(SDL_SOUND_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,sdl_sound))
-- 
1.7.0.4

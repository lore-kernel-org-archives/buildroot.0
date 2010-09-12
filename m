From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Sep 2010 23:23:30 +0200
Subject: [Buildroot] [PATCH 14/74] sdl_sound: convert old-style hooks to
	new-style hooks
In-Reply-To: <3d595a601606534bac4db9dd8ff0e9ca22beeafd.1284312638.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 12 Sep 2010 19:42:00 +0200")
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
	<cover.1284312638.git.thomas.petazzoni@free-electrons.com>
	<3d595a601606534bac4db9dd8ff0e9ca22beeafd.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87iq2ak65p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/sdl_sound/sdl_sound.mk |   23 +++++++++++++----------
 Thomas>  1 files changed, 13 insertions(+), 10 deletions(-)

 
 Thomas> -# target shared libs doesn't get removed by make uninstall if the .la files
 Thomas> -# are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
 Thomas> -$(SDL_SOUND_TARGET_UNINSTALL):
 Thomas> -	$(call MESSAGE,"Uninstalling")
 Thomas> +define SDL_SOUND_UNINSTALL_STAGING_CMDS
 Thomas>  	$(MAKE) DESTDIR=$(STAGING_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
 Thomas> -	rm -f $(@D)/.stamp_staging_installed
 Thomas> +endef
 Thomas> +
 Thomas> +# target shared libs doesn't get removed by make uninstall if the .la
 Thomas> +# files are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
 Thomas> +define SDL_SOUND_UNINSTALL_TARGET_CMDS
 Thomas>  	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
 Thomas>  	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
 Thomas> -	rm -f $(SDL_SOUND_TARGET_INSTALL_TARGET) $(SDL_SOUND_HOOK_POST_INSTALL)
 Thomas> +endef
 Thomas> +
 Thomas> +$(eval $(call AUTOTARGETS,package,sdl_sound))

As far as I can see you don't need to override the staging uninstall. If
a situation like this is common, then we should probably provide hooks
in the standard uninstall targets like we have for the other targets.

-- 
Bye, Peter Korsgaard

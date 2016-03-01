From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 09:19:24 +0100
Subject: [Buildroot] [PATCH 1/2] sdl_mixer: add patch to fix
 SDL_mixer.pc for static linking
In-Reply-To: <1456810926-9822-1-git-send-email-rprebello@gmail.com>
References: <1456810926-9822-1-git-send-email-rprebello@gmail.com>
Message-ID: <20160301091924.29fe2fe1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Tue,  1 Mar 2016 02:42:05 -0300, Rodrigo Rebello wrote:
> A 'Libs.private' field needs to be present and properly defined in the
> pkg-config file in order for static linking against SDL_mixer to work.
> 
> Besides adding the mentioned field, the included patch also modifies
> configure.in so that EXTRA_LDFLAGS (which is now also used as the value
> of 'Libs.private') no longer includes SDL_LIBS. This is done so as to
> prevent libraries required by SDL from being listed twice when
> 'pkg-config --libs --static SDL_mixer' is run (they're already shown
> because of the 'Requires: sdl' line in SDL_mixer.pc). Makefile.in is
> also adjusted accordingly.
> 
> Finally, force 'autogen.sh' to be run before the configure step since
> we're patching configure.in.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Thanks for working on this!


> +# We're patching configure.in, but SDL_mixer is not compatible with our
> +# autoreconf mechanism, so we have to do it manually instead of setting
> +# SDL_MIXER_AUTORECONF = YES
> +define SDL_MIXER_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +SDL_MIXER_PRE_CONFIGURE_HOOKS += SDL_MIXER_RUN_AUTOGEN
> +

If you do this, then you need to manually add host-autoconf
host-automake and host-libtool to SDL_MIXER_DEPENDENCIES. It is
normally done automatically by <pkg>_AUTORECONF = YES, but since you're
not using it, you must do it manually.

Of course, it would be even better if SDL_mixer
configure.ac/Makefile.am would autoreconf properly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Mar 2016 22:47:33 +0100
Subject: [Buildroot] [PATCH v2 1/2] sdl_mixer: add patch to fix
 SDL_mixer.pc for static linking
In-Reply-To: <1456830948-4329-1-git-send-email-rprebello@gmail.com>
References: <1456830948-4329-1-git-send-email-rprebello@gmail.com>
Message-ID: <56D60DF5.1060308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/16 12:15, Rodrigo Rebello wrote:
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
> ---
> Changes v1 -> v2:
>   - Add host-autoconf host-automake and host-libtool to
>     SDL_MIXER_DEPENDENCIES (Thomas Petazzoni)
> ---
[snip]
> diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
> index a602b6e..f3baef3 100644
> --- a/package/sdl_mixer/sdl_mixer.mk
> +++ b/package/sdl_mixer/sdl_mixer.mk
> @@ -12,6 +12,16 @@ SDL_MIXER_LICENSE_FILES = COPYING
>  
>  SDL_MIXER_INSTALL_STAGING = YES
>  SDL_MIXER_DEPENDENCIES = sdl
> +
> +# We're patching configure.in, but SDL_mixer is not compatible with our
> +# autoreconf mechanism, so we have to do it manually instead of setting
> +# SDL_MIXER_AUTORECONF = YES

 Try

SDL_MIXER_AUTORECONF_OPTS = -Iacinclude


 Regards,
 Arnout

> +define SDL_MIXER_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +SDL_MIXER_PRE_CONFIGURE_HOOKS += SDL_MIXER_RUN_AUTOGEN
> +SDL_MIXER_DEPENDENCIES += host-autoconf host-automake host-libtool
> +
>  SDL_MIXER_CONF_OPTS = \
>  	--without-x \
>  	--with-sdl-prefix=$(STAGING_DIR)/usr \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

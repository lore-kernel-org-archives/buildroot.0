From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 09:40:55 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/mpv: handle --{en,
 dis}able-libmpv-{shared, static}
In-Reply-To: <20210605220031.2750663-1-fontaine.fabrice@gmail.com>
References: <20210605220031.2750663-1-fontaine.fabrice@gmail.com>
Message-ID: <20210606074055.GG168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-06 00:00 +0200, Fabrice Fontaine spake thusly:
> libmpv-static and libmpv-shared are disabled by default resulting in the
> following build failure when building with gl but without rpi, wayland
> or x11:
> 
> Checking for OpenGL without platform-specific code (e.g. for libmpv)      : libmpv-shared not found
> Checking for OpenGL context support                                       : gl-cocoa not found
> You manually enabled the feature 'gl', but the autodetection check failed.
> 
> Here is an extract of wscript:
> 
>     } , {
>         'name': '--plain-gl',
>         'desc': 'OpenGL without platform-specific code (e.g. for libmpv)',
>         'deps': 'libmpv-shared || libmpv-static',
>         'func': check_true,
>     }, {
>         'name': '--gl',
>         'desc': 'OpenGL context support',
>         'deps': 'gl-cocoa || gl-x11 || egl-x11 || egl-drm || '
>                  + 'gl-win32 || gl-wayland || rpi || '
>                  + 'plain-gl',
>         'func': check_true,
>         'req': True,
>         'fmsg': "No OpenGL video output found or enabled. " +
>                 "Aborting. If you really mean to compile without OpenGL " +
>                 "video outputs use --disable-gl.",
>     }, {
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/590d2a8b6746ef071dfb439e42b636f81dbdc35d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've added a little blurb in the commit log, to explain why we can't
have both shared and static at the same time. Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - shared and static can't be enabled simultaneously so prefer shared
>    over static for BR2_SHARED_STATIC_LIBS
> 
>  package/mpv/mpv.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index 5713b98e8e..25ac783b52 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -28,6 +28,12 @@ MPV_CONF_OPTS = \
>  	--disable-uchardet \
>  	--disable-vapoursynth
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
> +else
> +MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
> +endif
> +
>  # ALSA support requires pcm+mixer
>  ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
>  MPV_CONF_OPTS += --enable-alsa
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

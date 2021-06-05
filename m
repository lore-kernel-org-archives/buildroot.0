From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 23:21:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: handle --{en,
 dis}able-libmpv-{shared, static}
In-Reply-To: <20210605200555.1252806-1-fontaine.fabrice@gmail.com>
References: <20210605200555.1252806-1-fontaine.fabrice@gmail.com>
Message-ID: <20210605212120.GB168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-05 22:05 +0200, Fabrice Fontaine spake thusly:
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
> ---
>  package/mpv/mpv.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index 5713b98e8e..364a49f893 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -28,6 +28,20 @@ MPV_CONF_OPTS = \
>  	--disable-uchardet \
>  	--disable-vapoursynth
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +MPV_CONF_OPTS += \
> +	--disable-libmpv-shared \
> +	--enable-libmpv-static

Two options fit on a single line, so no need for a multi-line.

> +else ifeq ($(BR2_SHARED_LIBS),y)
> +MPV_CONF_OPTS += \
> +	--enable-libmpv-shared \
> +	--disable-libmpv-static
> +else
> +MPV_CONF_OPTS += \
> +	--enable-libmpv-shared \
> +	--enable-libmpv-static
> +endif

In wscript, it seems the shared version and the static version are
incompatible, extract:

    }, {
        'name': '--libmpv-shared',
        'desc': 'shared library',
        'default': 'disable',
        'func': check_true
    }, {
        'name': '--libmpv-static',
        'desc': 'static library',
        'default': 'disable',
        'deps': '!libmpv-shared',    <- here:  ! libmpv-shared
        'func': check_true
    },

So we can't have both enabled simultaneously...

I would think that we should favour the shared library when doing a
static+shared BR configuration.

So, probably just the following would be OK:

    ifeq ($(BR2_STATIC_LIBS),y)
    MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
    else
    MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
    endif

Can you review/test that and resend another patch, please?

Regards,
Yann E. MORIN.

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

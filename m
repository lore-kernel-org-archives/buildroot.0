From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 23:13:02 +0200
Subject: [Buildroot] [PATCH v8 28/28] xbmc: Fix TexturePacker compile
In-Reply-To: <1400342276-10303-29-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-29-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517211302.GS3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

(_Not_ a review of the patch, to come later...)

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> Patch description:
> 
> use_texturepacker_native=yes
> 
> is needed because we obviously need a native-compiled binary, but the xbmc
> build system does enable this variable only for darwin, android and
> raspberry-pi targets.
> 
> USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
> 
> is also needed because
> USE_TEXTUREPACKER_NATIVE_ROOT="$TEXTUREPACKER_NATIVE_ROOT"
> is only executed for raspberry-pi by xbmc/configure and only
> USE_TEXTUREPACKER_NATIVE_ROOT is used by tools/TexturePacker/Makefile.in.
> 
> To sum up, building for raspberry-pi and other archs works out-of-the-box,

It seems I have a bug here where it does *not* work out-of-the box on my
system, for a RPi target. I'll have to re-run a build to dig up the exact
error, though; I'll give your series a spin later tonight...

Maxime, did you have time to look at it on your side?

Regards,
Yann E. MORIN.

> compiling for an Intel target, for example, fails:
> 
> In file included from SDL_anigif.cpp:23:0:
> SDL_anigif.h:24:21: fatal error: SDL/SDL.h: No such file or directory
> compilation terminated.
> XBMCTex.cpp:34:21: fatal error: SDL/SDL.h: No such file or directory
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index f537e92..8e4979e 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -26,6 +26,8 @@ XBMC_CONF_ENV = \
>  	PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
>  	PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
>  	PYTHON_NOVERSIONCHECK="no-check" \
> +	use_texturepacker_native=yes \
> +	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
>  	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
>  
>  XBMC_CONF_OPT +=  \
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 12:44:53 +0200
Subject: [Buildroot] [PATCH v12 04/32] xbmc: add host-yasm dependency
 for MMX/64bit archs
In-Reply-To: <1402144292-27837-5-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
 <1402144292-27837-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140608104453.GA15981@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-07 14:31 +0200, Bernd Kuhls spake thusly:
> Fixes error during xbmc configure:
> 
> yasm not found, use --disable-yasm for a crippled build
> 
> If you think configure made a mistake, make sure you are using the latest
> version from Git.  If the latest version fails, report the problem to the
> ffmpeg-user at ffmpeg.org mailing list or IRC #ffmpeg on irc.freenode.net.
> Include the log file "config.log" produced by configure as this will help
> solving the problem.
> configure: error: Submodule lib/ffmpeg failed to configure
> 
> This will be needed for 13.0 Gotham.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/xbmc/xbmc.mk |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 3522802..ffe573f 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -21,6 +21,13 @@ XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
>  # xbmc at i386 depends on nasm
>  XBMC_DEPENDENCIES += $(if $(BR2_i386),host-nasm)
>  
> +# ffmpeg depends on yasm on MMX archs
> +# xbmc configure passes $(BR2_ARCH) to ffmpeg configure which adds
> +# yasm as dependency for x86_64, even if BR2_x86_generic=y

Yes, all x86_64 have MMX.

Regards,
Yann E. MORIN.

> +ifneq ($(BR2_X86_CPU_HAS_MMX)$(BR2_x86_64),)
> +XBMC_DEPENDENCIES += host-yasm
> +endif
> +
>  XBMC_CONF_ENV = \
>  	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
>  	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
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

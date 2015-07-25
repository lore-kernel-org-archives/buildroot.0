From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 14:40:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Fix static compile
In-Reply-To: <1437763107-19489-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437763107-19489-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725124006.GE3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, all,

On 2015-07-24 20:38 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/aeb/aeb5481526497a01ada8ee9403f282a2374b0383/
> http://autobuild.buildroot.net/results/255/25536df514477f3210caf4af27f2f107683f7fb2/
> http://autobuild.buildroot.net/results/fa1/fa11cb360190b02d08e74997b0abc73079760dfa/
> and many others
> 
> This is a follow-up for these patches:
> http://patchwork.ozlabs.org/patch/493360/
> http://patchwork.ozlabs.org/patch/416007/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested the first build failre]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/minidlna/minidlna.mk |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
> index 3a9ad41..e0b5da1 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -17,8 +17,10 @@ MINIDLNA_DEPENDENCIES = \
>  ifeq ($(BR2_STATIC_LIBS),y)
>  # the configure script / Makefile forgets to link with some of the dependent
>  # libraries breaking static linking, so help it along
> -MINIDLNA_CONF_ENV = \
> -	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
> +MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static libavcodec`
> +MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static libexif`
> +MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static libvorbis`
> +MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS) $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
>  else
>  MINIDLNA_CONF_OPTS = \
>  	--disable-static
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

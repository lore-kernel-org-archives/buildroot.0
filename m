From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 22:12:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix static linking
In-Reply-To: <1417289621-17415-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417289621-17415-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141207211244.GD10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-29 20:33 +0100, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/6bd/6bd8c009056beb67092abd6d18064500302dcecb/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> This patch depends on http://patchwork.ozlabs.org/patch/416006/
> 
>  package/minidlna/minidlna.mk |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
> index 3a0ca35..d483e1c 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -18,8 +18,10 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  # the configure script / Makefile forgets to link with some of the dependent
>  # libraries breaking static linking, so help it along
>  MINIDLNA_CONF_ENV = \
> -	LIBS='-lavformat -lavcodec -lavutil -logg \
> +	LIBS='-lavformat -lavcodec -lavutil -logg -lvorbis -lvorbisenc \
> +		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl) -lexif \
>  		$(if $(BR2_PACKAGE_OPENSSL),-lssl -lcrypto) \
> +		$(if $(BR2_PACKAGE_OPUS),-lswresample -lopus) \

Ofd course, this should be adapted with the previous comment to your
previous patch.

But hold on on it, I'd like Thomas P. to ack my comment before you work
on it...

Regards,
Yann E. MORIN.

>  		-lz -lpthread -lm'
>  else
>  MINIDLNA_CONF_OPTS = \
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

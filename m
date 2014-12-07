From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 22:10:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix static linking
 with OpenSSL enabled
In-Reply-To: <1417289292-7006-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417289292-7006-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141207211025.GC10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-29 20:28 +0100, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/c38/c388b71ae154c062a863a35eca70a8c2ce121524/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/minidlna/minidlna.mk |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
> index 9e997f3..3a0ca35 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -18,7 +18,9 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  # the configure script / Makefile forgets to link with some of the dependent
>  # libraries breaking static linking, so help it along
>  MINIDLNA_CONF_ENV = \
> -	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
> +	LIBS='-lavformat -lavcodec -lavutil -logg \
> +		$(if $(BR2_PACKAGE_OPENSSL),-lssl -lcrypto) \
> +		-lz -lpthread -lm'

I'm not too fond of the way this is handled. I'd prefer we get something
like:

    MINIDLNA_LIBS = -lavformat -lavcodec -lavutil -logg
    MINIDLAN_LIBS += $(if $(BR2_PACKAGE_OPENSSL),-lssl -lcrypto)
    MINIDLAN_LIBS += -lz -lpthread -lm

    MINIDLNA_CONF_ENV = LIBS='$(MINIDLNA_LIBS)'

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

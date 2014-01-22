From: yann.morin.1998 at free.fr <yann.morin.1998@free.fr>
Date: Wed, 22 Jan 2014 11:21:10 +0100 (CET)
Subject: [Buildroot] [PATCH] BR2_EXTERNAL: check it is a valid
 BR2_EXTERNAL dir before using it
In-Reply-To: <1751679476.4596486.1390381240766.JavaMail.root@openwide.fr>
Message-ID: <1410002893.284525363.1390386070110.JavaMail.root@zimbra96-e16.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

----- Original Message -----
From: "Jeremy Rosen" <jeremy.rosen@openwide.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Peter Korsgaard" <jacmet@uclibc.org>, "Romain Naour" <romain.naour@openwide.fr>, buildroot at busybox.net
Sent: Wednesday, January 22, 2014 10:00:40 AM
Subject: Re: [PATCH] BR2_EXTERNAL: check it is a valid BR2_EXTERNAL dir before using it

ok, I tried your patch and I have a couple of problems

[--SNIP--]
> diff --git a/Makefile b/Makefile
> index 9dfb1e0..5753f81 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -118,7 +118,15 @@ ifeq ($(BR2_EXTERNAL),)
>    override BR2_EXTERNAL = support/dummy-external
>    $(shell rm -f $(BR2_EXTERNAL_FILE))
>  else
> -  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
> +  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
> +  ifeq ($(and $(_BR2_EXTERNAL),$(wildcard $(_BR2_EXTERNAL)/external.mk),$(wildcard $(_BR2_EXTERNAL)/Config.in)),)
> +    ifeq ($(patsubst /%,/,$(BR2_EXTERNAL)),)
> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist)
> +    else
> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relatively to $(TOPDIR))
> +    endif
> +  endif

Doh, I forgot to commit with this line:
    override BR2_EXTERNAL := $(_BR2_EXTERNAL)

> +  $(shell echo BR2_EXTERNAL ?= $(_BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
>  endif

Care to test again, please?

Regards,
Yann E. MORIN.

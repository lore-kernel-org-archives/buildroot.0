From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Dec 2014 19:17:01 +0100
Subject: [Buildroot] [PATCH v4] Makefile: improve detection of make "-s"
 flag
In-Reply-To: <1416419494-14916-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416419494-14916-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20141203181701.GA4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-11-19 18:51 +0100, Fabio Porcedda spake thusly:
> Because it's just checked the presence of the "s" character even a
>   make --warn-undefined-variables
> is detected as a silent build so fix this by filtering out long options.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> 
> Notes:
>     v4:
>      - split this patch from the patch set to send to muster as bugfix
>     v2:
>      - remove spurious space at the beginning of the QUIET variable (Arnout)
> 
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 471edf9..6b97dc6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  TARGETS :=
>  
>  # silent mode requested?
> -QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
> +QUIET := $(if $(findstring s, $(filter-out --%, $(MAKEFLAGS))),-q)

Please, do not add a space after the comma when calling a macro. This
should be:

    QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)

Yes, that's slightly less readable. But make really cuts on commas, and
the sapce is then part of the values, so we do not want it (it has no
impact in your case, though, but: consistency! ;-) )

Otherwise, looks good to me.

Regards,
Yann E. MORIN.

>  
>  # Strip off the annoying quoting
>  ARCH := $(call qstrip,$(BR2_ARCH))
> -- 
> 2.1.3
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

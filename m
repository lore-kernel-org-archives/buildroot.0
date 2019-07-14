From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 20:07:34 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't export GZIP environment
 variable
In-Reply-To: <20190703163959.23070-1-itsatharva@gmail.com>
References: <20190703163959.23070-1-itsatharva@gmail.com>
Message-ID: <20190714180734.GE29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-07-03 22:09 +0530, Atharva Lele spake thusly:
> We export GZIP = -n so that GZIP does not record original
> name and timestamps. However..
> 
> GZIP environment variable is deprecated and soon will not be
> supported in future GZIP versions. GZIP suggests the use of a
> wrapper to pass options globally but it might be difficult to
> implement in Buildroot. For now, we don't export the variable
> and fix reproducibility issues per package as they show up in
> Autobuilder.

This patch must be applied after all caller of gzip have been converted
to use -n.

So far, we identified only fs/comon.mk that calls gzip without -n, and
this is fixed in the following patch.

So, provided the order of these two patches are inversed when applying:

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c98a0ed87e..9cce934990 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -248,7 +248,6 @@ ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ = UTC
>  export LANG = C
>  export LC_ALL = C
> -export GZIP = -n
>  endif
>  
>  # To put more focus on warnings, be less verbose as default
> -- 
> 2.22.0
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Mar 2015 23:41:11 +0100
Subject: [Buildroot] [PATCH] package/dvdrw-tools: fix incorrect default
 choiche
In-Reply-To: <1426631327-15489-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1426631327-15489-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150318224111.GA4578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2015-03-17 23:28 +0100, Angelo Compagnucci spake thusly:
> This pathc fixes default choiche BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/dvdrw-tools/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
> index 6787b66..fb4d4c2 100644
> --- a/package/dvdrw-tools/Config.in
> +++ b/package/dvdrw-tools/Config.in
> @@ -35,7 +35,7 @@ config BR2_PACKAGE_DVDRW_TOOLS
>  if BR2_PACKAGE_DVDRW_TOOLS
>  choice
>  	prompt "Media Backend"
> -	default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
> +	default BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND

In fact that's not needed since cdrkit is the first entry.

Besides, and I missed it durign the review too, we can't force cdrkit as
the default sicne it has a dependency which is not reported here; it
should have been (options elided for readability):

    choice
        bool "backend"
        default CDRKIT if HEADERS_AT_LEAST_3_0

But really, there's no reason to have a default in the first place, so I
suggest we just get rid of it:

  - if kernel headers >= 3.0, cdrkit will be used by default as it is
    the first entry in the choice;

  - otherwise, cdrkit will be unavailable, and xorriso will be used.

Regards,
Yann E. MORIN.

>  	help
>  	  Choose which media backend program to use.
>  
> -- 
> 1.9.1
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

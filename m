From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 21:24:29 +0100
Subject: [Buildroot] [PATCH 1/2] package/nginx: disallow AIO support on
 arc
In-Reply-To: <1417871738-13421-1-git-send-email-s.martin49@gmail.com>
References: <1417871738-13421-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141207202429.GB3902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-12-06 14:15 +0100, Samuel Martin spake thusly:
> The nginx AIO support cannot build on arc, because it hardcodes
> the usage of SYS_eventfd(), while it should just use eventfd() from
> the C library.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/f3e/f3e2c7a937517a5444f8c6cc0b02692af897b3e0/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/nginx/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nginx/Config.in b/package/nginx/Config.in
> index c2a6af1..5b5c0b0 100644
> --- a/package/nginx/Config.in
> +++ b/package/nginx/Config.in
> @@ -17,9 +17,10 @@ if BR2_PACKAGE_NGINX
>  config BR2_PACKAGE_NGINX_FILE_AIO
>  	bool "file AIO support"
>  	# Does not build, because nginx hardcodes using SYS_eventfd,
> -	# but it's not available on AArch64, only eventfd() is.
> +	# but it's not available on AArch64, nor arc only eventfd() is.

but it's available on neither AArch64 nor arc, where only eventfd() is.

Otherwise, looks good:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	# See https://bugs.launchpad.net/linaro-aarch64/+bug/1160013
>  	depends on !BR2_aarch64
> +	depends on !BR2_arc
>  
>  config BR2_PACKAGE_NGINX_HTTP
>  	bool "http server"
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

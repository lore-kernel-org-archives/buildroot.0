From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2013 18:57:26 +0100
Subject: [Buildroot] [PATCH 2/2] libnl: do not allow to build tools on
 static lib configs
In-Reply-To: <1383387986-9508-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1383387986-9508-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102175726.GG3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-02 11:26 +0100, Thomas Petazzoni spake thusly:
> Building the libnl tools requires the <dlfcn.h> header, which is not
> compatible with static only builds. Therefore, this commit makes the
> libnl tools option depend on !BR2_PREFER_STATIC_LIB.
> 
> Fixes:
> 
>    http://autobuild.buildroot.org/results/573/57340b9bd2db3a523836e02e01cba6f7c17c8ca7/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/libnl/Config.in | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnl/Config.in b/package/libnl/Config.in
> index fec10d3..be41b07 100644
> --- a/package/libnl/Config.in
> +++ b/package/libnl/Config.in
> @@ -6,11 +6,18 @@ config BR2_PACKAGE_LIBNL
>  
>  	  http://people.suug.ch/~tgr/libnl/
>  
> +comment "libnl needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +if BR2_PACKAGE_LIBNL
> +
>  config BR2_PACKAGE_LIBNL_TOOLS
>  	bool "install tools"
> -	depends on BR2_PACKAGE_LIBNL
> +	# uses <dlfcn.h>
> +	depends on !BR2_PREFER_STATIC_LIB
>  	help
>  	  Install binary tools.
>  
> -comment "libnl needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "libnl tools need a toolchain w/ dynamic library"
> +
> +endif
> -- 
> 1.8.1.2
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

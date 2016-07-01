From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 18:06:56 +0200
Subject: [Buildroot] [PATCH 4/4] linux-headers: match headers for the
	latest kernel
In-Reply-To: <1461099155-30702-5-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-5-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20160701160656.GC17666@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2016-04-19 16:52 -0400, Vivien Didelot spake thusly:
> The point of choosing BR2_LINUX_KERNEL_LATEST_VERSION alongside
> BR2_KERNEL_HEADERS_FROM_KERNEL is not to care about bumping the kernel
> and its headers used in the toolchain in later Buildroot releases.
> 
> When using the latest kernel and its headers, automatically set the
> headers version to at least BR2_LINUX_KERNEL_VERSION.
> 
> A similar change can be done for BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE,
> but this is less trivial since it requires parsing the free form string.

We've also discussed this patch today, and we've come to a simpler
solution: default to the latest kernel version for the custom headers.
I've sent the patch:
    https://patchwork.ozlabs.org/patch/643102/

So, I've marked this patch as superseded in patchwork.

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  package/linux-headers/Config.in.host | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index baadb2e..15136df 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -12,7 +12,9 @@ choice
>  	  version you intend to use on your target system.
>  
>  	  Select BR2_KERNEL_HEADERS_FROM_KERNEL to use the header files from
> -	  the kernel source you are building for your target.
> +	  the kernel source you are building for your target. Unless you chose
> +	  BR2_LINUX_KERNEL_LATEST_VERSION, you must specify the custom kernel
> +	  headers series below.
>  
>  	  Select any other choices to download and use an independent kernel
>  	  version for its headers. Useful when you are not building the kernel.
> @@ -20,6 +22,8 @@ choice
>  	config BR2_KERNEL_HEADERS_FROM_KERNEL
>  		bool "From the kernel source"
>  		depends on BR2_LINUX_KERNEL
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 if \
> +			BR2_LINUX_KERNEL_LATEST_VERSION
>  
>  	config BR2_KERNEL_HEADERS_3_2
>  		bool "Linux 3.2.x kernel headers"
> @@ -96,7 +100,9 @@ config BR2_DEFAULT_KERNEL_VERSION
>  
>  choice
>  	bool "Custom kernel headers series"
> -	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_FROM_KERNEL
> +	depends on BR2_KERNEL_HEADERS_VERSION || \
> +		(BR2_KERNEL_HEADERS_FROM_KERNEL && \
> +		 !BR2_LINUX_KERNEL_LATEST_VERSION)
>  	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
>  	help
>  	  Set to the kernel headers series you manually set above.
> @@ -228,4 +234,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
>  	default "4.4.7"		if BR2_KERNEL_HEADERS_4_4
>  	default "4.5.1"		if BR2_KERNEL_HEADERS_4_5
> +	default BR2_LINUX_KERNEL_VERSION if BR2_KERNEL_HEADERS_FROM_KERNEL && \
> +		BR2_LINUX_KERNEL_LATEST_VERSION
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
> -- 
> 2.8.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

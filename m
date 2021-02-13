From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 22:35:32 +0100
Subject: [Buildroot] [PATCH] package/ply: needs dynamic library
In-Reply-To: <20210213190522.GA490@arbad>
References: <20210213190522.GA490@arbad>
Message-ID: <20210213213532.GB2740149@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andres, All,

On 2021-02-13 20:05 +0100, Andreas Klinger spake thusly:
> ply is not compiling with static libraries.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3a586241d37614b644ff6c4674ae28df2b22fdf8

I found this build to be puzzling, so I dug deeper, and then found this
commit log to be lacking the interesting explanations, so I expanded the
commit log. Please review what I wrote if it makes sense...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  package/ply/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/ply/Config.in b/package/ply/Config.in
> index 35c2dc9bfc..16f5f8a267 100644
> --- a/package/ply/Config.in
> +++ b/package/ply/Config.in
> @@ -5,11 +5,18 @@ config BR2_PACKAGE_PLY_ARCH_SUPPORTS
>  	default y if BR2_powerpc
>  	default y if BR2_x86_64
>  
> +comment "ply needs a toolchain w/ dynamic library"
> +	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
> +	depends on BR2_STATIC_LIBS
> +
>  config BR2_PACKAGE_PLY
>  	bool "ply"
>  	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  ply is a light-weight dynamic tracer for Linux. By means of
>  	  using the BPF it can attach probes to the linux kernel
> -- 
> 2.20.1
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

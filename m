From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 10:24:34 +0200
Subject: [Buildroot] [PATCH] Config.in: add -Ofast option
In-Reply-To: <1521735971-22210-1-git-send-email-joshua.henderson@microchip.com>
References: <1521735971-22210-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180325082434.GF2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2018-03-22 09:26 -0700, Joshua Henderson spake thusly:
> -Ofast (introduced in GCC 4.6) It combines the existing optimization level -O3
> with options that can affect standards compliance but result in better optimized
> code. For example, -Ofast enables -ffast-math.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  Config.in           | 9 +++++++++
>  package/Makefile.in | 3 +++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 0002df5..e83ce02 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -527,6 +527,15 @@ config BR2_OPTIMIZE_S
>  	  -ftree-vect-loop-version
>  	  This is the default.
>  
> +config BR2_OPTIMIZE_FAST
> +	bool "optimize for fast"

-Ofast was introduced in gcc-4.6, so you need a dependency:
    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6

Otherwise I'm fine with this.

Regards,
Yann E. MORIN.

> +	help
> +	  Optimize for fast. Disregard strict standards compliance. -Ofast
> +	  enables all -O3 optimizations. It also enables optimizations that are
> +	  not valid for all standard-compliant programs. It turns on -ffast-math
> +	  and the Fortran-specific -fstack-arrays, unless -fmax-stack-var-size
> +	  is specified, and -fno-protect-parens.
> +
>  endchoice
>  
>  config BR2_GOOGLE_BREAKPAD_ENABLE
> diff --git a/package/Makefile.in b/package/Makefile.in
> index e387ce6..828e12e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -128,6 +128,9 @@ endif
>  ifeq ($(BR2_OPTIMIZE_S),y)
>  TARGET_OPTIMIZATION = -Os
>  endif
> +ifeq ($(BR2_OPTIMIZE_FAST),y)
> +TARGET_OPTIMIZATION = -Ofast
> +endif
>  ifeq ($(BR2_DEBUG_1),y)
>  TARGET_DEBUGGING = -g1
>  endif
> -- 
> 2.7.4
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

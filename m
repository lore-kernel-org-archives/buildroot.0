From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 19:00:06 +0200
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: use gcc wrappers
 for binutils tools
In-Reply-To: <20201014194002.9753-1-nolange79@gmail.com>
References: <20201014194002.9753-1-nolange79@gmail.com>
Message-ID: <20201017170006.GS3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-10-14 21:39 +0200, Norbert Lange spake thusly:
> This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
> normal binutils tools. The difference is that with the
> wrappers, gcc plugins will be automatically picked up.
> 
> I dont think there are any toolchains still supported that
> lack those wrappers, so it should be safe to use
> unconditionally. Otherwise an option needs to be added.

When were they added? We are supposed to still support building with at
least back to gcc-4.3:

    https://git.buildroot.org/buildroot/tree/toolchain/Config.in#n557

Regards,
Yann E. MORIN.

> Note that binutils added some automatic loading with the
> 'bfd-plugins' directory (somewhere around 2.28), but
> the first implementation had issues, and generally depends on
> correctly setup symlinks (often broken, may point to some
> other gcc's library). The wrappers always work painless.
> 
> The original motivation (now ~2 years in use) was to add
> "-flto -ffat-lto-objects" to both BR2_TARGET_OPTIMIZATION and
> BR2_TARGET_LDFLAGS, and have target binaries lto optimized.
> 
> Not all packages will compile with this option, further work
> could white/blacklist packages (adding -fno-lto to the
> options).
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/Makefile.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 51f5cbce4f..a03f0304d5 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -198,15 +198,15 @@ TARGET_CROSS = $(HOST_DIR)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
>  endif
>  
>  # Define TARGET_xx variables for all common binutils/gcc
> -TARGET_AR       = $(TARGET_CROSS)ar
> +TARGET_AR       = $(TARGET_CROSS)gcc-ar
>  TARGET_AS       = $(TARGET_CROSS)as
>  TARGET_CC       = $(TARGET_CROSS)gcc
>  TARGET_CPP      = $(TARGET_CROSS)cpp
>  TARGET_CXX      = $(TARGET_CROSS)g++
>  TARGET_FC       = $(TARGET_CROSS)gfortran
>  TARGET_LD       = $(TARGET_CROSS)ld
> -TARGET_NM       = $(TARGET_CROSS)nm
> -TARGET_RANLIB   = $(TARGET_CROSS)ranlib
> +TARGET_NM       = $(TARGET_CROSS)gcc-nm
> +TARGET_RANLIB   = $(TARGET_CROSS)gcc-ranlib
>  TARGET_READELF  = $(TARGET_CROSS)readelf
>  TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
>  TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
> -- 
> 2.28.0
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

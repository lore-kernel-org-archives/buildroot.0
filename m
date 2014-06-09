From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:58:40 +0200
Subject: [Buildroot] [PATCH v6 3/3] Add an BR2_GCC_ENABLE_GRAPHITE flag
 for the buildroot toolchain
In-Reply-To: <BLU436-SMTP1389119D64FEA33BF25D8E5A8320@phx.gbl>
References: <1400528893-4483-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP1389119D64FEA33BF25D8E5A8320@phx.gbl>
Message-ID: <20140609115840.745671e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Mon, 19 May 2014 19:48:13 +0000, Steve Thomas wrote:
> The gcc graphite optimisations such as loop-interchange, blocking
> and loop-flattening, also known as graphite are an optional feature of
> gcc that is very well supported since about gcc version 4.5.
> 
> This patch adds support for graphite for the toolchain as an optional
> flag for versions 4.8 onwards as an optional flag, that is disabled by
> default.
> 
> Signed-off-by: Steve Thomas <scjthm@live.com>

Patch applied, with a few changes, see below.

> +config BR2_GCC_SUPPORTS_GRAPHITE
> +   bool

Indentation should be one tab.

And of course I've added the BR2_GCC_ENABLE_GRAPHITE option, otherwise
your patch wouldn't work.

> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 32219cc..8a35dbd 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -156,6 +156,16 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
>  HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
>  endif
>  
> +ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
> +HOST_GCC_COMMON_DEPENDENCIES += \
> +   host-isl \
> +   host-cloog

Used a single line.

> +
> +#This is needed as with-isl doesn't work
> +HOST_GCC_COMMON_CONF_OPT += \
> +   --disable-isl-version-check

Here, --with-isl and --with-cloog are working perfectly fine, as well
as --without-isl and --without-cloog, so I've used them.

Can you test if the latest master works for you?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

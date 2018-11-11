From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 20:53:43 +0100
Subject: [Buildroot] [PATCH 1/1] libkrb5: fix build on riscv
In-Reply-To: <20181111175210.14031-1-fontaine.fabrice@gmail.com>
References: <20181111175210.14031-1-fontaine.fabrice@gmail.com>
Message-ID: <20181111205343.76b10bff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Nov 2018 18:52:10 +0100, Fabrice Fontaine wrote:
> Define _REENTRANT otherwise pthread detection will fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/39a51d0c3feab74edd8a17c9174d031ccc7ffe1d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libkrb5/libkrb5.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index d9d7160ae8..6534c069ee 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -52,7 +52,14 @@ else
>  LIBKRB5_CONF_OPTS += --without-readline
>  endif
>  
> -ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
> +# it should. Compensate this deficiency here otherwise libkrb5 configure
> +# script doesn't find that thread support is enabled.
> +ifeq ($(BR2_riscv),y)
> +LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
> +endif

You did a similar change in libmicrothttpd, for which the same fix was
already done for ARC. Any idea why libmicrohttpd needs this hack for
both ARC and RISC-V, while libkrb5 would need it only for RISC-V ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

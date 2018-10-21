From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Oct 2018 14:30:57 +0200
Subject: [Buildroot] [PATCH 1/3] package/gcc: disable libcilkrts when
 there is no thread support
In-Reply-To: <20181021115415.21471-2-thomas.petazzoni@bootlin.com>
References: <20181021115415.21471-1-thomas.petazzoni@bootlin.com>
 <20181021115415.21471-2-thomas.petazzoni@bootlin.com>
Message-ID: <c1d43d4b-a6a5-8964-f76d-39e8b5bdc622@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 21/10/2018 ? 13:54, Thomas Petazzoni a ?crit?:
> The libcilkrts configure script errors out with "Pthreads are required
> to build libcilkrts" if the C library doesn't have thread support. To
> fix that, we disable libcilkrts when thread support is not available.
> 
> This issue was not noticed until now, because we only regularly build
> a no-thread toolchain for ARM, and libcilkrts was enabled on ARM only
> starting in gcc 7.x.
> 
> This fixes the build of no-thread toolchains on architectures where
> libcilkrts is supported, i.e x86/x86-64, ARM and Sparc.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  package/gcc/gcc-final/gcc-final.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 9897d18682..1be0b9bfc9 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -81,6 +81,11 @@ ifeq ($(BR2_sparc),y)
>  HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
>  endif
>  
> +# Pthreads are required to build libcilkrts
> +ifeq ($(BR2_PTHREADS_NONE),y)
> +HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
> +endif
> +
>  # Disable shared libs like libstdc++ if we do static since it confuses linking
>  # In that case also disable libcilkrts as there is no static version
>  ifeq ($(BR2_STATIC_LIBS),y)
> 

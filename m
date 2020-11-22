From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Nov 2020 18:44:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/spandsp: disable MMX on i686
In-Reply-To: <20201122162653.632222-1-fontaine.fabrice@gmail.com>
References: <20201122162653.632222-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh39wdcb.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sun, Nov 22 2020, Fabrice Fontaine wrote:
> MMX raises the following build failure on i686:
>
> gsm0610_rpe.c: In function 'gsm0610_rpe_encoding':
> gsm0610_rpe.c:132:5: error: invalid 'asm': invalid constraints for operand
>      __asm__ __volatile__(
>      ^~~~~~~
>
> Fixes:
>  - http://autobuild.buildroot.org/results/3e986c3109c392afe47fc98446a2563ac9776cf6
>  - http://autobuild.buildroot.org/results/00ed4a4285b35d8ec0be09217e5b503e4820d971
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---

[snip]

> diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
> index 42c0e3bb69..29fa39accc 100644
> --- a/package/spandsp/spandsp.mk
> +++ b/package/spandsp/spandsp.mk
> @@ -8,6 +8,8 @@ SPANDSP_VERSION = 3.0.0-6ec23e5a7e
>  SPANDSP_SITE = https://files.freeswitch.org/downloads/libs
>  SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
>  SPANDSP_LICENSE_FILES = COPYING
> +# We're patching configure.ac
> +SPANDSP_AUTORECONF = YES
>  
>  SPANDSP_DEPENDENCIES = tiff host-pkgconf
>  SPANDSP_INSTALL_STAGING = YES
> @@ -15,7 +17,6 @@ SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
>  
>  SPANDSP_CONF_OPTS = \
>  	--disable-builtin-tiff \
> -	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx) \
>  	$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
>  	$(if $(BR2_X86_CPU_HAS_SSE2),--enable-sse2,--disable-sse2) \
>  	$(if $(BR2_X86_CPU_HAS_SSE3),--enable-sse3,--disable-sse3) \
> @@ -23,4 +24,11 @@ SPANDSP_CONF_OPTS = \
>  	$(if $(BR2_X86_CPU_HAS_SSE4),--enable-sse4-1,--disable-sse4-1) \
>  	$(if $(BR2_X86_CPU_HAS_SSE42),--enable-sse4-2,--disable-sse4-2)
>  
> +# MMX on i686 raises a build failure
> +ifeq ($(BR2_X86_CPU_HAS_MMX)$(BR2_x86_64),yy)

Isn't BR2_X86_CPU_HAS_MMX always enabled for BR2_x86_64?

baruch

> +SPANDSP_CONF_OPTS += --enable-mmx
> +else
> +SPANDSP_CONF_OPTS += --disable-mmx
> +endif
> +
>  $(eval $(autotools-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

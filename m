From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 5 Sep 2019 18:16:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr: fix non-portable atomics
In-Reply-To: <20190904193315.28943-1-bernd.kuhls@t-online.de>
References: <20190904193315.28943-1-bernd.kuhls@t-online.de>
Message-ID: <b0616bd0-2308-0d36-5fb0-0febc2ae58b8@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Il 04/09/2019 21:33, Bernd Kuhls ha scritto:
> apr-1.7.0 added support for 8 bytes atomics for 32 bit archs
> https://github.com/apache/apr/commit/2f61f960c81e4a45f3849baa7563812e7e526436
> 
> We need to adjust our _CONF_OPTS which fixes an apache build error.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f24/f2461c1ed542e050afd761db5faeaaff1f51775b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

> ---
>   package/apr/apr.mk | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index 2a57f854f9..72008d8998 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -42,15 +42,10 @@ endif
>   # Fix lfs detection when cross compiling
>   APR_CONF_ENV += apr_cv_use_lfs64=yes
>   
> -# Use non-portable atomics when available: 8 bytes atomics are used on
> -# 64-bits architectures, 4 bytes atomics on 32-bits architectures. We
> -# have to override ap_cv_atomic_builtins because the test used to
> -# check for atomic builtins uses AC_TRY_RUN, which doesn't work when
> -# cross-compiling.
> -ifeq ($(BR2_ARCH_IS_64):$(BR2_TOOLCHAIN_HAS_SYNC_8),y:y)
> -APR_CONF_OPTS += --enable-nonportable-atomics
> -APR_CONF_ENV += ap_cv_atomic_builtins=yes
> -else ifeq ($(BR2_ARCH_IS_64):$(BR2_TOOLCHAIN_HAS_SYNC_4),:y)
> +# Use non-portable atomics when available. We have to override
> +# ap_cv_atomic_builtins because the test used to  check for atomic
> +# builtins uses AC_TRY_RUN, which doesn't work when cross-compiling.
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8),y)
>   APR_CONF_OPTS += --enable-nonportable-atomics
>   APR_CONF_ENV += ap_cv_atomic_builtins=yes
>   else
> 

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

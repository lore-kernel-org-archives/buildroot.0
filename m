From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 22:04:27 +0200
Subject: [Buildroot] [PATCH 2/3] gcc: pass explicit
 gcc_cv_libc_provides_ssp also to gcc-final
In-Reply-To: <1445087350-4947-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445087350-4947-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1445087350-4947-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151017200427.GI3717@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-17 15:09 +0200, Thomas Petazzoni spake thusly:
> During the gcc-initial build, we already pass
> gcc_cv_libc_provides_ssp=yes explicitly when SSP support will be
> available in the C library: at this point in time the C library is not
> yet built, so gcc cannot detect if it will support SSP or not.
> 
> However, it turns out that there are some situations for which it is
> also useful to tell gcc explicitly whether the SSP support is
> available or not: the gcc logic to decide whether uClibc has SSP
> support or not is broken since uClibc-ng bumped the glibc version it
> pretends to be.
> 
> So, this commit makes sure that we explicitly pass
> gcc_cv_libc_provides_ssp both to gcc-initial and gcc-final, and that
> we're always passing either 'yes' or 'no'.
> 
> Fixes:
> 
>    http://autobuild.buildroot.org/results/778/778e6309ba834cc70f8243a4f6c664c0bcaeb7c5/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc-final/gcc-final.mk     |  2 ++
>  package/gcc/gcc-initial/gcc-initial.mk |  5 +----
>  package/gcc/gcc.mk                     | 10 ++++++++++
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index a5be3c7..5a0f5b5 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -85,6 +85,8 @@ HOST_GCC_FINAL_CONF_OPTS += \
>  HOST_GCC_FINAL_CONF_ENV = \
>  	$(HOST_GCC_COMMON_CONF_ENV)
>  
> +HOST_GCC_FINAL_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
> +
>  # Make sure we have 'cc'
>  define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
>  	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index 4b03e47..c0b5eaf 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -51,10 +51,7 @@ HOST_GCC_INITIAL_CONF_OPTS = \
>  HOST_GCC_INITIAL_CONF_ENV = \
>  	$(HOST_GCC_COMMON_CONF_ENV)
>  
> -# We need to tell gcc that the C library will be providing the ssp
> -# support, as it can't guess it since the C library hasn't been built
> -# yet (we're gcc-initial).
> -HOST_GCC_INITIAL_MAKE_OPTS = $(if $(BR2_TOOLCHAIN_HAS_SSP),gcc_cv_libc_provides_ssp=yes) all-gcc
> +HOST_GCC_INITIAL_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc
>  HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc
>  
>  ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index ef606c4..d6213cc 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -238,6 +238,16 @@ endif
>  
>  HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
>  
> +# For gcc-initial, we need to tell gcc that the C library will be
> +# providing the ssp support, as it can't guess it since the C library
> +# hasn't been built yet.
> +#
> +# For gcc-final, the gcc logic to detect whether SSP support is
> +# available or not in the C library is not working properly for
> +# uClibc, so let's be explicit as well.
> +HOST_GCC_COMMON_MAKE_OPTS = \
> +	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> +
>  ifeq ($(BR2_CCACHE),y)
>  HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
>  # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
> -- 
> 2.6.2
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

From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 21:42:33 +0200
Subject: [Buildroot] [PATCH 02/18] gcc: use toolchain wrapper
In-Reply-To: <1442774504-22799-3-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442774504-22799-3-git-send-email-arnout@mind.be>
Message-ID: <56102FA9.3030109@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 20/09/2015 20:41, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> We have a toolchain wrapper for external toolchain, but it is also
> beneficial for internal toolchains, for the following reasons:
> 
> 1. It can make sure that BR2_TARGET_OPTIMIZATION is passed to the
>    compiler even if a package's build system doesn't honor CFLAGS.
> 2. It allows us to do the unsafe path check (i.e. -I/usr/include)
>    without patching gcc.
> 3. It makes it simpler to implement building each package with a
>    separate staging directory (per-package staging).
> 4. It makes it simpler to implement a compiler hash check for ccache.
> 
> The wrapper is reused from the external toolchain. A third CROSS_PATH_
> option is added to the wrapper: in this case, the real executable is in
> the same directory, with the extension .real.
> 
> The creation of the simple symlinks is merged with the creation of the
> wrapper symlinks, otherwise part of the -gcc-ar handling logic would
> have to be repeated.
> 
> The complex case-condition could be refactored with the one for the
> external toolchain, but then it becomes even more complex because
> they each have special corner cases. For example, the internal
> toolchain has to handle *.real to avoid creating an extra indirection
> after host-gcc-{final,initial}-rebuild.
> 
> Instead of creating the .real files, it would also have been possible
> to install the internal toolchain in $(HOST_DIR)/opt, similar to what
> we do for the external toolchain. However, then we would also have to
> copy things to the sysroot and do more of the magic that the external
> toolchain is doing. So keeping it in $(HOST_DIR)/usr/bin is much
> simpler.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
> ---
>  package/gcc/gcc-final/gcc-final.mk     | 13 +++++--------
>  package/gcc/gcc-initial/gcc-initial.mk |  4 ++++
>  package/gcc/gcc.mk                     | 35 ++++++++++++++++++++++++++++++++++
>  toolchain/toolchain-wrapper.c          |  4 +++-
>  4 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 3426ba4..2c16fdf 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -96,14 +96,11 @@ endef
>  
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
>  
> -# Create <arch>-linux-<tool> symlinks
> -define HOST_GCC_FINAL_CREATE_SIMPLE_SYMLINKS
> -	(cd $(HOST_DIR)/usr/bin; for i in $(GNU_TARGET_NAME)-*; do \
> -		ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
> -	done)
> -endef
> -
> -HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_SIMPLE_SYMLINKS
> +HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
> +HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
> +# Note: this must be done after CREATE_CC_SYMLINKS, otherwise the
> +# -cc symlink to the wrapper is not created.
> +HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
>  
>  # In gcc 4.7.x, the ARM EABIhf library loader path for (e)glibc was not
>  # correct, so we create a symbolic link to make things work
> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index 6bb7997..4b03e47 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -62,4 +62,8 @@ HOST_GCC_INITIAL_MAKE_OPTS += all-target-libgcc
>  HOST_GCC_INITIAL_INSTALL_OPTS += install-target-libgcc
>  endif
>  
> +HOST_GCC_INITIAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
> +HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
> +HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
> +

I was wondering why we had to use the wrapper for the gcc-initial until I figure
out that it's used when the libc is build.

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

>  $(eval $(host-autotools-package))
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 501fcea..9044040 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -235,4 +235,39 @@ HOST_GCC_COMMON_CONF_OPTS += \
>  	--with-long-double-128
>  endif
>  
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".real"'
> +
> +# The LTO support in gcc creates wrappers for ar, ranlib and nm which load
> +# the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
> +# *-gcc-nm and should be used instead of the real programs when -flto is
> +# used. However, we should not add the toolchain wrapper for them, and they
> +# match the *cc-* pattern. Therefore, an additional case is added for *-ar,
> +# *-ranlib and *-nm.
> +# Avoid that a .real is symlinked a second time.
> +# Also create <arch>-linux-<tool> symlinks.
> +define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
> +	$(Q)cd $(HOST_DIR)/usr/bin; \
> +	for i in $(GNU_TARGET_NAME)-*; do \
> +		case "$$i" in \
> +		*.real) \
> +			;; \
> +		*-ar|*-ranlib|*-nm) \
> +			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
> +			;; \
> +		*cc|*cc-*|*++|*++-*|*cpp) \
> +			rm -f $$i.real; \
> +			mv $$i $$i.real; \
> +			ln -sf toolchain-wrapper $$i; \
> +			ln -sf toolchain-wrapper $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
> +			ln -snf $$i.real $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}.real; \
> +			;; \
> +		*) \
> +			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
> +			;; \
> +		esac; \
> +	done
> +
> +endef
> +
> +
>  include $(sort $(wildcard package/gcc/*/*.mk))
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index b3b02d8..f3ff04f 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -138,8 +138,10 @@ int main(int argc, char **argv)
>  	/* Fill in the relative paths */
>  #ifdef BR_CROSS_PATH_REL
>  	ret = snprintf(path, sizeof(path), "%s/" BR_CROSS_PATH_REL "/%s", absbasedir, basename);
> -#else /* BR_CROSS_PATH_ABS */
> +#elif BR_CROSS_PATH_ABS
>  	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s", basename);
> +#else /* BR_CROSS_PATH_SUFFIX */
> +	ret = snprintf(path, sizeof(path), "%s/usr/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
>  #endif
>  	if (ret >= sizeof(path)) {
>  		perror(__FILE__ ": overflow");
> 

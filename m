From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 17:20:46 +0100
Subject: [Buildroot] [PATCH v2 01/23] toolchain-external:
 TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK: use arguments instead of global
 variables
In-Reply-To: <1477742948-11490-2-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161030162046.GA3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-10-29 14:08 +0200, Romain Naour spake thusly:
> A new external toolchain package infrastructure will be introduced in a
> followup patch, so TOOLCHAIN_EXTERNAL_{CC,CFLAGS...} global variables
> will no longer exist. Instead, each external-toolchain packages will
> provide it's own <toolchain-external-name>_{CC,CFLAGS...} variables.

What's missing in this explanation is why those variables will no longer
exist.

But I guess that's inherent to the entire rework. In which case the
cover-letter should have had a global explanation on the rework, and
what it entails for those functions/macros.

> So additional arguments are needed to provide CC and CFLAG when calling
> TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: rework commit log/title (Arnout)
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index b7a36be..d383d5f 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -554,20 +554,28 @@ endif
>  # (as appropriate)
>  #
>  # $1: destination directory (TARGET_DIR / STAGING_DIR)
> +# $2: toolchain CC
> +# $3: toolchain CFLAGS
>  create_lib_symlinks = \
>         $(Q)DESTDIR="$(strip $1)" ; \
> -       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +       TOOLCHAIN_CC="$(strip $2)" ; \
> +       TOOLCHAIN_CFLAGS="$(strip $3)" ; \
> +       ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
>         if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
>                 ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
>                 ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
>         fi
>  
> +# $1: toolchain CC
> +# $2: toolchain CFLAGS
>  define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
> -       $(call create_lib_symlinks,$(STAGING_DIR))
> +       $(call create_lib_symlinks,$(STAGING_DIR),$(1),$(2))
>  endef
>  
> +# $1: toolchain CC
> +# $2: toolchain CFLAGS
>  define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
> -       $(call create_lib_symlinks,$(TARGET_DIR))
> +       $(call create_lib_symlinks,$(TARGET_DIR),$(1),$(2))
>  endef
>  
>  # Integration of the toolchain into Buildroot: find the main sysroot
> @@ -781,7 +789,7 @@ TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
>  	$(TOOLCHAIN_WRAPPER_INSTALL)
> -	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
> +	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
> @@ -792,7 +800,7 @@ endef
>  # and the target directory, we do everything within the
>  # install-staging step, arbitrarily.
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
> -	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
> +	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
> -- 
> 2.5.5
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

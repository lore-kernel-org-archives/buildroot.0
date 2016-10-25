From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Oct 2016 12:50:51 +0200
Subject: [Buildroot] [PATCH 01/30] toolchain-external: pass CC and
 CFLAGS as arguments
In-Reply-To: <1477255711-28603-2-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <1477255711-28603-2-git-send-email-romain.naour@gmail.com>
Message-ID: <4bf57e5a-6e4b-4cc3-98ba-911cde2abc94@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-16 22:48, Romain Naour wrote:
> As soon as the external toolchain infrastructure gets introduced in a
> future commit, the TOOLCHAIN_EXTERNAL_CC and TOOLCHAIN_EXTERNAL_CFLAGS
> will be provided by the external toolchain package using
> <external-toolchain-name>_CC and <external-toolchain-name>_CFLAGS.
> 
> This commit prepares the transition to the external toolchain
> infrastructure by passing CC and CFLAGS as function arguments.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

but see next commit.

 Regards,
 Arnout

> ---
>  toolchain/toolchain-external/toolchain-external.mk | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 141dd10..1f57359 100644
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
> @@ -773,7 +781,7 @@ endef
>  TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
>  
>  define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
> -	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
> +	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
> @@ -784,7 +792,7 @@ endef
>  # and the target directory, we do everything within the
>  # install-staging step, arbitrarily.
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
> -	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
> +	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 22 Mar 2016 23:04:39 +0100
Subject: [Buildroot] [PATCH 3/5] toolchain-external: extract
 installation of gdbserver to separate define
In-Reply-To: <1455304826-10557-4-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-4-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <56F1C177.1060007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

Le 12/02/2016 20:20, Thomas De Schampheleire a ?crit :
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The installation of the gdbserver binary has no relation to the installation
> of the target libraries. Moving it to a separate define improves the
> understandability of the code and makes later refactoring easier.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 9d88158..d5445e5 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -604,7 +604,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>  		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
>  			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
>  		done ; \
> -	fi ; \
> +	fi
> +endef
> +

It's a good idea but can we instead define TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER
only when BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is set to y ?

ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
define TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER
...

> +define TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER
> +	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>  	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \

This allow to remove this line ^^^

Best regards,
Romain

>  		$(call MESSAGE,"Copying gdbserver") ; \
>  		gdbserver_found=0 ; \
> @@ -774,6 +779,7 @@ endef
>  define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
>  	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
> +	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
>  	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
> 

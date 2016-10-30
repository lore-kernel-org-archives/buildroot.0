From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 17:29:02 +0100
Subject: [Buildroot] [PATCH v2 03/23] toolchain-external:
 TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER: use arguments instead of global
 variables
In-Reply-To: <1477742948-11490-4-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-4-git-send-email-romain.naour@gmail.com>
Message-ID: <20161030162902.GC3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-10-29 14:08 +0200, Romain Naour spake thusly:
> A new external toolchain package infrastructure will be introduced in a
> followup patch, so TOOLCHAIN_EXTERNAL_{CC,CFLAGS...} global variables
> will no longer exist. Instead, each external toolchain packages will
> provide it's own <toolchain-external-name>_{CC,CFLAGS...} variables.
> 
> For the case of the toolchain wrapper install, CROSS is needed when
> calling TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see below...

> ---
> v2: rework commit log/title (Arnout)
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index ddf77aa..84b6a03 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -746,9 +746,10 @@ endif
>  # used. However, we should not add the toolchain wrapper for them, and they
>  # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
>  # *-ranlib and *-nm.
> +# $1 toolchain CROSS
>  define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>  	$(Q)cd $(HOST_DIR)/usr/bin; \
> -	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
> +	for i in $(1)*; do \

Again, for consistency with other functions/macros, it would have been
nice to introduce a local variable.

Regards,
Yann E. MORIN.

>  		base=$${i##*/}; \
>  		case "$$base" in \
>  		*-ar|*-ranlib|*-nm) \
> @@ -800,7 +801,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
>  	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>  	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
> -	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
> +	$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$(TOOLCHAIN_EXTERNAL_CROSS))
>  	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
>  endef
>  
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

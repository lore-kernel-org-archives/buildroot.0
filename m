From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 22:49:16 +0200
Subject: [Buildroot] [PATCHv2 10/21] Makefile: move source-check outside
 of noconfig_targets
In-Reply-To: <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150413204916.GJ29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> make source-check is here to check whether the remote sources for the
> current selection of packages are still available. So it cannot be a
> noconfig_targets, since it depends on a configuration being
> available. The very fact that 'source-check' is basically the same as
> 'source', and one is a noconfig_target and not the other is a clear
> indication that the current implementation is wrong.
> 
> So this commit moves source-check to no longer be a noconfig_target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I noticed that source-check tries to go to the mirror. For
example, cjson fails to download from svn for me here, and it falls back
to looking on the mirror, and thus concludes it exists.

Shouldn't source-check be limited to looking at the upstream locations?

However, not a blocker, since it;s already the behaviour we have.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 40ee2e2..6937dd3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -75,7 +75,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
>  noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>  	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
>  	randpackageconfig allyespackageconfig allnopackageconfig \
> -	source-check print-version olddefconfig
> +	print-version olddefconfig
>  
>  # Strip quotes and then whitespaces
>  qstrip = $(strip $(subst ",,$(1)))
> @@ -422,7 +422,7 @@ world: target-post-image
>  
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>  	legal-info legal-info-prepare legal-info-clean printvars help \
> -	target-finalize target-post-image
> +	target-finalize target-post-image source-check
>  
>  ################################################################################
>  #
> @@ -616,6 +616,10 @@ _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
>  external-deps:
>  	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
>  
> +# check if download URLs are outdated
> +source-check:
> +	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
> +
>  legal-info-clean:
>  	@rm -fr $(LEGAL_INFO_DIR)
>  
> @@ -794,10 +798,6 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
>  
> -# check if download URLs are outdated
> -source-check:
> -	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
> -
>  .PHONY: defconfig savedefconfig
>  
>  ################################################################################
> -- 
> 2.1.0
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

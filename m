From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Nov 2013 23:42:59 +0100
Subject: [Buildroot] [PATCHv4 3/5] core: allow external defconfigs to be
 used
In-Reply-To: <1385751626-28967-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385751626-28967-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385751626-28967-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131130224259.GC3500@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-29 20:00 +0100, Thomas Petazzoni spake thusly:
> This commit allows the user to store defconfigs in
> $BR2_EXTERNAL/configs/. To achieve this:
> 
>  * It adds a new %_defconfig that looks in $BR2_EXTERNAL/configs/ for
>    the corresponding defconfig file.
> 
>  * Updates the help target to also list external defconfigs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index b5a9828..eb547a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -754,6 +754,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
>  
> +ifeq ($(BR2_EXTERNAL_USED),y)
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
> +	@mkdir -p $(BUILD_DIR)/buildroot-config
> +	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
> +endif
> +
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@$(COMMON_CONFIG_ENV) $< \
> @@ -862,8 +868,17 @@ endif
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>  	@echo '  make O=dir             - Locate all output files in "dir", including .config'
>  	@echo
> +	@echo 'Built-in configs'
> +	@echo

There is no empty line after other help section titles, and the titles
end with a colon, eg.:

---8<--
Miscellaneous:
  source                 - download all sources needed for offline-build
  source-check           - check selected packages for valid download URLs
---8<--

>  	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
>  	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
> +ifeq ($(BR2_EXTERNAL_USED),y)
> +	@echo
> +	@echo 'User-provided configs'
> +	@echo

Ditto.

> +	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
> +	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
> +endif
>  	@echo
>  	@echo 'See docs/README, or generate the Buildroot manual for further details'
>  	@echo

Otherwise, you get my:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

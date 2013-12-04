From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Dec 2013 23:11:50 +0100
Subject: [Buildroot] [PATCHv5 3/5] core: allow external defconfigs to be
 used
In-Reply-To: <1386183373-17611-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386183373-17611-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131204221150.GE3332@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-04 19:56 +0100, Thomas Petazzoni spake thusly:
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
>  Makefile | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 4f20bd5..3365a50 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -742,6 +742,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
>  
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
> +	@mkdir -p $(BUILD_DIR)/buildroot-config
> +	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
> +
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@$(COMMON_CONFIG_ENV) $< \
> @@ -850,8 +854,15 @@ endif
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>  	@echo '  make O=dir             - Locate all output files in "dir", including .config'
>  	@echo
> +	@echo 'Built-in configs:'
>  	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
>  	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
> +ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
> +	@echo
> +	@echo 'User-provided configs:'

"User-provided configs" soudns odd to me. I would have expected "External
configs". But it goes well with "Built-in configs", above.

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

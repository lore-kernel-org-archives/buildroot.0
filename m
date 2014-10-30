From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 23:03:10 +0100
Subject: [Buildroot] [PATCH v3 1/2] randconfig,
 allyesconfig: fix handling of legacy options
In-Reply-To: <1413278695-8979-1-git-send-email-arnout@mind.be>
References: <1413278695-8979-1-git-send-email-arnout@mind.be>
Message-ID: <20141030230310.4b91e6ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Tue, 14 Oct 2014 11:24:54 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Randconfig and allyesconfig should never select legacy options, so use
> the same trick as allpackageyesconfig and randpackageconfig to remove
> them.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 907a0fc..5bcaa77 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -731,11 +731,25 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  
>  randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
> -	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
> +	@rm -f $(CONFIG_DIR)/.config.nopkg
> +	@grep '^config ' Config.in.legacy | \
> +		while read config pkg; do \
> +		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
> +	@$(COMMON_CONFIG_ENV) \
> +		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
> +		$< --randconfig $(CONFIG_CONFIG_IN)
> +	@rm -f $(CONFIG_DIR)/.config.nopkg
>  
>  allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
> -	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
> +	@rm -f $(CONFIG_DIR)/.config.nopkg
> +	@grep '^config ' Config.in.legacy | \
> +		while read config pkg; do \
> +		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
> +	@$(COMMON_CONFIG_ENV) \
> +		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
> +		$< --allyesconfig $(CONFIG_CONFIG_IN)
> +	@rm -f $(CONFIG_DIR)/.config.nopkg
>  
>  allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config

I was going to apply this, and then I tested it, to discover that it
then causes the same problem as the one we have with randpackageconfig
today: none of the choice options get randomized anymore. So before
this patch, if you do "randconfig", you get proper randomization. After
this patch, if you do "randconfig", it only generates i386
configurations.

I admit it's not really an issue introduced by the patch as the issue
already exists for randpackageconfig. But it's very annoying :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

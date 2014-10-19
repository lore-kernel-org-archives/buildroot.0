From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 11:00:41 +0200
Subject: [Buildroot] [PATCH v3 2/2] randconfig: seed with
 BR2_RAND_PRESEED_CONFIG_FILES
In-Reply-To: <1413278695-8979-2-git-send-email-arnout@mind.be>
References: <1413278695-8979-1-git-send-email-arnout@mind.be>
 <1413278695-8979-2-git-send-email-arnout@mind.be>
Message-ID: <20141019090041.GH4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-10-14 11:24 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Currently, randconfig is completely unusable. Instead, we use
> randpackageconfig, with two use cases: in the autobuilders, and when
> doing manual testing of the validity of depends/select chains. In both
> cases, we actually want the possibility to explicitly select some
> packages or to set a string value or to randomise between a choice or
> to test bootloaders and kernels - all of this is currently impossible.
> 
> This patch adds a BR2_RAND_PRESEED_CONFIG_FILES environment variable
> that can be set to a (set of) files with config options that should be
> set or unset. randconfig and randpackageconfig will force these
> values.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v3:
>  - use 'cat' instead of 'cp', to support multiple files. [Yann]
> 
> v2:
>  - split off the fix for legacy
>  - apply to both randconfig and randpackageconfig
>  - rename to BR2_RAND_PRESEED_CONFIG_FILES because it supports
>    multiple files
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5bcaa77..070c2e8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -732,6 +732,9 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@rm -f $(CONFIG_DIR)/.config.nopkg
> +ifneq ($(BR2_RAND_PRESEED_CONFIG_FILES),)
> +	@cat $(BR2_RAND_PRESEED_CONFIG_FILES) > $(CONFIG_DIR)/.config.nopkg
> +endif
>  	@grep '^config ' Config.in.legacy | \
>  		while read config pkg; do \
>  		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
> @@ -758,6 +761,9 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
> +ifneq ($(BR2_RAND_PRESEED_CONFIG_FILES),)
> +	@grep BR2_PACKAGE_ $(BR2_RAND_PRESEED_CONFIG_FILES) >> $(CONFIG_DIR)/.config.nopkg
> +endif
>  	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
>  		while read config pkg; do \
>  		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
> @@ -870,13 +876,15 @@ help:
>  	@echo '  oldconfig              - resolve any unresolved symbols in .config'
>  	@echo '  silentoldconfig        - Same as oldconfig, but quietly, additionally update deps'
>  	@echo '  olddefconfig           - Same as silentoldconfig but sets new symbols to their default value'
> -	@echo '  randconfig             - New config with random answer to all options'
> +	@echo '  randconfig             - New config with random answer to all options -'
> +	@echo '                             options can be forced by setting BR2_RAND_PRESEED_CONFIG_FILES'
>  	@echo '  defconfig              - New config with default answer to all options'
>  	@echo '                             BR2_DEFCONFIG, if set, is used as input'
>  	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
>  	@echo '  allyesconfig           - New config where all options are accepted with yes'
>  	@echo '  allnoconfig            - New config where all options are answered with no'
> -	@echo '  randpackageconfig      - New config with random answer to package options'
> +	@echo '  randpackageconfig      - New config with random answer to package options -'
> +	@echo '                             options can be forced by setting BR2_RAND_PRESEED_CONFIG_FILES'
>  	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
>  	@echo '  allnopackageconfig     - New config where package options are answered with no'
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -- 
> 2.1.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

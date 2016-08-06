From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Aug 2016 17:16:20 +0200
Subject: [Buildroot] [PATCH 05/16 v3] core: move rule to create basic
 directories
In-Reply-To: <35c825b427c5e89497aafde9b787986eeeac1ad7.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <35c825b427c5e89497aafde9b787986eeeac1ad7.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <11c12539-f62e-0e2b-c6e3-b6bb2e9a1c12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :
> Some of those directories will be needed even during configuration, like
> BUILD_DIR, where we'll store the generated kconfig snippet.
> 
> So, move the rule to create them outside the HAVE_CONFIG block.

You mean BR2_HAVE_DOT_CONFIG here, right ?

With that fixed:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>  Makefile | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6f947f3..d4dc1c5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -200,6 +200,15 @@ LEGAL_LICENSES_TXT_HOST = $(LEGAL_INFO_DIR)/host-licenses.txt
>  LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
>  LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
>  
> +################################################################################
> +#
> +# staging and target directories do NOT list these as
> +# dependencies anywhere else
> +#
> +################################################################################
> +$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
> +	@mkdir -p $@
> +
>  BR2_CONFIG = $(CONFIG_DIR)/.config
>  
>  # Pull in the user's configuration file
> @@ -496,15 +505,6 @@ world: target-post-image
>  	legal-info legal-info-prepare legal-info-clean printvars help \
>  	list-defconfigs target-finalize target-post-image source-check
>  
> -################################################################################
> -#
> -# staging and target directories do NOT list these as
> -# dependencies anywhere else
> -#
> -################################################################################
> -$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
> -	@mkdir -p $@
> -
>  # Populating the staging with the base directories is handled by the skeleton package
>  $(STAGING_DIR):
>  	@mkdir -p $(STAGING_DIR)
> 

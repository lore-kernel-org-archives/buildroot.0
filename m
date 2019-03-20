From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 22:54:59 +0100
Subject: [Buildroot] [PATCH v2 2/8] boot/arm-trusted-firmware: in-tree
 and OP-TEE BL32
In-Reply-To: <1552951269-16967-2-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
 <1552951269-16967-2-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190320225459.6e46ce9c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Tue, 19 Mar 2019 00:21:03 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> This change allows one to build trusted firmware (TF-A) with OP-TEE
> as BL32 secure payload.
> 
> When BR2_TARGET_ARM_TRUSTED_FIRMWARE_INTREE_BL32 is enabled TF-A
> builds a BL32 stage according the TF-A configuration directive.
> If these specify no BL3 stage then TF-A will build without BL32
> support. This is the default configuration and reflects TF-A legacy
> integration in BR.
> 
> When BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32 is enabled
> TF-A builds with support for the OP-TEE OS as BL32.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

I have applied, after doing a few changes. See below.

> +choice
> +	prompt "Select BL32 stage"

Simplified to just "BL32"

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_INTREE_BL32

Changed to:

BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_DEFAULT

I found the "in-tree" confusing, because in most cases, it's actually
"no BL32". What this option does is essentially nothing, i.e keeps the default.

> +	bool "Intree or no BL32 stage"

Changed to "Default"

> +	help
> +	  This option shall be set if the BL32 image is built from
> +	  trusted firmware sources (i.e sp_min, tsp) or when no BL32
> +	  is expected.
> +
> +	  When the BL32 stage shall be built from ATF source tree,
> +	  the target BL32 payload shall be defined from configuration
> +	  BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES, either
> +	  using directive SPD=<bl32_id> (Aarch64 platforms,
> +	  i.e SPD=tspd) or AARCH32_SP=<bl32_id> (Aarch32 and Armv7
> +	  platforms, i.e "AARCH32_SP=sp_min"). If no SPD or AARCH32_SP
> +	  directive is specified, ATF will build without BL32 support.

I've reworded this to simplify a bit the explanation.

> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32

Renamed to BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE

> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32),y)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += optee-os
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee-header_v2.bin
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL32_EXTRA1=$(BINARIES_DIR)/tee-pager_v2.bin
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL32_EXTRA2=$(BINARIES_DIR)/tee-pageable_v2.bin

I grouped these definitions in a single assignment to
ARM_TRUSTED_FIRMWARE_MAKE_OPTS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

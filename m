From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:18:11 +0200
Subject: [Buildroot] [PATCH 1/4] firmware-imx: add support for iMX8M
 firmware
In-Reply-To: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180412221811.21ec0b45@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 14:35:22 +0200, Erik Larsson wrote:

> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
> +FIRMWARE_IMX_INSTALL_IMAGES = YES
> +define FIRMWARE_IMX_PREPARE_LPDDR4_FW
> +	(cd $(@D)/firmware/ddr/synopsys/ && \
> +		$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
> +			lpddr4_pmu_train_$(1)_imem.bin \
> +			lpddr4_pmu_train_$(1)_imem_pad.bin && \
> +		$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
> +			lpddr4_pmu_train_$(1)_dmem.bin \
> +			lpddr4_pmu_train_$(1)_dmem_pad.bin && \
> +		cat lpddr4_pmu_train_$(1)_imem_pad.bin lpddr4_pmu_train_$(1)_dmem_pad.bin > \
> +			lpddr4_pmu_train_$(1)_fw.bin \
> +	)

It was still a bit annoying that we had to have all those commands
inside a single command, so I've instead introduced a
FIRMWARE_IMX_DDRFW_DIR variable, set to $(@D)/firmware/ddr/synopsys/
and used that everywhere. To me it makes the whole thing more readable.

Applied to master with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

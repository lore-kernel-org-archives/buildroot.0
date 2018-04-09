From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 22:38:46 +0200
Subject: [Buildroot] [PATCH v6 3/4] firmware-imx: add support for iMX8M
 firmware
In-Reply-To: <1520682702-10035-4-git-send-email-karl.erik.larsson@gmail.com>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520682702-10035-4-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180409223846.2d245c56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Mar 2018 12:51:41 +0100, Erik Larsson wrote:

> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
> +FIRMWARE_IMX_INSTALL_IMAGES = YES
> +define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
> +	# Create padded versions of lpddr4_pmu_*, needed for generating imx-boot-imx8mqevk-sd.bin
> +	# which is done in post-image script.
> +	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 $(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_1d_imem.bin ${BINARIES_DIR}/lpddr4_pmu_train_1d_imem_pad.bin
> +	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 $(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_1d_dmem.bin ${BINARIES_DIR}/lpddr4_pmu_train_1d_dmem_pad.bin
> +	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 $(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_2d_imem.bin ${BINARIES_DIR}/lpddr4_pmu_train_2d_imem_pad.bin

I'm a bit unhappy with the division of work between this .mk file and
the post-image script. Why are you doing the padding here, and then the
concatenation in the post-image script?

I think it should be done in just one place. Perhaps this package is
the most logical location. Also, use $(...) instead of ${...} in shell
to refer to variables.

So, perhaps:

define FIRMWARE_IMX_PREPARE_LPDDR4_FW
	(cd $(@D)/firmware/ddr/synopsys/ && \
		$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
			lpddr4_pmu_train_$(1)_imem.bin \
			lpddr4_pmu_train_$(1)_imem_pad.bin
		$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
			lpddr4_pmu_train_$(1)_dmem.bin \
			lpddr4_pmu_train_$(1)_dmem_pad.bin
		cat lpddr4_pmu_train_$(1)_imem_pad.bin lpddr4_pmu_train_$(1)_dmem_pad.bin > \
			lpddr4_pmu_train_$(1)_fw.bin
	)
endef

define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,1d)
	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,2d)
	cat $(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_1d_fw.bin \
		$(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_2d_fw.bin > \
		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
	...
endef

And then the post-image script can use
$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

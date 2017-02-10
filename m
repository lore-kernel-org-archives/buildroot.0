From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Feb 2017 10:30:34 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: Add support for Altera mkpimage
 generation
In-Reply-To: <20170210091030.dalq2ch2xazgb2w7@ed>
References: <20170128112720.umcchfeyyc7i6rdo@localhost.localdomain>
 <20170130103326.14427-1-lionel@svkt.org>
 <20170130103326.14427-2-lionel@svkt.org>
 <20170209233323.7f57c186@free-electrons.com>
 <20170210091030.dalq2ch2xazgb2w7@ed>
Message-ID: <20170210103034.2036a164@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 10:10:31 +0100, Lionel Flandrin wrote:

> > I missed it on my first review, but it seems like you missed it as
> > well: we already have some logic in uboot.mk to call mkpimage. See the
> > BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC option.
> > 
> > This should be extended rather than having two options doing the same
> > thing.  
> 
> I didn't miss it but the existing code is used for u-boot SPL
> generation, I didn't think there was an easy way to reuse it for
> "full" u-boot packaging (but admitedly my Make-foo is a bit
> weak). It's a different set of options.
> 
> The previous altera chips only had a 64K internal RAM which meant that
> you almost always had to use a SPL to bootstrap the bootloader. The
> newer chips however contain 256K of internal RAM so you can fit a full
> u-boot in a single stage quite snugly.

OK. Then I think we want something better indeed, because it's
completely impossible to understand if we have two separate options.

Here is what I would propose:

 1. Add an option BR2_TARGET_UBOOT_FORMAT_DTB_BIN so select
    u-boot-dtb.bin as the output format.

 2. Adjust the BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC option logic
    so that it will mkpimage the SPL if there is a SPL, or mkpimage the
    full U-Boot if u-boot-dtb.bin is selected. Something like:

config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
        bool "CRC U-Boot image for Altera SoC FPGA"
        depends on BR2_arm
        depends on BR2_TARGET_UBOOT_SPL || BR2_TARGET_UBOOT_FORMAT_DTB_BIN
        help

	  Pass the U-Boot image through the mkpimage tool to enable
	  booting on the Altera SoC FPGA based platforms.

	  On some platforms, it's the SPL that needs to be passed
	  through mkpimage. On some other platforms there is no SPL
	  because the internal SRAM is big enough to store the full
	  U-Boot. In this case, it's directly the full U-Boot image
	  that is passed through mkpimage.

	  Therefore, this option will convert the SPL image defined by
	  BR2_TARGET_UBOOT_SPL_NAME using mkpimage if
	  BR2_TARGET_UBOOT_SPL is enabled. Otherwise, it will convert
	  the full U-Boot image u-boot-dtb.bin if
	  BR2_TARGET_UBOOT_FORMAT_DTB_BIN is enabled.

And then in the .mk file, something like:

ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
ifeq ($(BR2_TARGET_UBOOT_SPL),y)
UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
else
UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = u-boot-dtb.bin
endif
define UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
        $(foreach f,$(UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES), \
                $(HOST_DIR)/usr/bin/mkpimage \
                        -o $(BINARIES_DIR)/$(notdir $(call qstrip,$(f))).crc \
                        $(@D)/$(call qstrip,$(f))
        )
endef
UBOOT_DEPENDENCIES += host-mkpimage
UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
endif

Could you try this, and verify it works for both the SPL and full
U-Boot image cases?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

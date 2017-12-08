From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 13:37:33 +0100
Subject: [Buildroot] [PATCH 4/8] uboot: add support for bundling ATF
 BL31 into U-Boot
In-Reply-To: <20171203214811.3124-5-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:07 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-5-thomas.petazzoni@free-electrons.com>
Message-ID: <87vahhz982.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Jagan Teki <jagannadh.teki@gmail.com>
 > Some ARM64 platforms (such as Allwinner A64/H5) have a boot process
 > where U-Boot encapsulates the BL31 part of the ARM trusted
 > firmware. For such platforms, we need to build ATF before U-Boot, and
 > pass a BL31 variable pointing to ATF bl31.bin to the U-Boot build
 > process.

 > This commit introduces a BR2_TARGET_UBOOT_NEEDS_ATF_BL31 variable to
 > achieve this.

 > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
 > [Thomas:
 >  - Rename option to BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 >  - Drop changes to arm-trusted-firmware.mk, they are taken care of by
 >    previous commits.
 >  - Improve Config.in help text
 >  - Add missing dependency on arm-trusted-firmware when
 >    BR2_TARGET_UBOOT_NEEDS_ATF_BL31 is enabled.
 >  - Use bl31.bin from $(BINARIES_DIR) instead of taking it from ATF's
 >    build dir.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  boot/uboot/Config.in | 10 ++++++++++
 >  boot/uboot/uboot.mk  |  5 +++++
 >  2 files changed, 15 insertions(+)

 > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
 > index 0e109d0977..8fa189f410 100644
 > --- a/boot/uboot/Config.in
 > +++ b/boot/uboot/Config.in
 > @@ -158,6 +158,16 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 >  	  typically the case when the board configuration has
 >  	  CONFIG_FIT_SIGNATURE enabled.
 
 > +config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 > +	bool "U-Boot needs ATF BL31"
 > +	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31

The fact that you need to enable this atf suboption before this option
is even visible isn't very nice. We also need to ensure this option
cannot be selected together with
BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33 as that would cause
circular dependencies, so I've changed it to:

	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
	depend on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31

And committed, thanks.

-- 
Bye, Peter Korsgaard

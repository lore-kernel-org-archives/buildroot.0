From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 10:14:53 +0100
Subject: [Buildroot] [PATCH 1/8] arm-trusted-firmware: add option to
 enable/disable building FIP image
In-Reply-To: <20171203214811.3124-2-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:04 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-2-thomas.petazzoni@free-electrons.com>
Message-ID: <87h8t11sz6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Currently, our arm-trusted-firmware unconditionally builds a FIP
 > (Firmware Image Package). While this is often needed on platforms
 > where ATF encapsulates U-Boot, it is not the case on some other
 > platforms where it's U-Boot that encapsulates parts of ATF.

 > In order to prepare the support for the later platforms, we make
 > building the FIP image optional, and update the only defconfig we have
 > that uses ARM Trusted Firmware.

 > Note: we considered adding a "default y" here to preserve backward
 > compatibility, but there really isn't any default that is sane:
 > whether a FIP image needs to be built or not is purely platform
 > specific.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  boot/arm-trusted-firmware/Config.in               | 8 ++++++++
 >  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++++-
 >  configs/arm_juno_defconfig                        | 1 +
 >  3 files changed, 16 insertions(+), 1 deletion(-)

 > diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
 > index 799370cd51..05600461a5 100644
 > --- a/boot/arm-trusted-firmware/Config.in
 > +++ b/boot/arm-trusted-firmware/Config.in
 > @@ -56,6 +56,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 >  	help
 >  	  Target plaform to build for.
 
 > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 > +	bool "Build FIP image"
 > +	help
 > +	  This option enables building the FIP image (Firmware Image
 > +	  Package). This is typically the image format used by
 > +	  platforms were ATF encapsulates the second stage bootloader
 > +	  (such as U-Boot).
 > +
 >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 >  	string "Additional ATF build variables"
 >  	help
 > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > index 7b1cc6ebb6..bdffb1dbe4 100644
 > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > @@ -39,10 +39,16 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 >  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
 >  endif
 
 > +ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 > +

Minor nit: I believe the 'all' target builds unneeded stuff for the
platforms using only bl31.bin.

-- 
Bye, Peter Korsgaard

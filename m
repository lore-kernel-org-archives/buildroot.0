From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:16:17 +0200
Subject: [Buildroot] [PATCH v5 2/3] boot/arm-trusted-firmware: add
 optional host-arm-gnu-a-toolchain dependency
In-Reply-To: <1585371871-29406-3-git-send-email-sunil@amarulasolutions.com>
References: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
 <1585371871-29406-3-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200329151617.1ed31526@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 10:34:30 +0530
sunil at amarulasolutions.com wrote:

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
> +	bool "Needs arm32 bare metal toolchain"

Reworded to:

	bool "Needs arm-none-eabi toolchain"

> +	select BR2_PACKAGE_HOST_ARM_GNU_A_TOOLCHAIN

I've dropped this line since this option has been removed. However,
I've added:

        depends on BR2_HOSTARCH = "x86_64"

because the pre-built toolchain is only available for x86_64 host
machines.

> +        help
> +          Select this option if your ATF board configuration
> +          requires ARM32-A bare metal toolchain to be available.

Indentation was not correct here: again, "make check-package" would
have told you.

But there was one more important thing that was forgotten: adding
host-arm-gnu-a-toolchain to ATF_DEPENDENCIES, to ensure the toolchain
is installed before ATF is built. So I've added:

ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN),y)
ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
endif

in arm-trusted-firmware.mk

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

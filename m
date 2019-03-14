From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 23:24:21 +0100
Subject: [Buildroot] [PATCH 1/6] boot/arm-trusted-firmware: support
 32bit Arm targets
In-Reply-To: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
References: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
Message-ID: <20190314232421.46ad28f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Mar 2019 11:11:35 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> This change allows one to build the TF-A (Trusted Firmware A) for
> 32bit Armv7 and Armv8 platforms which arm-trusted-firmware supports
> since release v1.5.
> 
> BR2_aarch64 is changed to BR2_ARM_CPU_ARMV8A as the later complemented
> by BR2_ARM_CPU_ARMV7A better represents to architectures that can
> support Arm Trusted Firmware A.
> 
> When BR2_arm is enabled, TF-A is built in Aarch32 mode.
> Selection between Armv8-A (default) and Armv7-A (ARM_ARCH_MAJOR=7) is
> expected from BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.

It seems a bit annoying to require passing ARM_ARCH_MAJOR=7 in those
additional variable. Why don't we do it automatically in
arm-trusted-firmware.mk. We have all the knowledge required, no?

> +ifeq ($(BR2_arm),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32

Can we do:

ifeq ($(BR2_arm),y)
ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32 ARM_ARCH_MAJOR=7
else
ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch64 ARM_ARCH_MAJOR=8
endif

for example ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

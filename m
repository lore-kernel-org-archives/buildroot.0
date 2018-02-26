From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 23:52:26 +0100
Subject: [Buildroot] [PATCH 1/1] rustc: disable for ARMV7A with EABI
In-Reply-To: <20180226200421.18131-1-eric.le.bihan.dev@free.fr>
References: <20180226200421.18131-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180226235226.62ad68b3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 21:04:21 +0100, Eric Le Bihan wrote:
> The Rust project does not support armv7a EABI, only EABIHF [1]. So
> disable rustc for this ARM variant.

Are you sure ?

> [1] https://forge.rust-lang.org/platform-support.html

On this page, I see:

arm-unknown-linux-gnueabi 	? 	? 	? 	ARMv6 Linux
arm-unknown-linux-gnueabihf 	? 	? 	? 	ARMv6 Linux, hardfloat
armv7-unknown-linux-gnueabihf 	? 	? 	? 	ARMv7 Linux

The arm-unknown-linux-gnueabi variant should apply to ARMv7 as well.

It looks like a better fix would be:

config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
        bool
        # The pre-built Rust standard library is only available for the
        # following architectures/ABIs, and is built against glibc.
        default y if BR2_i386
        default y if BR2_x86_64
        default y if BR2_aarch64
-       default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	default y if BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A
        default y if BR2_powerpc || BR2_powerpc64
        default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
        default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
                && BR2_MIPS_NABI64
        depends on BR2_TOOLCHAIN_USES_GLIBC
        depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

config BR2_PACKAGE_HOST_RUSTC_ARCH
        string
-	default "armv7"  if BR2_ARM_CPU_ARMV7A
+       default "armv7"  if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF)
        default BR2_ARCH if !BR2_ARM_CPU_ARMV7A

config BR2_PACKAGE_HOST_RUSTC_ABI
        string
        default "eabi"   if BR2_ARM_EABI
        default "eabihf" if BR2_ARM_EABIHF
        default "abi64"  if BR2_MIPS_NABI64

Indeed arm-unknown-linux-gnueabi can support ARMv6 and later (including
ARMv7) with EABI, arm-unknown-linux-gnueabihf can support ARMv6 EABIhf,
and armv7-unknown-linux-gnueabihf can support ARMv7 EABIhf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

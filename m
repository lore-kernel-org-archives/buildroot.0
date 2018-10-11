From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 10:06:10 +0200
Subject: [Buildroot] [PATCH v5 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <20181010053511.4093-1-jagan@amarulasolutions.com>
References: <20181010053511.4093-1-jagan@amarulasolutions.com>
Message-ID: <20181011100610.6b4c78fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 11:05:10 +0530, Jagan Teki wrote:
> Add initial support for Amarula A64-Relic board
> with below features:
> - U-Boot 2018.07-rc1
> - Linux 4.17.0-rc6
> - Default packages from buildroot
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Thanks, this looks good, except two aspects. One could have been fixed
using a follow-up patch, but not the other one.

> diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
> new file mode 100644
> index 0000000000..846275eadb
> --- /dev/null
> +++ b/configs/amarula_a64_relic_defconfig
> @@ -0,0 +1,47 @@
> +BR2_aarch64=y
> +BR2_cortex_a53=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Linux headers same as kernel, a 4.17 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
> +
> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07-rc1"

I guess the final 2018.07 is released now, so you could useit.

> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,amarula,linux-amarula,a64-relic)/linux-amarula_a64-relic.tar.gz"

"a64-relic" is a branch name, which makes the build non reproducible.
We want either a tag, or a full SHA1, to ensure that we always build
the same kernel version.

Could you fix that up and resend the patch?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

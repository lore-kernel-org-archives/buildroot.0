From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 12:14:11 +0200
Subject: [Buildroot] [PATCH 1/2] New Buildroot v2016.08 configuration
 for Acmesystems Aria G25
In-Reply-To: <1474447826-4960-1-git-send-email-biagio.hkr@gmail.com>
References: <1474447826-4960-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160921121411.7be88518@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please use:

	configs/acmesystems_aria_g25: update with newer components

as the commit title.

See more comments below.

On Wed, 21 Sep 2016 10:50:25 +0200, Biagio Montaruli wrote:

> +genimage 						   \

The \ is too far away here.

> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?

Please remove this last line, it's useless.

> +Buildroot configuration for Aria G25.
> +This default configuration allows you to build a minimal root filesystem
> +which includes the support for the serial console.
> +The default configuration for Aria G25 includes the getty program that
> +enables you to log in through the serial console ttyS0.
> +After the boot, to log in at the getty prompt use the following credentials:
> +Username: root
> +Password: acmesystems

Please don't set a password. Also the information you provide here are
a bit useless. Instead, give board specific information if needed (like
how to connect to the serial port in terms of connectors). Otherwise, I
think you can just remove this paragraph.


> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
> index c4d2cd6..72444ea 100644
> --- a/configs/acmesystems_aria_g25_128mb_defconfig
> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
> @@ -1,20 +1,35 @@
>  # Architecture
>  BR2_arm=y
>  
> -# Linux headers same as kernel, a 4.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +# Kernel header
> +BR2_KERNEL_HEADERS_4_7=y

Please keep using the headers from the kernel source, i.e:

# Linux headers same as kernel, a 4.7 series
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y


> +# System configuration
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
> +BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"

Please get rid of the custom password.

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
> +
> +# Kernel configuration
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"

Please keep an explicit custom version for the kernel.

(same comments for the other defconfig, and the other patch)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

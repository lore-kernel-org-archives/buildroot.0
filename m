From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 30 Jun 2015 12:21:58 +0200
Subject: [Buildroot] [PATCH v2] configs/acmesystems_aria_g25: new configs
In-Reply-To: <1435613937-20746-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435613937-20746-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CA+TH9Vkn625DJy8xzD-WCSZMpbPF_jE2C_eZ_jnVSfNFRv7NcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

2015-06-29 23:38 GMT+02:00 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> Add new basic configurations for ACME Systems ARIA G25 SOM.
> There are two different variants, a 128MB and a 256MB RAM model.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../aria-g25/at91bootstrap_aria_g25_128mb.config   |  9 ++++
>  .../aria-g25/at91bootstrap_aria_g25_256mb.config   |  9 ++++
>  board/acmesystems/aria-g25/readme.txt              | 48 ++++++++++++++++++++++
>  configs/acmesystems_aria_g25_128mb_defconfig       | 24 +++++++++++
>  configs/acmesystems_aria_g25_256mb_defconfig       | 24 +++++++++++
>  5 files changed, 114 insertions(+)
>  create mode 100644 board/acmesystems/aria-g25/at91bootstrap_aria_g25_128mb.config
>  create mode 100644 board/acmesystems/aria-g25/at91bootstrap_aria_g25_256mb.config
>  create mode 100644 board/acmesystems/aria-g25/readme.txt
>  create mode 100644 configs/acmesystems_aria_g25_128mb_defconfig
>  create mode 100644 configs/acmesystems_aria_g25_256mb_defconfig

Can we agree on the configs name format? Sergio usually uses the
format "acme-BOARD-MEMORY", I used acme-arietta-128m_defconfig for
example. I really prefer to have a standard name format!

> diff --git a/board/acmesystems/aria-g25/at91bootstrap_aria_g25_128mb.config b/board/acmesystems/aria-g25/at91bootstrap_aria_g25_128mb.config
> new file mode 100644
> index 0000000..9be0545
> --- /dev/null
> +++ b/board/acmesystems/aria-g25/at91bootstrap_aria_g25_128mb.config
> @@ -0,0 +1,9 @@
> +CONFIG_AT91SAM9X5_ARIA=y
> +CONFIG_BUS_SPEED_100MHZ=y
> +CONFIG_RAM_128MB=y
> +CONFIG_SDCARD=y
> +CONFIG_LOAD_LINUX=y
> +CONFIG_LINUX_ZIMAGE=y
> +CONFIG_LINUX_KERNEL_ARG_STRING="mem=128M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
> +CONFIG_DEBUG=y
> +CONFIG_THUMB=y
> diff --git a/board/acmesystems/aria-g25/at91bootstrap_aria_g25_256mb.config b/board/acmesystems/aria-g25/at91bootstrap_aria_g25_256mb.config
> new file mode 100644
> index 0000000..546c62c
> --- /dev/null
> +++ b/board/acmesystems/aria-g25/at91bootstrap_aria_g25_256mb.config
> @@ -0,0 +1,9 @@
> +CONFIG_AT91SAM9X5_ARIA=y
> +CONFIG_BUS_SPEED_100MHZ=y
> +CONFIG_RAM_256MB=y
> +CONFIG_SDCARD=y
> +CONFIG_LOAD_LINUX=y
> +CONFIG_LINUX_ZIMAGE=y
> +CONFIG_LINUX_KERNEL_ARG_STRING="mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
> +CONFIG_DEBUG=y
> +CONFIG_THUMB=y
> diff --git a/board/acmesystems/aria-g25/readme.txt b/board/acmesystems/aria-g25/readme.txt
> new file mode 100644
> index 0000000..374cf1c
> --- /dev/null
> +++ b/board/acmesystems/aria-g25/readme.txt
> @@ -0,0 +1,48 @@
> +Build instructions
> +==================
> +
> +As a regular user configure and then build:
> +
> +$ make acmesystems_aria_g25_defconfig
> +$ make
> +
> +Writing to the MicroSD card
> +===========================
> +
> +Assuming your Aria G25 baseboard has a MicroSD socket, for example with
> +the Terra baseboard, you'll need a blank MicroSD (obviously) initialized
> +in a particular way to be able to boot from it.
> +
> +Assuming the card is seen as /dev/sdb in your PC/laptop/other device
> +you'll need to run the following commands as root or via sudo.
> +
> +Make sure all of the card partitions are unmounted before starting.
> +
> +First we'll need to create two partitions:
> +
> +# sfdisk -uM /dev/sdb <<EOF
> +,32,6
> +;
> +EOF

This is better:

echo ',32,6\n;' | sfdisk -uM /dev/sdX

> +
> +Then we'll need to create the empty filesystems:
> +
> +# mkdosfs -n SD_BOOT /dev/sdb1
> +# mkfs.ext4 -L SD_ROOT /dev/sdb2
> +
> +We'll populate the first partition (boot) with the relevant files:
> +
> +# mount /dev/sdb1 /mnt
> +# cp output/images/at91bootstrap.bin /mnt/BOOT.BIN
> +# cp output/images/zImage /mnt
> +# cp output/images/at91-ariag25.dtb /mnt
> +# umount /mnt
> +
> +And the root filesystem afterwards:
> +
> +# mount /dev/sdb2 /mnt
> +# tar -C /mnt output/images/rootfs.tar
> +# umount /mnt
> +
> +You're done, insert the MicroSD card in the slot and enjoy.
> +
> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
> new file mode 100644
> index 0000000..76ccbe1
> --- /dev/null
> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
> @@ -0,0 +1,24 @@
> +# Architecture
> +BR2_arm=y
> +
> +# Toolchain
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="4.1"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
> +BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
> +
> +# Bootloader
> +BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="git://github.com/tanzilli/at91bootstrap.git"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="3f957cec253abc80fd10c733e5e596f46e1aef56"
> +BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE="board/acmesystems/aria-g25/at91bootstrap_aria_g25_128mb.config"

Config files for at91bootstrap are not really needed cause Sergio
shipped them in it's own at91bootstrap fork, so you should simply use
something like this in your bootstrap defconfig:

BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"

> diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
> new file mode 100644
> index 0000000..320abc3
> --- /dev/null
> +++ b/configs/acmesystems_aria_g25_256mb_defconfig
> @@ -0,0 +1,24 @@
> +# Architecture
> +BR2_arm=y
> +
> +# Toolchain
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="4.1"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
> +BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
> +
> +# Bootloader
> +BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="git://github.com/tanzilli/at91bootstrap.git"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="3f957cec253abc80fd10c733e5e596f46e1aef56"
> +BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE="board/acmesystems/aria-g25/at91bootstrap_aria_g25_256mb.config"

No need for custom config, should be:

BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"

Sincerely, Angelo

> --
> 2.3.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

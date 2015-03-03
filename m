From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Mar 2015 14:36:51 +0100
Subject: [Buildroot] [PATCH 1/1] Add ARM chromebook support to buildroot
In-Reply-To: <1425386608-2775-1-git-send-email-fabienlahoudere.pro@gmail.com>
References: <1425386608-2775-1-git-send-email-fabienlahoudere.pro@gmail.com>
Message-ID: <20150303143651.7c7a0859@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Dear Lahoudere Fabien,

On Tue,  3 Mar 2015 13:43:28 +0100, Lahoudere Fabien wrote:
> From: Lahoudere Fabien <fabien.lahoudere@openwide.fr>
> 
> I build a custom image for my cortex-a15 based laptop using buildroot.
> I don't know if it is usefull but if it can helps (for arndale for example) it's free.

Don't include "personal" messages in the commit log. The commit log
stays around forever. If you want to put personal messages, put them....

> 
> Signed-off-by: Lahoudere Fabien <fabienlahoudere.pro@gmail.com>
> ---

... here, i.e below the "---" sign.

See some more comments below.

>  board/samsung/chromebook-xe303c/bootscript.txt     |    8 +
>  board/samsung/chromebook-xe303c/create-boot-sd.sh  |   92 +
>  board/samsung/chromebook-xe303c/env.txt            |   50 +
>  .../chromebook-xe303c/linux-3.8.11-defconfig       | 3551 ++++++++++++++++++++
>  ...not-create-AP-and-P2P-interfaces-upon-dri.patch |   74 +
>  board/samsung/chromebook-xe303c/readme.txt         |   75 +
>  configs/chromebook_defconfig                       |   34 +
>  7 files changed, 3884 insertions(+)
>  create mode 100644 board/samsung/chromebook-xe303c/bootscript.txt
>  create mode 100644 board/samsung/chromebook-xe303c/create-boot-sd.sh
>  create mode 100644 board/samsung/chromebook-xe303c/env.txt
>  create mode 100644 board/samsung/chromebook-xe303c/linux-3.8.11-defconfig
>  create mode 100644 board/samsung/chromebook-xe303c/patches/0001-mwifiex-do-not-create-AP-and-P2P-interfaces-upon-dri.patch
>  create mode 100644 board/samsung/chromebook-xe303c/readme.txt
>  create mode 100644 configs/chromebook_defconfig
> 
> diff --git a/board/samsung/chromebook-xe303c/bootscript.txt b/board/samsung/chromebook-xe303c/bootscript.txt
> new file mode 100644
> index 0000000..4167884
> --- /dev/null
> +++ b/board/samsung/chromebook-xe303c/bootscript.txt
> @@ -0,0 +1,8 @@
> +#setenv bootpart 2
> +#setenv rootpart 3
> +#setenv regen_ext2_bootargs 'setenv bootdev_bootargs root=/dev/${devname}${rootpart} rootwait rw; run regen_all'
> +#setenv ext2_boot 'run regen_ext2_bootargs; ext2load ${devtype} ${devnum}:${bootpart} ${loadaddr} ${cros_bootfile}; echo ${bootargs}'
> +#setenv ext2_boot 'run regen_ext2_bootargs; ext2load ${devtype} ${devnum}:${bootpart} ${loadaddr} ${cros_bootfile}; bootm ${loadaddr}'
> +#setenv cros_bootfile /vmlinux.uimg
> +#setenv extra_bootargs console=tty1
> +setenv mmc0_boot 'echo ERROR: Could not boot from USB or SD'

So everything is commented out except a line echoing some text? This
doesn't seem to be very useful.

> diff --git a/board/samsung/chromebook-xe303c/create-boot-sd.sh b/board/samsung/chromebook-xe303c/create-boot-sd.sh
> new file mode 100644
> index 0000000..1606577
> --- /dev/null
> +++ b/board/samsung/chromebook-xe303c/create-boot-sd.sh
> @@ -0,0 +1,92 @@
> +!/bin/sh
> +
> +set -u
> +set -e
> +
> +PROGNAME=$(basename $0)
> +
> +usage()
> +{
> +    echo "Create an SD card that boots on chromebook board."
> +    echo
> +    echo "Note: all data on the the card will be completely deleted!"
> +    echo "Use with care!"
> +    echo "Superuser permissions may be required to write to the device."
> +    echo
> +    echo "Usage: ${PROGNAME} <sd_block_device>"
> +    echo "Arguments:"
> +    echo "  <sd_block_device>     The device to be written to"
> +    echo
> +    echo "Example: ${PROGNAME} /dev/mmcblk0"
> +    echo
> +}
> +
> +if [ $# -eq 0 ]
> +then
> +read -p "Please enter device name : /dev/" DEVICE

Do we do this for other scripts? Reading things on the standard input
is quite weird. I think the script argument should be mandatory, and
that's it.

> +echo
> +else
> +DEVICE=$1
> +fi
> +
> +echo "You are going to install the system on device /dev/${DEVICE}\n"
> +
> +echo -n "Check if /dev/${DEVICE} is really a block device ... "
> +if [ ! -b /dev/${DEVICE} ] 
> +then echo "KO\n"
> +exit 1
> +else
> +echo "OK\n"
> +fi
> +
> +# Unmount device if mounted
> +umount /dev/${DEVICE}*
> +
> +# create cgpt partition table
> +parted /dev/${DEVICE} mklabel gpt
> +
> +cgpt create -z /dev/${DEVICE}
> +cgpt create /dev/${DEVICE}
> +cgpt add -i 1 -t kernel -b 8192 -s 32768 -l U-Boot -S 1 -T 5 -P 10 /dev/${DEVICE}
> +cgpt add -i 2 -t data -b 40960 -s 32768 -l Kernel /dev/${DEVICE}
> +cgpt add -i 12 -t data -b 73728 -s 32768 -l Script /dev/${DEVICE}
> +RSZ=`cgpt show /dev/sde | grep "GPT table" | awk '{printf $1}'`
> +cgpt add -i 3 -t data -b 106496 -s `expr ${RSZ} - 106496` -l Root /dev/${DEVICE}

Where is this cgpt tool coming from? Is it built by Buildroot ?

> +# Create boot script
> +mount /dev/${DEVICE}12 ${TMPDIR}
> +cp board/samsung/chromebook-xe303c/bootscript.txt board/samsung/chromebook-xe303c/env.txt ${TMPDIR}
> +mkimage -A arm -C none -T script -d 

There seems to be an issue here.

> +umount ${TMPDIR}
> +
> +# Download booltoader nv-uboot for chromebook
> +wget -O - http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/nv_uboot-snow.kpart.bz2 | bunzip2 > ${TMPDIR}/nv_uboot-snow.kpart

No, such scripts should not download stuff. Instead, please create a
package that downloads this binary, and installs it uncompressed in
$(BINARIES_DIR).


> diff --git a/board/samsung/chromebook-xe303c/linux-3.8.11-defconfig b/board/samsung/chromebook-xe303c/linux-3.8.11-defconfig
> new file mode 100644
> index 0000000..cf6c164
> --- /dev/null
> +++ b/board/samsung/chromebook-xe303c/linux-3.8.11-defconfig

Please use 'make linux-savedefconfig' to reduce the size of this
defconfig.

> diff --git a/board/samsung/chromebook-xe303c/readme.txt b/board/samsung/chromebook-xe303c/readme.txt
> new file mode 100644
> index 0000000..2cb0845
> --- /dev/null
> +++ b/board/samsung/chromebook-xe303c/readme.txt
> @@ -0,0 +1,75 @@
> +*******************************************************
> +Samsung Chromebook based on Exynos 5520 (Cortex a15)
> +*******************************************************
> +
> +Build
> +=====
> +
> +First, configure Buildroot for your chromebook.
> +
> +  make chromebook_defconfig

I think there are many chromebooks around. Maybe the defconfig name
should use a more specific name.

> +
> +Build all components:
> +
> +  make
> +
> +You will find in ./output/images/ the following files:
> +  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb
> +  - rootfs.ext2
> +  - rootfs.tar
> +  - u-boot.imx
> +  - uImage
> +
> +Create a bootable SD card
> +=========================
> +
> +To determine the device associated to the SD card have a look in the
> +/proc/partitions file:
> +
> +  cat /proc/partitions
> +
> +Run the following script as root on your SD card. This will partition the card
> +and copy the bootloader, kernel, DTBs and root filesystem as needed.
> +
> +*** WARNING! The script will destroy all the card content. Use with care! ***
> +  ./board/samsung/chromebook-xe303c/create-boot-sd.sh <your-sd-device>
> +
> +Boot the laptop on sdcard 
> +=========================
> +
> +* Switch to developer mode
> +
> +    Turn off the laptop.
> +    To invoke Recovery mode, you hold down the ESC and Refresh keys and poke the Power button.
> +    At the Recovery screen press Ctrl-D (there's no prompt - you have to know to do it).
> +    Confirm switching to developer mode by pressing enter, and the laptop will reboot and reset the system. This takes about 15-20 minutes. 
> +
> +Note: After enabling developer mode, you will need to press Ctrl-D each time you boot, or wait 30 seconds to continue booting.
> +
> +* Enable USB booting
> +
> +    After booting into developer mode, hold Ctrl and Alt and poke the T key. This will open up the crosh shell.
> +    Type shell to get into a bash shell.
> +    Type sudo su to become root.
> +    Then type this to enable USB booting:
> +    	 crossystem dev_boot_usb=1 dev_boot_signed_only=0
> +    Reboot the system to allow the change to take effect.
> +    Hold Ctrl and U to boot on usb or sd
> +
> +* Configure nv-uboot
> +    mmc dev 1
> +    mmc rescan
> +    ext2load mmc 1:c ${loadaddr} /env.txt
> +    env import -t ${loadaddr} ${filesize}
> +    saveenv
> +
> +Now the laptop will reboot on your sd card system every time you hold Ctrl and U

This is great, good to have basic instructions to get started.


> diff --git a/configs/chromebook_defconfig b/configs/chromebook_defconfig
> new file mode 100644
> index 0000000..4a5c21f
> --- /dev/null
> +++ b/configs/chromebook_defconfig
> @@ -0,0 +1,34 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a15=y
> +
> +# system
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +
> +# Kernel Header Options
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.8.11"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
> +BR2_DEFAULT_KERNEL_HEADERS="3.8.11"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://chromium.googlesource.com/chromiumos/third_party/kernel"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="chromeos-3.8"
> +BR2_LINUX_KERNEL_VERSION="chromeos-3.8"
> +BR2_LINUX_KERNEL_PATCH="board/samsung/chromebook-xe303c/patches/"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/samsung/chromebook-xe303c/linux-3.8.11-defconfig"
> +BR2_LINUX_KERNEL_UBOOT_IMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow-rev4"
> +
> +# Filesystem images
> +BR2_TARGET_ROOTFS_TAR=y
> +BR2_TARGET_ROOTFS_TAR_NONE=y
> +BR2_TARGET_ROOTFS_TAR_OPTIONS=""

Those last two options look weird. Are they really present when you run
"make savedefconfig" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

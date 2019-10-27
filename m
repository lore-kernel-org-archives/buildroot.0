From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 14:12:30 +0100
Subject: [Buildroot] [RFC] raspberrypi: post-image.sh arguments as
 config.txt properties
In-Reply-To: <20181204160254.15785-1-gael.portay@collabora.com>
References: <20181204160254.15785-1-gael.portay@collabora.com>
Message-ID: <ed0aec28-52a9-429c-cdbd-4218f284068e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gae?l,

 After almost a year, it's time to review this patch :-)

On 04/12/2018 17:02, Ga?l PORTAY wrote:
> This patch improves the post-images script using the arguments given to
> the script as config.txt properties.
> 
> As example, the arguments below:
> 
> 	--dtoverlay=pi3-miniuart-bt --dtparam=audio=on
> 
> appends to:
> 
> 	dtoverlay=pi3-miniuart-bt
> 	dtparam=audio=on
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@collabora.com>
> ---
> Hi all,
> 
> The goal of this patch is to simplify the customisation of the
> config.txt.

 Sounds like a good idea! I just have a few minor comments though.

 First, it would probably better to split it in a few patches:

- adding support to post-image.sh
- update the defconfigs
- remove the old way of doing it.

> It takes arguments given to the post-image.sh (thanks to the config
> option BR2_ROOTFS_POST_SCRIPT_ARGS) and it appends them to the
> config.txt file.
> 
> That way, it is easy to add device-tree overlays without making
> modification to the existing post-image.sh script.
> 
> As examples:
> 
> 	BR2_ROOTFS_POST_SCRIPT_ARGS="--dtoverlay=pi3-miniuart-bt --dtparam=audio=on"
> 
> Or [*]:
> 	BR2_ROOTFS_PSOT_SCRIPT_ARGS="--kernel=Image --enable_uart=1" # to replace --aarch64
> 
> Or [*]:
> 
> 	BR2_ROOTFS_POST_SCRIPT_ARGS="--kernel=u-boot.bin" # to boot u-boot instead of a linux kernel
> 
> I also suggest also to start from a empty file config.txt (to avoid to
> run sed scripts) and to rewrite it at every invocations.

 That's a good idea too.

> 
> What's your opinion?
> 
> [*]: Sould not work as is as it script should starts with an empty
> config.txt file.
> 
> Regards,
> Gael
> 
>  board/raspberrypi/genimage-raspberrypi.cfg    |  2 +-
>  board/raspberrypi/genimage-raspberrypi0.cfg   |  2 +-
>  board/raspberrypi/genimage-raspberrypi0w.cfg  |  2 +-
>  board/raspberrypi/genimage-raspberrypi2.cfg   |  2 +-
>  .../raspberrypi/genimage-raspberrypi3-64.cfg  |  2 +-
>  board/raspberrypi/genimage-raspberrypi3.cfg   |  2 +-
>  board/raspberrypi/post-image.sh               | 27 +++++++++++--------
>  configs/raspberrypi3_defconfig                |  2 +-
>  configs/raspberrypi3_qt5we_defconfig          |  2 +-
>  9 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
> index bd5166a0f3..b659f717bf 100644
> --- a/board/raspberrypi/genimage-raspberrypi.cfg
> +++ b/board/raspberrypi/genimage-raspberrypi.cfg
> @@ -6,7 +6,7 @@ image boot.vfat {
>        "bcm2708-rpi-cm.dtb",
>        "rpi-firmware/bootcode.bin",
>        "rpi-firmware/cmdline.txt",
> -      "rpi-firmware/config.txt",
> +      "config.txt",

 Why do you rename the config.txt file? AFAICS you can just keep it as is, no?

>        "rpi-firmware/fixup.dat",
>        "rpi-firmware/start.elf",
>        "zImage"
[snip
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index 70447cd48b..fee19d1949 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -7,13 +7,16 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
>  GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
>  GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>  
> +cp "${BINARIES_DIR}/rpi-firmware/config.txt" "${BINARIES_DIR}/config.txt"
> +
>  for arg in "$@"
>  do
>  	case "${arg}" in
> +		# Leave as is for backward compatibility (same as --dtoverlay=pi3-miniuart-bt)
>  		--add-pi3-miniuart-bt-overlay)
> -		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> +		if ! grep -qE '^dtoverlay=pi3-miniuart-bt' "${BINARIES_DIR}/config.txt"; then

 Here also, I don't see why you would change the regex. But anyway, this code
should be removed once all defconfigs have been converted.

>  			echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
> -			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +			cat << __EOF__ >> "${BINARIES_DIR}/config.txt"
>  
>  # fixes rpi3 ttyAMA0 serial console
>  dtoverlay=pi3-miniuart-bt
> @@ -22,9 +25,9 @@ __EOF__
>  		;;
>  		--aarch64)
>  		# Run a 64bits kernel (armv8)
> -		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> -		if ! grep -qE '^arm_64bit=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> -			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/config.txt"
> +		if ! grep -qE '^arm_64bit=1' "${BINARIES_DIR}/config.txt"; then
> +			cat << __EOF__ >> "${BINARIES_DIR}/config.txt"
>  
>  # enable 64bits support
>  arm_64bit=1
> @@ -32,18 +35,20 @@ __EOF__
>  		fi
>  
>  		# Enable uart console
> -		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> -			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/config.txt"; then
> +			cat << __EOF__ >> "${BINARIES_DIR}/config.txt"
>  
>  # enable rpi3 ttyS0 serial console
>  enable_uart=1
>  __EOF__

 This should be removed as well (and replaced with --enable_uart=1 in the
defconfigs).

 Regards,
 Arnout

>  		fi
>  		;;
> -		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
> -		# Set GPU memory
> -		gpu_mem="${arg:2}"
> -		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> +		--*=*)
> +		# Set option=value
> +		optval="${arg:2}"
> +		cat << __EOF__ >> "${BINARIES_DIR}/config.txt"
> +$optval
> +__EOF__
>  		;;
>  	esac
>  
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 75f2dec9da..8356d0d794 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -32,4 +32,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="--dtoverlay=pi3-miniuart-bt"
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index c8d0be8cba..74318a3dd8 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -46,4 +46,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="360M"
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay --gpu_mem_1024=200"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="--dtoverlay=pi3-miniuart-bt --gpu_mem_1024=200"
> 

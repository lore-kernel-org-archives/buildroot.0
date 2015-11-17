From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 23:28:30 +0100
Subject: [Buildroot] [PATCH v8] board: add support for Intel Galileo Gen
 2
In-Reply-To: <1447778330.2974.66.camel@intel.com>
References: <1447778330.2974.66.camel@intel.com>
Message-ID: <20151117232830.42e68602@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ray,

I've applied your patch to next, after making some small additional
changes. See below.

On Tue, 17 Nov 2015 16:38:50 +0000, Kinsella, Ray wrote:
> Delta's from v7:-
>  * Consolidated efi-part.cfg and genimage.cfg into genimage.cfg
>  * Replaced ext2 with ext4, in kernel and buildroot config.
>  * Removed redundant kernel configuration entries.
>  * Hardlinked in modules common to Galileo Gen 1 & Gen 2
>   * Exception was intel_qrk_gip it appears to need to load after everything else.
>  * Removed bashism, on /bin/sh now.
>  * Added comment to defconfig on why binutils 2.25 is required. 

This shouldn't be part of the commit log proper, since we don't want to
preserve that in the history. It should go below the "---" sign.

> 
> Board support package includes:-
>  * Toplevel build root configuration
>  * Github based 3.8.7 Kernel
>   * Upstream 3.8.7
>   * Linux 3.8.7 Kernel Driver Patches
>  * Linux 3.8.7 configuration
>  * Grub configuration
>  * Init Script to load modules
>  * genimage config to create sdcard image. 
> 
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---

Here.

> +# Create an image of the efi parition

Typo: partition.

> +image efi-part.vfat {
> +	vfat {
> +		file startup.nsh {
> +			image = "efi-part/startup.nsh"
> +		}
> +		file EFI {
> +			image = "efi-part/EFI"
> +		}
> +	}
> +	size=512K
> +}
> +
> +# Create the sdcard image, pulling in 
> +#  * the image created by buildroot
> +#  * the efi-partition created above. 

Trailing space here.

> diff --git a/board/intel/galileo/post-image.sh b/board/intel/galileo/post-image.sh
> new file mode 100755
> index 0000000..259c215
> --- /dev/null
> +++ b/board/intel/galileo/post-image.sh
> @@ -0,0 +1,18 @@
> +#!/bin/sh -e
> +
> +GENIMAGE_CFG="board/intel/galileo/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +mkimage () {
> +	rm -rf "${GENIMAGE_TMP}"
> +
> +	genimage \
> +		--rootpath "${TARGET_DIR}" \
> +		--tmppath "${GENIMAGE_TMP}" \
> +		--inputpath "$1" \
> +		--outputpath "${BINARIES_DIR}" \
> +		--config "$2"
> +}
> +
> +# Create the SD Card Image
> +mkimage "${BINARIES_DIR}" "${GENIMAGE_CFG}"

The mkimage function was no longer needed, since you're only calling
genimage once now. I've simplified this by directly calling genimage.
Please verify my commit to make sure that it works fine for you.


> +load_drivers()
> +{
> +	while IFS= read -r line; do
> +	  	modprobe $line

Mixed tabs and spaces on this line. I've replaced that with tabs only.

> +	done < "/etc/modules-load.galileo/$1.conf"
> +}
> +
> +do_board()
> +{
> +	board=$(cat /sys/devices/virtual/dmi/id/board_name)
> +	case "$board" in
> +		*"GalileoGen2" )
> +			load_drivers "galileo_gen2" ;;
> +		*"Galileo" )
> +			load_drivers "galileo" ;;
> +	esac
> +}
> +
> +case "$1" in
> +	start)
> +		do_board
> +		;;
> +	stop)
> +		;;
> +	restart|reload)
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart}"
> +		exit 1
> +esac
> +
> +exit $?

Not needed, exiting with the return value of the last command is
already the default.

> +BR2_PACKAGE_HOST_MTOOLS=y

Why do you need host-mtools? I've kept it for now, but I'm not sure. Is
it used internally by genimage?

Also, it is generally customary to add a readme.txt in the board
folder, i.e in board/intel/galileo/ in your case to explain how to
build/use this configuration. What is especially useful is some
indication on which UART is used on the board, how to connect to it,
etc.

Since I've applied your patch to the next branch, please base your
future submissions on this branch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

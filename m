From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 12:04:19 +0200
Subject: [Buildroot] [PATCH 1/3] raspberrypi: post-image.sh handles many
	arguments
In-Reply-To: <20170923233007.13772-2-gael.portay@savoirfairelinux.com>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
 <20170923233007.13772-2-gael.portay@savoirfairelinux.com>
Message-ID: <f843fcf3-4bc0-53ec-8b75-34694270bab1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 01:30, Ga?l PORTAY wrote:
> This post-image script now handles many optional arguments given
> through the command-line.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

 Can you evaluate how this patch interacts with [1] ? Note that I haven't looked
at either of them in detail.

[1] http://patchwork.ozlabs.org/patch/788904/


 Regards,
 Arnout

> ---
>  board/raspberrypi/post-image.sh | 42 ++++++++++++++++++++++-------------------
>  1 file changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index de972998b0..1b49f0ea30 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -5,38 +5,42 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
>  GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
>  GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>  
> -case "${2}" in
> -	--add-pi3-miniuart-bt-overlay)
> -	if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> -		echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
> -		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +shift
> +while [ $# -ne 0 ]; do
> +	case "${1}" in
> +		--add-pi3-miniuart-bt-overlay)
> +		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> +			echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
> +			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
>  
>  # fixes rpi3 ttyAMA0 serial console
>  dtoverlay=pi3-miniuart-bt
>  __EOF__
> -	fi
> -	;;
> -	--aarch64)
> -	# Run a 64bits kernel (armv8)
> -	sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> -	if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> -		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +		fi
> +		;;
> +		--aarch64)
> +		# Run a 64bits kernel (armv8)
> +		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> +		if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> +			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
>  
>  # enable 64bits support
>  arm_control=0x200
>  __EOF__
> -	fi
> +		fi
>  
> -	# Enable uart console
> -	if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> -		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +		# Enable uart console
> +		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> +			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
>  
>  # enable rpi3 ttyS0 serial console
>  enable_uart=1
>  __EOF__
> -	fi
> -	;;
> -esac
> +		fi
> +		;;
> +	esac
> +	shift
> +done
>  
>  rm -rf "${GENIMAGE_TMP}"
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

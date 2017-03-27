From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Mar 2017 22:44:19 +0200
Subject: [Buildroot] [PATCH 2/2] board/raspberrypi: use generic genimage
 script
In-Reply-To: <20170327164730.16271-3-etienne.phelip@savoirfairelinux.com>
References: <20170327164730.16271-1-etienne.phelip@savoirfairelinux.com>
 <20170327164730.16271-3-etienne.phelip@savoirfairelinux.com>
Message-ID: <61474146-55fb-2d69-18b5-c319b5151f98@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-17 18:47, Phelip Etienne wrote:
> This use the generic genimage wrapper for the raspberrypi instead of
> calling genimage ourselves.
> 
> Signed-off-by: Phelip Etienne <etienne.phelip@savoirfairelinux.com>
> ---
>  board/raspberrypi/post-image.sh | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index b2bb070..a58fa11 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -3,7 +3,6 @@
>  BOARD_DIR="$(dirname $0)"
>  BOARD_NAME="$(basename ${BOARD_DIR})"
>  GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
> -GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>  
>  case "${2}" in
>  	--add-pi3-miniuart-bt-overlay)

 Since this part is in fact only used by raspberrypi3_defconfig, you can
actually change all other raspberrypi?_defconfigs to call genimage.sh directly,
and use this script only for raspberry3. Then the argument is no longer needed
either.

 Regards,
 Arnout

> @@ -18,13 +17,6 @@ __EOF__
>  	;;
>  esac
>  
> -rm -rf "${GENIMAGE_TMP}"
> -
> -genimage                           \
> -	--rootpath "${TARGET_DIR}"     \
> -	--tmppath "${GENIMAGE_TMP}"    \
> -	--inputpath "${BINARIES_DIR}"  \
> -	--outputpath "${BINARIES_DIR}" \
> -	--config "${GENIMAGE_CFG}"
> +sh ./support/scripts/genimage.sh ${GENIMAGE_CFG}
>  
>  exit $?
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

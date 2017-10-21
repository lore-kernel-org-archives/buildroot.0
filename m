From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Oct 2017 21:30:10 +0200
Subject: [Buildroot] [PATCH] raspberrypi: post-image.sh fix gpu_mem
	option
In-Reply-To: <20171021135214.18552-1-gael.portay@savoirfairelinux.com>
References: <20171021135214.18552-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171021193010.GF7022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2017-10-21 09:52 -0400, Ga?l PORTAY spake thusly:
> The gpu_mem option is not using the proper option argument which causes sed to
> fail.
> 
> 	+ case "${arg}" in
> 	+ gpu_mem=ome/gportay/output-rpi3-qtwe/images
> 	+ sed -e '/^ome/gportay/output-rpi3-qtwe/images=/s,=.*,=ome/gportay/output-rpi3-qtwe/images,' -i /home/gportay/output-rpi3-qtwe/images/rpi-firmware/config.txt
> 	sed: -e expression #1, char 8: extra characters after command
> 	+ case "${arg}" in
> 	+ gpu_mem=ome/gportay/output-rpi3-qtwe/images
> 	+ sed -e '/^ome/gportay/output-rpi3-qtwe/images=/s,=.*,=ome/gportay/output-rpi3-qtwe/images,' -i /home/gportay/output-rpi3-qtwe/images/rpi-firmware/config.txt
> 	sed: -e expression #1, char 8: extra characters after command
> 
> The issue comes from the use of $1 instead of $arg to extract the gpu_mem
> value. $1 is the $(BINARIES_DIR) which leads to a sed expression error.
> 
> Also, it adds the error flag to the shell script to prevent from such situation
> and terminate the build in error.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/raspberrypi/post-image.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index a2d6a98e79..3c6c938407 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -1,5 +1,7 @@
>  #!/bin/bash
>  
> +set -e
> +
>  BOARD_DIR="$(dirname $0)"
>  BOARD_NAME="$(basename ${BOARD_DIR})"
>  GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
> @@ -40,7 +42,7 @@ __EOF__
>  		;;
>  		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
>  		# Set GPU memory
> -		gpu_mem="${1:2}"
> +		gpu_mem="${arg:2}"
>  		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
>  		;;
>  	esac
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

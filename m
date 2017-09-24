From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 12:15:09 +0200
Subject: [Buildroot] [PATCH 2/3] raspberrypi: post-image.sh add new
	gpu_mem option
In-Reply-To: <20170923233007.13772-3-gael.portay@savoirfairelinux.com>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
 <20170923233007.13772-3-gael.portay@savoirfairelinux.com>
Message-ID: <8c1d85a4-4390-047f-1d21-af37842a0040@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 01:30, Ga?l PORTAY wrote:
> The amount of GPU memory can be set using the new option --gpu_mem_XXX
> (where XXX is the total amount of memory available on the board).
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  board/raspberrypi/post-image.sh | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index 1b49f0ea30..9091476ced 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  
>  BOARD_DIR="$(dirname $0)"
>  BOARD_NAME="$(basename ${BOARD_DIR})"
> @@ -38,6 +38,11 @@ enable_uart=1
>  __EOF__
>  		fi
>  		;;
> +		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
> +		# Set GPU memory
> +		gpu_mem="${1:2}"
> +		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"

 In the end, the config.txt is just for one board, right? So can't we just have
a single --gpu_mem=XXX option and do

		sed -i -e "/^gpu_mem_[0-9]*=/s/=.*/${1##*=}/" \
			"${BINARIES_DIR}/rpi-firmware/config.txt"

 Note that you no longer need to strip off the -- and that you no longer need bash.

 As you can see in the example, I also prefer if the options (-i) come in the
beginning, and to use / as the delimiter unless there actually are /-es in any
of the strings. But that's just personal preference.


 Regards,
 Arnout

> +		;;
>  	esac
>  	shift
>  done
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

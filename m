From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 23:27:52 +0200
Subject: [Buildroot] [PATCH v9 1/2] genimage.sh: fix calling from
 BR2_ROOTFS_POST_IMAGE_SCRIPT
In-Reply-To: <20170421185839.17905-1-abhimanyu.v@gmail.com>
References: <20170421185839.17905-1-abhimanyu.v@gmail.com>
Message-ID: <4ab07bda-2b88-9d16-4143-3757e0eedb38@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-04-17 20:58, Abhimanyu Vishwakarma wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> 
> When called from BR2_ROOTFS_POST_IMAGE_SCRIPT, this script
> ends up with following error:
> 
> Error: Missing argument
> 
> This is because, extra positional argument is also passed
                   ^an

> along with BR2_ROOTFS_POST_SCRIPT_ARGS. genimage.sh didnt
                                                          ^'
> had support to parse positional and optional argument
    ^ve                                                ^s

> together.
> 
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> ---
>  Changes v7->v8
>    - New file
>  Changes v8->v9
>    - Fix indentation
>    - Use bash basename as script name instead hardcoding
> 
>  support/scripts/genimage.sh | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
> index 0ed0e8bcc..a2309e224 100755
> --- a/support/scripts/genimage.sh
> +++ b/support/scripts/genimage.sh
> @@ -1,17 +1,26 @@
>  #!/bin/bash
>  
>  die() {
> -  echo "Error: $@" >&2
> -  exit 1
> +	echo "Error: $@" >&2
> +	exit 1

 Avoid mixing whitespace fixes with other fixes in the same patch. I.e., split
this up in a  separate patch (fixing indentation all over).

>  }
>  
> +# Parse arguments and put into argument list of the script
> +opts="$(getopt -n "${0##*/}" -o c: -- "$@")" || exit $?
> +eval set -- "$opts"
> +
>  GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>  
> -while getopts c: OPT ; do
> -	case "${OPT}" in
> -	c) GENIMAGE_CFG="${OPTARG}";;
> -	:) die "option '${OPTARG}' expects a mandatory argument\n";;
> -	\?) die "unknown option '${OPTARG}'\n";;
> +while true ; do
> +	case "$1" in
> +		-c)

 We sometimes do and sometimes don't indent inside a case statement in shell
scripts. Annoying inconsistency. However, this file _didn't_ indent, so stick to
that coding style.

 But all this is just minor things, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(if you resubmit, make sure you copy the above Reviewed-by, except when you make
changes not mentioned in my review).

 Regards,
 Arnout

> +			GENIMAGE_CFG="${2}";
> +			shift 2 ;;
> +		--) # Discard all non-option parameters
> +			shift 1;
> +			break ;;
> +		*)
> +			die "unknown option '${1}'" ;;
>  	esac
>  done
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

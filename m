From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 12:53:55 +0200
Subject: [Buildroot] [PATCH v8 1/2] genimage.sh: fix calling from
 BR2_ROOTFS_POST_IMAGE_SCRIPT
In-Reply-To: <20170416174048.4737-1-abhimanyu.v@gmail.com>
References: <20170416174048.4737-1-abhimanyu.v@gmail.com>
Message-ID: <0cd26cff-61c0-7e9a-76c9-13ad682d29f2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-04-17 19:40, Abhimanyu Vishwakarma wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> 
> When called from BR2_ROOTFS_POST_IMAGE_SCRIPT, this script
> ends up with following error:
> 
> Error: Missing argument
> 
> This is because, extra positional argument is also passed
> along with BR2_ROOTFS_POST_SCRIPT_ARGS. genimage.sh didnt
> had support to parse positional and optional argument
> together.
> 
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> ---
>  Changes v7->v8
>    - New file
> 
>  support/scripts/genimage.sh | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
> index 0ed0e8bcc..2b5549fb0 100755
> --- a/support/scripts/genimage.sh
> +++ b/support/scripts/genimage.sh
> @@ -5,13 +5,18 @@ die() {
>    exit 1
>  }
>  
> +# Parse arguments and put into argument list of the script
> +eval set -- $(getopt -n genimage.sh -o c: -- "$@")

 The proper way is to quote the $(getopt ...) part, because the eval will do an
additional level of unquoting. Otherwise if an option contains a shell meta
character (e.g. $) it will be expanded by eval. Also, instead of explicitly
putting genimage.sh, it's better to pass the basename with which it was called.
Also, getopt will print an error message and return false if something is wrong
with the options, so better handle that.

 So:

opts="$(getopt -n "${0##*/}" -o c: -- "$@")" || exit $?
eval set -- "$opts"


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
> +	-c) [ ! -z "$2" ] || die "option '${1}' expects a mandatory argument\n";

 This check shouldn't be needed since it's already done by getopt.

> +	    GENIMAGE_CFG="${2}";
> +	    shift 2 ;;
> +	--) shift 1; break ;;

 This could use a comment, e.g. # Discard all non-option parameters

 Also, since you use one line per statement above, do it here as well.

 In fact, I'm personally in favour of splitting off the case part (i.e., -c) and
--) ) on a separate line as well.

> +	*) die "unknown option '${1}'\n";;

 This is not strictly needed since getopt will already detect it, but I guess
better to keep it as an emergency fallback.

 Regards,
 Arnout
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

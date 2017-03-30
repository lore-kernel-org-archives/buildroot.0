From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Mar 2017 00:51:30 +0200
Subject: [Buildroot] [RFC 1/4] support/scripts: add generic genimage
	script
In-Reply-To: <20170329145120.11863-2-etienne.phelip@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-2-etienne.phelip@savoirfairelinux.com>
Message-ID: <4a4ed2c9-51e5-c14e-22bc-0e768cc4ecc9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-03-17 16:51, Etienne Phelip wrote:
> This script is a wrapper for the genimage tool used by most boards.
> The board postimage script can now call this script instead of invoking
> genimage command themselves.
> 
> Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  support/scripts/genimage.sh | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100755 support/scripts/genimage.sh
> 
> diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
> new file mode 100755
> index 0000000..0ed0e8b
> --- /dev/null
> +++ b/support/scripts/genimage.sh
> @@ -0,0 +1,27 @@
> +#!/bin/bash
> +
> +die() {
> +  echo "Error: $@" >&2
> +  exit 1
> +}
> +
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +while getopts c: OPT ; do
> +	case "${OPT}" in
> +	c) GENIMAGE_CFG="${OPTARG}";;
> +	:) die "option '${OPTARG}' expects a mandatory argument\n";;
> +	\?) die "unknown option '${OPTARG}'\n";;
> +	esac
> +done
> +
> +[ -n "${GENIMAGE_CFG}" ] || die "Missing argument"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Mar 2017 22:40:39 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: add generic genimage
 script
In-Reply-To: <20170327164730.16271-2-etienne.phelip@savoirfairelinux.com>
References: <20170327164730.16271-1-etienne.phelip@savoirfairelinux.com>
 <20170327164730.16271-2-etienne.phelip@savoirfairelinux.com>
Message-ID: <2b9a89f7-a56a-1b20-4b84-7952978203b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Phelip,

 Nice to see yet another contribution from Savoir-faire!

On 27-03-17 18:47, Phelip Etienne wrote:
> This script is a wrapper for the genimage tool used by most boards.
> The board postimage script can now call this script instead of invoking
> genimage command themselves.

 Looks good except for some small comments below. It would have been nice,
however, if you had included a patch in this series that completely removes one
of the post-image scripts. Almost all of them can be removed completely,
raspberrypi is one of the exceptions...

> 
> Signed-off-by: Phelip Etienne <etienne.phelip@savoirfairelinux.com>
> ---
>  support/scripts/genimage.sh | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 support/scripts/genimage.sh
> 
> diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
> new file mode 100644
> index 0000000..134fc98
> --- /dev/null
> +++ b/support/scripts/genimage.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +
> +usage() {
> +  echo "Usage: genimage.sh GENIMAGE_CFG"
> +}
> +
> +# Exit if argument is missing

 Comment is redundant.

> +if [ ! -n "$1" ]; then
> +  usage >&2
> +  echo "Error: Invalid argument!" >&2

 It's a bit nicer to move the >&2 and the error message to usage(), so you can
just call it as
  usage "Error: Invalid argument!"
and actually, it's "Missing argument", not invalid.

 Also, first print the error message, then the usage itself.

> +  exit 1
> +fi
> +
> +GENIMAGE_CFG=$1
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage  \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?

 The exit is not needed - the script will exit with the exit code of the last
command. (Almost) all other post-image scripts don't have it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

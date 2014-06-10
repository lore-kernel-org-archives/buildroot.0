From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 10 Jun 2014 21:42:23 +0200
Subject: [Buildroot] [PATCH 10/12] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <c2293afb886c275e874c23a403b0f3999064fc81.1402260012.git.yann.morin.1998@free.fr>
References: <cover.1402260012.git.yann.morin.1998@free.fr>
 <c2293afb886c275e874c23a403b0f3999064fc81.1402260012.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUSUWiWBSVgb=XX4-gFTYfL-65fN8ZYXkDbO9rJXp3rdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jun 8, 2014 at 10:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[..]
> diff --git a/support/download/check-hash b/support/download/check-hash
> new file mode 100755
> index 0000000..d498752
> --- /dev/null
> +++ b/support/download/check-hash
> @@ -0,0 +1,76 @@
> +#!/bin/sh
> +set -e
> +
> +# Helper to check a file matches its known hash
> +# Call it with:
> +#   $1: the full path to the file to check
> +#   $2: the path of the file containing all the the expected hashes
> +
> +h_file="${1}"
> +file="${2}"
> +
> +# Does the hash-file exist?
> +if [ ! -f "${h_file}" ]; then
> +    exit 0
> +fi
> +
> +# Check one hash for a file
> +# $1: known hash
> +# $2: file (full path)
> +check_one_hash() {
> +    _h="${1}"
> +    _known="${2}"
> +    _file="${3}"
> +
> +    # Note: sha3 is not supported, since there is currently no implemetation

nit: implementation

> +    #       (the NIST has yet to publish the parameters).
> +    case "${_h}" in
> +        md5|sha1)                       ;;
> +        sha224|sha256|sha384|sha512)    ;;
> +        *) # Unknown hash, exit with error
> +            printf "ERROR: unknown hash '%s' for '%s'\n"  \
> +                   "${_h}" "${_file##*/}" >&2
> +            exit 1
> +            ;;
> +    esac
> +
> +    # Do the hashes match?
> +    _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
> +    if [ "${_hash}" = "${_known}" ]; then
> +        printf "%s: OK (%s: %s)\n" "${_file##*/}" "${_h}" "${_hash}"
> +        return 0
> +    fi
> +
> +    printf "ERROR: %s has wrong %s hash:\n" "${_file##*/}" "${_h}" >&2
> +    printf "ERROR: expected: %s\n" "${_known}" >&2
> +    printf "ERROR: got     : %s\n" "${_hash}" >&2
> +    printf "ERROR: Incomplete download, or MITM attack\n" >&2

I would write MITM in full: the average user will not know or realize
what it means.

[..]

Best regards,
Thomas

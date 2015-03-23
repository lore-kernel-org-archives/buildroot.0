From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Mar 2015 14:03:27 +0100
Subject: [Buildroot] [PATCH 4/7 v3] support/download: return different
 exit codes for different failures
In-Reply-To: <b74adb73680d401a14a0841f4e09aa8a0b888116.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <b74adb73680d401a14a0841f4e09aa8a0b888116.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKsdKNtBrDcbXSEOCiBt_NzdcGAC_=G=ROppmJo5y8fCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Mar 22, 2015 at 4:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Return different exit codes depending on the error that occured:
>
>   0: no error (hash file missing, or all hashes match)
>   1: unknown option
>   2: hash file exists, but at least one hash in error
>   3: hash file exists, but no hash for file to check
>   4: hash file exists, but at least one hash type unknown
>
> This will be used in a later patch to decide whether the downloaded file
> should be kept or removed.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> ---
> Changes v2 -> v3:
>   - further differentiate errors for unknown hashes and unknown
>     command-line options  (Arnout)
>
> Changes v1 -> v2:
>   - typoes in script and commit  (Samuel)
> ---
>  support/download/check-hash | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/support/download/check-hash b/support/download/check-hash
> index d0a4ab9..0234ab0 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -9,6 +9,15 @@ set -e
>  #   $3: the final basename of the file, to which it will be ultimately
>  #       saved as, to be able to match it to the corresponding hashes
>  #       in the .hash file
> +#
> +# Exit codes:
> +#   0:  the hash file exists and the file to check matches all its hashes,
> +#       or the hash file does not exist
> +#   1:  unknown command-line option
> +#   2:  the hash file exists and the file to check does not match at least
> +#       of its hashes
maybe s/of its hashes/one of its hashes/

> +#   3:  the hash file exists and there was no hash to check the file against
> +#   4:  the hash file exists and at least one hash type is unknown
>
>  while getopts :q OPT; do
>      case "${OPT}" in
> @@ -46,7 +55,7 @@ check_one_hash() {
>          *) # Unknown hash, exit with error
>              printf "ERROR: unknown hash '%s' for '%s'\n"  \
>                     "${_h}" "${base}" >&2
> -            exit 1
> +            exit 4
>              ;;
>      esac
>
> @@ -62,7 +71,7 @@ check_one_hash() {
>      printf "ERROR: got     : %s\n" "${_hash}" >&2
>      printf "ERROR: Incomplete download, or man-in-the-middle (MITM) attack\n" >&2
>
> -    exit 1
> +    exit 2
>  }
>
>  # Do we know one or more hashes for that file?
> @@ -85,7 +94,7 @@ done <"${h_file}"
>  if [ ${nb_checks} -eq 0 ]; then
>      if [ -n "${BR2_ENFORCE_CHECK_HASH}" ]; then
>          printf "ERROR: No hash found for %s\n" "${base}" >&2
> -        exit 1
> +        exit 3
>      else
>          printf "WARNING: No hash found for %s\n" "${base}" >&2
>      fi
> --
> 1.9.1
>

Regards,

-- 
Samuel

From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Mar 2015 23:58:18 +0100
Subject: [Buildroot] [PATCH 1/3] support/download: return different exit
 codes for different failures
In-Reply-To: <5aa56104e6c37f9c06a0b7c1b927a00f973e1ca4.1426545571.git.yann.morin.1998@free.fr>
References: <cover.1426545571.git.yann.morin.1998@free.fr>
 <5aa56104e6c37f9c06a0b7c1b927a00f973e1ca4.1426545571.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKddGw5Uj+4F9Cec1=WvXVTQFhXVgaRb41ide-COXbLpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Just few typos ;)

On Mon, Mar 16, 2015 at 11:41 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Return different exit codes depending on the error that occured:
>
>   0: no error (hash file missing, or all hashes match)
>   1: hash file exists, but at least one hash in error
>   3: hash file exists, but no hash for file to check
s/3/2/

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/download/check-hash | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/support/download/check-hash b/support/download/check-hash
> index 4c07274..4cc62f3 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -9,6 +9,13 @@ set -e
>  #   $3: the final basename of the file, to which it will be ultimately
>  #       saved as, to be able to match it to the corresponding hashes
>  #       in the .hash file
> +#
> +# Exits with:
> +#   0: the hash file exists and the file to check matches all its hashes,
> +#      or the hash file does not exist
> +#   1: the hash file exists and the file to check does not match at least
> +#      of its hashes
> +#   2: the hash file exists and there was no hash to check the fiel against
s/fiel/file/

>
>  while getopts :q OPT; do
>      case "${OPT}" in
> @@ -83,7 +90,7 @@ done <"${h_file}"
>  if [ ${nb_checks} -eq 0 ]; then
>      if [ -n "${BR2_ENFORCE_CHECK_HASH}" ]; then
>          printf "ERROR: No hash found for %s\n" "${base}" >&2
> -        exit 1
> +        exit 2
>      else
>          printf "WARNING: No hash found for %s\n" "${base}" >&2
>      fi
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

-- 
Samuel

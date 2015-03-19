From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 21:44:27 +0100
Subject: [Buildroot] [PATCH 3/5 v2] support/download: return different
 exit codes for different failures
In-Reply-To: <7bea586c0c9b134a62cb006371c9e5442a9d010d.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
 <7bea586c0c9b134a62cb006371c9e5442a9d010d.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <550B352B.30600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/15 13:59, Yann E. MORIN wrote:
> Return different exit codes depending on the error that occured:
> 
>   0: no error (hash file missing, or all hashes match)
>   1: hash file exists, but at least one hash in error
>   2: hash file exists, but no hash for file to check
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - typoes in script and commit  (Samuel)
> ---
>  support/download/check-hash | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/check-hash b/support/download/check-hash
> index cee64ef..9c62d7f 100755
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
> +#   2: the hash file exists and there was no hash to check the file against

 This is not entirely true, it also exits with 1 when:

- an invalid option is given;
- the hash file contains an unknown hash type.

 Perhaps there's something to be said for the latter to also return 2, because
it indicates that there's something wrong with the hash file and that's exactly
what we want to catch with this series.


 Regards,
 Arnout


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
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

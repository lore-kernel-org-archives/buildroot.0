From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 16:21:34 +0200
Subject: [Buildroot] [PATCH] support/download: keep files downloaded
 without hash
In-Reply-To: <20171106004650.23669-1-gael.portay@savoirfairelinux.com>
References: <20171106004650.23669-1-gael.portay@savoirfairelinux.com>
Message-ID: <52d33bef-7b0c-9d3c-e49e-7caefbf76841@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-17 01:46, Ga?l PORTAY wrote:
> In the situation where the hash is missing from the hash file, the
> dl-wrapper downloads the file again and again until the developer
> specifies the hash to complete the download step.
> 
> To avoid this situation, the freshly-downloaded file is not removed
> anymore after a successful download.
> 
> The build continues to terminate in error and the file will not be
> downloaded again during the next builds.
> 
> Next builds will terminate in error until the hash is specified.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

 Applied to master, thanks. I just extended the commit log a little to describe
what will happen after this patch:

    After this change, the behaviour is as follows:

    - Hash file doesn't exist, or file is in BR_NO_CHECK_HASH_FOR
      => always succeeds.

    - Hash file exists, but file is not present
      => file is NOT removed, build is terminated immediately (i.e.
         secondary site is not tried).

    - Hash file exists, file is present, but hash mismatch
      => file is removed, secondary site is tried.
      => If all primary/secondary site downloads or hash checks fail, the
         build is terminated.


 I think the handling of rc in the script could be done in a nicer way, but it's
not important enough to do anything about it.

 Regards,
 Arnout

> ---
>  support/download/dl-wrapper | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index f944b71db5..b018819833 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -21,7 +21,7 @@ set -e
>  
>  main() {
>      local OPT OPTARG
> -    local backend output hfile recurse quiet
> +    local backend output hfile recurse quiet rc
>  
>      # Parse our options; anything after '--' is for the backend
>      while getopts :hb:o:H:rq OPT; do
> @@ -93,9 +93,16 @@ main() {
>  
>      # Check if the downloaded file is sane, and matches the stored hashes
>      # for that file
> -    if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
> -        rm -rf "${tmpd}"
> -        exit 1
> +    if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
> +        rc=0
> +    else
> +        if [ ${?} -ne 3 ]; then
> +            rm -rf "${tmpd}"
> +            exit 1
> +        fi
> +
> +        # the hash file exists and there was no hash to check the file against
> +        rc=1
>      fi
>  
>      # tmp_output is in the same directory as the final output, so we can
> @@ -141,6 +148,8 @@ main() {
>          rm -f "${tmp_output}"
>          exit 1
>      fi
> +
> +    return ${rc}
>  }
>  
>  help() {
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

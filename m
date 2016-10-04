From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Oct 2016 23:33:34 +0200
Subject: [Buildroot] [PATCH 1/2] check-host-rpath: support symlinks in
 rpath
In-Reply-To: <1475230194-18524-2-git-send-email-jezz@sysmic.org>
References: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
 <1475230194-18524-2-git-send-email-jezz@sysmic.org>
Message-ID: <8fb2b678-db51-9ba7-c07d-d7956c9708db@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-09-16 12:09, J?r?me Pouiller wrote:
> If compilation path contains symlinks, rpath may sometime contains
> symlinks and sometime canonicalized path.
> 
> A pratical example:
> 
>   $ ln -s /opt/buildroot /opt/buildroot-symblink
>   $ cd /opt/buildroot-symlink
>   $ make O=out
>   $ make -C out package-rebuild
> 
> This last command produce an error since already installed host binaries
> contains /opt/buildroot/out/host/usr/lib as rpath while check-host-rpath expect
> /opt/buildroot-symlink/out/host/usr/lib
> 
> This patch canonicalize all paths used in check-host-rpath in order to avoid
> problem

 Wouldn't this also be fixed by http://patchwork.ozlabs.org/patch/613854/ ? With
that patch (series) applied, there shouldn't be any symlinks anymore once the
real make starts.

 Note that I still had remarks on that specific patch and Samuel hasn't respun.
Maybe something for in Berlin.


 Regards,
 Arnout

> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  support/scripts/check-host-rpath | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 6ce547c..2541e53 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -13,8 +13,8 @@ main() {
>      local hostdir="${2}"
>      local file ret
>  
> -    # Remove duplicate and trailing '/' for proper match
> -    hostdir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${hostdir}" )"
> +    # Canonicalize path: follow symlinks, remove duplicate and trailing '/'
> +    hostdir="$( readlink -m "${hostdir}" )"
>  
>      ret=0
>      while read file; do
> @@ -56,8 +56,8 @@ check_elf_has_rpath() {
>  
>      while read rpath; do
>          for dir in ${rpath//:/ }; do
> -            # Remove duplicate and trailing '/' for proper match
> -            dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
> +            # Canonicalize path: follow symlinks, remove duplicate and trailing '/'
> +            dir="$( readlink -m "${dir}" )"
>              [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
>          done
>      done < <( readelf -d "${file}"                                              \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

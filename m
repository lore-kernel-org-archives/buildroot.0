From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2018 10:38:48 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: Use series.host for host
 package (if exists) instead of series
In-Reply-To: <20180728063118.657-1-kuldeep@madresistor.com>
References: <20180728063118.657-1-kuldeep@madresistor.com>
Message-ID: <f5170328-82d9-d992-66e1-4fef83746554@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Kuldeep,


On 28-07-18 08:31, Kuldeep Singh Dhaka wrote:
> This allow apply differential patching depending upon the package being compiled for (target or host)
> Backward compatible: If series.host do not exists, it simply apply series (original behaviour)

 I'm not sure we want to support such a feature. Patching a host package
differently than the target package is not something we want to encourage. If
you need to do that, it probably also means you have to patch it differently for
different target architectures and that would be a maintenance nightmare.

 In addition, we want to move to a separate source and build directory, where
the source directory is shared between host and target build. The patches are
applied to the source directory, so it is no longer possible to do this.

 Finally, if you really do need this, you can use either
HOST_FOO_POST_PATCH_HOOKS or HOST_FOO_PATCHES to point to a directory containing
the host-specific patches. So in the extremely exceptional / hackish case that
this is needed, there is already a way to do it.

 I have now marked your patch as Rejected in patchwork, but feel free to defend
why such a feature should be added, and we can reinstate it.

> 
> Signed-off-by: Kuldeep Singh Dhaka <kuldeep@madresistor.com>

 By the way, please make sure that the Signed-off-by address is the same as the
author.

 Regards,
 Arnout

> ---
>  support/scripts/apply-patches.sh | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 66fef262ee..81e8cec036 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -46,6 +46,8 @@ patchdir=${2-../kernel-patches}
>  shift 2
>  patchpattern=${@-*}
>  
> +case "$(basename ${builddir})" in host-*) hostpkg=y;; esac;
> +
>  # use a well defined sorting order
>  export LC_COLLATE=C
>  
> @@ -131,15 +133,22 @@ function scan_patchdir {
>      shift 1
>      patches=${@-*}
>  
> +    # If there is a series.host file and the package is host, use it instead of series.
> +    if [ -e "${path}/series.host" -a "${hostpkg}" ] ; then
> +        series="${path}/series.host"
> +    elif [ -e "${path}/series" ]; then
> +        series="${path}/series"
> +    fi
> +
>      # If there is a series file, use it instead of using ls sort order
>      # to apply patches. Skip line starting with a dash.
> -    if [ -e "${path}/series" ] ; then
> +    if [ -n "${series}" ] ; then
>          # The format of a series file accepts a second field that is
>          # used to specify the number of directory components to strip
>          # when applying the patch, in the form -pN (N an integer >= 0)
>          # We assume this field to always be -p1 whether it is present
>          # or missing.
> -        series_patches="`grep -Ev "^#" ${path}/series | cut -d ' ' -f1 2> /dev/null`"
> +        series_patches="`grep -Ev "^#" ${series} | cut -d ' ' -f1 2> /dev/null`"
>          for i in $series_patches; do
>              apply_patch "$path" "$i" series
>          done
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

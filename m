From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Feb 2012 23:40:46 +0100
Subject: [Buildroot] [RFC PATCH 4/6] apply-patches.sh: directories are
	considered as a collection of patches
In-Reply-To: <4497cd4c9ca71e3bba7da6b9906319f6c40862be.1328492511.git.ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
 <4497cd4c9ca71e3bba7da6b9906319f6c40862be.1328492511.git.ludovic.desroches@atmel.com>
Message-ID: <201202102340.46608.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 06 February 2012 02:47:17 ludovic.desroches at atmel.com wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> Behaviour of directories is changed: it is no more considered as an overlay,
> but rather a collection of patches. Subdirectories are not supported.

 Actually, I think the directory feature could be removed completely.  It's
not used anywhere at the moment and I don't see why anyone would want to use it.

> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  support/scripts/apply-patches.sh |   63 ++++++++++++++++++++-----------------
>  1 files changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 2eab05d..1fc93f6 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -11,30 +11,10 @@ patchdir=${2-../kernel-patches}
>  shift 2
>  patchpattern=${@-*}
>  
> -if [ ! -d "${builddir}" ] ; then
> -    echo "Aborting.  '${builddir}' is not a directory."
> -    exit 1
> -fi
> -if [ ! -d "${patchdir}" ] ; then
> -    echo "Aborting.  '${patchdir}' is not a directory."
> -    exit 1
> -fi
> -
> -# Check for rejects because if there are some, even if patches are well
> -# applied, at the end it will complain about rejects into builddir.
> -if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
> -	echo "There are remaining reject files into ${builddir}, please delete them."
> -fi

 I still think it's better to keep these checks before the definition
of the apply_patch function.

> -    
> -for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
> -    apply="patch -g0 -p1 -E -d"
> -    uncomp_parm=""
> -    if [ -d "${patchdir}/$i" ] ; then
> -	type="directory overlay"
> -	uncomp="tar cf - --exclude=.svn --no-anchored -C"
> -	uncomp_parm="."
> -	apply="tar xvf - -C"
> -    else case "$i" in
> +function apply_patch {
> +    path=$1
> +    patch=$2
> +    case "$patch" in
>  	*.gz)
>  	type="gzip"; uncomp="gunzip -dc"; ;; 
>  	*.bz)
> @@ -51,15 +31,40 @@ for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
>  	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
>  	*)
>  	type="plaintext"; uncomp="cat"; ;; 
> -    esac fi
> +    esac
>      echo ""
> -    echo "Applying ${i} using ${type}: " 
> -	echo ${i} >> ${builddir}/.applied_patches_list
> -    ${uncomp} "${patchdir}/${i}" ${uncomp_parm} | ${apply} "${builddir}"
> +    echo "Applying $patch using ${type}: "
> +	echo ${1} >> ${builddir}/.applied_patches_list

 Shouldn't this be 'echo $path/$patch' ?  Not that it matters that much...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/d6819abf/attachment-0001.html>

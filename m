From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Feb 2012 23:48:08 +0100
Subject: [Buildroot] [RFC PATCH 6/6] apply-patches.sh: change archive
	management
In-Reply-To: <76267ac6ba3ddac4379b9896f72875dedd455ebd.1328492511.git.ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
 <76267ac6ba3ddac4379b9896f72875dedd455ebd.1328492511.git.ludovic.desroches@atmel.com>
Message-ID: <201202102348.08459.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 06 February 2012 02:47:19 ludovic.desroches at atmel.com wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> The way archives were managed was incorrect because the uncompressed archives
> were sent directly to patch command. It means that alphabetical patch orderwas
> not respected.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  support/scripts/apply-patches.sh |   15 +++++++++++----
>  1 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 3a73ab9..9c2fbb3 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -25,10 +25,6 @@ function apply_patch {
>  	type="zip"; uncomp="unzip -d"; ;; 
>  	*.Z)
>  	type="compress"; uncomp="uncompress -c"; ;; 
> -	*.tgz)
> -	type="tar gzip"; uncomp="gunzip -dc"; apply="tar xvf - -C"; ;; 
> -	*.tar)
> -	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
>  	*)
>  	type="plaintext"; uncomp="cat"; ;; 
>      esac
> @@ -50,6 +46,17 @@ function scan_patchdir {
>      for i in `cd $path; ls -d $patches 2> /dev/null` ; do
>          if [ -d "${path}/$i" ] ; then
>  	    scan_patchdir "${path}/$i"
> +	elif echo "$i" | grep -q -E "tar\.bz$|tbz$|tar.\bz2$|tbz2$|tar\.gz$|tgz$" ; then
 Wouldn't '\.tar(\..*)?$|\.tbz2?$|\.tgz$' be a better pattern?

> +            unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
> +	    rm -rf "$unpackedarchivedir" 2> /dev/null
> +	    mkdir "$unpackedarchivedir"
> +	    if echo "$i" | grep "tar\.bz$|tbz$|tar\.bz2$|.tbz2$" ; then
> +	        tar_options="-xjf"
> +	    else
> +	        tar_options="-xzf"
> +	    fi
 You can also use tar -xaf, which selects compression automatically.

> +	    tar -C "$unpackedarchivedir" --strip-components=1 $tar_options "${path}/$i"
> +	    scan_patchdir "$unpackedarchivedir"
>          else
>              apply_patch "$path" "$i" || exit 1
>          fi
> 


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/ce0cbfda/attachment.html>

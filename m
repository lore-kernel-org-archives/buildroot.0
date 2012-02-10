From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Feb 2012 22:43:18 +0100
Subject: [Buildroot] [RFC PATCH 1/6] apply-patches.sh: check if there
	are rejects before applying patches
In-Reply-To: <97c03a1ea46f7ace3b981399635c3ddbe6082db3.1328492511.git.ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
 <97c03a1ea46f7ace3b981399635c3ddbe6082db3.1328492511.git.ludovic.desroches@atmel.com>
Message-ID: <201202102243.19123.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 06 February 2012 02:47:14 ludovic.desroches at atmel.com wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/scripts/apply-patches.sh |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 1aef47e..1ad7d1f 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -19,6 +19,12 @@ if [ ! -d "${patchdir}" ] ; then
>      echo "Aborting.  '${patchdir}' is not a directory."
>      exit 1
>  fi
> +
> +# Check for rejects because if there are some, even if patches are well
> +# applied, at the end it will complain about rejects into targetdir.
> +if [ "`find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
> +	echo "There are remaining reject files into ${targetdir}, please delete them."

 'into' should be 'in'.

 Personally, I would just delete them instead of issuing a warning.  If you
don't then the script should at least exit at this point, otherwise you'll
still get the complaint at the end.

 Regards,
 Arnout

> +fi
>      
>  for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
>      apply="patch -g0 -p1 -E -d"
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/4c10e19c/attachment-0001.html>

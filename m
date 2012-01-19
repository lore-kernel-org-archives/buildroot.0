From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Jan 2012 23:26:45 +0100
Subject: [Buildroot] [RFC PATCH v4 2/2] apply-patches.sh check if they
	are rejects before applying patches
In-Reply-To: <c170b553688aa9cf430f99b35f7a7d02481f4474.1326218007.git.ludovic.desroches@atmel.com>
References: <CAAXf6LWYfg-JO0NnW-ng2XfyTr159aGDSsU9Ec6NZriXQHpvrA@mail.gmail.com>
 <1326218516-28062-1-git-send-email-ludovic.desroches@atmel.com>
 <c170b553688aa9cf430f99b35f7a7d02481f4474.1326218007.git.ludovic.desroches@atmel.com>
Message-ID: <201201192326.46203.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Short commit message should be:
apply-patches.sh: check if there are rejects before applying patches

On Tuesday 10 January 2012 19:01:56 ludovic.desroches at atmel.com wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> If we don't do it, the rejects' check at the end of the script can complain
> about rejects not deleted by the user from a previous try.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Since this patch is much more likely to go in on the short term, I would
reverse the order of the patches.  That means: revert builddir to targetdir.

> ---
>  support/scripts/apply-patches.sh |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 2a25606..a15b5c1 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -64,6 +64,13 @@ if [ ! -d "${builddir}" ] ; then
>  	echo "Aborting: ${builddir} is not a directory."
>  	exit 1
>  fi
> +# check for rejects because if there are some, even if patches are well
> +# applied, at the end it will complain about rejects into buildir
> +if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
> +    echo "There are remaining rejecting file into ${buildir}, please delete them"
 Should be:
echo "There are remaining reject files in '${buildir}', please delete them."

 Otherwise, looks perfect.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Mar 2012 23:32:05 +0100
Subject: [Buildroot] [PATCH 1/6] apply-patches.sh: check if there are
	rejects before applying patches
In-Reply-To: <1331739237-29872-2-git-send-email-ludovic.desroches@atmel.com>
 (ludovic desroches's message of "Wed, 14 Mar 2012 16:33:52 +0100")
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
 <1331739237-29872-2-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <87aa3ike56.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ludovic" == ludovic desroches <ludovic.desroches@atmel.com> writes:

 ludovic> From: Ludovic Desroches <ludovic.desroches@atmel.com>
 ludovic> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
 ludovic> Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
 ludovic> with an armadeus_apf9328_defconfig build
 ludovic> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ludovic> ---
 ludovic>  support/scripts/apply-patches.sh |    7 +++++++
 ludovic>  1 files changed, 7 insertions(+), 0 deletions(-)

 ludovic> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
 ludovic> index 1aef47e..b145b46 100755
 ludovic> --- a/support/scripts/apply-patches.sh
 ludovic> +++ b/support/scripts/apply-patches.sh
 ludovic> @@ -19,6 +19,13 @@ if [ ! -d "${patchdir}" ] ; then
 ludovic>      echo "Aborting.  '${patchdir}' is not a directory."
 ludovic>      exit 1
 ludovic>  fi
 ludovic> +
 ludovic> +# Check for rejects because if there are some, even if patches are well
 ludovic> +# applied, at the end it will complain about rejects into targetdir.
 ludovic> +if [ "`find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
 ludovic> +	rm -f "${targetdir}/*.rej" 2> /dev/null

This is wrong, as the *.rej files might be in subdirs, so I changed this
to just do the find ... | xargs rm -f without notifying the user,
similar to how we do it for *.orig files. I also adjusted the comment
and commit message to match.

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard

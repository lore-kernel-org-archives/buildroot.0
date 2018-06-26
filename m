From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 21:38:47 +0200
Subject: [Buildroot] [PATCH] git-download: Fix downloading of specific
 revisions from github.
In-Reply-To: <20180626093617.13034-1-neumann@teufel.de>
References: <20180626093617.13034-1-neumann@teufel.de>
Message-ID: <20180626213847.61a588d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 11:36:17 +0200, Sven Neumann wrote:

> diff --git a/support/download/git b/support/download/git
> index 11bb52c1e1..1efde4fcdc 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -75,6 +75,12 @@ _git() {
>      eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
>  }
>  
> +# If the URL contains github, simply fetch the archive via wget:
> +if [[ $repo == https://api.github.com/* ]]; then
> +    wget -O $output $repo
> +    exit 0
> +fi

This looks weird. Why would downloads from https://<something> end up
in the Git download helper ?

If the URL starts with https://, unless the SITE_METHOD is forced to
Git, then it's the wget download helper that gets used.

Downloads that use the $(call github,...,...) macro today already use
wget, not git.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

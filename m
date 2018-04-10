From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 14:36:30 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: Take default
 SOURCE_DATE_EPOCH from repo containing Makefile
In-Reply-To: <1523356092-16037-1-git-send-email-james.byrne@origamienergy.com>
References: <1523356092-16037-1-git-send-email-james.byrne@origamienergy.com>
Message-ID: <20180410143630.22646b86@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 11:28:12 +0100, James Byrne wrote:
> For reproducible builds, SOURCE_DATE_EPOCH will be set to the git commit
> date if it is not defined in the environment, but this was done by
> explicitly using $(TOPDIR)/.git as the git repository, which would not
> give the expected result if Buildroot had been put into a subdirectory
> of another repository.
> 
> This commit removes that restriction, meaning that the default date will
> now be the date of the git commit that contains Makefile, regardless of
> what level above Makefile the repository is at. This works because the
> current directory when the 'git log' command is executed will always be
> the directory containing Makefile (it must be, since TOPDIR is set from
> CURDIR).
> 
> In general this should be a sensible default, and in cases where a
> different date is required SOURCE_DATE_EPOCH can be defined in the
> environment before invoking make.
> 
> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index cd53362..3b846b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -506,7 +506,7 @@ ifeq ($(BR2_REPRODUCIBLE),y)
>  # If SOURCE_DATE_EPOCH has not been set then use the commit date, or the last
>  # release date if the source tree is not within a Git repository.
>  # See: https://reproducible-builds.org/specs/source-date-epoch/
> -BR2_VERSION_GIT_EPOCH := $(shell $(GIT) --git-dir=$(TOPDIR)/.git log -1 --format=%at 2> /dev/null)
> +BR2_VERSION_GIT_EPOCH := $(shell $(GIT) log -1 --format=%at 2> /dev/null)

Was there a reason to have this --git-dir/GIT_DIR option/variable
passed in the first place ?

I don't immediately see any problem with the change you're proposing,
but I'm wondering why we were passing --git-dir (previously GIT_DIR).

It has been done this way since commit
9befe94baf990ee6331e77edb40e286e9dc4df8d, where SOURCE_DATE_EPOCH was
introduced in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

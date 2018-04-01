From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 08:23:24 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: Correctly take source date
 from commit date
In-Reply-To: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
References: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
Message-ID: <20180401062324.GA2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-03-28 13:26 +0100, James Byrne spake thusly:
> For reproducible builds SOURCE_DATE_EPOCH is supposed to be set to the
> date of the last Buildroot commit if running from a git repository, but
> this doesn't actually work. This corrects this in the following way:
> 
> 1) Set GIT from BR2_GIT, otherwise it may be undefined.
> 
> 2) Use 'git rev-parse --is-inside-work-tree' to see if we are inside a
> Git repository. There is no need to use TOPDIR, because the current
> directory will always be TOPDIR, and in any case the Git repository may
> be at a higher directory level if Buildroot has been imported into a
> larger build system.

Besides what Arnout said, I'm not a big fan of this patch.

Buildroot does abide by the rules: if SOURCE_DATE_EPOCH is seet in the
environemnt, we do not set it.

Otherwise we do set it to a date that is meaningful to Buildroot itself.

In an upper-layer buildsystem wants to use its own date, it should set
it in the environment before calling us.

That's what the spec about SOURCE_DATE_EPOCH mandates:

    https://reproducible-builds.org/specs/source-date-epoch/

So, I would just drop that patch.


Now, having SOURCE_DATE_EPOCH set correctly in an unconfigured tree
could be fixed, in deed, but what would be the use case for that?

Regards,
Yann E. MORIN.

> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> ---
>  Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9e2402d..59af554 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -253,8 +253,10 @@ export TZ = UTC
>  export LANG = C
>  export LC_ALL = C
>  export GZIP = -n
> -BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
> -export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
> +GIT := $(call qstrip,$(BR2_GIT))
> +BR2_IN_WORK_TREE = $(if $(subst false,,$(shell $(GIT) rev-parse --is-inside-work-tree 2> /dev/null || echo false)),Y,)
> +BR2_VERSION_GIT_EPOCH = $(shell $(GIT) log -1 --format=%at)
> +export SOURCE_DATE_EPOCH ?= $(if $(BR2_IN_WORK_TREE),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
>  endif
> 
>  # To put more focus on warnings, be less verbose as default
> --
> 2.7.4
> 
> The contents of this email and any attachment are confidential to the intended recipient(s). If you are not an intended recipient: (i) do not use, disclose, distribute, copy or publish this email or its contents; (ii) please contact the sender immediately; and (iii) delete this email. Origami Energy Limited (company number 8619644); Origami Storage Limited (company number 10436515) and OSSPV001 Limited (company number 10933403), each registered in England and each with a registered office at: Ashcombe Court, Woolsack Way, Godalming, GU7 1LQ.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

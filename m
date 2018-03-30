From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Mar 2018 21:28:18 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: Correctly take source date
 from commit date
In-Reply-To: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
References: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
Message-ID: <b5fd4075-1939-04c6-2295-69d6f426ac57@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-03-18 14:26, James Byrne wrote:
> For reproducible builds SOURCE_DATE_EPOCH is supposed to be set to the
> date of the last Buildroot commit if running from a git repository, but
> this doesn't actually work. This corrects this in the following way:
> 
> 1) Set GIT from BR2_GIT, otherwise it may be undefined.
> 
> 2) Use 'git rev-parse --is-inside-work-tree' to see if we are inside a

 If you say "1 and 2" in your commit log, that's a hint it should be two
separate patches :-)

> Git repository. There is no need to use TOPDIR, because the current
> directory will always be TOPDIR, and in any case the Git repository may
> be at a higher directory level if Buildroot has been imported into a
> larger build system.

 Hm, but in that case, do you really want SOURCE_DATE_EPOCH to be set to the git
epoch of the larger build system? I think that depends a lot on the exact
circumstances.

 Anyway, a much more likely situation is that your "larger build system"
includes one or more BR2_EXTERNAL directories - and those are typically a lot
more volatile than the Buildroot directory itself. So maybe the source epoch
should be set to the git epoch of one of those?

 I think there are just too many different situations here, and that we should
just rely on the user explicitly setting SOURCE_DATE_EPOCH to whatever is
appropriate for her/him. That said, using any surrounding git repo sounds like a
sane default. So in the end I'm not really opposed to your patch.


> 
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

 This is in fact defined in package/pkg-download.mk. I guess the problem is that
that that file doesn't get included on an unconfigured system. However, in that
case, how does your BR2_REPRODUCIBLE get set? Can you specify under which
circumstances this variable is not defined?

> +BR2_IN_WORK_TREE = $(if $(subst false,,$(shell $(GIT) rev-parse --is-inside-work-tree 2> /dev/null || echo false)),Y,)

 This would be much simpler:

BR2_IN_WORK_TREE = $(shell $(GIT) rev-parse --is-inside-work-tree 2> /dev/null)

 This will be empty in case it is not in a work tree, and 'true' if it is.

> +BR2_VERSION_GIT_EPOCH = $(shell $(GIT) log -1 --format=%at)
> +export SOURCE_DATE_EPOCH ?= $(if $(BR2_IN_WORK_TREE),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
 But actually, it could be made a whole lot simpler:

BR2_VERSION_GIT_EPOCH = $(shell $(GIT) log -1 --format=%at 2> /dev/null)
export SOURCE_DATE_EPOCH ?= $(or $(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))

BR2_VERSION_GIT_EPOCH will be empty if it's not in a worktree.

 Regards,
 Arnout


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
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

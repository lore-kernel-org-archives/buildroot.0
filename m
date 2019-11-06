From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 7 Nov 2019 00:41:43 +0200
Subject: [Buildroot] [PATCH 1/1] Include makefiles from GLOBAL_PATCH_DIR
In-Reply-To: <20191106233100.3b66c426@windsurf>
References: <20191026145151.17749-1-jeremy.rosen@smile.fr>
 <20191106163748.GA3419@scaer> <20191106233100.3b66c426@windsurf>
Message-ID: <CAMw6YJ+bZy5Pfu849F1qpDJoYR0=a16Qp7p3raLsfiLkjV0wKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Regarding the package replacing by one from the BR2_EXTERNAL, I really
did not tried this
just in case may be it may help.

On Thu, Nov 7, 2019 at 12:31 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 6 Nov 2019 17:37:48 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > > * add a function to pkg-utils.mk to include makefiles from GLOBAL_PATCH_DIR
> > > * modify all pkg-* to use it as their first action
> >
> > So I finally took the time to think about this patch. This is not really
> > a review per-se, because the core of the changes are pretty trivial
> > overall.
> >
> > Rather, it is mostly my point of view on the subject, and why I think
> > an override-based solution is a bad idea. We discussed this during the
> > last dev-days, but for posterity, I'll recap all here to spur more
> > comments.
>
> Here is also my point of view. I will contradict Yann on several
> points, but this does not necessarily mean that I strongly support the
> patch. It's just an attempt at providing a different point of view in
> the discussion.
>
> > First, this solution does not cover all use-cases. One major drawback it
> > has, is that it can't allow overriding the version of a package. The
> > reason for this limitation is that he .hash file is not overridden, so it
> > is not possible to provide an alternate version. However, when exposed
> > with your proposal, the very first thing most users thought about using
> > it for, was *exactly* for that: changing the version of the package.
> >
> > So, the most obvious limitations of this solution, is also the most
> > obvious use-case users would expect to use it for. Big drawback...
>
> True, but could we also allow overriding the .hash file ? Perhaps we
> could specify that in a BR2_EXTERNAL tree, package/foo/foo.mk gets
> included at the end of package/foo/foo.mk of the main Buildroot tree,
> right before the $(eval $(something-package)), and that
> package/foo/foo.hash in the BR2_EXTERNAL takes precedence over
> package/foo/foo.hash in the Buildroot tree. I agree it starts to be
> messy and complicated, but probably not impossible either.
>

Well, I am not a makefile expert but what if BR2_EXTERNAL package might set
XXX_OVERRIDE_PKG and replace the original package with its content and
the following
code in common Makefile (which is in Buildroot tree) will just skip
including the original package:

    include $(sort $(foreach p,$(wildcard package/*/*.mk),$(if
$($(call UPPERCASE,$(p))_OVERRIDE_PKG),,$(p))))

> > Second, the excuse for such an override is to be able to claim not
> > touching the Buildroot tree, and to be able to update the Buildroot tree
> > with just a simple "git pull".
> >
> > I believe this is broken by design, because this actually hides breakage
> > when updating Buildroot. When you update Buildroot, you have to account
> > for the changes in the new version: new config options, new variables,
> > new values in existing variables, or even changes deep in the various
> > infrastructures. A proper override would have to go so far as to unset
> > all the variables of a package before redefining it entirely.
> >
> > Hiding local changes away in an override actually is a missed opportunity
> > to notice these changes with actual merge (or rebase) conflicts, instead
> > leading to issues much later down the road, which means a lot of time
> > lost. That would not show semantic conflicts, true, but actual
> > code-level conflicts would show, and they would probably be the most
> > common.
> >
> > So, I am afraid that these overrides are a poor excuse for not wanting to
> > do actual VCS work.
>
> Well, you are the one who introduced BR2_EXTERNAL in the first place!
> And what we can put today in a BR2_EXTERNAL is in fact what is the
> easiest to maintain using a VCS inside the Buildroot tree: new
> defconfigs, new packages, board/ artefacts. These are always new files,
> they will never conflict in any way when rebasing, etc. And still, we
> agreed on adding BR2_EXTERNAL, even if at the time there was the same
> concern: why don't people simply use the capabilities of their VCS.
>
> > Third, since the override is outside the Buildroot tree (if it were in,
> > there would be no point in the override to begin with), it means it is
> > easy to miss it in critical times. Some packages in Buildroot are
> > licensed under copyleft licenses (GPL, LGPL...), and those have
> > requirements reading something along the lines of "complete source code
> > means [...], plus the scripts used to control compilation and
> > installation of the executable." Scripts which happens to be Buildroot
> > in our case, and the stuff in your override.
> >
> > Since the override would live in a separate tree with private, non
> > public stuff, it would be very easy to miss it when coming into
> > compliance for such packages, as one would be tempted to only distribute
> > their Buildroot tree.
>
> The problem already exists today with BR2_EXTERNAL: one can easily mess
> up and create a BR2_EXTERNAL with a mix of GPL-licensed packages and
> proprietary-licensed packages, and forget to redistribute the source
> code of the BR2_EXTERNAL. So that doesn't really seem like a good
> argument against Jeremy's patch: the problem already exists today, and
> we can't avoid it. Jeremy's patch doesn't really make it better or
> worse.
>
> A reasonably sane person would probably use two BR2_EXTERNAL: a first
> one with the additional GPL-licensed packages + the package overrides
> to existing Buildroot packages, and a second one with all the
> proprietary/product-specific bits. The first BR2_EXTERNAL would be
> published, not the second one.
>
> > In conclusion, my position on this topic is pretty straightforward: if
> > you want to modify the package recipes, then do so, and do so your the
> > Buildroot tree. Use a branch that contains your changes, and when you
> > need, merge a new master (or stable, or LTS) into your branch.
>
> So we can remove the BR2_EXTERNAL feature ? :-)
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Vadym Kochan

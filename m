From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 15 Jan 2020 21:30:45 +1300
Subject: [Buildroot] Allowing to build from Git branches
In-Reply-To: <20200115090044.5b9d56d0@windsurf>
References: <20200114220401.61700031@windsurf>
 <CAFOYHZAq0Yrhg10m+U5UNa5+YRY+gcqDQ9K8sE+Sjg1P32edWQ@mail.gmail.com>
 <20200115090044.5b9d56d0@windsurf>
Message-ID: <CAFOYHZAZ=__V_iA+X=_EFnPmYEULw+ab5Dq-zfrYU-zpNdUp5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jan 2020, 9:00 PM Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello Chris,
>
> On Wed, 15 Jan 2020 20:07:29 +1300
> Chris Packham <judge.packham@gmail.com> wrote:
>
> > > However, over time, I have seen a number of users/companies complaining
> > > about this, both on the mailing list and privately with customers or
> > > while discussing with users at conferences.
> >
> > Yep I'm one of those users.
>
> And you're not the only one :-)
>
> > I'd qualify that reproducibility is good but we also want correct builds.
> >
> > A frustration for us (bear in mind this was ~2010) was that it was often
> > hit and miss between whether buildroot would pick up the fact that the
> > source had changed so we were constantly second-guessing the validity of
> > tests which led to a lot of make <package>-dirclean.
>
> I don't really understand how it can be "hit and miss". The way
> Buildroot downloads from the upstream location for each package is
> completely deterministic.
>
> In addition, if you were doing <package>-dirclean to avoid the problem,
> then we're not talking about the same issue, because <package>-dirclean
> has zero impact on the contents of DL_DIR, and therefore zero impact on
> whether Buildroot will re-download things or not.
>
> Perhaps your issue was broader in the sense that you wanted an existing
> Buildroot build (where all packages have already been built) to
> automatically refetch some of the packages from Git, without having to
> do a "make clean". And that is why you had to selectively "make
> <package>-dirclean" those packages.
>

Yes it was the re-build case that was problematic for us.

The hit and miss was probably our attempt to make buildroot build packages
using local sources. This was before SITE_METHOD=local was a thing.

However, what I am proposing is not going that far. All what I'm
> proposing is that if you're doing a clean build, if a package points to
> a Git branch as an upstream source, then Buildroot would re-fetch from
> that Git branch rather than using a locally cached tarball in DL_DIR
> potentially corresponding to an older version of that Git branch.
>
> > > So I'd like to start the debate on whether it might makes sense to
> > > relax our requirements on this, and be more pragmatic, and support
> > > fetching from Git branches. Of course, this very likely needs to be
> > > guarded by a Config.in option, so that we clearly set the boundary
> > > between "you're in the safe zone where your build is reproducible" and
> > > "you're in the zone where your build is non-reproducible".
> >
> > As you've hinted at it should be possible to at least track the git
> > describe --always --dirty (or hg equivalent) to provide some level of
> > traceability even if it's not complete binary equvialence.
>
> Yes, absolutely. In fact, automatically refetching branches is in some
> sense more reproducible than when OVERRIDE_SRCDIR / SITE_METHOD = local
> are used.
>
> Indeed, when a package points to a branch, you can at least save the
> Git commit which was pointed by the branch at the moment of the build,
> and save that somewhere, allowing you to reproduce the same build later
> if you need to. However a source directory used with OVERRIDE_SRCDIR /
> SITE_METHOD = local can contain any random changes that Buildroot can't
> track at all.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200115/82c81501/attachment.html>

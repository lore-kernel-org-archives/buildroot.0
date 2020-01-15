From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 15 Jan 2020 20:07:29 +1300
Subject: [Buildroot] Allowing to build from Git branches
In-Reply-To: <20200114220401.61700031@windsurf>
References: <20200114220401.61700031@windsurf>
Message-ID: <CAFOYHZAq0Yrhg10m+U5UNa5+YRY+gcqDQ9K8sE+Sjg1P32edWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 15 Jan 2020, 10:04 AM Thomas Petazzoni, <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> I know some people are going to yell at me for bringing up this topic,
> but let's do it anyway.
>
> Currently, Buildroot says that using a Git branch as the VERSION for a
> package is not supported. There are some patches that have been
> proposed to explicitly prevent using branches, but in the current
> Buildroot it "works" except that a cached tarball is preserved in
> DL_DIR, which means that the branch is never fetched again unless the
> tarball is manually deleted from DL_DIR. We have generally resisted
> supporting Git branches with the (very valid) argument that it breaks
> reproducibility.
>
> However, over time, I have seen a number of users/companies complaining
> about this, both on the mailing list and privately with customers or
> while discussing with users at conferences.
>

Yep I'm one of those users.

The typical use case that they describe is the following: a company has
>
a large number of packages in Buildroot to build in-house software
> components. Both for their CI runs, and for the developers actively
> working on the system, they would like for those packages to point to a
> branch, and always fetch the latest version. Yes, it is not
> reproducible, but reproducibility is not what is desired at this point
> of the project: what is wanted is precisely to fetch the latest and
> greatest for those packages that point to a branch, to make sure the
> most recent code gets tested and used by developers internally.
>
> The only solution we offer for this today is <pkg>_OVERRIDE_SRCDIR or
> <pkg>_SITE_METHOD = local, but neither of those are very practical: you
> need to have fetched each of your software components outside of
> Buildroot, and point Buildroot at them. It's a bit silly when Buildroot
> is already perfectly capable of doing this.
>
> Overall, I think it makes sense to realize that Buildroot is used in
> different use-cases:
>
>  - During active development, where we want to offer a lot of
>    flexibility, possibly at the expense of reproducibility.
>

I'd qualify that reproducibility is good but we also want correct builds.

A frustration for us (bear in mind this was ~2010) was that it was often
hit and miss between whether buildroot would pick up the fact that the
source had changed so we were constantly second-guessing the validity of
tests which led to a lot of make <package>-dirclean.

Ultimately it may not be possible to fix that issue when sticking with make
as the underlying tool (we ended up rolling our own system so we could hash
stuff instead of relying on timestamps).

 - During release/generation of the final firmware that will be used on
>    actual devices, where we want an absolute reproducibility, to the
>    point where we're working on binary-identical results.
>
> Buildroot has its roots in solving the second use-case. However, we
> have already added some features, like OVERRIDE_SRCDIR and SITE_METHOD
> = local, to provide the additional flexibility needed for the first use
> case. In some sense, those features already kill reproducibility: what
> you're building is some random source code from some random local
> folder. Completely non-reproducible. Possibility worse that a Git
> branch, where you can potentially at least trace back which commit was
> built, and re-do that same build.
>
> So I'd like to start the debate on whether it might makes sense to
> relax our requirements on this, and be more pragmatic, and support
> fetching from Git branches. Of course, this very likely needs to be
> guarded by a Config.in option, so that we clearly set the boundary
> between "you're in the safe zone where your build is reproducible" and
> "you're in the zone where your build is non-reproducible".
>

As you've hinted at it should be possible to at least track the git
describe --always --dirty (or hg equivalent) to provide some level of
traceability even if it's not complete binary equvialence.


> And now, let's the flames start! :-)
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
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200115/94cd88c4/attachment.html>

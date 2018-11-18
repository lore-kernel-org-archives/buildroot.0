From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 18 Nov 2018 08:41:38 -0600
Subject: [Buildroot] [PATCH 4/4 v2] support/dependencies: add a check
 for a suitable gzip
In-Reply-To: <20181118134403.GB2601@scaer>
References: <cover.1542474939.git.yann.morin.1998@free.fr>
 <ba548d03f79279b7f02605006a709ffc630e8639.1542474939.git.yann.morin.1998@free.fr>
 <CANQCQpY9KckNd=VjAu7AHuUeURoCRhY=5gP-wfOf_-Kog0e-sg@mail.gmail.com>
 <20181118134403.GB2601@scaer>
Message-ID: <CANQCQpYSBb27wxgtaJMHLguWO1crNuThsJ5Ys8+6gWhZ5tMstQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Nov 18, 2018 at 7:44 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Matthew, All,
>
> On 2018-11-17 11:23 -0600, Matthew Weber spake thusly:
> > On Sat, Nov 17, 2018 at 11:16 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > Add a dependency check that ensures that gzip is not pigz. If that is
> > > the case, define a conditional dependency to host-gzip, that is used as
> > > a download dependency for packages that will generate compressed files,
> > > i.e. cvs, git, and svn.
> [--SNIP--]
> > (Not wanting to hijack the intent of this patch :-) )
> > As part of a reproducible build, why should we conditionally build
> > these dependencies and not instead always build them.  Then builds
> > start become reproducible with the same cached dl folder of material
> > across a series of distro releases?  Best example I have is a product
> > that is under development for 2-3years and we may have a spread of
> > build machine distros (ie Ubuntu 14 -> 18 LTS).  We've recently
> > started to run into this as products stabilize with the Buildroot
> > concept of having these conditional host dependencies building.  Where
> > depending on the machine, we may miss a source archive in our
> > collection of dl material at release time.  Thoughts?
>
> So, two things, that are contradictory one to the other:
>
>  1- we want reproducible builds,
>  2- we want fast builds
>
> For 1, it would mean that we should build as much tools as possible.
> However, the more we build, the slower the build is.
>

I'm definitely not advocating for building all the tools and libraries
we use from the host distro packages.  The case I'm running into is
when additional host dependency checks/builds are added over time to
Buildroot, it changes the consistency of the necessary set of cached
dl archives depending on the machine you execute on.  I do agree using
a standard container or VM instance is the way to capture and define
that "consistent environment".  More times then not, I find that I
can't control the OS users use for a dev env (many devops teams,
timelines, "favorite OS", financial constraints, engineer opinions :-)
).

Use cases
1) We have a Sandbox environment which is engineered to create
consistent offline rebuilds from a given set off offline inputs.  This
sandbox environment can't change as often as the distro used for day
to day development.  ie. need lots of projects to use the consistent
environment to get our money out of the setup/doc effort.  Normally
we'd update the environment every ~4yrs.  This mis-match of distro/env
versions results in us doing some additional test builds in the
sandbox and our day-to-day envs to identify the conditional host pkg
builds.
2) Corporate network/proxy and offline builds.  A user prepares to
take a set of files offline and collects their material on distro
14.x.y.z (when online) and then had the same distro but 14.x (offline)
that triggered a dependency build requiring another archive.

> For 2, we should rely as much as possible on distro-provided tools,
> However, the more we rely on the host, the less reproducible we get.
>
> gzip has been rock stable over the years. IIRC, I took one of the first
> releases from way back 1993-or-so, and the latest one, 1.9; they were
> generating the exact same output, 25 years apart! That, is stability.
>
> Given the goals of the gzip authors and maintainers, I don't expect they
> change anything to it anytime.
>
> So, we really don't want to build it if the host provides it.
>

Agree.  What about adding the option that if only the reproducible
option is enabled, then we build all host tools we have a version
dependency on (ie. all those we'd normally just conditionally build)?

> Now, we can't know what the future will be, and we can't predict what
> other tool is gonna change its behaviour, that we have to build our
> own. So, when you update to a newer host, you'll also have to adapt,
> even if that means adding a few new archives to your BR2_DL_DIR, yes.
>

I'm actually worried/experiencing the opposite.  It's when our distro
versions are newer during development and we go back to a older OS for
release or CI.

> If you want to be sure that, in the future, you'll be as reproducible as
> possible, then do a chroot. Even now, having a chroot ensures that all
> users/developpers of your project have a known and reproducible devel
> environment (no more "it builds for me" arguments!) You may even go
> further, and mandate a VM, and even go as far as having HW spares for
> the project lifetime (to run the VM on!).
>

Yeah, the hard part is the $/time investment in those VM and dev
environments means (at least for my company) they don't change as
often and we've found you always end up with a different/new one on
the next new project.  As a Linux team supporting our own env and a
series of dev configurations, we start to see some of the use cases
appear.  For instance I currently have a projects with dev envs close
to my Buildroot build machine distro version and a project on the
fringe of support.   Generally this spread of versions is Ok with our
projects only having a ~1-2yr development cycle before feature
complete.  It does mean we get caught occasionally by things like the
conditional host dependencies.  Internally we'll carry a patch to make
this consistant but I figured I'd bring it up and see if collectively
this would be a good upstream change.

Thanks for the feedback Yann!

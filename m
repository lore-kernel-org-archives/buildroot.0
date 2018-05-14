From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 14 May 2018 18:00:07 +0000
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <CAOesGMimW+-9zEaSoJk0-Xjwg7O6-NJ3fXMYDdkzGRDUSaKB9A@mail.gmail.com>
References: <20180511172314.28ba9f80@windsurf.home>
 <20180511215508.GA28572@jaya>
 <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
 <704976570.261553.1526089365924.JavaMail.zimbra@datacom.com.br>
 <20180512142738.GB3674@momiji.home>
 <CAMWSM7gzGhpgRB-xXqNreQtvwR27d+UQuGUZ35_5uwhNY6gonA@mail.gmail.com>
 <CAOesGMimW+-9zEaSoJk0-Xjwg7O6-NJ3fXMYDdkzGRDUSaKB9A@mail.gmail.com>
Message-ID: <1526320807.30073.31.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2018-05-12 at 10:51 -0700, Olof Johansson wrote:
> On Sat, May 12, 2018 at 10:06 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> > On Sat, May 12, 2018 at 6:27 AM, Adrian Perez de Castro
> > <aperez@igalia.com> wrote:
> > > On Fri, 11 May 2018 22:42:45 -0300 (BRT), Carlos Santos <casantos@datacom.ind.br> wrote:
> > > > > From: "ratbert90" <aduskett@gmail.com>
> > > > > To: anisse at astier.eu, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> > > > > 
> > > > 
> > > > Makes me wonder why they don't use a BR2_EXTERNAL.
> > > 
> > > Probably because (AFAIK) it is not yet possible to override base package in
> > > a BR2_EXTERNAL. I have tripped on this myself a couple of times, and ended
> > > up providing a top-level Makefile in the repo for my BR2_EXTERNAL which
> > > downloads a certain version of the Buildroot tarball and applies a couple
> > > of patches over it, then proceeds to chain up to the Buildroot Makefiles
> > > passing the path BR2_EXTERNAL path down to them (so from the point of view
> > > of somebody building, they just download the BR2_EXTERNAL repo and do ?make
> > > foo_defconfig && make?).

Since the external mk file is included after all of buildroot's
internal packages and infrastructure files, it's possible to re-define
variables from buildroot packages in external.  In some case this could
can be a way to override or patch a buildroot package via BR2_EXTERNAL
instead of as a patch to buildroot.

> > I do the same thing. The top level Makefile exports BR2_EXTERNAL="..",
> > there's a target for cloning and checking out a specific Buildroot
> > revision, then there's a wildcard pattern at the end to pass any
> > unrecognized targets up to Buildroot's Makefile, so things like
> > "linux-menuconfig" still work.

> I liked the split of having third party software in an upstream-based
> separate buildroot repo, and only proprietary components in
> BR2_EXTERNAL. That way it's easier to separate out the portion you
> need to share for compliance (i.e. see current github contents), while
> having a place to keep confidential material, work on new
> configs/products/prototypes/internal uses that are not yet released,
> etc in the BR2_EXTERNAL. As expressed above, wrapping it with a second
> layer of makefiles makes it relatively easy to deal with.

We have a top-level project with a top level Makefile that contains the
 BR2_EXTERNAL tree.  I.e., the BR2_EXTERNAL tree is the top level
project.  Buildroot exists as a git submodule in a directory of this
project.  We can update buildroot by pulling from upstream and rebasing
and can git format-patch a patch to send to the list.

We patch buildroot if:
1. We think the patch is upstreamable.
2. There appears to be no reasonable way to accomplish what we want
otherwise.

The top level makefile uses a pattern rule to provide a target for
every defconfig that exists in br2-external/configs directory.  It'll
call buildroot's build with BR2_EXTERNAL and O set build that defconfig
into an output directory.  Or just do a buildroot *_defconfig call but
not actually build.

buildroot sets itself up so that once you go to the output directory,
there is a Makefile that will execute any buildroot target (menuconfig,
pkg-rebuild, all, etc.) with BR2_EXTERNAL configured.

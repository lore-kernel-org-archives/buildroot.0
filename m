From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 7 Apr 2020 09:37:43 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] toolchain: bump ARC tools
 to arc-2020.03-eng002
In-Reply-To: <20200407060912.GB22325@scaer>
References: <20200406140719.41518-1-Evgeniy.Didin@synopsys.com>
 <20200407060912.GB22325@scaer>
Message-ID: <CY4PR1201MB0120B779B9C5AB3AA1BCE0E7A1C30@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> On 2020-04-06 17:07 +0300, Evgeniy Didin spake thusly:
> > This commit bumps ARC toolchain to arc-2020.03-eng002. We want
> > to test how new toolchain-eng002 builds packages, so we can make
> > fixes before release of toolchain.
> >
> > Please note that it is an engineering build and it might have
> > all kind of breakages, please don't use it for production builds.
> 
> So why would we want to have it in Buildroot?
> 
> If you need to have some confidence about your toolchain, you could spin
> your own autobuilder and check the results (but not send them for
> a.b.o).
> 
> I've marked the patch as rejected, sorry.

I think we've been doing that for years. See:
--------------------->8-----------------
$ git log --author=synopsys --oneline package/gcc | grep eng
12ebdfd37c toolchain: bump ARC tools to arc-2019.09-eng002
f3436357cf toolchain: Bump ARC tools to arc-2017.03-eng008
eb6873b1d1 toolchain: Bump ARC tools to arc-2016.09-eng015
999c7048c1 toolchain: Bump ARC tools to arc-2016.09-eng013
9b77525c9a toolchain: Bump ARC tools to arc-2016.09-eng011
e227e6bf50 toolchain: Bump ARC tools to arc-2016.09-eng010
f0e1381ef9 toolchain: Bump ARC tools to arc-2016.09-eng008
3897ded714 toolchain: Bump ARC tools to arc-2016.09-eng007 and enable PIE
c88d547460 toolchain: Bump ARC tools to arc-2016.09-eng006
4520524ba0 toolchain: Bump ARC tools to arc-2016.09-eng005
--------------------->8-----------------

And it's not only for spinning our WIP, as a matter of fact we
never post real WIP snapshots because that will introduce way too many
breakages we'll need to fix, so only when our extensive internal testing
shows acceptable results we're ready to use it for something else.

And there's yet another reason: that way we secure our more
recent toolchain in the next Buildroot release. See that eng002 is
supposed to become RC1 but now we're gated by some problems with Eclipse
IDE plugins (see https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/255)
and just because of that non-related to the GNU toolchain itself problem we
might be ready to post RC1 (not to mention final release) in Buildroot
a bit too late and so use older toolchain for ARC until the next release
in a few months.

But if by the time of Buildroot's RC1 we have whatever pre-release version
of newer ARC GNU tools merged then we may easily bump version number before
Buildroot's release and in the worst case except name there will be 1 or 2
fixes.

And as usual I'm happy to mention that we're getting closer and closer to
upstream so that in GCC10 we have pretty much all the changes we need as well
as upcoming Binutils as of now have everything for ARC. So I do expect to
drop ARC-fork from Buildroot soon in favor of just a few patches on top of the most
recent release.

-Alexey

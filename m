From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 4 May 2017 15:57:03 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-02
In-Reply-To: <20170504174635.3d7f060c@free-electrons.com>
References: <20170503062809.135BB207F9@mail.free-electrons.com>
 <CAOMZO5B9sPeE+_YH4nWykogzB_dq7XUpz0AraMXjgazZjA_DxA@mail.gmail.com>
 <CAOMZO5BbPjn9b6i1uDr01ikFsSHWy9xkzfpk7F7GhssQyCuuJw@mail.gmail.com>
 <20170504093049.27618dbf@free-electrons.com>
 <035B547B-A554-4715-A235-95E6A1E14EE9@uclibc-ng.org>
 <20170504095750.7cb38619@free-electrons.com>
 <87r305au17.fsf@dell.be.48ers.dk> <1493912093.7376.14.camel@synopsys.com>
 <20170504174635.3d7f060c@free-electrons.com>
Message-ID: <1493913422.7376.18.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2017-05-04 at 17:46 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 4 May 2017 15:34:55 +0000, Alexey Brodkin wrote:
> 
> > 
> > Unfortunately in the beginning of the current toolchain development cycle
> > we decided to stay on uClibc-ng 1.0.17 + backported ARC-related patches
> > due to different reasons and given we're now on rc2 stage there's no chance
> > to switch to any other version unfortunately. I hope next dev cycle we'll use just
> > latest upstream uClibc-ng release.
> 
> OK. Can you make sure to enable wordexp as well?

I'll try to :)

> 
> > 
> > We're talking only about __prebuilt__ ARC toolchain right?
> > Because Buildroot-built tools use latest uClibc-ng with correct config.
> 
> Wow, I just discovered that our autobuilders were not properly setup.
> They are not supposed to test the Synopsys pre-built toolchain, but a
> Buildroot pre-built toolchain. But they are testing the Synopsys
> pre-built toolchain.

Yeah, I was really surprised ARC prebuilt tools are now tested
by BR autobuilder - I was sure it was disabled quite some time ago
but then I thought for some reason it got added back again :)

> To clarify things, we have three toolchain possibilities:
> 
> ?- The internal toolchain backend, Buildroot builds the entire
> ???toolchain from scratch for every build. This is what the base
> ???configuration
> ???https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_toolchains_configs_br-2Darc-2Dfull-2Dinternal.config&d=DwIFaQ&c=DPL6_
> X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=lI2tCqR-PmGs3JqLc-
> Snnhmqzt6zHKZM_7hqymaPhQM&s=IcnEnd9QveBxXM9nhFjGxcVn_aw5IOBaVZ6TR9HLVog&e=?
> ???is doing.
> 
> ?- The external toolchain backend that uses a custom toolchain, itself
> ???built by Buildroot. This one I have rebuilt recently with uClibc-ng
> ???1.0.24 and wordexp. It is the toolchain configuration supposed to be
> ???tested by
> ???https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_toolchains_configs_br-2Darcle-2Dhs38.config&d=DwIFaQ&c=DPL6_X_6JkXFx7
> AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=lI2tCqR-PmGs3JqLc-
> Snnhmqzt6zHKZM_7hqymaPhQM&s=vIRYBsKYcVzHuV5wdpe9R3huxW1q_X_Lz3MQXD1XEWo&e= .
> ???Except that this file lacks BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y, so
> ???instead of using the custom toolchain specified in this defconfig,
> ???it uses the Synopsys pre-built toolchain. Weird that Arnout's check
> ???that all lines of the base configuration are still present in the
> ???final configuration doesn't detect this.
> 
> ?- The external toolchain backend that uses the Synopsys provided
> ???pre-built toolchain, through the toolchain-external-synopsys-arc
> ???package. This is *NOT* supposed to be tested by the autobuilders
> ???currently.
> 
> > 
> > Ideally I'd prefer to update affected packages so they are disabled for
> > ARC prebuilt tools with some easily greppable comment like:
> > ----------------->8-----------------??
> > ?xxx yyy zzz # arc_prebuilt lacks wordexp
> > ----------------->8-----------------??
> > that will help us to track missing parts we need to work on in the future.
> > Otherwise we may just disable autobuilder for ARC prebuilt tools because:
> > 
> > 1) There's no such thing as prebuilt engineering builds i.e. autobuilder
> > ? ?only will test either RCs or final releases of ARC prebuilt tools which
> > ? ?IMHO makes not much sense as that's a bit too late, rgiht?
> > 
> > 2) We know there're differences in ARC prebuilt tools from what gets built in
> > ? ?Buildroot still having ARC prebuilt tools is a nice opportunity to
> > ? ?simplify life for some people who prefers to not build toolchain
> > ? ?themselves and for basic stuff it usually works quite fine.
> 
> Sorry, but I don't understand what you suggested here. In the light of
> my explanation above, could you clarify what you mean by "ARC prebuilt
> tools" ?

Scratch it then :)

If ARC prebuilt tools are not used by BR autobuilder there's no sense in
touching packages affected by these tools.

-Alexey

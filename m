From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:46:35 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-02
In-Reply-To: <1493912093.7376.14.camel@synopsys.com>
References: <20170503062809.135BB207F9@mail.free-electrons.com>
 <CAOMZO5B9sPeE+_YH4nWykogzB_dq7XUpz0AraMXjgazZjA_DxA@mail.gmail.com>
 <CAOMZO5BbPjn9b6i1uDr01ikFsSHWy9xkzfpk7F7GhssQyCuuJw@mail.gmail.com>
 <20170504093049.27618dbf@free-electrons.com>
 <035B547B-A554-4715-A235-95E6A1E14EE9@uclibc-ng.org>
 <20170504095750.7cb38619@free-electrons.com>
 <87r305au17.fsf@dell.be.48ers.dk>
 <1493912093.7376.14.camel@synopsys.com>
Message-ID: <20170504174635.3d7f060c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 May 2017 15:34:55 +0000, Alexey Brodkin wrote:

> Unfortunately in the beginning of the current toolchain development cycle
> we decided to stay on uClibc-ng 1.0.17 + backported ARC-related patches
> due to different reasons and given we're now on rc2 stage there's no chance
> to switch to any other version unfortunately. I hope next dev cycle we'll use just
> latest upstream uClibc-ng release.

OK. Can you make sure to enable wordexp as well?

> We're talking only about __prebuilt__ ARC toolchain right?
> Because Buildroot-built tools use latest uClibc-ng with correct config.

Wow, I just discovered that our autobuilders were not properly setup.
They are not supposed to test the Synopsys pre-built toolchain, but a
Buildroot pre-built toolchain. But they are testing the Synopsys
pre-built toolchain.

To clarify things, we have three toolchain possibilities:

 - The internal toolchain backend, Buildroot builds the entire
   toolchain from scratch for every build. This is what the base
   configuration
   http://autobuild.buildroot.net/toolchains/configs/br-arc-full-internal.config
   is doing.

 - The external toolchain backend that uses a custom toolchain, itself
   built by Buildroot. This one I have rebuilt recently with uClibc-ng
   1.0.24 and wordexp. It is the toolchain configuration supposed to be
   tested by
   http://autobuild.buildroot.net/toolchains/configs/br-arcle-hs38.config.
   Except that this file lacks BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y, so
   instead of using the custom toolchain specified in this defconfig,
   it uses the Synopsys pre-built toolchain. Weird that Arnout's check
   that all lines of the base configuration are still present in the
   final configuration doesn't detect this.

 - The external toolchain backend that uses the Synopsys provided
   pre-built toolchain, through the toolchain-external-synopsys-arc
   package. This is *NOT* supposed to be tested by the autobuilders
   currently.

> Ideally I'd prefer to update affected packages so they are disabled for
> ARC prebuilt tools with some easily greppable comment like:
> ----------------->8-----------------  
> ?xxx yyy zzz # arc_prebuilt lacks wordexp
> ----------------->8-----------------  
> that will help us to track missing parts we need to work on in the future.
> Otherwise we may just disable autobuilder for ARC prebuilt tools because:
> 
> 1) There's no such thing as prebuilt engineering builds i.e. autobuilder
> ? ?only will test either RCs or final releases of ARC prebuilt tools which
> ? ?IMHO makes not much sense as that's a bit too late, rgiht?
> 
> 2) We know there're differences in ARC prebuilt tools from what gets built in
> ? ?Buildroot still having ARC prebuilt tools is a nice opportunity to
> ? ?simplify life for some people who prefers to not build toolchain
> ? ?themselves and for basic stuff it usually works quite fine.

Sorry, but I don't understand what you suggested here. In the light of
my explanation above, could you clarify what you mean by "ARC prebuilt
tools" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

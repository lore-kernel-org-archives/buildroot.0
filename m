From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 5 Mar 2021 10:22:26 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <6cb4a8d7-bee8-5712-2cac-1259d01e288e@benettiengineering.com>
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home>
 <6cb4a8d7-bee8-5712-2cac-1259d01e288e@benettiengineering.com>
Message-ID: <20210305102226.49bc0b0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Fri, 5 Mar 2021 08:56:32 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Yes, I've filed it time ago here:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
> 
> Then maintainer wanted me to provide all pre-preprocessed files and all 
> build flags. There the issue was showing using Codesourcery only, but 
> here we have a Buildroot toolchain, so better chance to dig.

Indeed!

> Anyway I can add patches to add the _BUG_ and use the -O0 workaround. 
> What about that?

Sure, sounds good.

> >>     nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/71f26fd81db8e9b19b3f18f3f3cefd9c768f094f |  
> > 
> > /tmp/ccDtjRfo.s: Assembler messages:
> > /tmp/ccDtjRfo.s:210798: Error: branch offset out of range
> > 
> > Another wonderful nios2 toolchain issue. Giulio, what do you think ?  
> 
> This is new to me, I've checked on Gcc Bugzilla and it doesn't seem to 
> be there. So I can file it up and look for a workaround, maybe the usual 
> -O0.

With these errors, I'm never sure if it's a gcc issue (that emits bogus
assembly) or a binutils issue. But most likely a gcc issue.

> >>     nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d | ORPH  
> > 
> > Some more nios2 toolchain issue.  
> 
> This is very similar to one of Microblaze gcc bugs. So I could be able 
> to workaround it with the same -O0.

OK.

Maybe we should default to -O2 for those funky architectures? Indeed,
our default is -Os, but this is perhaps less widely used/tested than
-O2 ?

Or are the bugs in question also appearing at -O2 ?

> > Should we get rid of nios2 support entirely ?  
> 
> Here it seems we get to the same point of Microblaze, if there is no 
> hurry I can provide patches to save Nios the same way I've done for 
> Microblaze.

My concern is that those gcc issues for nios2/microblaze never seem to
be fixed. That there are gcc issues that we need to workaround, it's
fine I guess, but that they stay forever is more annoying.


> >>      arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/d9b9a4b7c3660bd730a19ab09e44f24bc29e3f40 | ORPH
> >>      arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/13f9a551f5ac911e7daa2a382b0683d81486cffa | ORPH  
> > 
> > toolchain is gone ?  
> 
> Here it's Micronova firewall that blocks it, I've just written to my IT.

OK, thanks!

> >>    powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/159d2c07060c235080711d1d0da0b2eae995d4bf |  
> > 
> > This is a top-level parallel build issue... but since we don't have the
> > full log, we don't have the error.
> > 
> > Should we perhaps keep the full log, compressed, for builds done in
> > parallel ?  
> 
> I see it's on my Autobuilder, what can I do to provide suck full log? Do 
> you mean the entire Buildroot log? If yes I can try to reproduce it and 
> save it on a file and post it in some way.

Now that the build is finished, the build log is gone. My proposal here
was to adjust the autobuild-run script to upload to
autobuild.buildroot.org the full build log (compressed) when the build
is a top-level parallel build.

> >>      or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ed105d321c0bde99c293ab7328d57c3764db6f27 |
> >>      or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce351e0e97c2cacc17d4718d39941548c7558559 |  
> > 
> > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.33.1 assertion fail elf32-or1k.c:2329
> > collect2: error: ld returned 1 exit status
> > 
> > Giulio, is this a known or1k issue ?  
> 
> Yes, for this I've sent a patchset time ago:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=161548
> 
> So basically zeromq should be disabled like protobuf. But need to check it.
> 
> You've also answered me here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200228175814.128730-1-giulio.benetti at benettiengineering.com/
> 
> Here it seems the same situation as Nios and Microblaze.
> 
> For this I can provide patches too if not in hurry.

Maybe we should be pragmatic here and just take your patches as-is.

Thanks for all the feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 19:12:54 +0200
Subject: [Buildroot] Reducing buildroot compile times by reusing
 toolchain?
In-Reply-To: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484CBB@AMEHLEX02.ehl.pri>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
 <20140930113024.74091a8f@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484CBB@AMEHLEX02.ehl.pri>
Message-ID: <20140930191254.39dfccca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Sep 2014 15:04:56 +0000, Paassen, Hiram van wrote:

> Sure but if you are using another buildroot folder, would it not be
> possible to distill that either from that buildroots kconfig file or let
> that buildroot create a special file on build which describes the
> created toolchain and include that? Similar to whats in
> "br-arm-full.config"

We could have a tool that "scans" a given toolchain and generates a
minimal Buildroot config file from that.

But again, have you actually tried what you're talking about? It's
_very_ easy to use an existing toolchain as an external toolchain in
Buildroot. If you're using glibc, there's basically 2 or 3
configuration options to be filled in. If you're using uClibc, there's
a little more, maybe 8 or 10, but not more. And all of those values are
checked, so there's hardly a way for a user to make a mistake at this
level.

> >  * Beyond Buildroot toolchains, there are also other toolchain
> >    providers, such as Sourcery CodeBench or Linaro. Depending on the
> >    architecture you're targeting, this may be interesting to explore.
> >
> >  * We also provide pre-built Buildroot toolchains as part of our
> >    autobuild infrastructure. If you look at
> >    http://autobuild.buildroot.org/toolchains/configs/, all the files
> >    starting in "br-" are minimal configurations using pre-built
> >    Buildroot toolchains. For example,
> >    http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config
> >    is using a Buildroot uClibc ARM toolchain, targeted at ARM926.
> >
> Well I suppose I should spend some time to understand that part of
> buildroot. Currently were always using the "buildroot-toolchain" but it
> seems that is not a common case given the amount of replies which
> suggest using an external toolchain.

Using the "internal backend" (where Buildroot builds the toolchain) is
quite common. It really depends on the use cases. But since I'm amongst
the people who have put a lot of effort in the external toolchain
support, I certainly believe it's a very useful way of using Buildroot.

> I understand that it is not possible to do a partial rebuild of target.
> But in this case I expect that lftp is also rebuild since it needs to be
> installed in $(TARGET_DIR). But would this not work if say
> "make-clean-target" removes $(TARGET_DIR) and all package build dirs
> which need to be installed in $(TARGET_DIR) (and possibly
> $(STAGING_DIR)) and leaves everything else.

But then we would have to cleanup the $(STAGING_DIR) entirely as well.

> I expect that everything that needs does not install something in
> $(TARGET_DIR) is the set of packages named "host-*" so if I can "make
> clean" without rebuilding all that is already a win for us.
> 
> Of course when using an external toolchain there is not much use for
> this target since the toolchain/"host-*" building part is much smaller
> in that case

Right. There are still a bunch of host tools besides the toolchain
itself, that can take a bit of time to build.

However, the general feeling of the Buildroot developers is that such
techniques usually have a lot of corner cases: they work in many cases,
but not in all cases. And since we want a tool that is simple to use
and understand, we dislike quite a lot those techniques that are not
working properly 100% of the time.

> Well in some sense you could implement this as treating the compiled
> toolchain as being a preconfigured preextracted external toolchain
> except for when it is not yet compiled?

Sorry, I did not understand your suggestion here.

> >  * Use an external toolchain.
> I think I am going to make my own buildroot-toolchain tarball for me and
> my colleagues for now. :-)

Yes, if you have a team, it's generally the good thing to do.

> >  * Enable ccache if you do repeated builds with the same toolchain.
> Already on
> >  * Buy a faster machine. And if you use a virtual machine like VMWare
> >    or VirtualBox, throw it away, and do your build on a real physical
> >    machine.
> >
> Our build using eglibc, systemd and python takes (including toolchain)
> 45 min on my i7 quad-core laptop. At least half of that seems to be the
> toolchain and other "host" tools. I prefer a faster machine but I
> suspect my boss won't give that to me given that I already have the
> fastest machine in the office.

Ok, your machine looks good. If you don't have a SSD, switch to a SSD,
it's going to speed up the build nicely.

Also, do a completely clean build:

	make clean all

And then, generate a graph of the build time:

	make graph-build

Once this is done, look in $(O)/graphs/, and look at the PDF files that
were generated. It will give you some hints as to where the build time
is spent.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

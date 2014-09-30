From: Paassen, Hiram van <Hiram.van.Paassen@mastervolt.com>
Date: Tue, 30 Sep 2014 15:04:56 +0000
Subject: [Buildroot] Reducing buildroot compile times by reusing
 toolchain?
In-Reply-To: <20140930113024.74091a8f@free-electrons.com>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
 <20140930113024.74091a8f@free-electrons.com>
Message-ID: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484CBB@AMEHLEX02.ehl.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to cc the list


On di, 2014-09-30 at 11:30 +0200, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 30 Sep 2014 08:02:34 +0000, Paassen, Hiram van wrote:
>
> > We are using buildroot to build two images for the same target
> > platform. We noticed that most of the build time is in building the
> > host tools. I'd like to reduce our build time and noticed the option
> > to use an external toolchain.
>
> Absolutely.
>
> > Would it be possible to add an option to the external toolchain menu
> > to use a buildroot toolchain as external toolchain? This is probably
> > possible right now but then I have to know exactly what to fill in. I
> > imagine that buildroot would be able to infer all those options from
> > another buildroot installation/out-of-tree-build. I can imagine that
> > such an option would simplify the reuse of the toolchain for our
> > other build.
>
> I don't really see how this would work. The main issue here is that
> we need to know the characteristics of the toolchain (C library being
> used, toolchain options, etc.) at the kconfig level (i.e the
> configuration menu). And this is done before Buildroot gets the chance
> to start the build to find out by itself the characteristics of the
> toolchain.
Sure but if you are using another buildroot folder, would it not be
possible to distill that either from that buildroots kconfig file or let
that buildroot create a special file on build which describes the
created toolchain and include that? Similar to whats in
"br-arm-full.config"
>
> However, what Buildroot does is that it verifies that the
> characteristics of the toolchain declared in menuconfig actually match
> the external toolchain being provided. This means that there is
> basically zero chance for you to use an invalid configuration.
>
> Also:
>
>  * Beyond Buildroot toolchains, there are also other toolchain
>    providers, such as Sourcery CodeBench or Linaro. Depending on the
>    architecture you're targeting, this may be interesting to explore.
>
>  * We also provide pre-built Buildroot toolchains as part of our
>    autobuild infrastructure. If you look at
>    http://autobuild.buildroot.org/toolchains/configs/, all the files
>    starting in "br-" are minimal configurations using pre-built
>    Buildroot toolchains. For example,
>    http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config
>    is using a Buildroot uClibc ARM toolchain, targeted at ARM926.
>
Well I suppose I should spend some time to understand that part of
buildroot. Currently were always using the "buildroot-toolchain" but it
seems that is not a common case given the amount of replies which
suggest using an external toolchain.

> > Secondly, we run "make clean" often since buildroot cannot
> > automatically remove stuff from the target directory however running
> > "make clean" also removes the toolchain. would it be possible to make
> > a "make clean-target" that would delete the target and possible the
> > staging directory and would rebuild everything except the
> > host/toolchain stuff. Or did I miss something and is such a target
> > already possible?
>
> We do not provide this possibility because we cannot implement this in
> a safe way.
>
> Scenario:
>
>  1. You enable the lftp package, and also the openssl package in
>     menuconfig.
>
>  2. You start the build. Since lftp optionally depends on openssl,
>     openssl will be built first, and then lftp. lftp is therefore build
>     with openssl support, and relies on the openssl libraries to be
>     installed in the target.
>
>  3. The build is finished, you now have both lftp and openssl installed
>     in your target filesystem. Everything is fine.
>
>  4. Now, you remove openssl from menuconfig. Of course, lftp is still
>     enabled.
>
>  5. You do your new "cleanup target and reinstall everything" thing. It
>     will install the already built lftp in the target. But it will not
>     install openssl, because the package is no longer enabled.
>
>  6. You know have a broken root filesystem: lftp is linked with the
>     openssl libraries, but those libraries were not installed in the
>     target.
>
> Since Buildroot is very simple and does not track which package
> installs what, and which package should be rebuilt when other packages
> are enabled/disabled, we cannot provide the feature you request in a
> safe way.
>
> We could of course provide it, but then you would see lots and lots of
> weird situations like the one exposed above. And it would be very
> complicated for us to provide support to people falling into those
> situations.
>
I understand that it is not possible to do a partial rebuild of target.
But in this case I expect that lftp is also rebuild since it needs to be
installed in $(TARGET_DIR). But would this not work if say
"make-clean-target" removes $(TARGET_DIR) and all package build dirs
which need to be installed in $(TARGET_DIR) (and possibly
$(STAGING_DIR)) and leaves everything else.

I expect that everything that needs does not install something in
$(TARGET_DIR) is the set of packages named "host-*" so if I can "make
clean" without rebuilding all that is already a win for us.

Of course when using an external toolchain there is not much use for
this target since the toolchain/"host-*" building part is much smaller
in that case

Well in some sense you could implement this as treating the compiled
toolchain as being a preconfigured preextracted external toolchain
except for when it is not yet compiled?

> Some final recommendations:
>
>  * Use an external toolchain.
I think I am going to make my own buildroot-toolchain tarball for me and
my colleagues for now. :-)

>  * Enable ccache if you do repeated builds with the same toolchain.
Already on
>  * Buy a faster machine. And if you use a virtual machine like VMWare
>    or VirtualBox, throw it away, and do your build on a real physical
>    machine.
>
Our build using eglibc, systemd and python takes (including toolchain)
45 min on my i7 quad-core laptop. At least half of that seems to be the
toolchain and other "host" tools. I prefer a faster machine but I
suspect my boss won't give that to me given that I already have the
fastest machine in the office.
> Best regards,
>
> Thomas




________________________________

Power Products, LLC Email Notice

This message is intended only for the use of the Addressee and may contain information that is PRIVILEGED and/or CONFIDENTIAL.
This email is intended only for the personal and confidential use of the recipient(s) named above. If the reader of this email is not an intended recipient, you have received this email in error and any review, dissemination, distribution or copying is strictly prohibited.
If you have received this email in error, please notify the sender immediately by return mail and permanently delete the copy you received.

Thank you.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/a9dd4123/attachment.html>

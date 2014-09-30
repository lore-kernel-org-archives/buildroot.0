From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 11:30:24 +0200
Subject: [Buildroot] Reducing buildroot compile times by reusing
 toolchain?
In-Reply-To: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
Message-ID: <20140930113024.74091a8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Sep 2014 08:02:34 +0000, Paassen, Hiram van wrote:

> We are using buildroot to build two images for the same target
> platform. We noticed that most of the build time is in building the
> host tools. I'd like to reduce our build time and noticed the option
> to use an external toolchain. 

Absolutely.

> Would it be possible to add an option to the external toolchain menu
> to use a buildroot toolchain as external toolchain? This is probably
> possible right now but then I have to know exactly what to fill in. I
> imagine that buildroot would be able to infer all those options from
> another buildroot installation/out-of-tree-build. I can imagine that
> such an option would simplify the reuse of the toolchain for our
> other build.

I don't really see how this would work. The main issue here is that
we need to know the characteristics of the toolchain (C library being
used, toolchain options, etc.) at the kconfig level (i.e the
configuration menu). And this is done before Buildroot gets the chance
to start the build to find out by itself the characteristics of the
toolchain.

However, what Buildroot does is that it verifies that the
characteristics of the toolchain declared in menuconfig actually match
the external toolchain being provided. This means that there is
basically zero chance for you to use an invalid configuration.

Also:

 * Beyond Buildroot toolchains, there are also other toolchain
   providers, such as Sourcery CodeBench or Linaro. Depending on the
   architecture you're targeting, this may be interesting to explore.

 * We also provide pre-built Buildroot toolchains as part of our
   autobuild infrastructure. If you look at
   http://autobuild.buildroot.org/toolchains/configs/, all the files
   starting in "br-" are minimal configurations using pre-built
   Buildroot toolchains. For example,
   http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config
   is using a Buildroot uClibc ARM toolchain, targeted at ARM926.

> Secondly, we run "make clean" often since buildroot cannot
> automatically remove stuff from the target directory however running
> "make clean" also removes the toolchain. would it be possible to make
> a "make clean-target" that would delete the target and possible the
> staging directory and would rebuild everything except the
> host/toolchain stuff. Or did I miss something and is such a target
> already possible?

We do not provide this possibility because we cannot implement this in
a safe way.

Scenario:

 1. You enable the lftp package, and also the openssl package in
    menuconfig.

 2. You start the build. Since lftp optionally depends on openssl,
    openssl will be built first, and then lftp. lftp is therefore build
    with openssl support, and relies on the openssl libraries to be
    installed in the target.

 3. The build is finished, you now have both lftp and openssl installed
    in your target filesystem. Everything is fine.

 4. Now, you remove openssl from menuconfig. Of course, lftp is still
    enabled.

 5. You do your new "cleanup target and reinstall everything" thing. It
    will install the already built lftp in the target. But it will not
    install openssl, because the package is no longer enabled.

 6. You know have a broken root filesystem: lftp is linked with the
    openssl libraries, but those libraries were not installed in the
    target.

Since Buildroot is very simple and does not track which package
installs what, and which package should be rebuilt when other packages
are enabled/disabled, we cannot provide the feature you request in a
safe way.

We could of course provide it, but then you would see lots and lots of
weird situations like the one exposed above. And it would be very
complicated for us to provide support to people falling into those
situations.

Some final recommendations:

 * Use an external toolchain.
 * Enable ccache if you do repeated builds with the same toolchain.
 * Buy a faster machine. And if you use a virtual machine like VMWare
   or VirtualBox, throw it away, and do your build on a real physical
   machine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

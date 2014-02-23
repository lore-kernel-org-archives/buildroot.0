From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 11:18:39 +0100
Subject: [Buildroot] What's the buildroot attitude to u-boot building?
In-Reply-To: <leb2a2$688$1@ger.gmane.org>
References: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
 <le7p26$n75$1@ger.gmane.org> <20140222000428.77575be9@skate>
 <leb2a2$688$1@ger.gmane.org>
Message-ID: <20140223111839.1ef569b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Grant Edwards,

On Sat, 22 Feb 2014 20:45:54 +0000 (UTC), Grant Edwards wrote:

> > Do you have more details about what you found unpractical in Buildroot
> > to build U-Boot and your kernel? What issues did you had, or things you
> > found not really nice?
> 
> First, I should have prefaced my comments by saying that was a couple
> years ago, so things may be different now.
> 
> There are two main reasons I switched to building the kernel and
> U-Boot outside buildroot:
> 
> 1) U-Boot, the Linux kernel, and the root FS are three differnt
>    "things".  The binaries are versioned and archived independently,
>    they have separate part numbers, and they're distributed and
>    installed independently.  Building all three of them together at
>    the same time with buildroot doesn't really fit well with that.  It
>    ends up wasting a lot of build time when only one of them needs to
>    be built.
>    
>    Or, you set up three different biuldroot configs to build the three
>    different things. But, using buildroot to build just the kernel, or
>    just U-Boot just adds a layer of indirection and opacity over the
>    simple "make menuconfig && make".

I guess here it's really a matter of taste. I've seen a large of number
of people/companies who really like the fact that one *single*
Buildroot configuration is building their entire embedded Linux
system: toolchain, rootfs, kernel and bootloader images.

It is indeed true that for the kernel, Buildroot creates one layer of
indirection: you have to run "make linux-menuconfig" to adjust the
kernel configuration, and remember to save back the modified
configuration file. There's not much we can do about it, though:
Buildroot is a meta build-system: its purpose is to trigger the build
of various components, using their respective build systems. There are
necessarily limits to the integration that can be done between the meta
build-system that Buildroot is, and the respective build systems of
each component.

> 2) When doing active development, it usually wasn't simple/clear how
>    to get buildroot to do a "make" in the directory I wanted it to
>    after a source file had been edited.  There were several occasions
>    when I thought something had been rebuilt, but it wasn't -- and
>    after messing around for a while I ended up having to create source
>    tarballs from my edited source files, remove the buildroot build
>    tree and start over from scratch.
> 
>    Buildroot is based on the sequence:
> 
>       a) fetch tarball
>       b) unpack tarball
>       c) apply patches
>       d) run build script
>       e) run install script
>       
>    When you're doing development on the Kernel or U-Boot that sequence
>    isn't very convenient. It's a lot simpler to (in eamcs):
> 
>       a) Edit source file(s) and hit ctrl-X ctrl-S to save changes
>       b) Hit F8 to do a "make" and move the cursor to the first
>          warning/error.
>       
> After all development is done, it might be more feasible to use
> buildroot to build everything. But, when you get to that point, you've
> alreay got a working source trees, configurations, and makefiles for
> the kernel and U-Boot, so it's simple just to stick with them.

It is indeed clear that Buildroot used to be mainly aimed at
"integration", not to be used during development work.

However, based on what you say, it really looks like you have never
looked at using <pkg>_OVERRIDE_SRCDIR together with "make
<pkg>-rebuild", because they do precisely what you're looking for :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

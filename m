From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sat, 20 Apr 2013 11:40:51 -0500
Subject: [Buildroot] RFC: "make emu" build and start QEMU target
In-Reply-To: <20130420005605.70e482a1@skate>
References: <CAEBucnDgqjO+3RpdXOgqJzkitSG6P-L=cbOEJws09WZXnnD5kQ@mail.gmail.com>
 <20130420005605.70e482a1@skate>
Message-ID: <CAEBucnC4T0rDfk1tuqZPBJNQSjA_JLA15_+iPqzRNFddAzUUDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas & Arnout,

> I am not sure to understand the reasoning behind this proposal.
> Buildroot is a tool that, given a .config file, generates a
> toolchain+root filesystem+kernel+bootloader for a given platform. We
> already have defconfigs for various platforms, some of them being real
> hardware platforms, some others being emulated platforms in Qemu.

QEMU is such a large part of embedded development.  It's an integral
part of most work flows.  In many cases there is a one-to-one
relationship between a machine configuration in QEMU and an embedded
target.  Thus, creating a configuration for a board to specify it's
QEMU configuration ensures that it's easy to emulate.  Sometimes, the
vendor provides their own QEMU fork; thus, the need for a more "kernel
like" configuration menu.

> We've worked really hard to get rid of all the board-specific code
> that used to be in Buildroot, and what you're proposing seems like
> reintroducing this.

I anticipate that most configuration would occur in the additional
options.  Thus, we avoid creating to many board specific attributes
and would use defconfigs for board specific configuration.

> I have nothing against adding a host-qemu package, but for the rest, I
> don't understand the need. Each Qemu defconfig is associated with a
> readme.txt file in board/qemu/<something>/ that explains how to start
> the emulation. Just like we have a readme.txt file for some platforms
> in board/<foo>/<bar> that explain how to format the SD card or other
> platform-specific details.

It seems like the "make emu" option is what is your disagreeing with.
I think Arnout's idea of generating a script may be more appropriate.


>  I think  a single 'QEMU emulation of target' menu is sufficient. Can
> you think of another emulator?

There's Dynampis, and Virtualbox but I don't think many people use
them for embedded.  Perhaps it's better to go with "QEMU Target
Emulation."

>  And maybe it belongs in the host-tools menu, rather than top-level.

I agree.

> I think the number of machines is a bit too large to list them. Just
> specify a string, like a kernel defconfig or a u-boot config.

Good idea and avoids the maintenance hassle of updating this entry.

> I'm not a big fan of starting tools like qemu or a debugger or whatever
> from the buildroot 'make' command. I would prefer to generate a script
> that runs qemu with the correct arguments. You can easily start that
> script either with 'make && output/images/run_qemu.sh' or from a
> post-build script. But others may disagree with me.

Good point.  See above.

> Would you generate the correct -drive option automatically from the
> selected rootfs, or select the rootfs automatically?

I don't think we should go this far.  The -drive option should be an
optional attribute.

Spenser






--
Spenser Gilliland
Computer Engineer
Doctoral Candidate

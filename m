From: Thomas Koster <tkoster@gmail.com>
Date: Mon, 18 Apr 2011 19:31:52 +1000
Subject: [Buildroot] initramfs, busybox init, switch_root and ARM
Message-ID: <BANLkTi=8bAcdFNgo8MXaiVHnSr8CTqrt-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I am starting out with buildroot and have managed to build a minimal
environment with an initramfs for qemu's versatilepb ARM target.
Firstly I would like to thank everyone for making it so easy thus far!

Using a post-build script I compile and install a simple "hello world"
program into the target directory to be picked up by buildroot when it
makes the initramfs. The system boots in qemu and I can run my hello
program inside. My next step is to make a graphical "hello world"
using directfb, but I have concerns about the size of the kernel
growing too large for flash ROM if I start heaping binaries into the
initramfs. Additionally, at runtime the applications will be
generating files that clearly can't go in the initramfs. After several
hours of reading through tutorials and list posts, I'm a bit confused
about how to deal with this.

Question one: If the requisite drivers are included in the kernel
(e.g. ext2, or nfs + kernel network auto-configuration if I want an
NFS root), is an initramfs even necessary? Can I get away with the
'real' root filesystem being mounted from the start? In this case,
should I take advantage of buildroot's support for building directfb
et al. after all, build my apps (or even write my own buildroot
'packages' for them) and augment the root filesystem in a post-build
script as before, finally to have buildroot make an ext2 image for my
MMC card or NFS export? If going down the NFS path, how is /dev
handled?

Question two (if the answer to question one is mostly "no"): Else, I
expect the kernel will be installed to flash ROM with its initramfs
and the 'real' root filesystem will be on an MMC device (or on an NFS
export while I'm still working with qemu) and switch_root will be
used. Then I imagine I would build directfb together with my apps as a
target in my own build system, rather than have buildroot build such
things for the initramfs. Does this make sense or have I got this
wrong?

Question three (also if the answer to question one is mostly "no"):
Since buildroot installs busybox's init as /init in the initramfs, and
not some script, what is the correct procedure for configuring
busybox's init to do a switch_root? My first guess would be to use the
post-build script to replace /etc/inittab with a new one that includes
the requisite switch_root command, but what would such an inittab look
like? There are existing lines that look like they ought to run in the
new root. When should the switch_root happen?

In either case, I expect to be using busybox and uClibc throughout
(that is, I won't be using GNU libc or a debian root unless I hit a
major roadblock with uClibc). One day I might try compiling a java or
mono runtime for it but that is over the horizon.

Bonus question if you work with ARM boards: At some point I plan on
transitioning to a development board like the PandaBoard but one day
this environment might have to run on a less powerful device. Is this
a valid paradigm for this kind of target?

Thanks in advance,
Thomas

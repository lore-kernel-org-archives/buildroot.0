From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2011 00:04:45 +0200
Subject: [Buildroot] initramfs, busybox init, switch_root and ARM
In-Reply-To: <BANLkTi=8bAcdFNgo8MXaiVHnSr8CTqrt-w@mail.gmail.com>
References: <BANLkTi=8bAcdFNgo8MXaiVHnSr8CTqrt-w@mail.gmail.com>
Message-ID: <20110420000445.32c24327@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 18 Apr 2011 19:31:52 +1000
Thomas Koster <tkoster@gmail.com> wrote:

> Hi list,
> 
> I am starting out with buildroot and have managed to build a minimal
> environment with an initramfs for qemu's versatilepb ARM target.
> Firstly I would like to thank everyone for making it so easy thus far!
> 
> Using a post-build script I compile and install a simple "hello world"
> program into the target directory to be picked up by buildroot when it
> makes the initramfs. The system boots in qemu and I can run my hello
> program inside. My next step is to make a graphical "hello world"
> using directfb, but I have concerns about the size of the kernel
> growing too large for flash ROM if I start heaping binaries into the
> initramfs.

Yeah, typically initramfs is used for fairly small systems. But
theorically, the mechanism allows for initramfs of arbitrary size. As
long as you accept the longer boot time (because everything must be
loaded in RAM prior to starting the kernel) and the additional memory
consumption, initramfs are fine. But granted, when you start having
graphical applications, initramfs is probably no longer suited.

> Additionally, at runtime the applications will be generating files
> that clearly can't go in the initramfs.

You can still have an initramfs for application and static things, and
a special partition mounted for your generated data.

> After several hours of reading through tutorials and list posts, I'm
> a bit confused about how to deal with this.

> Question one: If the requisite drivers are included in the kernel
> (e.g. ext2, or nfs + kernel network auto-configuration if I want an
> NFS root), is an initramfs even necessary?

No.

> Can I get away with the 'real' root filesystem being mounted from the
> start?

Yes, just pass "root=/dev/something" in the kernel command line,
with /dev/something being the device containing your root filesystem.

> In this case, should I take advantage of buildroot's support
> for building directfb et al. after all, build my apps (or even write
> my own buildroot 'packages' for them) and augment the root filesystem
> in a post-build script as before, finally to have buildroot make an
> ext2 image for my MMC card or NFS export?

Yes, correct.

> If going down the NFS path, how is /dev handled?

As Buildroot doesn't run as root, it cannot create device files
directly in your filesystem. Therefore, to do NFS, what you need to do
is to tell Buildroot to generate a tarball as the image of your root
filesystem (menuconfig -> Target filesystem options), and then once
Buildroot has generated this tarball, extract it as root in some
directory exported by your NFS server.

> Question two (if the answer to question one is mostly "no"): Else, I
> expect the kernel will be installed to flash ROM with its initramfs
> and the 'real' root filesystem will be on an MMC device (or on an NFS
> export while I'm still working with qemu) and switch_root will be
> used. Then I imagine I would build directfb together with my apps as a
> target in my own build system, rather than have buildroot build such
> things for the initramfs. Does this make sense or have I got this
> wrong?

Well, as the answer to the question above is 'yes', I don't know if you
care. But yes, you can have the following boot sequence :

 * Kernel starts
 * Kernel uncompresses the initramfs and executes the /init script or
   application inside the initramfs
 * The /init script or application loads some drivers, do some stuff,
   and ultimately mounts the final root filesystem, and switch_root to
   it, and then finally starts the /sbin/init application of the real
   root filesystem.

Buildroot is not directly capable of generating *both* an initramfs and
a real root filesystem in a single build. You'd have to create two
separate Buildroot configurations and builds, one for the initramfs,
and one for the real root filesystem.

> Question three (also if the answer to question one is mostly "no"):
> Since buildroot installs busybox's init as /init in the initramfs, and
> not some script, what is the correct procedure for configuring
> busybox's init to do a switch_root? My first guess would be to use the
> post-build script to replace /etc/inittab with a new one that includes
> the requisite switch_root command, but what would such an inittab look
> like? There are existing lines that look like they ought to run in the
> new root. When should the switch_root happen?

In the initramfs, most likely, /init wouldn't be a symlink to Busybox,
but rather a shell script of your own that does everything needed to
switch to the real root filesystem.

> In either case, I expect to be using busybox and uClibc throughout
> (that is, I won't be using GNU libc or a debian root unless I hit a
> major roadblock with uClibc). One day I might try compiling a java or
> mono runtime for it but that is over the horizon.

Ouch, Java and Mono runtime are probably not the easiest things to get
running on non-x86 platforms. Definitely possible, but probably not
easy.

> Bonus question if you work with ARM boards: At some point I plan on
> transitioning to a development board like the PandaBoard but one day
> this environment might have to run on a less powerful device. Is this
> a valid paradigm for this kind of target?

Which paradigm ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

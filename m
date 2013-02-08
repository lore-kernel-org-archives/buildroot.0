From: John Stile <john@stilen.com>
Date: Fri, 08 Feb 2013 13:34:05 -0800
Subject: [Buildroot] need smaller filesystem for NOR
In-Reply-To: <20130208183807.2b2fe572@skate>
References: <1360344317.17385.31.camel@genx.eng.msli.com>
 <20130208183807.2b2fe572@skate>
Message-ID: <1360359245.28641.79.camel@genx.eng.msli.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Fri, 2013-02-08 at 18:38 +0100, Thomas Petazzoni wrote:
> Dear John Stile,
> 
> On Fri, 08 Feb 2013 09:25:17 -0800, John Stile wrote:
> > I primarily boot from one of two 128Mb NAND areas, but I have an 8Mb NOR
> > failsafe if NAND is bad.  I have about 5.5Mb available for the
> > Filesystem after loading at91bootstrap, uboot, uboot-env, and kernel.
> > ...(using buildroot-2011.11)...
> > 
> > The rootfs.jffs2 for NAND is 41Mb.
> > I need one for NOR that is less than 5.5Mb.
> > 
> > Is there a good method or script to copy buildroot's rootfs.jffs2  to
> > make a smaller copy for NOR?
> > 
> > My first attempt  leads to
> > VFS: Mounted root (jffs2 filesystem) on device 31:1.
> > Freeing init memory: 104K
> > Warning: unable to open an initial console.
> > Kernel panic - not syncing: No init found.  Try passing init= option to kernel.
> > [<c0028678>] (unwind_backtrace+0x0/0xdc) from [<c0243990>] (panic+0x34/0x110)
> > [<c0243990>] (panic+0x34/0x110) from [<c002254c>] (init_post+0x138/0x170)
> > [<c002254c>] (init_post+0x138/0x170) from [<c0008408>] (kernel_init+0xbc/0xe8)
> > [<c0008408>] (kernel_init+0xbc/0xe8) from [<c003b634>] (do_exit+0x0/0x5a4)
> > [<c003b634>] (do_exit+0x0/0x5a4) from [<00000003>] (0x3)
> > 
> > I think this means the file system is found and mounted, and for some
> > reason, init isn't found, although I have played with init= to no avail,
> > and if I mount my little jffs2, I do see busybox and all the links
> > (/bin/init).
> 
> Beware that if a NAND or NOR partition is empty and properly erase,
> jffs2 will happily mount it and show a filesystem that contains no
> file. So the behavior you're seeing here could perfectly happen if your
> NAND or NOR partition is simply empty.

To check for an empty file system I compared the hex dump of my jffs2
image to the contents of NOR, and they are the same.
From the uboot prompt I ran: md.b 0xD0294000 0x19
From the shell I ran: od -t x1z NORrootfs.jffs2
Both are identical, and I can mount my .jffs2 and see it contains stuff.

Could it be my bootargs mtdparts pointing to the wrong place?
bootargs=mem=64M console=ttyS0,115200 mtdparts=dataflash0:2640k(bootstrap/uboot/env/kernel)ro,-(rootfs) root=/dev/mtdblock1 rw rootfstype=jffs2

I also tried exchanging 'dataflash0' for 'dataflash1', with no change in
behavior.

This is the first time I have tried to put a file system on NOR.

> > I tried to trying to hack it (unsuccessfully) with a post-build script
> > that tries to do what buildroot does:
> 
> Rather than doing this, what about having a separate Buildroot project
> that is used to build your small NOR failsafe filesystem? If it's only
> a 5.5 MB filesystem, most likely there isn't too much in it. Both
> Buildroot projects can share the same Buildroot source tree, but be
> built in different directories.

I would like to try this.

> 
> Let's say ~/buildroot/ contains the Buildroot sources,
> ~/buildroot/configs/project_defconfig and
> ~/buildroot/configs/project_failsafe_defconfig are respectively the
> Buildroot configuration for your full filesystem and for the small
> failsafe filesystem. Then you can do:
> 
>  mkdir -p ~/project/full/
>  cd ~/project/full/
>  make -C ~/buildroot O=$(pwd) project_defconfig
>  make
> 
>  mkdir -p ~/project/failsafe/
>  cd ~/project/failsafe
>  make -C ~/buildroot O=$(pwd) project_failsafe_defconfig
>  make

From this I wonder if I have been organizing my buildroot incorrectly.

My buidroot works out of a directory named buildroot-2011.11.
My config is just called buildroot-2011.11/.config, so I just run 'make'
without an options.

Should .config be stored under configs instead?

I also hold all my special stuff under:
 buildroot-2011.11/board/atmel/at91sam9g20ek/
 |-at91bootstrap-patches
 |-kernel-configs
 |-kernel-patches
 |-post-build
 |-uboot-2013-patches
 |-uboot-patches
 |-uClibc-config

Following your gracious directions, ...

cp  buildroot-2011.11/.config \
buildroot-2011.11/configs/project_failsafe_defconfig

I had to edited the new config manually to remove almost everything.

How do I run 'make menuconfig' on
buildroot-2011.11/configs/project_failsafe_defconfig?

mkdir -p failsafe
cd failsafe
make -C ../buildroot-2011.11 O=$(pwd) project_failsafe_defconfig
make

This rebuilt everything, but fails on my post-build scripts, but I kinda
need some of those.  The post-build script calls make on the programs
that implement my firmware rescue web server interface.
**** POST-BUILD SCRIPTS: ****
ERROR: Cant read
buildroot .config: /home/jstile/svn_rmserver/failsafe/target/../../.config

If I comment out BR2_ROOTFS_POST_BUILD_SCRIPT the image is created
(failsafe/images/rootfs.jffs2) but over the size I need.  

I was able to create a jffs2 of 4.9Mb, but this new image is 6.8Mb.
Still too big.  I've got 5.5.Mb of NOR available.

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Feb 2013 18:38:07 +0100
Subject: [Buildroot] need smaller filesystem for NOR
In-Reply-To: <1360344317.17385.31.camel@genx.eng.msli.com>
References: <1360344317.17385.31.camel@genx.eng.msli.com>
Message-ID: <20130208183807.2b2fe572@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Fri, 08 Feb 2013 09:25:17 -0800, John Stile wrote:
> I primarily boot from one of two 128Mb NAND areas, but I have an 8Mb NOR
> failsafe if NAND is bad.  I have about 5.5Mb available for the
> Filesystem after loading at91bootstrap, uboot, uboot-env, and kernel.
> ...(using buildroot-2011.11)...
> 
> The rootfs.jffs2 for NAND is 41Mb.
> I need one for NOR that is less than 5.5Mb.
> 
> Is there a good method or script to copy buildroot's rootfs.jffs2  to
> make a smaller copy for NOR?
> 
> My first attempt  leads to
> VFS: Mounted root (jffs2 filesystem) on device 31:1.
> Freeing init memory: 104K
> Warning: unable to open an initial console.
> Kernel panic - not syncing: No init found.  Try passing init= option to kernel.
> [<c0028678>] (unwind_backtrace+0x0/0xdc) from [<c0243990>] (panic+0x34/0x110)
> [<c0243990>] (panic+0x34/0x110) from [<c002254c>] (init_post+0x138/0x170)
> [<c002254c>] (init_post+0x138/0x170) from [<c0008408>] (kernel_init+0xbc/0xe8)
> [<c0008408>] (kernel_init+0xbc/0xe8) from [<c003b634>] (do_exit+0x0/0x5a4)
> [<c003b634>] (do_exit+0x0/0x5a4) from [<00000003>] (0x3)
> 
> I think this means the file system is found and mounted, and for some
> reason, init isn't found, although I have played with init= to no avail,
> and if I mount my little jffs2, I do see busybox and all the links
> (/bin/init).

Beware that if a NAND or NOR partition is empty and properly erase,
jffs2 will happily mount it and show a filesystem that contains no
file. So the behavior you're seeing here could perfectly happen if your
NAND or NOR partition is simply empty.

> I tried to trying to hack it (unsuccessfully) with a post-build script
> that tries to do what buildroot does:

Rather than doing this, what about having a separate Buildroot project
that is used to build your small NOR failsafe filesystem? If it's only
a 5.5 MB filesystem, most likely there isn't too much in it. Both
Buildroot projects can share the same Buildroot source tree, but be
built in different directories.

Let's say ~/buildroot/ contains the Buildroot sources,
~/buildroot/configs/project_defconfig and
~/buildroot/configs/project_failsafe_defconfig are respectively the
Buildroot configuration for your full filesystem and for the small
failsafe filesystem. Then you can do:

 mkdir -p ~/project/full/
 cd ~/project/full/
 make -C ~/buildroot O=$(pwd) project_defconfig
 make

 mkdir -p ~/project/failsafe/
 cd ~/project/failsafe
 make -C ~/buildroot O=$(pwd) project_failsafe_defconfig
 make

And that's it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

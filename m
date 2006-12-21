From: Joe Pruett <joey@clean.q7.com>
Date: Wed, 20 Dec 2006 21:19:32 -0800 (PST)
Subject: [Buildroot] Kernel Panic .....
In-Reply-To: <20061220154303.GA24288@aon.at>
References: <Pine.LNX.4.64.0612191302220.31862@smtcorms05.samuelmanutech.com>
	<Pine.LNX.4.64.0612192336370.31862@smtcorms05.samuelmanutech.com>
	<Pine.LNX.4.64.0612192039380.11555@q7.q7.com>
	<Pine.LNX.4.64.0612192344000.31862@smtcorms05.samuelmanutech.com>
	<20061220154303.GA24288@aon.at>
Message-ID: <Pine.LNX.4.64.0612202113430.2373@q7.q7.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Dec 2006, Bernhard Fischer wrote:

> On Tue, Dec 19, 2006 at 11:47:54PM -0500, Robin Mordasiewicz wrote:
> >On Tue, 19 Dec 2006, Joe Pruett wrote:
> >> On Tue, 19 Dec 2006, Robin Mordasiewicz wrote:
> >>> On Tue, 19 Dec 2006, Robin Mordasiewicz wrote:
> >>>
> >>>> I am trying to boot the image as an initrd filesystem over pxe, but I see
> >>>> an error
> >>>> 'Unpacking initramfs...<0>Kernel panic - not syncing: bad gzip magic numbers'
> >>>>
> >>>> in my pxelinux.cfg/default
> >>>>
> >>>> label test
> >>>>   kernel linux-kernel-2.6.19.1-i386
> >>>>   append ramdisk_blocksize=4096 initrd=rootfs.i386.ext2 root=/dev/ram0 ramdisk_size=524288
> >>>>
> >>>> Is there anything I am required to change to make this kernel and image
> >>>> work over booting from pxe ?
> >>>
> >>> I needed to build some RAM disk drivers into the kernel.
> >>
> >> how exactly did you do that?  that is where i have finally gotten after
> >> making that kernel-patches directory (as you also just posted) and fixing
> >> the problem that grub no longer has a -19 version at debian.org (-20 seems
> >> to be working).  i made an iso image and ran into the same kernel panic
> >> because it seems to want a cpio image.  i have just rebuilt using the
> >> linux26.config file instead of busybox.config and will be booting in a few
> >> minutes to see how that goes...
> >
> >Not sure if I am following you. I think you may be getting the kernel 
> >config and the busybox config confused. The documentation for customizing 
> >busybox does not mention modifying the kernel, but what I did to customize 
> >the kernel is something like the following.
> >
> >cd build_i386/linux-2.6.19.1
> >cp .config .config.original
> >make mrproper
> >make menuconfig
> >(set the kernel options you require)
> >cd ../../
> >make
> 
> there is a make linux26-menuconfig target for that (for i386 with
> the generic x86 target support option turned on, at least).
> 

ok, i determined that the missing piece is that the ramdisk block device 
needs to be set to compile in, not be a module.  to make an iso function, 
i also had to hack in a makefile entry for LINUX_KERNEL (i just set it to 
LINUX26_KERNEL).  after that things started working.  i also seem to see 
an ordering problem that if i made a kernel change, i had to run make 
twice in order for that to get into the iso.

i'm not sure where those two changes should be done officially, or i'd 
submit a patch.  it seems that if the iso relies on ramdisk support, then 
it makes sense to have that enabled by default, and the LINUX_KERNEL vs 
LINUX26_KERNEL make var should be addressed.  

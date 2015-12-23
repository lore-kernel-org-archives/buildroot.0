From: Craig Swank <craigswank@fastmail.fm>
Date: Wed, 23 Dec 2015 10:15:05 -0800
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
Message-ID: <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is my response again.  I sent one a few minutes ago but it might be
too big because I tried attaching the build output.

> Does it work with some other kernel? 
Yes, it works with the default kernel that is defined in
configs/beaglebone_defconfig

> Do you have console= defined in the bootargs to the proper value?
I tried playing around with console= a few days ago, but I didn't get it
working with that.  I really am not sure what the correct args would be.
 I'm going to revisit that now and see if I can find what they should be
set to.  

I uploaded the build output to
https://www.dropbox.com/s/nbm6r5520g0wutf/nohup.out.bz2?dl=0 

On Wed, Dec 23, 2015, at 10:03 AM, Craig Swank wrote:
> > Does it work with some other kernel? 
> Yes, it works with the default kernel that is defined in
> configs/beaglebone_defconfig
> 
> > Do you have console= defined in the bootargs to the proper value?
> I tried playing around with console= a few days ago, but I didn't get it
> working with that.  I really am not sure what the correct args would be.
>  I'm going to revisit that now and see if I can find what they should be
> set to.  
> 
> Both of the paste sites I just tried won't accept the output from my
> build because it is too large so I'm compressing and attaching it.
> 
> 
> On Wed, Dec 23, 2015, at 09:47 AM, Thomas Petazzoni wrote:
> > Craig,
> > 
> > On Wed, 23 Dec 2015 09:04:56 -0800, Craig Swank wrote:
> > 
> > > [*] Linux Kernel
> > >       Kernel version (Custom Git repository)  --->
> > > (file:///home/craig/workspace/beaglebone/linux) URL of custom repository
> > > (4.1.4-ti-r9) Custom repository version
> > > ()    Custom kernel patches
> > >       Kernel configuration (Using an in-tree defconfig file)  --->
> > > (bb.org) Defconfig name
> > > ()    Additional configuration fragment files
> > >       Kernel binary format (zImage)  --->
> > >       Kernel compression format (gzip compression)  --->
> > > [*]   Build a Device Tree Blob (DTB)
> > >         Device tree source (Use a device tree present in the kernel.) 
> > >         --->
> > > (am335x-bone am335x-boneblack) Device Tree Source file names
> > > [ ]   Install kernel image to /boot in target
> > >       Linux Kernel Extensions  --->
> > >       Linux KernelTools?>
> > 
> > This looks good. It is somewhat odd to use "URL of custom repository"
> > when you have the sources locally. You could just as well use the
> > option BR2_LINUX_KERNEL_CUSTOM_LOCAL to point to a local directory. But
> > that definitely shouldn't prevent it from working.
> > 
> > > $ git checkout 4.1.4-ti-r9 -b tmp
> > > make ARCH=arm bb.org_defconfig
> > > so, following the pattern of the raspberry pi defconfig in buildroot,
> > > the defconfig name should be ?bb.org?
> > 
> > Correct.
> > 
> > > when I run ?make? in buildroot it all seems to build fine, but when I
> > > install the output to my sd card and start up my beaglebone I get:
> > 
> > Can you pastebin (on http://code.bulix.org or some other pastebin site)
> > the entire build output, so we can check that what happens is really
> > good?
> > 
> > > U-Boot SPL 2013.10 (Dec 23 2015 - 09:23:34)
> > > reading args
> > > spl: error reading image args, err - -1
> > > reading u-boot.img
> > > reading u-boot.img
> > > 
> > > 
> > > U-Boot 2013.10 (Dec 23 2015 - 09:23:34)
> > > 
> > > I2C:   ready
> > > DRAM:  512 MiB
> > > WARNING: Caches not enabled
> > > NAND:  0 MiB
> > > MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> > > *** Warning - readenv() failed, using default environment
> > > 
> > > Net:   <ethaddr> not set. Validating first E-fuse MAC
> > > cpsw, usb_ether
> > > Hit any key to stop autoboot:  0 
> > > mmc0 is current device
> > > SD/MMC found on device 0
> > > reading uEnv.txt
> > > 96 bytes read in 3 ms (31.3 KiB/s)
> > > Loaded environment from uEnv.txt
> > > Importing environment from mmc ...
> > > Running uenvcmd ...
> > > reading /zImage
> > > 7416160 bytes read in 688 ms (10.3 MiB/s)
> > > reading ramdisk.gz
> > > ** Unable to read file ramdisk.gz **
> > > reading /am335x-boneblack.dtb
> > > 57860 bytes read in 12 ms (4.6 MiB/s)
> > > Booting from ramdisk ...
> > > Kernel image @ 0x80200000 [ 0x000000 - 0x712960 ]
> > > Wrong Ramdisk Image Format
> > > Ramdisk image is corrupt or invalid
> > > reading /zImage
> > > 7416160 bytes read in 689 ms (10.3 MiB/s)
> > > reading /am335x-boneblack.dtb
> > > 57860 bytes read in 11 ms (5 MiB/s)
> > > Kernel image @ 0x80200000 [ 0x000000 - 0x712960 ]
> > > ## Flattened Device Tree blob at 80f80000
> > >    Booting using the fdt blob at 0x80f80000
> > >    Using Device Tree in place at 80f80000, end 80f91203
> > > 
> > > Starting kernel ...
> > > 
> > > 
> > > After ?Starting kernel ?? there is no more output and no leds are
> > > flashing.  It just dies there.
> > 
> > Does it work with some other kernel? Do you have console= defined in
> > the bootargs to the proper value?
> > 
> > Best regards,
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, CTO, Free Electrons
> > Embedded Linux, Kernel and Android engineering
> > http://free-electrons.com
> 
> 
> -- 
>   Craig Swank
>   craigswank at fastmail.fm
> Email had 1 attachment:
> + nohup.out.bz2
>   529k (application/x-bzip2)


-- 
  Craig Swank
  craigswank at fastmail.fm

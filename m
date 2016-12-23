From: daggs <daggs@gmx.com>
Date: Fri, 23 Dec 2016 20:08:37 +0100
Subject: [Buildroot] [PATCH 1/2] first_boot_rootfs_resizer: New Package.
In-Reply-To: <20161223150037.5dff81d0@free-electrons.com>
References: <20161202101028.26736-1-daggs@gmx.com>
 <20161217165039.6169d54c@free-electrons.com>
 <trinity-0083f4f6-b9ec-4e8f-83e5-87b64224abf7-1482500518932@3capp-mailcom-bs05>,
 <20161223150037.5dff81d0@free-electrons.com>
Message-ID: <trinity-fc6c5626-c471-453b-bc90-01c36a6958fa-1482520117173@3capp-mailcom-bs03>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

>
> Hello,
> 
> On Fri, 23 Dec 2016 14:41:59 +0100, daggs wrote:
> 
> > > We clearly shouldn't have an "unclear" license for such a package.  
> > the file is ported from the odroidc2 buildroot, I've marked it unclear because it doesn't states it's license anywhere.
> 
> Would be good to get a clarified license, especially when the source
> code is inside Buildroot itself.
maybe I'll rewrite it from scratch not depending on this, thus license is irrelevant.

> > > > +ROOT=$(cat /proc/cmdline | tr ' ' '\n' | grep root= | cut -f 2 -d =)  
> > > 
> > > This will fail badly if you have a GPT partition table and root= is
> > > using the partition UUID, like:
> > > 
> > > 	root=UUID=xyz
> > >   
> > I see, that should be the proper way to detect the rootfs file system?
> 
> One way would be to use the Busybox "rdev" applet, but it's not enabled
> in our default configuration. You could run "stat /" where the "Device"
> fields tells you the block device that was mounted as the root
> filesystem. But not that trivial to go from this (major/minor) to the
> actual /dev/.
> 
> I'm not sure there's a good and simple way to achieve that I'm afraid.
I'll test the possibilities.

> 
> > > > +DEV=$(echo ${ROOT} | sed 's/p[0-9]\+$//g')  
> > > 
> > > This only works for mmcblkXpY case, but not for sdXY  
> > correct, will see how I can generalize it more.
> 
> It's actually not that easy to generalize, except of course if you
> restrict yourself to sdXY and mmcblkXpY.
beside sdXY, mmcblkXpY and hdaXY, are there any other possibilities?

> 
> > > > +if [ -f /.first_boot ]; then
> > > > +	echo "Resizing fs, please wait... upon finish the system will be restarted"
> > > > +	# ok, its the very first boot, we need to resize the disk.
> > > > +	p2_start=`fdisk -l ${DEV} | grep ${PART} | awk '{print $2}'`
> > > > +	p2_finish=`fdisk -l ${DEV} | grep sectors | awk '{printf $5}'`  
> > > 
> > > This will not work with the Busybox fdisk, which is the default in
> > > Buildroot:
> > > 
> > > Disk /dev/sda: 256.0 GB, 256060514304 bytes
> > > 255 heads, 63 sectors/track, 31130 cylinders
> > > Units = cylinders of 16065 * 512 = 8225280 bytes
> > > 
> > >    Device Boot      Start         End      Blocks  Id System
> > > /dev/sda1   *           1        3648    29295616  83 Linux
> > > /dev/sda2            3648        4644     8000512  82 Linux swap
> > > /dev/sda3            4644       31131   212761600  83 Linux  
> > I'm pretty sure I've tested it with busybox's fdisk.
> 
> Well, to find the size of the block device, you grep for "sectors". The
> only line matching with Busybox fdisk is:
> 
> 255 heads, 63 sectors/track, 31130 cylinders
> 
> Which doesn't contain the size (at least not the size in sectors)
> 
> > > Using sfdisk is probably more appropriate here, as it's meant to be
> > > used for scripting.  
> > ok, will check.
> 
> But sfdisk is not in Busybox, so make sure to select the right package.
will see what I can do.

> 
> > > Also, this logic doesn't work if the root filesystem is mounted
> > > read-only, since you expect to be able to remove .first_boot, and
> > > remove the script itself.  
> > so essentally, if the fs is read only, there is no way to remove it.
> > so the right way is to check every boot if the fs is maxed out to the boot dev and resize it if not.
> > am I correct?
> 
> Well, what if you're read-only but the root filesystem doesn't take the
> whole space? Perhaps you can check in 'mount | grep " / "' whether it's
> mounted read-only or not?
not sure I follow, can you please elaborate more?

> 
> > > Why wouldn't the S00resizefs script directly do the resizing work?  
> > as said above, I've ported it from the odroidc2 buildroot, so I didn't tried to change it too much.
> 
> Since the source code is part of Buildroot and we don't intend to
> resync with the odroidc2 stuff, please make it more Buildroot-ish.
> 
> Thanks a lot!
> 
> Thomas

Dagg.

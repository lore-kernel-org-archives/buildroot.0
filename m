From: Ed Sutter <ed.sutter@alcatel-lucent.com>
Date: Mon, 03 Mar 2014 17:14:47 -0500
Subject: [Buildroot] readonly rootfs problem
Message-ID: <5314FED7.80903@alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've been using buildroot to create my rootfs for a few months.
I build my kernel directly out of freescale.git.
I had been running with my rootfs nfs mounted, and all was well.
Recently I had spent some time with a ramdisk-based rootfs because
i was working on some kernel stuff.
Now I'm going back to running rootfs/nfs and I'm finding that
it "insists" on coming up in read-only mode.

I was initially using buildroot-2013.08, and recently I
updated to buildroot-2013.11; however, I don't think that has
anything to do with this.  As far as I can tell I have everything
set up properly...

####On NFS host /etc/exports has...
/full_path_to_my_rootfs *(rw,no_root_squash)

####On target...
/etc/inittab...
null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW

/etc/fstab...
# /etc/fstab: static file system information.
#
# <file system> <mount pt>     <type> <options>         <dump> <pass>
/dev/root       /              ext2     rw,noauto         0      1
proc            /proc          proc     defaults          0      0
devpts          /dev/pts       devpts   defaults,gid=5,mode=620 0      0
tmpfs           /dev/shm       tmpfs    mode=0777         0      0
tmpfs           /tmp           tmpfs    defaults          0      0
sysfs           /sys           sysfs    defaults          0 0

Output from mount:
# mount
rootfs on / type rootfs (rw)
1.2.3.4:/full_path_to_my_rootfs on / type nfs 
(ro,relatime,vers=3,rsize=4096,wsize=4096,namlen=255,hard,nolock,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=1.2.3.4,mountvers=3,mountproto=tcp,local_lock=all,addr=135.222.138.108)
devtmpfs on /dev type devtmpfs 
(rw,relatime,size=110708k,nr_inodes=27677,mode=755)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
tmpfs on /tmp type tmpfs (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)

I actually think the problem is in the kernel, not the rootfs.
I say this because even some of my older rootfs copies (still on my 
host) are now
showing up as read only.  The bootlog always ends up with this message:
VFS: Mounted root (nfs filesystem) readonly on device 0:11.

Any idea what I might be doing wrong here?
Thanks,
Ed

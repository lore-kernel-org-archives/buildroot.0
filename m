From: Steve Kenton <skenton@ou.edu>
Date: Fri, 19 May 2017 07:55:24 -0600
Subject: [Buildroot] rpath and runpath
Message-ID: <952e1471-12e9-7935-16c2-af56ad4fead7@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several years ago when I first started using buildroot I tripped over an 
issue where the rpath of the mount executable would prevent unmounting  
unless the lazy flag was used because the current mount point happened 
to match the mount point where buildroot was originally built. For 
umount it's easy enough to work around using umount -l but it got me 
wondering about paths again. I found this article very helpful 
http://amir.rachum.com/blog/2016/09/17/shared-libraries/

Each shared library in our dependencies is searched in the following 
locations in order:

 1. Directories listed in the executable?s |rpath|.
 2. Directories in the |LD_LIBRARY_PATH| environment variable, which
    contains colon-separated list of directories (e.g.,
    |/path/to/libdir:/another/path|)
 3. Directories listed in the executable?s |runpath|.
 4. The list of directories in the file |/etc/ld.so.conf|. This file can
    include other files, but it is basically a list of directories - one
    per line.
 5. Default system libraries - usually |/lib| and |/usr/lib| (skipped if
    compiled with |-z nodefaultlib|).

The chrpath command can display and/or modify the (pre LD_LIBRARY_PATH) 
rpath and (post LD_LIBRARY_PATH) runpath settings in the ELF executable. 
As an example looking at the host and target /usr/sbin directory gives 
the 95 lines of output below.

I can see the reason for having the host executables use an RPATH to the 
build directory, although I think a relative path using "$ORIGIN" at 
link time which would allow the tree to be relocated would be even better.

However, some of the target target executables also have RPATH to the 
build directory which makes no real sense to me and other have no RPATH 
or RUNPATH at all.

What is the purpose of this arrangement, or is it just a historical 
accident?

Thanks, Steve Kenton


hdi at hdi-H110N:/ssd/bcdist/buildroot-2017.05/output$ find host/usr/sbin 
target/usr/sbin -type f -exec chrpath {} \; 2>/dev/null | grep -i rpath
host/usr/sbin/e2image: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/fdisk: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/mkfs: RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/fsck.minix: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/swapoff: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/logsave: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/kstash: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/fsfreeze: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/blkdiscard: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/e2undo: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/dumpe2fs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/getpcaps: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/addpart: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/getcap: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/swapon: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/tune2fs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/resize2fs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/fsck: RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/losetup: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/mkfs.bfs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/e2fsck: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/mklost+found: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/filefrag: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/iprop-log: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/grub-bios-setup: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/fstrim: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/blkid: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/readprofile: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/grub-sparc64-setup: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/mkswap: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/ctrlaltdel: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/zic: no rpath or runpath tag found.
host/usr/sbin/raw: RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/delpart: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/rtcwake: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/grub-probe: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/agetty: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/swaplabel: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/switch_root: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/mke2fs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/mkfs.cramfs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/fdformat: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/badblocks: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/e2freefrag: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/grub-ofpathname: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/sfdisk: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/nologin: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/findfs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/partx: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/pivot_root: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/wipefs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/mkfs.minix: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/capsh: RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/resizepart: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/zramctl: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/sulogin: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/debugfs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/blockdev: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/chcpu: RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/fsck.cramfs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/uuidd: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/host-util-linux-2.29.2/.libs
host/usr/sbin/hwclock: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/setcap: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/e4crypt: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
host/usr/sbin/ldattach: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/lib
target/usr/sbin/dumpexfat: no rpath or runpath tag found.
target/usr/sbin/ctdbd: RPATH=/usr/lib/samba
target/usr/sbin/mkexfatfs: no rpath or runpath tag found.
target/usr/sbin/netscsid: no rpath or runpath tag found.
target/usr/sbin/ntfsclone: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/ntfs-3g-2017.3.23/libntfs-3g/.libs
target/usr/sbin/partprobe: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/parted-3.1/libparted/.libs:/ssd/bcdist/buildroot-2017.05/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/util-linux-2.29.2/.libs
target/usr/sbin/ntfscp: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/ntfs-3g-2017.3.23/libntfs-3g/.libs
target/usr/sbin/proftpd: no rpath or runpath tag found.
target/usr/sbin/nmbd: RPATH=/usr/lib/samba
target/usr/sbin/exfatlabel: no rpath or runpath tag found.
target/usr/sbin/smbd: RPATH=/usr/lib/samba
target/usr/sbin/acpid: no rpath or runpath tag found.
target/usr/sbin/mdadm: no rpath or runpath tag found.
target/usr/sbin/sshd: no rpath or runpath tag found.
target/usr/sbin/readprofile: no rpath or runpath tag found.
target/usr/sbin/mkntfs: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/ntfs-3g-2017.3.23/libntfs-3g/.libs
target/usr/sbin/rtcwake: no rpath or runpath tag found.
target/usr/sbin/ntfsundelete: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/ntfs-3g-2017.3.23/libntfs-3g/.libs
target/usr/sbin/mount.exfat-fuse: no rpath or runpath tag found.
target/usr/sbin/ntfslabel: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/ntfs-3g-2017.3.23/libntfs-3g/.libs
target/usr/sbin/winbindd: RPATH=/usr/lib/samba
target/usr/sbin/php-fpm: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib
target/usr/sbin/parted: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/parted-3.1/libparted/.libs:/ssd/bcdist/buildroot-2017.05/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib:/ssd/bcdist/buildroot-2017.05/output/build/util-linux-2.29.2/.libs
target/usr/sbin/lighttpd: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib
target/usr/sbin/ntfsresize: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/ntfs-3g-2017.3.23/libntfs-3g/.libs
target/usr/sbin/exfatfsck: no rpath or runpath tag found.
target/usr/sbin/kacpimon: no rpath or runpath tag found.
target/usr/sbin/uuidd: 
RPATH=/ssd/bcdist/buildroot-2017.05/output/build/util-linux-2.29.2/.libs
target/usr/sbin/lighttpd-angel: no rpath or runpath tag found.
target/usr/sbin/ldattach: no rpath or runpath tag found.
hdi at hdi-H110N:/ssd/bcdist/buildroot-2017.05/output$
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170519/a7ad35fb/attachment.html>

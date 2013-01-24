From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 25 Jan 2013 00:40:50 +0200
Subject: [Buildroot] Squashfs boot
In-Reply-To: <CAN_xxrUMYm_q7JvdJhCHWtcjzAVBxHkV3GHvZL4-ueur8ODvLA@mail.gmail.com>
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
 <50FE8914.30909@petroprogram.com> <51017295.7020803@mind.be>
 <CAN_xxrUMYm_q7JvdJhCHWtcjzAVBxHkV3GHvZL4-ueur8ODvLA@mail.gmail.com>
Message-ID: <5101B872.1090705@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thin client? Ah, now I beging to understand why you needed to load that
squashfs image into ram.

So your thin client is totally diskless ? No hard drive at all ?
And you plan to load your squashfs image from server or usb stick or
from where ?

Stefan


24.1.2013 21:29, Stephen Turner kirjoitti:
>
> I shouldnt need unionfs as im just loading a basic thinclient and
> having it in a ro image would be best to prevent accidental or
> intentional tampering when a simple reboot will fix. The rw items can
> use a temp ramdisk. Only issue i was running into was figuring out how
> to read a squashfs at boot with no initrd or basically  busybox squash
> output which is only bzImage and rootfs.squashfs. i have managed to
> move usr to squash and use the rest of the os as initrd but if thats
> what needs to be done then shouldnt the busybox build script handle that?
>
> On Jan 24, 2013 1:50 PM, "Arnout Vandecappelle" <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
>
>     On 01/22/13 13:41, Stefan Fr?berg wrote:
>     [snip]
>
>         My /etc/fstab look like this
>         # /etc/fstab: static file system information.
>         #
>         # <file system> <mount pt> <type> <options> <dump> <pass>
>         /modules.sqfs        /lib/modules    squashfs  
>          defaults,auto,loop,noatime    0    0
>         /firmware.sqfs      /lib/firmware    squashfs  
>          defaults,auto,loop,noatime    0    0
>         /dev/cdrom            /mnt/cdrom    iso9660    
>          defaults,noatime    0    0
>         /mnt/cdrom/usr.sqfs        /mnt/ro        squashfs
>          defaults,auto,loop,noatime    0    0
>
>
>      Now this is a real use case for being able to split the rootfs
>     into several parts.
>
>      However, as Thomas mentioned, it's simpler to just use a complete
>     squashfs rootfs and put the unionfs on top of that. How? Somewhere
>     early in your init.d you put something like the following (a
>     script I swiped from the internet, don't remember where from; I
>     haven't actually tested it myself):
>
>     #!/bin/sh
>
>     CHROOT_PATH="/tmp/unionfs"
>     UNION_OPT="-o
>     allow_other,use_ino,suid,dev,nonempty,chroot=$CHROOT_PATH,max_files=32768"
>
>     #mount -t proc proc /proc
>     #mount -t tmpfs tmpfs /tmp
>
>     mkdir -p $CHROOT_PATH/root
>     mkdir -p $CHROOT_PATH/rw
>     mkdir -p /tmp/union
>
>     # Mount the filesystems
>     mount --bind / $CHROOT_PATH/root
>     # $CHROOT_PATH/rw is already on a tmpfs so doesn't need to be mounted
>
>     modprobe fuse
>     $CHROOT_PATH/root/usr/bin/unionfs $UNION_OPT /rw=RW:/root=RO
>     /tmp/union
>
>     #mount -t proc proc /tmp/union/proc
>
>     cd /tmp/union
>     mkdir oldroot
>     pivot_root . oldroot
>     cd /
>
>     # Move existing mounts, if any
>     #umount /proc
>     mount --move /oldroot/proc /proc
>     mount --move /oldroot/dev /dev
>     mount --move /oldroot/sys /sys
>     mount --move /oldroot/tmp /tmp
>     rmdir /tmp/union
>
>     -- 
>     Arnout Vandecappelle                          arnout at mind be
>     Senior Embedded Software Architect            +32-16-286500
>     <tel:%2B32-16-286500>
>     Essensium/Mind                                http://www.mind.be
>     G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
>     Leuven
>     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>     GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130125/cee45e54/attachment.html>

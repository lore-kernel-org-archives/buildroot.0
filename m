From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 25 Jan 2013 23:55:26 +0200
Subject: [Buildroot] Squashfs boot
In-Reply-To: <CAN_xxrXsvvupyo61cqZhCR4JyLwtCsm1NRAh9JCy_uVHRqGO4A@mail.gmail.com>
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
 <50FE8914.30909@petroprogram.com> <51017295.7020803@mind.be>
 <CAN_xxrUMYm_q7JvdJhCHWtcjzAVBxHkV3GHvZL4-ueur8ODvLA@mail.gmail.com>
 <5101B872.1090705@petroprogram.com>
 <CAN_xxrXsvvupyo61cqZhCR4JyLwtCsm1NRAh9JCy_uVHRqGO4A@mail.gmail.com>
Message-ID: <5102FF4E.1060405@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephen

I made a quick conversion of my LiveCD initramfs stuff to squashfs image
file and then played little bit with it and kernel image
with the help of qemu. (took less time than starting all
reconfiguring/combiling from buildroot)

The good news is that yes, it should be doable to do boot directly from
squashfs root image.

For example I did this to start it (ramdisk_size is in kilobytes):

qemu-system-i386 -kernel bzImage -initrd rootfs.sqfs -append
"ramdisk_size=131072"

It first tries to unpack rootfs as initramfs and then it notices that
it's not initramfs but traditional,
older version of initrd file. (please see root.png).

After that it should print RAMDISK: squashfs filesystem found and start
automatically loading it to ram.
(please see root2.png)

After that it continues normally and starts the normal init process.

And now the bad news:

- Takes a lot of memory. This is old style initrd stuff (time when 2.4
kernel was still hot and new).
- Squashfs is read-only so if you use mdev or udev then expect little
troubles (please see root3.png).

However maybe buildroot init already takes care of those ????


Now, you said you use grub to load ? Then either try givin that
rootfs.sqfs as in a separate line starting with "initrd
/path/to/your/rootfs.sqfs"
in your grub menu.lst (or is it grub.conf now?)
or if that does not work then giving kernel parameter in kernel line
like "initrd rootfs.sqfs" (or maybe "initrd=rootfs.sqfs")

The other way of using squashfs root from image could be maybe done with
initramfs and that script that Arnout posted (without unionfs stuff in
your case).
But maybe it needs some cleaning up first and pivot_root changed to
switch_root ???

Adding maybe this line to init script inside your initramfs to mount
rootfs.sqfs to loopback device just before switching to realroot:

mount -o loop rootfs.sqfs /mnt/realroot
switch_root /mnt/realroot

.... init continues normally here in the real root (squashfs image
mounted to loopback device, usually /dev/loop0) ....


Regards
Stefan

25.1.2013 1:47, Stephen Turner kirjoitti:
>
> Im hoping to use the raspberry pi (may need the special buildroot
> distro for that) but really were building this for soc risc boards in
> general. I am trying to stay away from loading to ram since its
> limited and we will be doing something like a freebsd nanobsd setup
> where scripts update software to 2 partitions one backup other
> booting. That way they have a fall back in the event a update goes
> south. It would be ideal to run the systems from a file instead of dd
> a image to an area. If i cant boot from the squash file then im
> thinking of just squashing the usr and mounting it at boot like i have
> done now as that leaves me with a 2 mb initrd + 40mb squash and 5 mb
> kernel so far on a 586 for a pilot.
>
> On Jan 24, 2013 5:40 PM, "Stefan Fr?berg"
> <stefan.froberg@petroprogram.com
> <mailto:stefan.froberg@petroprogram.com>> wrote:
>
>     Thin client? Ah, now I beging to understand why you needed to load
>     that squashfs image into ram.
>
>     So your thin client is totally diskless ? No hard drive at all ?
>     And you plan to load your squashfs image from server or usb stick
>     or from where ?
>
>     Stefan
>
>
>     24.1.2013 21:29, Stephen Turner kirjoitti:
>>
>>     I shouldnt need unionfs as im just loading a basic thinclient and
>>     having it in a ro image would be best to prevent accidental or
>>     intentional tampering when a simple reboot will fix. The rw items
>>     can use a temp ramdisk. Only issue i was running into was
>>     figuring out how to read a squashfs at boot with no initrd or
>>     basically  busybox squash output which is only bzImage and
>>     rootfs.squashfs. i have managed to move usr to squash and use the
>>     rest of the os as initrd but if thats what needs to be done then
>>     shouldnt the busybox build script handle that?
>>
>>     On Jan 24, 2013 1:50 PM, "Arnout Vandecappelle" <arnout@mind.be
>>     <mailto:arnout@mind.be>> wrote:
>>
>>         On 01/22/13 13:41, Stefan Fr?berg wrote:
>>         [snip]
>>
>>             My /etc/fstab look like this
>>             # /etc/fstab: static file system information.
>>             #
>>             # <file system> <mount pt> <type> <options> <dump> <pass>
>>             /modules.sqfs        /lib/modules    squashfs  
>>              defaults,auto,loop,noatime    0    0
>>             /firmware.sqfs      /lib/firmware    squashfs  
>>              defaults,auto,loop,noatime    0    0
>>             /dev/cdrom            /mnt/cdrom    iso9660    
>>              defaults,noatime    0    0
>>             /mnt/cdrom/usr.sqfs        /mnt/ro        squashfs
>>              defaults,auto,loop,noatime    0    0
>>
>>
>>          Now this is a real use case for being able to split the
>>         rootfs into several parts.
>>
>>          However, as Thomas mentioned, it's simpler to just use a
>>         complete squashfs rootfs and put the unionfs on top of that.
>>         How? Somewhere early in your init.d you put something like
>>         the following (a script I swiped from the internet, don't
>>         remember where from; I haven't actually tested it myself):
>>
>>         #!/bin/sh
>>
>>         CHROOT_PATH="/tmp/unionfs"
>>         UNION_OPT="-o
>>         allow_other,use_ino,suid,dev,nonempty,chroot=$CHROOT_PATH,max_files=32768"
>>
>>         #mount -t proc proc /proc
>>         #mount -t tmpfs tmpfs /tmp
>>
>>         mkdir -p $CHROOT_PATH/root
>>         mkdir -p $CHROOT_PATH/rw
>>         mkdir -p /tmp/union
>>
>>         # Mount the filesystems
>>         mount --bind / $CHROOT_PATH/root
>>         # $CHROOT_PATH/rw is already on a tmpfs so doesn't need to be
>>         mounted
>>
>>         modprobe fuse
>>         $CHROOT_PATH/root/usr/bin/unionfs $UNION_OPT /rw=RW:/root=RO
>>         /tmp/union
>>
>>         #mount -t proc proc /tmp/union/proc
>>
>>         cd /tmp/union
>>         mkdir oldroot
>>         pivot_root . oldroot
>>         cd /
>>
>>         # Move existing mounts, if any
>>         #umount /proc
>>         mount --move /oldroot/proc /proc
>>         mount --move /oldroot/dev /dev
>>         mount --move /oldroot/sys /sys
>>         mount --move /oldroot/tmp /tmp
>>         rmdir /tmp/union
>>
>>         -- 
>>         Arnout Vandecappelle                          arnout at mind be
>>         Senior Embedded Software Architect            +32-16-286500
>>         <tel:%2B32-16-286500>
>>         Essensium/Mind                                http://www.mind.be
>>         G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063
>>         RPR Leuven
>>         LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>>         GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB
>>         2450 2F1F
>>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130125/56d3d968/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: root.jpg
Type: image/jpeg
Size: 45905 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130125/56d3d968/attachment-0003.jpg>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: root2.jpg
Type: image/jpeg
Size: 41946 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130125/56d3d968/attachment-0004.jpg>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: root3.jpg
Type: image/jpeg
Size: 45919 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130125/56d3d968/attachment-0005.jpg>

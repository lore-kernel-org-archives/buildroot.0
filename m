From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 22 Jan 2013 14:41:56 +0200
Subject: [Buildroot] Squashfs boot
In-Reply-To: <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
Message-ID: <50FE8914.30909@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephen
22.1.2013 3:25, Stephen Turner kirjoitti:
>
> Sorry if my previous email went through. Im having some difficulty
> booting a squashfs with grub4dos on usb and grub2 from hd. In short im
> using bzImage for a kernel and trying to both boot the squashfs in ram
> and imaged to a usb drive. I havent found much info on how to use the
> squashfs from busybox and what i did find wasnt very helpful. Could
> someone point me to a how to for booting a busybox squash? Do i need
> to make my own initrd Image or edit some files such as fstab?
> I appreciate any and all input.
>
> Thanks
> Stephen
>
>

What I usually have is squashfs (xz-compressed) image of the whole /usr
(because that's usually the largest).

And everything else is in xz-compressed initramfs. Kernel extract and
loads the initramfs file(s) that you have
specified in grub to  automatically to ram. squashfs image does not need
to loaded to ram but mounted to
loopback devise /dev/loop0. However, when files are accessed in that
image it's contents can be also cached to ram.

The basic idea is that everything that is absolutely needed for booting
and running, the very minimal core of the
system, is located in that initramfs.

Now, in the /etc/inittab file there is usually a line like
null::sysinit:/bin/mount -a

That will instruct that all stuff in /etc/fstab should be mounted.

My /etc/fstab look like this
# /etc/fstab: static file system information.
#
# <file system>         <mount pt>    <type>        <options>       
<dump>     <pass>
/modules.sqfs        /lib/modules    squashfs   
defaults,auto,loop,noatime    0    0
/firmware.sqfs      /lib/firmware    squashfs   
defaults,auto,loop,noatime    0    0
/dev/cdrom            /mnt/cdrom    iso9660        defaults,noatime   
0    0
/mnt/cdrom/usr.sqfs        /mnt/ro        squashfs   
defaults,auto,loop,noatime    0    0
proc                /proc               proc         defaults         
0    0
devpts                /dev/pts           devpts      
defaults,gid=5,mode=620    0    0
tmpfs                   /dev/shm           tmpfs       mode=0777        
    0          0
tmpfs                   /tmp               tmpfs       
defaults              0          0
sysfs                /sys               sysfs        defaults         
0    0

What that does, is:

1 ) mount ./modules.sqfs (xz-compressed squashfs containing kernel
modules) to /lib/modules
2 ) mount ./firmware.sqfs (xz-compressed squashfs containing firmware
stuff) to /lib/firmware
3 ) mount Live-CD (the system itself that is running) to /mnt/cdrom. The
reason for this is
that storing usr.sqfs (xz-compressed squasfhs containing /usr) to
initramfs is waste of memory
while it can be stored into the root (outside of initramfs) of live-cd.
Just like I have done with kernel.
4 ) Mount /mnt/cdrom/usr.sqfs to /mnt/ro.
The reason for this is that later, in  /etc/init.d/rcS
im going to use unionfs to compine read-writeable /mnt/rw (just empty
directory without nothing mounted in)
 and read-only /mnt/ro (the xz-compressed squashfs image from Live-CD
root that just got mounted) to compined
read-write directory in /usr

It's all little compilacted but space and memory saving and stuff can be
written to /usr if need to (for example Xorg
needs at least one location inside/usr to be writable for fonts if I
remember correctly)

If you don't need writable /usr then you can just mount your
usr-squashfs directly to /usr.
If you don't need /usr at all but just want to squashfs your /  then
maybe it's doable but you still have to mount
few places as read-write for tmp files and other stuff.

Like:
mount -t tmpfs tmpfs /tmp

And maybe
mount -t tmpfs tmpfs /var/log

Ofcourse those can be also added to /etc/fstab

What exatcly you have inside that squashfs ? Just busybox and nothing else ?
In that case it's really not worth all the squashfs setup.

Regards
Stefan




>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130122/4b5e14f3/attachment.html>

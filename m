From: Ossy <ossy1980@gmx.net>
Date: Wed, 07 Jul 2010 20:00:35 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <87pqyz6dpa.fsf@macbook.be.48ers.dk>
References: <4C33AB4E.9050604@gmx.net> <87pqyz6dpa.fsf@macbook.be.48ers.dk>
Message-ID: <4C34C0C3.4000500@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.07.2010 07:52, schrieb Peter Korsgaard:
>>>>>> "Ossy" == Ossy<ossy1980@gmx.net>  writes:
>
>   Ossy>  Hi buildroot mailinglist,
>   Ossy>  After successfully compiling a whole rootfs and mounting it via loop
>   Ossy>  on some nfs export I started my arm ebedded device and ran into tho
>   Ossy>  following error after booting the image via tftp.
>
>   Ossy>  "init: I won't write compressed data to a terminal."
>
> What .config are you using? That string doesn't exist in the busybox
> init (or anywhere in busybox).

I'm using the configuration attached (you may need to ignore my custom 
settings for the sheevaplugbased DockStar).

I mount the generated rootfs with
mount -o loop,ro br_dist/dev/rootfs.ext2 /exports/rootfs/rfs1
and export it via nfs. The Kernel supports rootfs over nfs and was able 
to mount the filesystem via nfs. After that I get the above mentioned error.
As Mitch already mentioned, this error comes from bzip2 (or maybe gzip). 
So I guess there is some ext2 inline compression, which is not 
compatibel with the serial console?
I need to add, that I connect passing console=ttyS0,115200 to the kernel.

The cat of /exports/rootfs/rfs1/etc/inittab looks good to me:
debian-virtual:/exports/rootfs/rfs1# cat etc/inittab
# /etc/inittab
[...]
#

# Startup the system
null::sysinit:/bin/mount -o remount,rw /
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mkdir -p /dev/pts
null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Set up a couple of getty's
tty1::respawn:/sbin/getty 38400 tty1
tty2::respawn:/sbin/getty 38400 tty2

# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

# Logging junk
null::sysinit:/bin/touch /var/log/messages
null::respawn:/sbin/syslogd -n -m 0
null::respawn:/sbin/klogd -n
tty3::respawn:/usr/bin/tail -f /var/log/messages

# Stuff to do for the 3-finger salute
::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
null::shutdown:/usr/bin/killall klogd
null::shutdown:/usr/bin/killall syslogd
null::shutdown:/bin/umount -a -r
null::shutdown:/sbin/swapoff -a

Maybe it would work, if I do not watch the bootingprocess on the serial 
console, but I won't be able to verify if the system comes up without 
serialconsole output.

Regards for now,
Marcus
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100707/fc6b6b79/attachment-0002.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uClibc-config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100707/fc6b6b79/attachment-0003.ksh>

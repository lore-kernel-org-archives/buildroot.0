From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 23 Mar 2011 19:36:13 +0000
Subject: [Buildroot] proc not mouning
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99A012@EXV1.corp.adtran.com>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>
	<20110322195502.GA8662@tarshish>
	<4D88FFC6.1010404@michaelburghart.de>
	<20110322200337.GB8662@tarshish>
	<4D8904BF.5060503@michaelburghart.de>
	<4D898F3C.8010603@michaelburghart.de>
	<20110323171608.GC3225@nataf.siach.name>
	<1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F99A012@EXV1.corp.adtran.com>
Message-ID: <AANLkTikDqMH9RaLZK1ALpyBh8-qePa2C72RZ9LJReea6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My environment is different in that I tftpboot my kernel and mount the OS
over NFS (not using sd card)

This is my inittab:

[root at vx-200 ~]# cat /etc/inittab
# /etc/inittab
#
# This inittab is a basic inittab sample for sysvinit, which mimics
# Buildroot's default inittab for Busybox.
id:1:initdefault:

proc::sysinit:/bin/mount -t proc proc /proc
rwmo::sysinit:/bin/mount -o remount,rw /
dpts::sysinit:/bin/mkdir -p /dev/pts
moun::sysinit:/bin/mount -a
host::sysinit:/bin/hostname -F /etc/hostname
init::sysinit:/etc/init.d/rcS

1:1:respawn:/sbin/getty 38400 tty1
2:1:respawn:/sbin/getty 38400 tty2

S0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

# Logging junk
mess::sysinit:/bin/touch /var/log/messages
sysl:1:respawn:/sbin/syslogd -n -m 0
klog:1:respawn:/sbin/klogd -n

# Stuff to do for the 3-finger salute
rebo::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
sklo:6:wait:/usr/bin/killall klogd
ssys:6:wait:/usr/bin/killall syslogd
umou:6:wait:/bin/umount -a -r
swap:6:wait:/sbin/swapoff -a
[root at vx-200 ~]#


On Wed, Mar 23, 2011 at 7:32 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com>wrote:

> > -----Original Message-----
> > From: buildroot-bounces at busybox.net
> [mailto:buildroot-bounces at busybox.net] On Behalf Of Heyendal, Carl
> > Sent: Wednesday, March 23, 2011 2:03 PM
> > To: buildroot at busybox.net
> > Subject: [Buildroot] proc not mouning
> >
> > Hi,
> >
> > I've done something bad to my Buildroot platform, but I can't figure
> out what the problem is.
> >
> > When the initramfs system switches over to the root filesystem on an
> SD Card created by Buildroot,
> > it can't find /dev/null, and can't mount /proc.
> >
> > When I login the /proc directory is not mounted, but I can manually
> mount it however from the command
> > line.
> >
> > My inittab contains a statement to mount proc as well as another
> statement to do a 'mount -a'.
> > I verified that fstab contains an entry for proc. I know something is
> processing inittab because
> > the boot scripts that inittab calls do run.
>
> Are you mounting proc FIRST in inittab?
>
> Andy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110323/deaedde0/attachment.html>

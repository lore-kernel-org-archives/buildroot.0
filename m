From: Poole, Donald R. <drpoole@swri.org>
Date: Wed, 25 Jan 2012 15:16:57 +0000
Subject: [Buildroot] Buildroot RFS Login Question
Message-ID: <CB457908.2D7A%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 24, 2012 at 2:29 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>> "Donald" == Donald Poole <donny3000 at gmail.com<mailto:donny3000@gmail.com>> writes:

Hi,

 Donald> Unfortunately, if I use the root user get a "Login Incorrect"
 Donald> message and a new login prompt that looks like this: Starting
 Donald> input-event-daemon: done


 Donald>     Welcome to VICTORY Embedded
 Donald>     victory-embedded login: root
 Donald>     Login incorrect

 Donald>     victory-embedded login:


 Donald> I'm using the default filesystem skeleton.  I'm not sure what
 Donald> buildroot config information would be helpful, so I will need
 Donald> some more direction on what to give you guys for
 Donald> assistance. But i am using udev, my getty port is ttymxc0 at
 Donald> 115200 baudrate and I'm using BusyBox 1.19.x in the "Package
 Donald> Selection for Target" configuration.  I'm also using buildroot
 Donald> version builroot-2011.11.

Ok, and how do you boot the system, what kind of filesystem output are
you using?

I am booting the kernel with u-boot (Freescales u-boot for i.MX53 processors version rel_imx_2.6.35_11.01.00<http://opensource.freescale.com/git?p=imx/uboot-imx.git;a=commit;h=a069e6b2ca7e8f0ad39375ca12bec11bb0d41ba4>) with the boot arguments

console=ttymxc0,115200 video=mxcdi1fb:GBR24,XGA di1_primary tve root=/dev/mmcblk0p1 rw rootwait rootflags=barrier=1

I am directing all filesystem output to the console (ttymxc0).  This is my /etc/inittab file:

# Startup the system
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
null::sysinit:/bin/mkdir -p /dev/pts
null::sysinit:/bin/mkdir -p /dev/shm
null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Put a getty on the serial port
ttymxc0::respawn:/sbin/getty -L ttymxc0 115200 vt100 # GENERIC_SERIAL

# Stuff to do for the 3-finger salute
::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
null::shutdown:/usr/bin/killall klogd
null::shutdown:/usr/bin/killall syslogd
null::shutdown:/bin/umount -a -r
null::shutdown:/sbin/swapoff ?a

It should be the default inittab created by buildroot, but I wanted to post it anyway for everyone to take a look to see if anything might be suspect.

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120125/f50c57f4/attachment-0001.html>

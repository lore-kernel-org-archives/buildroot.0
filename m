From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Wed, 7 Apr 2010 11:24:01 +0530
Subject: [Buildroot] understanding and using buildroot
In-Reply-To: <532dd5841003242357g4120d757o2f992f898464a993@mail.gmail.com>
References: <532dd5841003231053w2b88f147ne655bc7985e65aff@mail.gmail.com>
	<4BA90F26.4020201@gmail.com>
	<532dd5841003231214t2f52726cge975b399849c87ca@mail.gmail.com>
	<1269373751.14674.7.camel@coalu.atr>
	<532dd5841003242337p88d33faw6ff39813e72e005e@mail.gmail.com>
	<1269499524.31425.1.camel@coalu.atr>
	<532dd5841003242357g4120d757o2f992f898464a993@mail.gmail.com>
Message-ID: <o2s532dd5841004062254s7e391604sa92cd8e705f2834f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 25, 2010 at 12:27 PM, Ravi Kumar Kulkarni
<ravilinux4u@gmail.com> wrote:
> On Thu, Mar 25, 2010 at 12:30 PM, Lionel Landwerlin
> <llandwerlin@gmail.com> wrote:
>> Le jeudi 25 mars 2010 ? 12:22 +0545, Ravi Kumar Kulkarni a ?crit :
>>> Hi all,
>>>
>>> On Wed, Mar 24, 2010 at 1:34 AM, Lionel Landwerlin
>>> <llandwerlin@gmail.com> wrote:
>>> > Le mercredi 24 mars 2010 ? 00:44 +0530, Ravi Kumar Kulkarni a ?crit :
>>> >> On Wed, Mar 24, 2010 at 12:27 AM, Paulius Zaleckas
>>> >> <paulius.zaleckas@gmail.com> wrote:
>>> >> > On 03/23/2010 07:53 PM, Ravi Kumar Kulkarni wrote:
>>> >> >>
>>> >> >> Hello everybody,
>>> >> >> finally after 2 weeks of struggling i managed to build buildroot!
>>> >> >> ?i have some doubts to clarify on usage of buildroot and regarding some
>>> >> >> packages
>>> >> >> i have built buildroot jffs2 image from using daily snapshot and
>>> >> >> booted onto target.
>>> >> >> but
>>> >> >> a)when i get login prompt what password should i enter for a user and for
>>> >> >> root?
>>> >> >
>>> >> > Initially password for root is empty. Just press Enter when you get asked
>>> >> > for password.
>>> >> ?i pressed enter but it is again comin back to login only.any idea wat
>>> >> might be wrong?
>>> >
>>> > Same problem here ... I do not
>>> > Boot your kernel with option init=/bin/sh, then change the root
>>> > password.
>>> >
>>> >>
>>> >> >> b)and what should be enabled to so as to login as root?
>>> >> >
>>> >
>>> > You can edit the /etc/inittab file to login automatically as root by
>>> > default on the console. Like this :
>>> >
>>> > tty0::respawn:/bin/sh # GENERIC_SERIAL
>>> >
>>> > Quite useful for people doing development on your board.
>>> >
>>> I tried the above possible options but no luck !! ?:( and im getting
>>> out of ideas!.
>>>
>>> this is what my console gives me when i tried to login
>>>
>>>
>>> (none) login: root
>>> Dec 31 17:01:01 (none) auth.info login[63]: root login on 'ttyS0'
>>> Dec 31 17:01:01 (none) daemon.info init: process '/sbin/getty -L ttyS0
>>> 115200 vt100 ' (pid 63) exited. Scheduling for restart.
>>> Dec 31 17:01:01 (none) daemon.info init: starting pid 64, tty
>>> '/dev/ttyS0': '/sbin/getty -L ttyS0 115200
>>>
>>>
>>>
>>> (none) login: user
>>> Password:
>>> Dec 31 17:01:08 (none) daemon.info init: process '/sbin/
>>>
>>> my /etc/ inittab file is shown below.
>>> # /etc/inittab
>>> #
>>> # Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
>>> #
>>> # Note: BusyBox init doesn't support runlevels. ?The runlevels field is
>>> # completely ignored by BusyBox init. If you want runlevels, use
>>> # sysvinit.
>>> #
>>> # Format for each entry: <id>:<runlevels>:<action>:<process>
>>> #
>>> # id ? ? ? ?== tty to run on, or empty for /dev/console
>>> # runlevels == ignored
>>> # action ? ?== one of sysinit, respawn, askfirst, wait, and once
>>> # process ? == program to run
>>>
>>> # Startup the system
>>> null::sysinit:/bin/mount -t proc none /proc
>>> null::sysinit:/bin/mount -t sysfs none /sys
>>> null::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
>>> null::sysinit:/bin/mkdir /dev/pts
>>> null::sysinit:/bin/mount -t devpts devpts /dev/pts
>>> null::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
>>> null::sysinit:/sbin/mdev -s
>>> null::sysinit:/bin/mount -o remount,rw /
>>> null::sysinit:/bin/mount -a
>>> null::sysinit:/bin/hostname -F /etc/hostname
>>> null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
>>> null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
>>> # now run any rc scripts
>>> null::sysinit:/etc/init.d/rcS
>>>
>>> # Set up a couple of getty's
>>> tty1::respawn:/sbin/getty 38400 tty1
>>> tty2::respawn:/sbin/getty 38400 tty2
>>>
>>>
>>>
>>> # Put a getty on the serial port
>>> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>>
>> Replace previous line by :
>>
>> ttyS0::respawn:/bin/sh
>
> i did ?now im not login prompt also. im ?gettin ths
>
> ?17:00:12 (none) daemon.info init: process '/bin/sh' (pid 63) exited.
> Scheduling for restart.
> ?17:00:12 (none) daemon.info init: starting pid 64, tty '/dev/ttyS0': '/bin/sh'
>
>>>
>>> # Logging junk
>>> null::sysinit:/bin/touch /var/log/messages
>>> null::respawn:/sbin/syslogd -n
>>> null::respawn:/sbin/klogd -n
>>> tty3::respawn:/usr/bin/tail -f /var/log/messages
>>>
>>> # Stuff to do for the 3-finger salute
>>> ::ctrlaltdel:/sbin/reboot
>>>
>>> # Stuff to do before rebooting
>>> null::shutdown:/usr/bin/killall klogd
>>> null::shutdown:/usr/bin/killall syslogd
>>> null::shutdown:/bin/umount -a -r
>>> null::shutdown:/sbin/swapoff -a
>>>
>

SOLVED ! The problem was in kernel config. kernel was not recognising
getty . now its working like a charm. thanks to buildroot
which allows to build filesystems at this ease.:) now im off to build
TinyX and hope to get xserver working.
warm regards,
Ravi Kulkarni

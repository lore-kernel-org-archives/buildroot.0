From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Tue, 15 Mar 2011 14:14:09 -0400
Subject: [Buildroot] inittab for Busybox
In-Reply-To: <20110315180743.5e34890b@surf>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
Message-ID: <1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Comments below.....
/carl h.

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: March 15, 2011 1:08 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] inittab for Busybox
> 
> Hello,
> 
> On Tue, 15 Mar 2011 12:37:01 -0400
> "Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:
> 
> > I have not enabled support for sysvinit in my project. Could someone
> > tell me why Buildroot adds an inittab file that's incompatible with
> > BusyBox? I looked at the mail archives but no one seems to have asked
> > that question before.
> 
> How do you see that the inittab is incompatible with Busybox ? Many of
> us use it every day without problem.

[Heyendal, Carl] 
Hmmmm....I unselected the sysvinit option in busybox and recompiled from
Buildroot. But there was still an incompatible inittab file being used. I know 
Buildroot picked up my changes in Busybox because I also added support for klogd
which got reflected in the newer inittab file.

Here's my inittab file that Buildroot added to /etc:

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

	ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

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

Here's some debug output from running this inittab file:

	Bad inittab entry at line 5
	can't open /dev/proc: No such file or directory
	can't open /dev/rwmo: No such file or directory
	can't open /dev/dpts: No such file or directory
	can't open /dev/moun: No such file or directory
	can't open /dev/host: No such file or directory
	can't open /dev/init: No such file or directory
	can't open /dev/mess: No such file or directory
	can't open /dev/sklo: No such file or directory
	can't open /dev/ssys: No such file or directory
	can't open /dev/umou: No such file or directory
	can't open /dev/swap: No such file or directory
	can't open /dev/1: No such file or directory
	can't open /dev/2: No such file or directory
	can't open /dev/S0: No such file or directory
	can't open /dev/sysl: No such file or directory
	can't open /dev/klog: No such file or directory

Clearly it's not compatible. Note the above file comment:
"This inittab is a basic inittab sample for sysvinit"

> 
> When sysvinit is not selected, fs/skeleton/etc/inittab is the inittab
> that is used, and it is compatible with Busybox init.
> 
> When sysvinit is selected, package/sysvinit/inittab is used instead.
> 

[Heyendal, Carl] 
Do I have to change the inittab file manually? Or should I go a global 
recompile? Or delete the filesystem and recompile?

> > Also in the mail archives, some reference is made to documentation
> > about creating your own inittab file. Does that documentation still
> > exist somewhere? I've looked but can't find it.
> 
> You should refer to the Busybox documentation, as this is not something
> related to Buildroot directly. See examples/inittab in Busybox sources.
> 

[Heyendal, Carl] 
Good to know.

> Regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

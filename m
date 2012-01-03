From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 3 Jan 2012 08:10:48 -0600
Subject: [Buildroot] Different runlevels support
In-Reply-To: <1F383CDA589639468828C7E2B75EDE9D096DE461@POCITMSEXMB03.LntUniverse.com>
References: <1F383CDA589639468828C7E2B75EDE9D096DE3C1@POCITMSEXMB03.LntUniverse.com>
 <CALR4fEKNQp=Ee=V0WQAqeYjE_L5E9Rr=QALLtuUuUhz=wFKEnA@mail.gmail.com>
 <1F383CDA589639468828C7E2B75EDE9D096DE461@POCITMSEXMB03.LntUniverse.com>
Message-ID: <201201030810.51116.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon January 2 2012, Mahanteshwari Hiremath wrote:
> >>Busybox's init does not support run levels. All scripts are executed always.
> 
> >>Are you sure you are running sysv init and not busybox?
> 
> Hi,
> Yes I am using sysv init not busy box, I have completely disabled init
> utilities in busybox and enabled sysvinit. 
>  And the contets of the sysvinit generated inittab are like this,
> 

The command: 'man inittab' on a system with sysv installed will give
you all the gory details, but...

> 
> # /etc/inittab
> #
> # This inittab is a basic inittab sample for sysvinit, which mimics
> # Buildroot's default inittab for Busybox.
> id:1:initdefault:
> 
> proc::sysinit:/bin/mount -t proc proc /proc
> rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
> dpts::sysinit:/bin/mkdir -p /dev/pts
> moun::sysinit:/bin/mount -a
> host::sysinit:/bin/hostname -F /etc/hostname
> init::sysinit:/etc/init.d/rcS
> 
> 1:1:respawn:/sbin/getty 38400 tty1
> 2:1:respawn:/sbin/getty 38400 tty2
> 

If you want the above to happen in all levels except 0 & 6 :
1:12345:respawn:/sbin/getty 38400 tty1
2:12345:respawn:/sbin/getty 38400 tty2

Other examples in the man(ual), such as how to use the S&K scripts.
If you don't have a system with the sysvinit manual installed,
Google can find you a copy posted on the web.

Mike
> S0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
> 
> # Logging junk
> mess::sysinit:/bin/touch /var/log/messages
> sysl:1:respawn:/sbin/syslogd -n -m 0
> klog:1:respawn:/sbin/klogd -n
> 
> # Stuff to do for the 3-finger salute
> rebo::ctrlaltdel:/sbin/reboot
> 
> # Stuff to do before rebooting
> sklo:6:wait:/usr/bin/killall klogd
> ssys:6:wait:/usr/bin/killall syslogd
> umou:6:wait:/bin/umount -a -r
> swap:6:wait:/sbin/swapoff -a
> 
> 
> can u tell what else to do next to get all other runlevels.
> 
> 
> 
> Regards,
> Mahanteshwari.
> 
> 
> Larsen & Toubro Limited
> 
> www.larsentoubro.com
> 
> This Email may contain confidential or privileged information for the intended recipient (s) If you are not the intended recipient, please do not use or disseminate the information, notify the sender and delete it from your system.
> 

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jun 2011 16:33:15 +0200
Subject: [Buildroot] Buildroot root fs over NFS bug
In-Reply-To: <4E09C8A0.8000808@labri.fr>
References: <4E09C8A0.8000808@labri.fr>
Message-ID: <20110628163315.7f9a2527@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 28 Jun 2011 14:27:12 +0200,
Jigar SOLANKI <jigar.solanki@labri.fr> a ?crit :

> I'm trying to build a full Linux environment on a Virtex4 FPGA board.
> I'm actually using a sparc's clone (LEON).
> I've successfully built and run the system using grmon
> grmon> load image.ram
> grmon> run
> 
> But when it comes to mount the root filesystem over NFS, i get the
> following error :

According to the following log, you are not mounting your root
filesystem over NFS.

> ...
> IP-Config: Complete:
>      device=eth0, addr=10.10.10.1, mask=255.255.255.0,
> gw=10.10.10.254, host=houat, domain=, nis-domain=(none),
>      bootserver=10.10.10.254, rootserver=10.10.10.254, rootpath=
> Freeing unused kernel memory: 5060k freed

This is the last line from the kernel.

> Initializing random number generator... done.

This is the first line from the userspace initialization scripts. So I
guess your root filesystem is in an initramfs.

> Starting network...
> ip: RTNETLINK answers: File exists
> Starting NFS statd: touch: /var/lock/subsys/nfslock: No such file or
> directory

presumably the nfs-utils init script forgets to create this subsys
directory.

> done
> Starting NFS services: *** invalid open64 call: O_CREAT without mode
> ***: /usr/sbin/exportfs terminated
> ======= Backtrace: =========
> /lib/libc.so.6(__open64_2+0x28)[0x50133790]
> /usr/sbin/exportfs[0x15ca8]
> /usr/sbin/exportfs[0x13d90]
> /usr/sbin/exportfs[0x11f3c]
> /lib/libc.so.6(__libc_start_main+0x10c)[0x50079674]
> /usr/sbin/exportfs[0x11154]
> ======= Memory map: ========
> 00010000-00019000 r-xp 000000

Looks like a bug in exportfs.

But if your goal is to mount a root filesystem over NFS, then the
nfs-utils package is useless. The kernel contains all the necessary
bits to mount a NFS filesystem as the root filesystem.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 16:05:58 +0100
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
	<20101214150520.253b9bae@surf>
	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>
	<20101214154228.51a969b6@surf>
	<AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
Message-ID: <20101214160558.325cddcb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 16:54:00 +0200
Diego Iastrubni <diegoiast@gmail.com> wrote:

> VFS: Mounted root (nfs filesystem) on device 0:12.
> Freeing init memory: 152K
> Populating /dev using udev: done
> Initializing random number generator... read-only file system
> detected...done
> Starting network...
> ip: RTNETLINK answers: File exists
> GPIO_M: init
> usbcore: registered new interface driver fjveincam
> v2.21:USB PalmVeinCam driver
> net eth0: MAC Address: 00:11:22:33:44:57
> */bin/sh: can't access tty; job control turned off*
> 
> The line before comes from some S90* init.d script (this is OK). I don't
> understand where does it come from.

This last line "can't access tty; job control turned off" means that
the shell has been started directly on /dev/console, which is normal is
you start a shell directly from an init.d script, because those scripts
are executed with /dev/console as the standard input, standard output,
standard err.

You really having *nothing* else on the serial line after what you
sent ?

According to your Buildroot configuration, your /etc/inittab should
contain a line :

ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

and you should see a login prompt on this serial line.

It's the /etc/inittab file that decides on which terminals a login
prompt should appear, by starting a getty program on those terminals.

What does your /etc/inittab look like ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

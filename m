From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 14 Dec 2010 15:39:45 +0200
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <20101214142544.7863d2d2@surf>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
Message-ID: <AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nope. In my original case /dev/tty was not a char device (a null file
instead). Creating these files fixed the problem:

rm -fr $ROOT/dev/*


mknod $ROOT/dev/tty     c 5 0


mknod $ROOT/dev/console c 5 1


mknod $ROOT/dev/null    c 1 3


mknod $ROOT/dev/tty0    c 4 0


mknod $ROOT/dev/tty1    c 4 1


mknod $ROOT/dev/tty2    c 4 2


mknod $ROOT/dev/tty3    c 4 3


mknod $ROOT/dev/ttyS0   c 4 64

(I only need the very basic before udev starts).

If I write "/bin/sh" at /etc/init.d/rc.S I *do* get a working shell, so my
problem is with login.

On Tue, Dec 14, 2010 at 3:25 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Tue, 14 Dec 2010 15:06:43 +0200
> Diego Iastrubni <diegoiast@gmail.com> wrote:
>
> > I am using buitdroot to create my development environment (the
> > production is something bigger and slower made manually once...). I
> > am using codesourcery for arm as the toolchain. the HW (which is not
> > relevant  to the scenario) is an OMAP3 device boots with my old
> > firmware).
> >
> > I forked (I use git and not released versions)  buildroot a few
> > months and its worked after I manually mknod'ed some devices. Now I
> > pulled from you guys, and now I cannot even login to my new clean
> > environment (last time it was /dev/tty ,which was not correct). Does
> > anyone have an idea?
>
> What is your boot log ?
>
> Quite likely, you should read
> http://buildroot.org/downloads/buildroot.html#faq-boot-hangs, but there
> may be other problems as well, of course.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/d5f9be56/attachment.html>

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 08 Sep 2010 17:07:33 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <201009081648.41500.yann.morin.1998@anciens.enib.fr> (Yann
	E. MORIN's message of "Wed, 8 Sep 2010 16:48:41 +0200")
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
	<201009081648.41500.yann.morin.1998@anciens.enib.fr>
Message-ID: <87k4mwclze.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

Hi,

 >> Isn't this largely obsolete now we have devtmpfs?

 Yann> Well, devtmpfs has a static naming scheme, default permissions for device
 Yann> nodes, so it is not sufficient by itself. As the help entry for devtmpfs
 Yann> states:
 Yann>  "It provides a fully functional /dev directory, where usually
 Yann>   udev runs on top, managing permissions and adding meaningful
 Yann>   symlinks."

True, but it is fine for most small embedded systems as well (E.G. the
target group of buildroot). Most of these are root only so you just want
the device nodes of the hw you have available.

But yes, it can certainly be used with mdev as well (you basically just
get rid of the slow mdev -s at startup).

 Yann> Even better, embedded system have a mostly static set of devices, thus a
 Yann> mostly static set of entries in /dev, and those can go to flash. Entries
 Yann> for removeable devices (eg. usb sticks) can still go there. Thus you gain
 Yann> both in flash (no space used by any code, kerenl or userland) and in RAM
 Yann> (no space used by devtmpfs/tmpfs/ramfs/... and VFS entries).

The devtmpfs code is very small if you already have ramfs/tmpfs (and
most likely you do), so the size difference between devtmpfs and static
/dev is really down in the noise.

 Yann> Really, devtmpfs and mdev/udev are for desktop, where the set of
 Yann> devices is to easily divergent, IMHO...

Depends on what you want to do. You fairly often see embedded devicess
that react when you plug in a usb device. For that, mdev (or other
hotplug scripts) are pretty nice.

-- 
Bye, Peter Korsgaard

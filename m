From: Brad House <brad@mainstreetsoftworks.com>
Date: Tue, 21 Aug 2007 11:02:51 -0400
Subject: [Buildroot] Can't access tty; job control turned off.
In-Reply-To: <200708211546.13079.rolf@elektronix.no>
References: <200708211546.13079.rolf@elektronix.no>
Message-ID: <46CAFE9B.7050808@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> The image is supposed to work on an embedded device, running the AMD Geode x86 
> CPU. The boot is working as intended, with switch_root and tmpfs, etc, but 
> when init is initializing the problem is that I get no login prompt. sysinit 
> can't pull /sbin/getty on /dev/tty1 with the default inittab which comes with 
> buildroot/busybox. 
> after adding ::sysinit:/bin/ash in /etc/inittab, I get a shell running 
> on /dev/console, but along comes:
> 
> /bin/ash: can't access tty; job control turned off
> 
> I've read every post I can imagine on the subject, but there is something here 
> I just don't get.
> I'd really appreciate any hints, preferable solutions ;) on this.. I'm so 
> stuck with this, and my time is running out soon..
> All device nodes are created properly in /dev from /sys.
> Please let me know if I've forget to include some information.

Are you sure your device nodes are infact created properly?
I've seen some setups where the device nodes look like they are
there, but infact, they are files by the same name, not device
nodes.  Are you using udev, or mdev with busybox?

I've got a geode system (soekris net4801) running the latest svn
and all is working fine. I use udev, personally.  You do have to
edit your /etc/inittab though, as you need to add:
ttyS0::respawn:/sbin/getty -L ttyS0 19200 vt100
To make getty listen on ttyS0, since the standard tty's won't work.

Also, what are your bootargs for the kernel? You should at least have
the console specified:
console=ttyS0,19200n8

-Brad

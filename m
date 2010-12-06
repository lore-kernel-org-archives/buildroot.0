From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 20:48:59 +0100
Subject: [Buildroot] [PATCH 50/55] xtensa: remove unused and useless
 skeleton patch
In-Reply-To: <522C1DF17AF50042AD8AE87F7887BD3D01E0B5DDE6@exch.hq.tensilica.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<668fe87ee8e6c80825b87382fb17dc9cacc43c0e.1291582352.git.thomas.petazzoni@free-electrons.com>
	<522C1DF17AF50042AD8AE87F7887BD3D01E0B5DDE6@exch.hq.tensilica.com>
Message-ID: <20101206204859.51b3cd6f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marc,

On Sun, 5 Dec 2010 17:08:50 -0800
Marc Gauthier <marc@tensilica.com> wrote:

> Hi Thomas,
> 
> We're using this particular inittab for our boards.
> I realize I haven't sync'ed buildroot recently, but is
> there now a more appropriate way to do this, that makes
> this approach "useless" ?

Here is the diff between the default skeleton inittab and the xtensa
specific inittab (and my comments below) :

--- fs/skeleton/etc/inittab	2010-12-06 20:42:36.152606620 +0100
+++ target/device/xtensa/skeleton-patch/etc/inittab	2010-12-06 20:42:36.462605512 +0100
@@ -14,26 +14,25 @@
 # process   == program to run
 
 # Startup the system
-null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
 # Set up a couple of getty's
-tty1::respawn:/sbin/getty 38400 tty1
-tty2::respawn:/sbin/getty 38400 tty2
+#tty1::respawn:/sbin/getty 38400 tty1
+#tty2::respawn:/sbin/getty 38400 tty2
 
 # Put a getty on the serial port
-#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
+ttyS0::respawn:/sbin/getty -L ttyS0 38400 vt100
 
 # Logging junk
 null::sysinit:/bin/touch /var/log/messages
 null::respawn:/sbin/syslogd -n -m 0
 null::respawn:/sbin/klogd -n
-tty3::respawn:/usr/bin/tail -f /var/log/messages
+#tty3::respawn:/usr/bin/tail -f /var/log/messages
 
 # Stuff to do for the 3-finger salute
 ::ctrlaltdel:/sbin/reboot

So it does three things:

 * Moves the read/write remount of the root filesystem after mounting
   proc, which probably makes sense to have in the default skeleton
   (there has been a thread recently on the list about this).

 * It enables a getty on ttyS0, and we have an option to do that in
   Buildroot (which this patch set moves to a new "System
   configuration" menu).

 * It removes things from tty1, tty2, tty3. They don't do much harm if
   tty1, tty2 and tty3 are not visible, but if we really think it's
   useful to be able to disable them, we can just add some more generic
   options in the "System configuration" menu.

So I think all those three changes can be handled without having a
specific inittab, which is why I called the Xtensa specific one
"useless" (sorry if the word sounded offensive, it definitely wasn't my
intention).

Does this clarifies what I meant ?

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

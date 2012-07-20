From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 10:02:19 +0200
Subject: [Buildroot] [PATCH] avahi: only install
 default.script/S05avahi-setup.sh if not present in fs skeleton
In-Reply-To: <CANxTyt4p2hR7StT27=SXN40KcYY4L-oBVfZ5V=dOYKLuY7GTfw@mail.gmail.com>
References: <1341980076-28347-1-git-send-email-danomimanchego123@gmail.com>
 <20120717234535.6ae0b109@skate>
 <CANxTyt4p2hR7StT27=SXN40KcYY4L-oBVfZ5V=dOYKLuY7GTfw@mail.gmail.com>
Message-ID: <20120720100219.0317a30e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 19 Jul 2012 21:53:45 -0400,
Danomi Manchego <danomimanchego123@gmail.com> a ?crit :

> > If avahi is built before
> > Busybox, then you'll have the Avahi script. If Busybox is built before
> > Avahi, then you'll have the Busybox script. This doesn't look correct.
> 
> Would it be appropriate to add something like this to busybox.mk, so that
> Avahi always gets built first?
> 
> ifeq ($(BR2_PACKAGE_AVAHI),y)
> # Compile Avahi first, to ensure proper preference of conditional
> udhcpc/default.script installations
> BUSYBOX_DEPENDENCIES += avahi
> endif

Well, I think the whole idea of testing whether a configuration file has
already been copied or not to the target filesystem to avoid
overwriting files from the skeleton is not nice (I think using the
post-build script to overwrite configuration files is a much better
idea), but I know Peter wants this to work.

So, if we indeed want the Avahi udhcpc configuration file to take
precedence over the busybox one, we would have to do what you suggest.

I ran a diff between the Busybox udhcpc script and the Avahi one and
got the following result:

--- ../busybox/udhcpc.script	2012-03-09 11:23:50.255418372 +0100
+++ busybox-udhcpc-default.script	2011-05-12 22:43:39.000000000 +0200
@@ -10,10 +10,29 @@
 
 case "$1" in
 	deconfig)
-		/sbin/ifconfig $interface 0.0.0.0
+		grep -q -v ip= /proc/cmdline
+		if [ $? -eq 0 ]; then
+			/sbin/ifconfig $interface up
+		fi
+		grep -q -v nfsroot= /proc/cmdline
+		if [ $? -eq 0 ]; then
+			/sbin/ifconfig $interface 0.0.0.0
+		fi
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -k $interface
+		fi
+		;;
+
+	leasefail|nak)
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -wD $interface --no-chroot
+		fi
 		;;
 
 	renew|bound)
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -k $interface
+		fi
 		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
 
 		if [ -n "$router" ] ; then

The parts around avahi-autoipd are obviously here for a reason, but why
does it need to test for ip= and nfsroot= in the kernel command line in
Avahi case and not in Busybox case?

One possibility would be to simply put the Avahi variant of the script
into the Busybox package. When Avahi is not installed, the
avahi-autoipd tests would simply ensure that the script does not try to
use Avahi.

Also, the current Avahi installation makes the assumption that Busybox
is in the system, and that its DHCP client is used. But we have another
DHCP client packaged in Buildroot (though I admit most people probably
use the one from Busybox).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

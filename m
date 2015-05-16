From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 07:03:26 +0000 (UTC)
Subject: [Buildroot] [Bug 8116] 2015.05-rc2 raspberrypi2_defconfig network
 interface not coming up
In-Reply-To: <bug-8116-163@https.bugs.busybox.net/>
References: <bug-8116-163@https.bugs.busybox.net/>
Message-ID: <20150516070326.D6EDC81768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8116

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2015-05-16 07:03:26 UTC ---
It is because the rpi uses a usb<>ethernet adapter, and USB initialization
happens after (or rather in parallel) with the rootfs getting mounted and init
running - So eth0 isn't available by the time ifup runs.

Busybox ifup/ifdown isn't made to handle such dynamic setups, but perhaps we
could add a wait-for-eth0 init script for the rpi that does something like:

etc/init.d/S40eth0
#!/bin/sh
#
# Wait for (usb based) eth0 to get detected
#

case "$1" in
  start)
        echo -n "Waiting for eth0 ... "
        while [ ! -d /sys/class/net/eth0 ]; do sleep 1; done
        echo "done"
        ;;
  stop)
        ;;
  restart|reload)
        "$0" stop
        "$0" start
        ;;
  *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
esac

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

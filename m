From: wzab <wzab01@gmail.com>
Date: Tue, 27 Dec 2011 00:57:56 +0100
Subject: [Buildroot] SOLVED! Re: Buildroot 2011.11 on x86_64 - neither
 udev nor mdev loads needed modules at startup
In-Reply-To: <4EF8FABB.9060104@gmail.com>
References: <4EF8FABB.9060104@gmail.com>
Message-ID: <4EF90A04.7090101@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've tested yet another configuration. With modprobe provided by busybox and without external module-init-tools.
In this setup the modprobe is located correctly in /sbin, so the only modification needed to assure automatic loading of modules is addition of "udevadm trigger --action=add" to the 
/etc/init.d/S10udev file right after the  $UDEV_BIN -d || (echo "FAIL" && exit 1) line.

It could be interesting to check if the automatic loading of modules with mdev may be achieved using the recipe described in: https://bugs.busybox.net/show_bug.cgi?id=2377
i.e. by writing the script:

#!/bin/sh
[ "$ACTION" = add ]&&  [ "$MODALIAS" != "" ]&&  modprobe $MODALIAS
[ "$ACTION" = remove ]&&  [ "$MODALIAS" != "" ]&&  modprobe -r $MODALIAS
/sbin/mdev $@

and passing it's path to the /sys/kernel/uevent_helper
(or simply to the CONFIG_UEVENT_HELPER_PATH in the kernel configuration).
If someone verifies it, please let me know. I think, I'll stay with my udev based setup ;-).
-- 
Regards,
Wojtek

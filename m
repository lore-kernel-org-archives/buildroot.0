From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Jul 2019 21:03:29 +0000
Subject: [Buildroot] [Bug 11766] Console (getty) issues with systemd
In-Reply-To: <bug-11766-163@https.bugs.busybox.net/>
References: <bug-11766-163@https.bugs.busybox.net/>
Message-ID: <bug-11766-163-TBebZII79s@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11766

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
Tested with buildroot master and raspberrypi3_64_defconfig with the following
changes:

- change to glibc
- channge to init systemd

No login on HDMI, double Buildroot login on serial.

After changing cmdline.txt from:

    root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200

to (as described in [1]):

    root=/dev/mmcblk0p2 rootwait console=ttyAMA0,115200 console=tty1

everything worked fine...

Login from serial, getty for HDMI console runs:

    /sbin/agetty -o -p -- \u --noclear --keep-baud console 115200,38

Login from HMDI conole, getty for serial runs:

    /sbin/agetty -o -p -- \u --keep-baud 115200,38400,9600 ttyS0 vt220

Mind to share your config/defconfig file?

[1] https://patchwork.ozlabs.org/patch/668134

-- 
You are receiving this mail because:
You are on the CC list for the bug.

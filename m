From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Aug 2016 21:32:02 +0000
Subject: [Buildroot] [Bug 9176] minnowboard : USB not mounted
In-Reply-To: <bug-9176-163@https.bugs.busybox.net/>
References: <bug-9176-163@https.bugs.busybox.net/>
Message-ID: <bug-9176-163-nLOwG5wC0U@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9176

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Christophe,

I'm a bit surprised that you say that you are "not able to mount an
external USB".

First, check that the partitions on the device are detected:

    $ cat /proc/partitions

If not, then you are missing a driver in your kernel (unlikely as you
said it was "detected").

Next, can you actually mount your USB drive manually, e.g. with:

    $ mkdir /tmp/test
    $ mount /dev/sda1 /tmp/test

If not, you might be missing support for that filesystem in the kernel.

If something was not working so far, then you need to adapt your Linux
kernel configuration to enable additional support (be it a driver or a
filesystem or both):

    $ make linux-menuconfig
       (and then enable the missing pieces)
    $ make

And then restart from the beginning.

If everything works so far, then it means you are missing to mount the
partitions dynamically. You have to know that block devices are never
automounted by the kernel; you need a userspace program for that.

Ezequiel provided a list of possible solution to make the partitions
mounted automatically.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

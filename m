From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jun 2014 19:09:14 +0200
Subject: [Buildroot] Check root file system at boot time
In-Reply-To: <1401897756168-71600.post@n4.nabble.com>
References: <1401897756168-71600.post@n4.nabble.com>
Message-ID: <20140604170914.GA3325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-06-04 09:02 -0700, psnsilva spake thusly:
> I am facing a problem with checking my root file system at boot time and I
> don't know what I am missing here.
> The target device is a Raspberry Pi and my intention is to check the SD card
> at boot time.

This should not be necessary if the system is properly shut down or
rebooted. In case of power failure, the filesystem is automatically
checked by the filesystem "driver" in the kernel.

Besides, with the standard Buildroot boot process, the root filesystem is
already mounted by the time you can run e2fsck, so you're out of luck in
any case.

> and running "*e2fsck -n /dev/mmcblk0p2*" I get:
> e2fsck -n /dev/mmcblk0p2

You should *not* run fsck on a read-write mounted filesystem. This could
gravely confuse the filesystem "driver" in the kernel.

> In addition, running e2fsck to the SD card, but using my Linux PC is
> working. At the next rPi boot the messages does not appear. Reappearing
> again on the the second and following boots.
> 
> Am I missing some needed scripts at /etc/init.d/ (e.g., SXXcheckroot)?

How do you turn off your RPi? If you just unplug the power from the RPI
without doing a proper shutdown, then it is expected the filesystem will
be incoherent, and a repair is done on the next boot.

I have a bunch of RPi herre at home, and I never experienced this
behaviour when I issue a "shutdown" or a "poweroff" command before
unplugging the power supply.

BTW, the "poweroff" command will not power off the RPI, obviously, since
it lacks a power control circuit, but will flash the "ACT" LED 10 times
when it is safe to remove the power supply from the RPi  (I discovered
that by accident, and it is very handy on a headless RPi!)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

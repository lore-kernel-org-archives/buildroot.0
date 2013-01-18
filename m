From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jan 2013 14:55:32 +0100
Subject: [Buildroot] designing a firmware update mechanism
In-Reply-To: <1358460573.32266.63.camel@genx> (John Stile's message of "Thu,
 17 Jan 2013 14:09:33 -0800")
References: <1358460573.32266.63.camel@genx>
Message-ID: <87bocmioiz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Stile <john@stilen.com> writes:

Hi,

 John> So far I am trying to split NAND in redundant halves (each with a copy
 John> of uboot + uboot-env + kernel + roofs), and modify at91bootstrap to
 John> choose which uboot to load, based on something inside the uboot-env
 John> areas.

 John> Will I need to compile 2 versions of uboot, differing only in where to
 John> look for the uboot-env, or is there another way?  If so, is there a way
 John> to do this within buildroot, or does uboot need to become an external
 John> project from my buildroot setup?

 John> Could anyone share a firmware update strategy for a project that uses
 John> buildroot, at91bootstrap, and uboot, or is that outside the scope of
 John> this list?

I would suggest you use something simpler than the u-boot environment
(as you would have to extend at91bootstrap to be able to read &
understand it to figure out what u-boot to load).

I have in the past done something similar, just with everything in NOR
flash. At91bootstrap is in the first flash sector and never updated in
the field. Everything after that is doubled, and at91bootstrap figures
out what u-boot to load, which in turn figures out to load the correct
kernel / use the correct rootfs.

As indicator to at91bootstrap about which part it should load (low/high)
I used the unused flash sector in the upper half of the flash
(E.G. where the 2nd copy of at91bootstrap would have been if it would
have been stored double) as that's very simple to read.

A little ascii art probably helps:

flash sector       part
0                  at91bootstrap
1                  u-boot low
..                 u-boot environment low
..                 linux low
..                 rootfs low

n/2                low/high boot marker
n/2 + 1            u-boot high
..                 u-boot environment high
..                 linux high
..                 rootfs high

As an extension, at91bootstrap also starts the watchdog with a long
timeout (~16s on at91). This is used as kind of a 'bootup watchdog' for
extra safety. The software will only kick the watchdog once it is
completely booted, so if the watchdog ever fires we know the system
couldn't boot. It is simple to check for this condition in at91bootstrap
(register in reset controller), and I simply revert to the other half of
the flash in that case.

Finally the choice of what part has been selected is stored somewhere
that U-Boot can easily read it (In my implementation I used GPB3, but a
location in SRAM could be used as well).

U-Boot then reads this value and uses it to select what kernel/rootfs
to use.

The low/high boot marker is simply the first byte in the flash
sector. If it is equal to 0xff (E.G. erased), the low U-boot is used,
otherwise the high one. During upgrade (once the unused part of the
flash has been updated) I simply run something like this before rebooting:

#!/bin/sh
# Toggle high/low boot mode for at91bootstrap (bootstrap_mark erased or not)

set -e

# lookup mtd name and return /dev/mtdX
mtd_name_to_dev()
{
        awk -v FS=: "/\"$1\"\$/ { print \"/dev/\" \$1 }" /proc/mtd
}

dev=$(mtd_name_to_dev "bootstrap_mark")

# partition currently erased?
if dd if=$dev bs=1 count=1 2>/dev/null | hexdump -C | grep -q ff;
then
    dd if=/dev/zero of=$dev bs=2 count=1 2>/dev/null
else
    flash_eraseall -q $dev
fi

-- 
Bye, Peter Korsgaard

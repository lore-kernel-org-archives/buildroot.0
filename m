From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 25 Sep 2008 09:10:05 +0200
Subject: [Buildroot] AT91SAM9263 JFFS2 problems
In-Reply-To: <20080924140533.7230@gmx.net>
References: <20080924140533.7230@gmx.net>
Message-ID: <20080925091005.3bf2eaaa@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Sep 2008 16:05:33 +0200
"Matt Wood" <mattwood2000@gmx.net> wrote:

Hi Matt (-;

> Hi, has anyone seen problems booting an AT91SAM9263-EK board with the
> JFFS2 filesystem created by buildroot?  I used to be able to boot no
> problem with an older version of buildroot, but not with the latest.
> I'm getting the following kernel panic:
> 
> VFS: Mounted root (jffs2
> filesystem). Freeing init memory:
> 136K Warning: unable to open an initial
> console. Kernel panic - not syncing: No init found.  Try passing
> init= option to kernel.
> 
> I've loaded the NAND flash as follows:
> 

If your NAND flash is properly partitioned in the board code, the
layout will show up as the following below.

> 0x00000000 - at91bootstrap
>

mtd0

> 0x00020000 - u-boot
>

mtd1

> 0x00200000 - kernel
>

mtd2

> 0x00400000 - JFFS2
> 

mtd3

> My bootargs are "mem=64M console=ttyS0,115200 root=/dev/mtdblock1 rw
> rootfstype=jffs2"
> 

Try root=mtd3, you do not need to specify /dev/mtdblock1.

> The strange thing is if I change the bootargs to root=/dev/mtdblock0,
> I get a ton of jffs2 oob and ecc errors, but after a while, it gives
> me the login prompt.
> 

This is just weird, could you post the output from the kernel boot at
http://pastebin.org/ or something similar?

> My JFFS2 memory type options are:
> Page Size:  0x800
> Erase Block Size:  0x20000
> Not using clean marker.
> 

These options seems right, 2048 bytes pages and 128 kB erase blocks.

> These options never gave me a problem before.
> 
> The only other thing I can think of is a message I get after a build
> of buildroot about skipping dev, tmp, and etc while creating the RFS:
> 
> table='target/device/Atmel/root/device_table.txt'
> mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
> mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
> mkfs.jffs2: skipping device_table entry '/etc': no parent directory!

I see these as well, but they do not impact the generated image.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt

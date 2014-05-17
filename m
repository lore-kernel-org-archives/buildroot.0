From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 09:11:21 +0200
Subject: [Buildroot] Booting new kernels
In-Reply-To: <1400278020.25876.YahooMailNeo@web122103.mail.ne1.yahoo.com>
References: <1400278020.25876.YahooMailNeo@web122103.mail.ne1.yahoo.com>
Message-ID: <20140517091121.59fdaa6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tal Lubko,

On Fri, 16 May 2014 15:07:00 -0700 (PDT), Tal Lubko wrote:

> I'm using buildroot to build embedded Linux.
> I'm using syslinux 4.05 and kernel 3.6.8 and it works fine for me.
> 
> However I need to use newer kernel and it doesn't work for me.For some reason when I use kernel 3.7.1 and above the system crashes during boot and I have no reason why.
> I tried syslinux mailing list but they think it's not a syslinux issue.
> Any ideas???
> I've attached the output.

That's most likely a kernel configuration problem. What we see in your
boot is:

[    0.000000] Kernel command line: root=/dev/sda1 initrd=rootfs.ext2 console=ttyS0,115200 BOOT_IMAGE=bzImage 
...
[    0.983947] VFS: Mounted root (vfat filesystem) readonly on device 8:1.
[    0.985102] devtmpfs: error mounting -2
...
[    0.989220] Kernel panic - not syncing: No init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.

So, first your kernel command line is a little bit strange: you
indicate to use an ext2 image as initrd, but you also point
to /dev/sda1 as your root filesystem.

Later on, it happens that /dev/sda (i.e device 8:1) is indeed mounted
as your root filesystem. And it doesn't contain a /dev directory (which
explains the devtmpfs failure), and it doesn't contain a /sbin/init
program.

So it seems like /dev/sda1 does not contain a proper root filesystem.
Maybe what you want to do was to use an initrd instead as your root
filesystem, but something (a kernel configuration problem) made it fail.

Also, I'm not very familiar with usage of initrd on x86, but shouldn't
the initrd= argument take a memory address at which the bootloader has
loaded the initrd? At least this is how it works on ARM, if I remember
correctly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

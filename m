From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Fri, 3 Aug 2012 12:21:06 -0500
Subject: [Buildroot] ext-toolchain-wrapper issues
Message-ID: <CAE9DZUSdA9fgHZjgNu3bY8Ue4d6V+4o0USbR6_dcOPsCAfxgiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have been having trouble booting a uImage on my armada-xp
development board.  I am building with an external toolchain.  When
building the linux kernel via buildroot, the supported machine types
were all garbled, and the kernel would not boot.

--------------

## Booting kernel from Legacy Image at 02000000 ...
   Image Name:   Linux-3.0.6
   Created:      2012-08-03  15:34:47 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3303244 Bytes =  3.2 MB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK
Using machid 0xbdc from environment

Starting kernel ...

Uncompressing Linux... done, booting the kernel.

Error: unrecognized/unsupported machine ID (r1 = 0x00000bdc).

Available machine support:

ID (hex)        NAME
00000000        (null)
c000e150        (null)
???0?-??L???M?M?P1? ??
c000e234        ???
???0?-??L?

Please check your kernel config and/or bootloader.

--------------

I discovered that if I built the kernel manually outside the buildroot
tree, it would boot just fine.  In an attempt to narrow down the
problem, I simply modified the symlink in output/host/usr/bin which
was pointing to ext-toolchain-wrapper instead of the actual cross gcc.

# ls -l output/host/usr/bin
lrwxrwxrwx 1 dallasc dallasc     21 Aug  2 15:53
arm-marvell-linux-gnueabi-gcc -> ext-toolchain-wrapper

# rm arm-marvell-linux-gnueabi-gcc

# ln -s /opt/armada-sdk-5.0/armv7-marvell-linux-gnueabi-softfp/bin/arm-marvell-linux-gnueabi-gcc
arm-marvell-linux-gnueabi-gcc

Lo and behold, after rebuilding the kernel, it booted just fine.
Clearly there is some difference in the compiler options when relying
on ext-toolchain-wrapper that is leading to trouble.

Apart from tweaking the links as I have done, is there a way to
disable the use of ext-toolchain-wrapper?  I think I'll be fine
without it.

Thanks,

Dallas

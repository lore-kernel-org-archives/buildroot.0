From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 5 Jan 2016 18:52:27 +0200
Subject: [Buildroot] [PATCH 2/2 v3] board: add support for Chromebook
	Snow
In-Reply-To: <20151228222843.1c12ee82@free-electrons.com>
References: <20151227125701.GA8245@vostro>
 <20151228222843.1c12ee82@free-electrons.com>
Message-ID: <20160105165227.GA17663@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mon, Dec 28, 2015 at 10:28:43PM +0100, Thomas Petazzoni wrote:

> > The kernel defconfig is also provided. Mainline kernel already
> > has exynos_defconfig which could have been used here, but it builds
> > mwifiex statically, and that module tries to load its firmware during
> > initialization.
> 
> And so the rootfs is not available by that time and the firmware
> loading fails? 

Yes, and it never retries, just gives up on the device.

> Does it work on other distros because they use an
> initramfs that is readily available with the firmware?

That particular defconfig expects the whole system to reside in initrd,
judging by their kernel command line.

Big distros typically have custom kernel configs, and tend to avoid
static modules, so it's probably not a issue for them. And many use
initramfs anyway.

> If all you need is to override the mwifiex driver to be built as a
> module, then you can use a cool feature: fragment files.

I was not aware of this. Yes, a simple fragment to turn mwifiex into
a module is enough, the rest of exynos_defconfig is perfectly usable.

> > +# The card is partitioned in sectors of 8KB.
> > +# 4 sectors are reserved for MBR+GPT. Their actual size turns out
> > +# to be 33 512-blocks which is just over 2 sectors, but we align
> > +# it to a nice round number.
> > +sec=8192
> > +kernelsec=$[(kernelsize+8191)>>13]
> > +rootfssec=$[(rootfssize+8191)>>13]
> 
> Is this sort of calculation POSIX compliant, or a bash extension? If a
> bash extension, then the shebang of the script should be #!/bin/bash

Looks like changing $[ ] to $(( )) makes it POSIX compliant, even with
bitshifts. At least that works in dash. And with ${var:-value} expressions
gone, I think it's ok to leave /bin/sh there.

> > +BR2_BINUTILS_VERSION_2_25_X=y
> > +BR2_GCC_VERSION_5_X=y
> 
> Can you tried without overriding those values? We prefer to use the
> default version for the toolchain components, unless there's a strong
> reason to do otherwise.

No reason at all, I wonder why it got into defconfig.
It's a Cortex-A15, nothing special about it, so I think it will
work with pretty much any ARM7 toolchain.


The rest fixed, and I got it working with nv-uboot, so I'm sending v4.

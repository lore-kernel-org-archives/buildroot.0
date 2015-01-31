From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Jan 2015 23:13:49 +0100
Subject: [Buildroot] [Patch V2] memtest86+: new package
In-Reply-To: <54CAF90E.6080303@ou.edu>
References: <54CAF90E.6080303@ou.edu>
Message-ID: <20150131231349.3bf24a94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

Thanks for this submission. It'd be great if you could use Git to
generate your patches, though. Some other comments below.

On Thu, 29 Jan 2015 21:22:54 -0600, Steve Kenton wrote:

> diff -pruN buildroot.ori/package/memtest86/Config.in buildroot/package/memtest86/Config.in
> --- buildroot.ori/package/memtest86/Config.in	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/memtest86/Config.in	2015-01-29 11:13:50.384721730 -0600
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_MEMTEST86
> +	bool "memtest86"
> +	depends on BR2_i386 || BR2_x86_64
> +	help
> +	  Memtest86+ is a bootable standalone memory test program.
> +
> +	  Please note that this is the forked memtest86+ program and not
> +	  the original memtest86 which has different licensing. The
> +	  buildroot scripts do not seem to allow the "+" in the name.

You could instead say: "Buildroot does not support packages with a '+'
sign in their name."

> +
> +	  Memtest86+ is a utility designed to test whether your memory
> +	  is in working order. It repeatedly writes an enormous amount
> +	  of different patterns to all memory locations and reads them
> +	  back again and verifies whether the result of the read is the
> +	  same as what was written to memory.
> +
> +	  Memtest86+ will only work on 32-bit or 64-bit x86 targets.
> +	  It boots as an i486 program and autodetects hardware. It can
> +	  be added to the grub2 boot menu by adding the following lines
> +	  to the bottom of /boot/grub/grub.cfg - note the use of linux16.
> +
> +	  menuentry "Memtest86+" {
> +		 linux16 /boot/memtest86+.bin
> +	  }
> +
> +	  Other boot loaders will have similar requirements.
> +
> +	  http://www.memtest.org
> +

Last empty new line unneeded.

> diff -pruN buildroot.ori/package/memtest86/memtest86.hash buildroot/package/memtest86/memtest86.hash
> --- buildroot.ori/package/memtest86/memtest86.hash	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/memtest86/memtest86.hash	2015-01-29 21:17:44.806124906 -0600
> @@ -0,0 +1,4 @@
> +# Locally computed using openssl dgst
> +md5	ef62c2f5be616676c8c62066dedc46b3	memtest86+-4.20.tar.gz
> +sha1	df49a3d0b003c575d5a26dedc3d66dbe905db1b6	memtest86+-4.20.tar.gz
> +

Last empty new line unneeded. If you locally compute the hash, please
only add one hash: the SHA256 hash. You can compute it using the
sha256sum tool.

> diff -pruN buildroot.ori/package/memtest86/memtest86+.mk buildroot/package/memtest86/memtest86+.mk
> --- buildroot.ori/package/memtest86/memtest86+.mk	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/memtest86/memtest86+.mk	2015-01-29 11:22:22.576731555 -0600

Please name this file memtest86.mk.

> @@ -0,0 +1,23 @@
> +###############################################################################
> +#
> +# memtest86
> +#
> +###############################################################################
> +
> +MEMTEST86_VERSION = 4.20

Any reason to use 4.20 and not the latest version 5.01 ?

> +MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
> +MEMTEST86_SITE = http://www.memtest.org/download/$(MEMTEST86_VERSION)
> +MEMTEST86_LICENSE = GPLv2
> +MEMTEST86_LICENSE_FILES = README, source code

<pkg>_LICENSE_FILES should only contains the name of real files,
otherwise 'make legal-info' will not work. So just put README in this
variable.

> +# memtest86+ is sensitive to toolchain changes, use the shipped binary version
> +define MEMTEST86_BUILD_CMDS
> +	true
> +endef

Not needed, for generic-package, if you don't give any value for
<pkg>_BUILD_CMDS, nothing is done.

> +
> +define MEMTEST86_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/precomp.bin $(TARGET_DIR)/boot/memtest86+.bin
> +endef
> +
> +$(eval $(generic-package))

Other than that, looks good to me. Can you take into account those
relatively minor comments and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

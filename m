From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 09:14:34 +0100
Subject: [Buildroot] [PATCH 2/2] qt5base: use ccache if enabled
In-Reply-To: <201311290910.54807.fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?=
 message of "Fri, 29 Nov 2013 09:10:54 +0200")
References: <1384436438-2119-1-git-send-email-fatih.asici@gmail.com>
 <1384436438-2119-2-git-send-email-fatih.asici@gmail.com>
 <87eh60xjl4.fsf@dell.be.48ers.dk>
 <201311290910.54807.fatih.asici@gmail.com>
Message-ID: <871u1zy68l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

Hi,

 >> > + -device-option BUILDROOT_CCACHE="$(CCACHE)" \

 >> Can't we just pass it in CROSS_COMPILE?

>> No. linux_device_pre.conf uses CROSS_COMPILE for other tools, too (ar, objcopy,

Yes, but ccache then just becomes a NOOP - E.G:

./output/host/usr/bin/ccache ./output/host/usr/bin/arm-linux-objdump -v
GNU objdump (GNU Binutils) 2.21.1
Copyright 2011 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) any later version.
This program has absolutely no warranty.

We do the same for E.G. the Linux kernel and other packages using
CROSS_COMPILE:

git grep 'CCACHE.*TARGET_CROSS'
boot/barebox/barebox.mk:BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk:              CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
boot/uboot/uboot.mk:    CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
linux/linux.mk: CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
package/freescale-imx/imx-lib/imx-lib.mk:       CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
package/libebml/libebml.mk:     $(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)"
package/libmatroska/libmatroska.mk:     $(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)"

-- 
Bye, Peter Korsgaard

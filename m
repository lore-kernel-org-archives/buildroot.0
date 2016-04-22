From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri, 22 Apr 2016 11:56:22 +0200
Subject: [Buildroot] [PATCH 1/1] openzwave: new package
In-Reply-To: <5718DFE2.6030401@free.fr>
References: <1461159491-14317-1-git-send-email-joris.lijssens@gmail.com>
 <5718DFE2.6030401@free.fr>
Message-ID: <CACt6We0fs2y3q+Qx+EvC=ou+V+ZdNVyzzSKdamiwuN3+7eimeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

I just saw the patch of Fabrice to include openzwave, it is more complete
than the patch that i have send. I wasn't aware that a openzwave patch was
already floating around. I wonder why it is not in the mainline yet. I will
send a mail to Thomas for this.

Oin my build config, I also require a patch for openzwave to add:

>     #define _GNU_SOURCE
> in cpp/hidapi/linux/hid.c (like already done in cpp/hidapi/libusb/hid.c).
> Otherwise build fails on wcsdup() implicit declaration.
>

I did not encounter this problem in my buildconfig, but i only tested one,
so not really representative.

>
> > +     help
> > +        OpenZwave is a free software library that interfaces with
> selected Z-Wave
> > +        PC controllers, allowing anyone to create applications that
> manipulate
> > +        and respond to devices on a Z-Wave network, without requiring
> in-depth
> > +        knowledge of the Z-Wave protocol.
> > +
> > +comment "openzwave needs udev /dev management and a toolchain w/ C++,
> threads, wchar"
> > +     depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> > +             || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> > diff --git a/package/openzwave/openzwave.hash
> b/package/openzwave/openzwave.hash
> > new file mode 100644
> > index 0000000..4291e76
> > --- /dev/null
> > +++ b/package/openzwave/openzwave.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256 ca122365f6237dc245be0129eb460e78126976b9c7bd06487795d3acfc9f2a5f
> openzwave-v1.4.tar.gz
> > diff --git a/package/openzwave/openzwave.mk b/package/openzwave/
> openzwave.mk
> > new file mode 100644
> > index 0000000..aa96b0c
> > --- /dev/null
> > +++ b/package/openzwave/openzwave.mk
> > @@ -0,0 +1,26 @@
> >
> +################################################################################
> > +#
> > +# openzwave
> > +#
> >
> +################################################################################
> > +
> > +OPENZWAVE_VERSION = v1.4
> > +OPENZWAVE_SITE = $(call
> github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
> > +OPENZWAVE_LICENSE = LGPLv3+ (library), GPLv3+ (test programs),
> Apache-2.0
> > +OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt
> license/gpl.txt \
> > +                       license/Apache-License-2.0.txt
>
> does it take into account licenses of cpp/hidapi/* ?
>

 HIDAPI can be used under one of three licenses.

1. The GNU Public License, version 3.0, in
2. A BSD-Style License,
3. The more liberal original HIDAPI license.

The license chosen is at the discretion of the user of HIDAPI. For example:
1. An author of GPL software would likely use HIDAPI under the terms of the
GPL.

2. An author of commercial closed-source software would likely use HIDAPI
under the terms of the BSD-style license or the original HIDAPI license.

I did not include the orginal hidapi license but opted for gplv3


> > +OPENZWAVE_DEPENDENCIES = udev
> > +
> > +define OPENZWAVE_BUILD_CMDS
> > +     $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
> > +endef
> > +
> > +define OPENZWAVE_INSTALL_STAGING_CMDS
> > +     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(STAGING_DIR)
> PREFIX=/usr install
> > +endef
>
> shouldn't you also have a OPENZWAVE_INSTALL_STAGING = YES ?
>
> > +
> > +define OPENZWAVE_INSTALL_TARGET_CMDS
> > +     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR)
> PREFIX=/usr install
> > +endef
>
> Your installation method end up by installing config files in
> /usr/etc/openzwave/ instead of /etc/openzwave and libraries in
> /usr/lib64 instead of /usr/lib.
> Fabrice patch seems to adress that (to be confirmed soon).
>
> Moreover you also install ozw_config script in rootfs, whereas this
> build script is only needed in staging dir.
>
> Otherwise, all run well on my ARM platforms with AEON-LABS Zstick S2. :-)
>
>
Well to be honest the openzwave buildsystem needs quite some rework to make
it truly crossplatform. When i have the time i would like to rework it.

> > +
> > +$(eval $(generic-package))
>

thanks for looking at my patch, but the patch of Fabrice is more complete
and i would prefer that one to be included in the main line

>
> Best regards,
> Julien
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160422/039a1b4c/attachment.html>

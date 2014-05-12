From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 23:50:40 +0200
Subject: [Buildroot] Discussing libudev,
 was: Re: [PATCH v6 09/32] mesa3d: dri2 does not need udev support
In-Reply-To: <g2q74bxv7r.ln2@ID-313208.user.individual.net>
References: <pil74bx9op.ln2@ID-313208.user.individual.net>
 <20140512230238.76c7fb6b@free-electrons.com>
 <g2q74bxv7r.ln2@ID-313208.user.individual.net>
Message-ID: <20140512235040.1be8bbb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 12 May 2014 23:12:16 +0200, Bernd Kuhls wrote:

> I copied the systemd package and build only the libudev part, short snippets 
> from my hacky package:
> 
> LIBUDEV_VERSION = 212
> LIBUDEV_SITE = http://www.freedesktop.org/software/systemd/
> LIBUDEV_SOURCE = systemd-$(LIBUDEV_VERSION).tar.xz
> [...]
> define LIBUDEV_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
>                 src/libudev/libudev.pc \
>                 src/shared/errno-from-name.h \
>                 src/shared/errno-to-name.h \
>                 src/shared/af-from-name.h \
>                 src/shared/af-to-name.h
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) libudev.la
> endef
> 
> followed by some LIBUDEV_INSTALL_STAGING/TARGET_CMDS file copying.

To be honest, this seems quite hacky to me, and fragile for future
version bumps.

If you run a complete monster software such as XBMC, I'm pretty sure
your platform can also afford to run either eudev or systemd, no?

In Buildroot, we've always tried to avoid going *against* upstream
decisions. The decision of upstream for udev is to bundle it as part of
systemd. Gentoo has decided to provide a maintained fork of udev as
eudev, so we support both options. But I definitely wouldn't want to
support things that are completely Buildroot-specific.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 18:24:16 +0100
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5125F7BB.50403@petroprogram.com>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com>
 <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com>
Message-ID: <20130224182416.64b51c7b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Thu, 21 Feb 2013 12:32:27 +0200, Stefan Fr?berg wrote:

> >>> Also kernel .config file should also have CONFIG_DEVTMPFS and
> >>> DEVTMPFS as 'y'.
> >> Sorry, that should have been CONFIG_DEVTMPFS=y and
> >> CONFIG_DEVTMPFS_MOUNT=y
> > Kernel version 2.6.30 is too old for that.
> >
> > baruch
> >
> 
> It is ?
> Damn, then the only options are mdev and udev.

No, because our mdev/udev handling makes the assumption that devtmpfs
support is enabled in the kernel.

Contrary to what Arnout says, I don't think devtmpfs support is
*mandatory* to get mdev to work. But in Buildroot, we've decided to
support only mdev on top of devtmpfs.

From linux/linux.mk:

        $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

So whenever we're not using the "static" method, we enable DEVTMPFS +
DEVTMPFS_MOUNT.

So if you're using a kernel < 2.6.32 (I think that's the kernel release
in which devtmpfs was introduced), then your only choice is to use the
static method. Obviously, another better solution is to upgrade the
kernel version you're using. The .config posted by John Stile
originally mentions a board/atmel/at91sam9g20ek/ directory, which seems
to indicate John is using the AT91SAM9G20 SoC. This SoC is perfectly
well supported by mainline kernel versions, so there should normally be
no reason to stick with the old 2.6.30.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

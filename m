From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Wed, 28 Jan 2015 17:24:42 +0100
Subject: [Buildroot] [PATCH] package: add support for the wf111 WiFi
 driver and its utilities
In-Reply-To: <20150128161736.67c93ab7@free-electrons.com>
References: <1422453245-11725-1-git-send-email-antoine.tenart@free-electrons.com>
 <20150128161736.67c93ab7@free-electrons.com>
Message-ID: <20150128162442.GD11705@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Jan 28, 2015 at 04:17:36PM +0100, Thomas Petazzoni wrote:
> > 
> > Finally, two options must be selected in the Linux kernel configuration:
> > CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV.
> 
> Please explain that those options are blind options, so they cannot be
> enabled by a change in linux/linux.mk. And maybe you should explain how
> the user is supposed to enable such blind options: either patch the
> kernel to make them non-blind, or enable some other random WiFi driver
> that selects them.

Will do.

> 
> Please add:
> 
> comment "wf111 needs an (e)glibc toolchain"
> 	depends on BR2_LINUX_KERNEL
> 	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
> 	depends on !BR2_TOOLCHAIN_USES_GLIBC

Sure.

> 
> > +		-C $(@D) PWD=$(@D) ARCH=arm \
> 
> ARCH=arm, really ? :-)

Oops :)

> 
> Please use $(LINUX_MAKE_FLAGS) instead, which already contains ARCH=
> correctly.
> 
> > +		CC=$(TARGET_CC) LD=$(TARGET_LD) \
> 
> With $(LINUX_MAKE_FLAGS) containing CROSS_COMPILE, this should probably
> become unnecessary.

I'll update in v2.

> 
> > +		KDIR=$(LINUX_DIR) \
> > +		install_static
> > +endef
> > +
> > +define WF111_INSTALL_TARGET_CMDS
> > +	rsync -a $(@D)/output/ $(TARGET_DIR)
> 
> We typically don't use rsync for such things. What does $(@D)/output
> contains exactly? We would more typically use:
> 
> 	cp -dpfr $(@D)/output/* $(TARGET_DIR)

Utility binaries, the firmware and the kernel module, all in theirs
respective directories. `cp -dpfr` should be fine, I'll update.


I'll also fix all the typos, and I'll add a check to be sure
BR2_PACKAGE_WF111_TARBALL_PATH is correctly filled.

Thanks!

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

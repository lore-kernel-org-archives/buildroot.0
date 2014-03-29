From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 16:17:37 +0100
Subject: [Buildroot] [PATCH 09/10 v2] package/iprutils: Add IBM Power
 RAID utilities
In-Reply-To: <1394595957.566789.595625760281.9.gpush@pablo>
References: <1394595957.563937.119075350083.0.gpush@pablo>
 <1394595957.566789.595625760281.9.gpush@pablo>
Message-ID: <20140329161737.292ee63f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

I've applied your patch, with a few corrections (see below).

On Wed, 12 Mar 2014 11:45:57 +0800, Jeremy Kerr wrote:

> diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
> new file mode 100644
> index 0000000..d72688f
> --- /dev/null
> +++ b/package/iprutils/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_IPRUTILS
> +	bool "iprutils"
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
> +	select BR2_PACKAGE_NCURSES_TARGET_FORM
> +	select BR2_PACKAGE_NCURSES_TARGET_MENU
> +	select BR2_PACKAGE_LIBSYSFS
> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  System utilities for IBM Power RAID devices

Here I've added the URL of the upstream project on SourceForge.


> diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
> new file mode 100644
> index 0000000..15de9af
> --- /dev/null
> +++ b/package/iprutils/iprutils.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# iprutils
> +#
> +################################################################################
> +
> +IPRUTILS_VERSION = 2.3.15
> +IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION)
> +IPRUTILS_SOURCE = iprutils-$(IPRUTILS_VERSION)-src.tgz
> +IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
> +IPRUTILS_LICENSE = Common Public License Version 1.0
> +IPRUTILS_LICENSE_FILES = LICENSE
> +
> +define IPRUTILS_BUILD_CMDS
> +	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
> +endef

Here instead of CC=$(TARGET_CC) and LD=$(TARGET_LD), I've used
$(TARGET_CONFIGURE_OPTS), which also ensures CFLAGS and al. are passed.
This required adding another patch to the package so that our CFLAGS
can be passed from the environment and can be added with the
package-specific CFLAGS.

> +define IPRUTILS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/iprconfig $(TARGET_DIR)/sbin/iprconfig
> +	$(INSTALL) -D -m 0755 $(@D)/iprupdate $(TARGET_DIR)/sbin/iprupdate
> +	$(INSTALL) -D -m 0755 $(@D)/iprdump $(TARGET_DIR)/sbin/iprdump
> +	$(INSTALL) -D -m 0755 $(@D)/iprinit $(TARGET_DIR)/sbin/iprinit
> +	$(INSTALL) -D -m 0755 $(@D)/iprdbg $(TARGET_DIR)/sbin/iprdbg
> +endef

And I've replaced that my using the "make install" target of the
package Makefile, which was doing the same thing. "make install" is
also installing manpages, which is probably why you didn't use it, but
Buildroot anyway automatically removes documentation from the target,
such as manpages. Therefore, we prefer to use the package "make
install", which is more likely to continue to work in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

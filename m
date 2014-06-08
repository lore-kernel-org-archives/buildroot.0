From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:27:17 +0200
Subject: [Buildroot] [PATCH v5] canfestival: new package
In-Reply-To: <1397986492-7870-1-git-send-email-s.martin49@gmail.com>
References: <1397986492-7870-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140608162717.614d7ba6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 20 Apr 2014 11:34:52 +0200, Samuel Martin wrote:

> diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
> new file mode 100644
> index 0000000..4fe72de
> --- /dev/null
> +++ b/package/canfestival/Config.in
> @@ -0,0 +1,102 @@
> +config BR2_PACKAGE_CANFESTIVAL
> +	bool "CanFestival"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm

According to the .mk file, the package depends on the Linux kernel, so
the dependencies should be added here, as well as a comment.

However, after testing, it turns out that the package does not always
depend on the Linux kernel. It depends on which timer driver you
select, and which driver you select. Therefore, it looks like this
package needs a bit more work.

> +	help
> +	  CanFestival is an OpenSource CANOpen framework, licensed with GPLv2
> +	  and LGPLv2.

"licensed with" -> "licensed under"

License is LGPLv2.1+, not LGPLv2.

I couldn't spot the GPLv2 parts.

> +config BR2_PACKAGE_CANFESTIVAL_PEAK_LINUX
> +	bool "peak_linux"
> +	help
> +	  PeakSystem CAN support (requires kernel driver and libpcan from
> +	  PeakSystem).

And so, will it build under Buildroot ? It's better to only create
options for things you tested / can test, instead of trying to support
everything.

> diff --git a/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch b/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch
> new file mode 100644
> index 0000000..7448bd6
> --- /dev/null
> +++ b/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch
> @@ -0,0 +1,787 @@
> +From 9b76c8c97344472bc58e38cc28f734687d1a2aab Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Fri, 27 Dec 2013 19:01:02 +0100
> +Subject: [PATCH] now honor DESTDIR
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Please submit upstream :-)

> diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
> new file mode 100644
> index 0000000..a9576ae
> --- /dev/null
> +++ b/package/canfestival/canfestival.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# canfestival
> +#
> +################################################################################
> +
> +# Revision 789:
> +CANFESTIVAL_VERSION = a82d867e7850
> +CANFESTIVAL_SOURCE = $(CANFESTIVAL_VERSION).tar.bz2
> +CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3/archive
> +CANFESTIVAL_DEPENDENCIES = linux

That's the dependency I was referring to.

> +# Runtime code is licensed LGPLv2, whereas accompanying developer tools and few
> +# drivers (virtual_kernel, lincan and copcican_linux) are licensed GPLv2.
> +CANFESTIVAL_LICENSE = LGPLv2.1, GPLv2

It's LGPLv2.1+ and probably GPLv2+. Also, augment the license
informations with something such as:

	LGPLv2.1+ (runtime), GPLv2+ (developer tools, some drivers)

> +CANFESTIVAL_LICENSE_FILES = COPYING, LICENCE

Fields are space separated, not comma separated.

> +CANFESTIVAL_INSTALL_STAGING = YES
> +CANFESTIVAL_INSTALLED-y = src drivers
> +CANFESTIVAL_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples
> +
> +define CANFESTIVAL_CONFIGURE_CMDS
> +	cd $(@D) && \
> +		$(TARGET_CONFIGURE_OPTS) ./configure \
> +		--target=unix \
> +		--arch=$(BR2_ARCH) \
> +		--kerneldir=$(LINUX_DIR) \
> +		--timers=unix \
> +		--binutils=$(TARGET_CROSS) \
> +		--cc="$(TARGET_CC)" \
> +		--cxx="$(TARGET_CC)" \
> +		--ld="$(TARGET_CC)" \
> +		--prefix=/usr \
> +		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
> +		$(call qstrip,$(BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS))
> +endef
> +
> +define CANFESTIVAL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
> +endef
> +
> +define CANFESTIVAL_INSTALL_TARGET_CMDS
> +	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
> +		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
> +			DESTDIR=$(TARGET_DIR) ; \

Add "|| exit 1" after calling make, so that if one make fails, it
exits the loop.

> +	done
> +endef
> +
> +define CANFESTIVAL_INSTALL_STAGING_CMDS
> +	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
> +		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
> +			DESTDIR=$(STAGING_DIR) ; \

Same.

> +	done
> +endef
> +
> +$(eval $(generic-package))

Add a comment above CONFIGURE_CMDS to explain why we're not using the
autotools here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

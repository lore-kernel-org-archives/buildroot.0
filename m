From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Jul 2011 00:03:45 +0200
Subject: [Buildroot] [PATCH 1/3] bump udev and clean up
In-Reply-To: <4E298E70.50200@visionsystems.de> (Yegor Yefremov's message of
 "Fri, 22 Jul 2011 16:51:28 +0200")
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de>
Message-ID: <871uxe10hq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, committed with minor tweaks (see below).

 Yegor> ---
 Yegor>  package/udev/Config.in            |   43 +++--------
 Yegor>  package/udev/S10udev              |    6 -
 Yegor>  package/udev/libvolume_id.la.tmpl |   35 ---------
 Yegor>  package/udev/udev.mk              |  144 ++++++--------------------------------
 Yegor>  4 files changed, 36 insertions(+), 192 deletions(-)
 Yegor>  delete mode 100644 package/udev/libvolume_id.la.tmpl

 Yegor> Index: b/package/udev/Config.in
 Yegor> ===================================================================
 Yegor> --- a/package/udev/Config.in
 Yegor> +++ b/package/udev/Config.in
 Yegor> @@ -5,37 +5,18 @@
 
 Yegor>  	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 
 Yegor> -config BR2_PACKAGE_UDEV_UTILS
 Yegor> -	bool "udev-utils"
 Yegor> +config BR2_PACKAGE_UDEV_ALL_EXTRAS
 Yegor> +	bool "enable all extras"
 Yegor>  	depends on BR2_PACKAGE_UDEV

You forgot to depend on BR2_LARGEFILE + BR2_USE_WCHAR.

 Yegor> +UDEV_VERSION = 172
 Yegor> +UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 Yegor> +UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 
 Yegor> -UDEV_BUILD_EXTRAS=$(addprefix extras/,$(UDEV_EXTRAS))
 Yegor> +UDEV_CONF_OPT =			\
 Yegor> +	--sbindir=/sbin		\
 Yegor> +	--with-rootlibdir=/lib	\
 Yegor> +	--libexecdir=/lib/udev	\
 Yegor> +	--disable-introspection
 
 Yegor> -#
 Yegor> -# Build
 Yegor> -#
 Yegor> -define UDEV_BUILD_CMDS
 Yegor> -	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC="$(TARGET_CC)" LD="$(TARGET_CC)"\
 Yegor> -		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 Yegor> -		USE_LOG=false USE_SELINUX=false \
 Yegor> -		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D)
 Yegor> -endef
 Yegor> +UDEV_DEPENDENCIES = host-gperf

udev's configure script uses pkg-config, so we also need to depend on
host-pkg-config.

Thanks for your persistence!

-- 
Bye, Peter Korsgaard

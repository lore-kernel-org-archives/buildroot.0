From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 21:45:18 +0100
Subject: [Buildroot] [PATCH v3 1/1] iputils: resolve musl compatibility
In-Reply-To: <1453292421-21583-1-git-send-email-matt@thewebers.ws>
References: <1453292421-21583-1-git-send-email-matt@thewebers.ws>
Message-ID: <20160120214518.2914b389@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Wed, 20 Jan 2016 12:20:21 +0000, Matt Weber wrote:
> The new upstream is a fork of the original that consolidates other distro's
> patches.  This fork resolves a series of musl build failures noted in the
> autobuilder log.
> 
> http://autobuild.buildroot.net/results/12cb73f3def95efe706bcd957bc2c091e7931d5a/
> 
>   - Updated to github fork, selected merge from Nov 3 2015
>     which provided musl fixes (last release was to old, 20150815)
>   - Why the fork ? (http://www.spinics.net/lists/netdev/msg279881.html)
>   - Added missing dependencies for kernel capabilies lib
>   - Accounted for new consolidated ping (ipv4/6)
> 
> Tested against a buildroot arm musl/glibc toolchains, as well as
> autobuilder defconfig.

You don't explain here why you are adding libcap as a mandatory
dependency. USE_CAP=no still exists, and it stills works, so there is
no reason to make libcap a mandatory dependency.


> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> index 5324639..4188353 100644
> --- a/package/iputils/Config.in
> +++ b/package/iputils/Config.in
> @@ -1,9 +1,11 @@
>  config BR2_PACKAGE_IPUTILS
>  	bool "iputils"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBCAP
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # XATTR_NAME_CAPS

If you add a dependency like this, you need to add a "comment" in the
Config.in file. However, this this new dependency is caused by "select
BR2_PACKAGE_LIBCAP", and this select is not needed, you can get rid of
it.

> -IPUTILS_VERSION = s20121011
> -IPUTILS_SITE = http://www.skbuff.net/iputils
> -IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
> -IPUTILS_LICENSE = GPLv2+, BSD-3c
> +# The original upstream was forked to the github repository in 2014 to
> +# pull fixes from other distribution and centralize the changes after
> +# the upstream seemed to have gone dormant.  The fork contains the
> +# latest changes including msul support, removing a libsysfs dependency
> +# and IPv6 updates.
> +# http://www.spinics.net/lists/netdev/msg279881.html
> +
> +IPUTILS_VERSION = c8ff6feaf0442f8efd96ccb415770c54f9e84d47
> +IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
> +IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
>  # Only includes a license file for BSD
>  IPUTILS_LICENSE_FILES = ninfod/COPYING
> -IPUTILS_DEPENDENCIES = openssl
> +IPUTILS_DEPENDENCIES = openssl libcap

If you want to enable libcap support, you can do:

IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no \
	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

ifeq ($(BR2_PACKAGE_LIBCAP),y)
IPUTILS_MAKE_OPTS += USE_CAP=yes
IPUTILS_DEPENDENCIES += libcap
else
IPUTILS_MAKE_OPTS += USE_CAP=no
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 21 Apr 2016 16:12:50 +0200
Subject: [Buildroot] [PATCH 1/1] openzwave: new package
In-Reply-To: <1461159491-14317-1-git-send-email-joris.lijssens@gmail.com>
References: <1461159491-14317-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <5718DFE2.6030401@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joris,

is your work more or less derived from Fabrice's patch (04/03/2016) ?

I have run tested it, so my comments below...

On 20/04/2016 15:38, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/openzwave/Config.in      | 15 +++++++++++++++
>  package/openzwave/openzwave.hash |  2 ++
>  package/openzwave/openzwave.mk   | 26 ++++++++++++++++++++++++++
>  4 files changed, 44 insertions(+)
>  create mode 100644 package/openzwave/Config.in
>  create mode 100644 package/openzwave/openzwave.hash
>  create mode 100644 package/openzwave/openzwave.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ecaf164..25fa0d9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1171,6 +1171,7 @@ menu "Networking"
>  	source "package/omniorb/Config.in"
>  	source "package/openldap/Config.in"
>  	source "package/openpgm/Config.in"
> +	source "package/openzwave/Config.in"
>  	source "package/ortp/Config.in"
>  	source "package/qdecoder/Config.in"
>  	source "package/qpid-proton/Config.in"
> diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
> new file mode 100644
> index 0000000..3ae0959
> --- /dev/null
> +++ b/package/openzwave/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_OPENZWAVE
> +	bool "openzwave"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_UDEV # libudev
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_WCHAR # use wchar_t

in my build config, I also require a patch for openzwave to add:
    #define _GNU_SOURCE
in cpp/hidapi/linux/hid.c (like already done in cpp/hidapi/libusb/hid.c).
Otherwise build fails on wcsdup() implicit declaration.

> +	help
> +	   OpenZwave is a free software library that interfaces with selected Z-Wave
> +	   PC controllers, allowing anyone to create applications that manipulate
> +	   and respond to devices on a Z-Wave network, without requiring in-depth
> +	   knowledge of the Z-Wave protocol.
> +
> +comment "openzwave needs udev /dev management and a toolchain w/ C++, threads, wchar"
> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
> new file mode 100644
> index 0000000..4291e76
> --- /dev/null
> +++ b/package/openzwave/openzwave.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 ca122365f6237dc245be0129eb460e78126976b9c7bd06487795d3acfc9f2a5f openzwave-v1.4.tar.gz 
> diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
> new file mode 100644
> index 0000000..aa96b0c
> --- /dev/null
> +++ b/package/openzwave/openzwave.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# openzwave
> +#
> +################################################################################
> +
> +OPENZWAVE_VERSION = v1.4
> +OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
> +OPENZWAVE_LICENSE = LGPLv3+ (library), GPLv3+ (test programs), Apache-2.0
> +OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt license/gpl.txt \
> +			  license/Apache-License-2.0.txt

does it take into account licenses of cpp/hidapi/* ?

> +OPENZWAVE_DEPENDENCIES = udev
> +
> +define OPENZWAVE_BUILD_CMDS
> +	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
> +endef
> +
> +define OPENZWAVE_INSTALL_STAGING_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
> +endef

shouldn't you also have a OPENZWAVE_INSTALL_STAGING = YES ?

> +
> +define OPENZWAVE_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
> +endef

Your installation method end up by installing config files in
/usr/etc/openzwave/ instead of /etc/openzwave and libraries in
/usr/lib64 instead of /usr/lib.
Fabrice patch seems to adress that (to be confirmed soon).

Moreover you also install ozw_config script in rootfs, whereas this
build script is only needed in staging dir.

Otherwise, all run well on my ARM platforms with AEON-LABS Zstick S2. :-)

> +
> +$(eval $(generic-package))

Best regards,
Julien

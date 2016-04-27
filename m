From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 27 Apr 2016 17:59:17 +0200
Subject: [Buildroot] [PATCH v3] openzwave: new package
In-Reply-To: <18234_1461593236_571E2494_18234_9415_1_d894cc93-b732-4ef7-ad29-329991781b34@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
References: <18234_1461593236_571E2494_18234_9415_1_d894cc93-b732-4ef7-ad29-329991781b34@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
Message-ID: <5720E1D5.4020606@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

builds fine on 64bits Host with internal BR toolchain (uclibc, ARM
cortex-A9, BR git).
runs also fine on i.MX6 with AEON Labs Z-Stick S2.

So:

On 25/04/2016 16:07, fabrice.fontaine at orange.com wrote:
> Free software library that interfaces with selected Z-Wave PC
> controllers, allowing anyone to create applications that manipulate and
> respond to devices on a Z-Wave network, without requiring in-depth
> knowledge of the Z-Wave protocol
>
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Tested-by: Julien Boibessot <julien.boibessot@armadeus.com>

> ---
> Changes v2 -> v3 (after reviews of Thomas Petazzoni and
> Julien Boibessot):
>  - Remove empty line in Config.in
>  - Add hash file with locally computed sha256 of openzwave-v1.4.tar.gz
>  - Format correctly the wcsdup patch (git patch with signed-off-by
>    description)
>  - Remove unneeded comments before OPENZWAVE_LICENSE
>  - Add TARGET_MAKE_ENV in openzwave.mk
>  - Use instlibdir variable to install library in /usr/lib instead of
>    /usr/lib64
>  - Use sysconfdir variable to install configuration files in
>    /etc/openzwave instead of /usr/etc/openzwave
>  - Remove unneeded ozw_config binary from target directory
>
> Changes v1 -> v2:
>  - Fix indentation in Config.in
>  - Add dependency on BR2_USE_WCHAR (from patch of Joris Lijssens)
>  - Remove TARGET_CONFIGURE_ENV from openzwave.mk
>  - Use CROSS_COMPILE variable to build (from patch of Joris Lijssens)
>  - Add a patch to fix wcsdup implicit declaration (from review of Julien
>    Boibessot)
>
>  package/Config.in                                  |  1 +
>  ...ix-warning-on-wcsdup-implicit-declaration.patch | 29 ++++++++++++
>  package/openzwave/Config.in                        | 17 +++++++
>  package/openzwave/openzwave.hash                   |  2 +
>  package/openzwave/openzwave.mk                     | 52 ++++++++++++++++++++++
>  5 files changed, 101 insertions(+)
>  create mode 100644 package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch
>  create mode 100644 package/openzwave/Config.in
>  create mode 100644 package/openzwave/openzwave.hash
>  create mode 100644 package/openzwave/openzwave.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e860f72..f242181 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1172,6 +1172,7 @@ menu "Networking"
>  	source "package/omniorb/Config.in"
>  	source "package/openldap/Config.in"
>  	source "package/openpgm/Config.in"
> +	source "package/openzwave/Config.in"
>  	source "package/ortp/Config.in"
>  	source "package/qdecoder/Config.in"
>  	source "package/qpid-proton/Config.in"
> diff --git a/package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch b/package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch
> new file mode 100644
> index 0000000..1fe30e4
> --- /dev/null
> +++ b/package/openzwave/0001-Fix-warning-on-wcsdup-implicit-declaration.patch
> @@ -0,0 +1,29 @@
> +From 0878d933223158343af3fe13e03bcd128e8b4cbc Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fabrice.fontaine@orange.com>
> +Date: Fri, 22 Apr 2016 17:06:27 +0200
> +Subject: [PATCH 1/1] Fix warning on wcsdup implicit declaration
> +
> +Define __GNU_SOURCE in cpp/hidapi/linux/hid.c (like already done in
> +cpp/hidapi/libusb/hid.c) to fix implicit declaration of wcsdup function
> +
> +Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> +---
> + cpp/hidapi/linux/hid.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/cpp/hidapi/linux/hid.c b/cpp/hidapi/linux/hid.c
> +index dbf9b9b..c3eb22b 100644
> +--- a/cpp/hidapi/linux/hid.c
> ++++ b/cpp/hidapi/linux/hid.c
> +@@ -21,6 +21,8 @@
> +         http://github.com/signal11/hidapi .
> + ********************************************************/
> + 
> ++#define _GNU_SOURCE /* needed for wcsdup() before glibc 2.10 */
> ++
> + /* C */
> + #include <stdio.h>
> + #include <string.h>
> +-- 
> +1.9.1
> +
> diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
> new file mode 100644
> index 0000000..190b88b
> --- /dev/null
> +++ b/package/openzwave/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_OPENZWAVE
> +	bool "openzwave"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_USE_WCHAR
> +	help
> +	  Free software library that interfaces with selected Z-Wave PC
> +	  controllers, allowing anyone to create applications that manipulate
> +	  and respond to devices on a Z-Wave network, without requiring
> +	  in-depth knowledge of the Z-Wave protocol
> +
> +	  http://www.openzwave.net
> +
> +comment "openzwave needs udev and a toolchain w/ C++, threads, wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR
> diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
> new file mode 100644
> index 0000000..bab940e
> --- /dev/null
> +++ b/package/openzwave/openzwave.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	ca122365f6237dc245be0129eb460e78126976b9c7bd06487795d3acfc9f2a5f	openzwave-v1.4.tar.gz
> diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
> new file mode 100644
> index 0000000..eab9943
> --- /dev/null
> +++ b/package/openzwave/openzwave.mk
> @@ -0,0 +1,52 @@
> +################################################################################
> +#
> +# openzwave
> +#
> +################################################################################
> +
> +OPENZWAVE_VERSION = v1.4
> +OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
> +OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh)
> +OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
> +	license/gpl.txt license/Apache-License-2.0.txt
> +
> +OPENZWAVE_DEPENDENCIES = host-pkgconf udev
> +OPENZWAVE_INSTALL_STAGING = YES
> +
> +define OPENZWAVE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
> +endef
> +
> +# Set instlibdir to install libopenzwave.so* in the correct directory
> +# otherwise openzwave will check that /lib64 exists (on the host) to
> +# know if the library should be installed in $(PREFIX)/lib or $(PREFIX)/lib64.
> +# Set pkgconfigdir to /lib/pkgconfig to install libopenzwave.pc in the
> +# correct directory otherwise openzwave will call
> +# "pkg-config --variable pc_path pkg-config" which returns an incorrect value.
> +# Set sysconfdir to /etc/openzwave to install openzwave configuration files in
> +# the correct directory otherwise openzwave will install configuration files in
> +# $(PREFIX)/etc/openzwave.
> +define OPENZWAVE_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		PREFIX=/usr DESTDIR=$(STAGING_DIR) \
> +		instlibdir=/usr/lib \
> +		pkgconfigdir=/usr/lib/pkgconfig \
> +		sysconfdir=/etc/openzwave \
> +		install
> +endef
> +
> +# Apply the same tricks (even if the trick on pkgconfigdir is not needed as
> +# libopenzwave.pc is not useful in target directory).
> +# Delete unneeded ozw_config binary from target directory as this is an utility
> +# application used to get the openzwave build configuration.
> +define OPENZWAVE_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		PREFIX=/usr DESTDIR=$(TARGET_DIR) \
> +		instlibdir=/usr/lib \
> +		pkgconfigdir=/usr/lib/pkgconfig \
> +		sysconfdir=/etc/openzwave \
> +		install
> +	rm -f $(TARGET_DIR)/usr/bin/ozw_config
> +endef
> +
> +$(eval $(generic-package))

Regards,
Julien
Tested-by: Julien Boibessot <julien.boibessot@armadeus.com>

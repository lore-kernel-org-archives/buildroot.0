From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jul 2013 11:26:45 +0200
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <1373440365-9031-1-git-send-email-g@maral.me>
References: <1373440365-9031-1-git-send-email-g@maral.me>
Message-ID: <20130710112645.1c88b4a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillermo A. Amaral,

On Wed, 10 Jul 2013 00:12:45 -0700, Guillermo A. Amaral wrote:
> From: "Guillermo A. Amaral" <g@maral.me>
> 
> 
> Signed-off-by: Guillermo A. Amaral <g@maral.me>
> ---
>  package/Config.in                                 |   1 +
>  package/wiringpi/Config.in                        |   8 ++
>  package/wiringpi/wiringpi-CLOEXEC-undefined.patch |  15 ++++
>  package/wiringpi/wiringpi-cmake-support.patch     | 101 ++++++++++++++++++++++
>  package/wiringpi/wiringpi.mk                      |  41 +++++++++
>  5 files changed, 166 insertions(+)
>  create mode 100644 package/wiringpi/Config.in
>  create mode 100644 package/wiringpi/wiringpi-CLOEXEC-undefined.patch
>  create mode 100644 package/wiringpi/wiringpi-cmake-support.patch
>  create mode 100644 package/wiringpi/wiringpi.mk

Thanks for this patch! I'm giving a few comments below.

On a side note, I'm really wondering why such hardware platform
specific libraries are needed. Why aren't people using the standard
Linux GPIO API in /sys/class/gpio, which is re-usable across hardware
platforms? Why is it always that the RasberryPi community
constantly invents for everything a non-standard way of doing things?
Of course, that's nothing against your patch, but I'm really wondering
what RasberryPi users are smoking. The big interest of Linux compared
to micro-controller development is IMO that user-space interfaces are
standardized across hardware platforms, so you can easily move on
program from on platform to another, and re-use your knowledge between
platforms. Those RasberryPi specific libraries really look like things
being done by people who come from a micro-controller background, and
don't understand the value of standardized APIs across hardware
platforms.

Anyway, enough rant.

> diff --git a/package/Config.in b/package/Config.in
> index 3186bb7..2824904 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -303,6 +303,7 @@ source "package/usb_modeswitch_data/Config.in"
>  source "package/usbmount/Config.in"
>  source "package/usbutils/Config.in"
>  source "package/wipe/Config.in"
> +source "package/wiringpi/Config.in"
>  source "package/w_scan/Config.in"
>  endmenu
>  
> diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
> new file mode 100644
> index 0000000..7ce1048
> --- /dev/null
> +++ b/package/wiringpi/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_WIRINGPI
> +        bool "wiringpi"

Indentation should be a tab.

> +	depends on BR2_arm
> +	help
> +	  GPIO Interface library for the Raspberry Pi.
> +
> +	  http://wiringpi.com/
> +
> diff --git a/package/wiringpi/wiringpi-CLOEXEC-undefined.patch b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch
> new file mode 100644
> index 0000000..097cb93
> --- /dev/null
> +++ b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch

All patches should have a header with a description + Signed-off-by.

> @@ -0,0 +1,15 @@
> +diff --git a/wiringPi/wiringPi.c b/wiringPi/wiringPi.c
> +index ba61d9f..2ee23b9 100644
> +--- a/wiringPi/wiringPi.c
> ++++ b/wiringPi/wiringPi.c
> +@@ -77,6 +77,10 @@
> + #define	FALSE	(1==2)
> + #endif
> + 
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + // Environment Variables
> + 
> + #define	ENV_DEBUG	"WIRINGPI_DEBUG"
> diff --git a/package/wiringpi/wiringpi-cmake-support.patch b/package/wiringpi/wiringpi-cmake-support.patch
> new file mode 100644
> index 0000000..f6664ab
> --- /dev/null
> +++ b/package/wiringpi/wiringpi-cmake-support.patch

Same thing here. However, can you comment on why you're adding a new
build system here instead of using the Makefiles that come with the
official version of this WiringPi thing?

> diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
> new file mode 100644
> index 0000000..2f38c4e
> --- /dev/null
> +++ b/package/wiringpi/wiringpi.mk
> @@ -0,0 +1,41 @@
> +#############################################################
> +#
> +# wiringpi
> +#
> +#############################################################
> +
> +WIRINGPI_VERSION = 02a3bd8d8f2ae5c873e63875a8faef5b627f9db6
> +WIRINGPI_SITE = git://git.drogon.net/wiringPi
> +WIRINGPI_LICENSE = LGPLv3+
> +WIRINGPI_LICENSE_FILES = COPYING.LESSER
> +WIRINGPI_INSTALL_STAGING = YES
> +WIRINGPI_INSTALL_TARGET = YES

This last line is not needed, that's the default.

> +WIRINGPI_CONF_OPT = -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

CMAKE_INSTALL_PREFIX is already passed by the cmake-package
infrastructure.

Maybe CMAKE_BUILD_TYPE (which I believe is a standard CMake variable)
should also be passed by the cmake package infrastructure. But OK,
that's a separate contribution.

> +define WIRINGPI_INSTALL_TARGET_CMDS
> +	$(HOST_DIR)/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=$(TARGET_DIR)/usr -DCOMPONENT=target -P "$(@D)/cmake_install.cmake"
> +	mv $(@D)/install_manifest_target.txt $(@D)/install_manifest_target_target.txt
> +endef
> +
> +define WIRINGPI_INSTALL_STAGING_CMDS
> +	$(HOST_DIR)/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=$(STAGING_DIR)/usr -DCOMPONENT=staging -P "$(@D)/cmake_install.cmake"
> +	mv $(@D)/install_manifest_staging.txt $(@D)/install_manifest_staging_staging.txt
> +
> +	$(HOST_DIR)/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=$(STAGING_DIR)/usr -DCOMPONENT=target -P "$(@D)/cmake_install.cmake"
> +	mv $(@D)/install_manifest_target.txt $(@D)/install_manifest_target_staging.txt
> +endef

Not sure what you're doing here. Why do you have those target and
staging components? Just install everything to both staging and target.
Headers, static libraries and such are automatically removed from the
target/ directory by Buildroot. If there's anything else that is
installed in target/ and isn't really needed, you can remove it from
the target/ directory using a POST_INSTALL_TARGET hook.

Your patch that introduces the CMake build system should not introduce
within the WiringPi build system the notion of target vs. staging.

> +
> +define WIRINGPI_POST_STAGING_CLEANUP
> +    rm $(STAGING_DIR)/usr/bin/cpio
> +endef

This isn't used anywhere.

> +define WIRINGPI_UNINSTALL_TARGET_CMDS
> +	xargs rm -f < $(@D)/install_manifest_target_target.txt
> +endef
> +
> +define WIRINGPI_UNINSTALL_STAGING_CMDS
> +	xargs rm -f < $(@D)/install_manifest_staging_staging.txt
> +	xargs rm -f < $(@D)/install_manifest_target_staging.txt
> +endef

Don't bother implementing the uninstall steps, we're considering
phasing them out.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

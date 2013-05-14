From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 22:50:30 +0200
Subject: [Buildroot] [PATCH v4 2/4] am33x-cm3: add FW for suspend/resume
In-Reply-To: <1368562193-26149-3-git-send-email-anders@chargestorm.se> (Anders
 Darander's message of "Tue, 14 May 2013 22:09:51 +0200")
References: <1368562193-26149-1-git-send-email-anders@chargestorm.se>
 <1368562193-26149-3-git-send-email-anders@chargestorm.se>
Message-ID: <87fvxpqoa1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders@chargestorm.se> writes:

 Anders> Without this firmware, the beaglebone won't be able to reboot
 Anders> correctly.

It's afaik only for suspend/resume handling (E.G. low power).

 Anders> Signed-off-by: Anders Darander <anders@chargestorm.se>
 Anders> ---
 Anders>  package/Config.in                         |    1 +
 Anders>  package/am33x-cm3/Config.in               |    4 ++++
 Anders>  package/am33x-cm3/am335x-pm-firmware-load |    6 ++++++
 Anders>  package/am33x-cm3/am33x-cm3.mk            |   28 ++++++++++++++++++++++++++++
 Anders>  4 files changed, 39 insertions(+)
 Anders>  create mode 100644 package/am33x-cm3/Config.in
 Anders>  create mode 100755 package/am33x-cm3/am335x-pm-firmware-load
 Anders>  create mode 100644 package/am33x-cm3/am33x-cm3.mk

 Anders> diff --git a/package/Config.in b/package/Config.in
 Anders> index d980871..329d734 100644
 Anders> --- a/package/Config.in
 Anders> +++ b/package/Config.in
 Anders> @@ -213,6 +213,7 @@ endmenu
 
 Anders>  menu "Hardware handling"
 Anders>  menu "Misc devices firmwares"
 Anders> +source "package/am33x-cm3/Config.in"
 Anders>  source "package/b43-firmware/Config.in"
 Anders>  source "package/firmware-imx/Config.in"
 Anders>  source "package/linux-firmware/Config.in"
 Anders> diff --git a/package/am33x-cm3/Config.in b/package/am33x-cm3/Config.in
 Anders> new file mode 100644
 Anders> index 0000000..ee39f7d
 Anders> --- /dev/null
 Anders> +++ b/package/am33x-cm3/Config.in
 Anders> @@ -0,0 +1,4 @@
 Anders> +config BR2_PACKAGE_AM33X_CM3
 Anders> +	bool "am33x-cm3"

SoC specific packages like this should depend on BR2_arm to not clutter
menuconfig for other archs.

 Anders> +	help
 Anders> +	  Cortex-M3 binary blob for suspend-resume

I've added 'on am335x', otherwise it isn't clear that this is for
am335x.

I've also added the git location as upstream URL.

 Anders> diff --git a/package/am33x-cm3/am335x-pm-firmware-load b/package/am33x-cm3/am335x-pm-firmware-load
 Anders> new file mode 100755
 Anders> index 0000000..56c17b3
 Anders> --- /dev/null
 Anders> +++ b/package/am33x-cm3/am335x-pm-firmware-load

We normally give this the same name as what it get's installed to, so
I've prepended it with S93-.

 Anders> @@ -0,0 +1,6 @@
 Anders> +#!/bin/sh
 Anders> +
 Anders> +# Load the PM CM3 firmware
 Anders> +echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
 Anders> +cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
 Anders> +echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
 Anders> diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
 Anders> new file mode 100644
 Anders> index 0000000..5125c5b
 Anders> --- /dev/null
 Anders> +++ b/package/am33x-cm3/am33x-cm3.mk
 Anders> @@ -0,0 +1,28 @@
 Anders> +#############################################################
 Anders> +#
 Anders> +# am33x-cm3
 Anders> +#
 Anders> +#############################################################
 Anders> +
 Anders> +AM33X_CM3_VERSION = AM335xPSP_04.06.00.10-rc1
 Anders> +AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
 Anders> +AM33X_CM3_SITE_METHOD = git
 Anders> +AM33X_CM3_LICENSE = TI Publicly Available Software License
 Anders> +AM33X_CM3_LICENSE_FILES = License.txt
 Anders> +
 Anders> +# The build command below will use the standard cross-compiler (normally
 Anders> +# build for Cortex-A8, to build the FW for the Cortex-M3.
 Anders> +define AM33X_CM3_BUILD_CMDS
 Anders> +	$(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
 Anders> +endef
 Anders> +
 Anders> +# Not all of the firmware files are used
 Anders> +define AM33X_CM3_INSTALL_TARGET_CMDS
 Anders> +	$(INSTALL) -m 0644 -D $(@D)/bin/am335x-pm-firmware.bin $(TARGET_DIR)/lib/firmware/am335x-pm-firmware.bin
 Anders> +endef
 Anders> +
 Anders> +define AM33X_CM3_INSTALL_INIT_SYSV
 Anders> +	$(INSTALL) -m 0755 -D package/am33x-cm3/am335x-pm-firmware-load $(TARGET_DIR)/etc/init.d/S93-am335x-pm-firmware-load

And renamed here as well.

These lines are very long, so I've word wrapped them.

Committed to next with these changes, thanks.

-- 
Bye, Peter Korsgaard

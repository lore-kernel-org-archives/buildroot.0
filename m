From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 8 Nov 2017 18:02:13 +0100
Subject: [Buildroot] [PATCH 1/1] add sunxi-mali mainline kernel
In-Reply-To: <20171108102753.nisqsfaibybjul4x@flea.lan>
References: <1509920353-23438-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171108102753.nisqsfaibybjul4x@flea.lan>
Message-ID: <ed7218c6-5770-43b6-0c03-8ba6eff395a7@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 08/11/2017 11:27, Maxime Ripard ha scritto:
> Hi,
> 
> On Sun, Nov 05, 2017 at 11:19:13PM +0100, Giulio Benetti wrote:
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> A commit log would be nice.

Right

> 
>> ---
>>   package/sunxi-mali-driver-mainline/Config.in       |  9 +++++
>>   package/sunxi-mali-driver-mainline/S80mali         | 43 ++++++++++++++++++++++
>>   .../sunxi-mali-driver-mainline.mk                  | 43 ++++++++++++++++++++++
>>   3 files changed, 95 insertions(+)
>>   create mode 100644 package/sunxi-mali-driver-mainline/Config.in
>>   create mode 100644 package/sunxi-mali-driver-mainline/S80mali
>>   create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>
>> diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
>> new file mode 100644
>> index 0000000..8f2c960
>> --- /dev/null
>> +++ b/package/sunxi-mali-driver-mainline/Config.in
>> @@ -0,0 +1,9 @@
>> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
>> +	depends on !BR2_LINUX_KERNEL
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
>> +	bool "sunxi-mali-driver-mainline"
>> +	depends on BR2_LINUX_KERNEL
>> +	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
>> +	help
>> +	  Sunxi Mali Kernel space driver
>> diff --git a/package/sunxi-mali-driver-mainline/S80mali b/package/sunxi-mali-driver-mainline/S80mali
>> new file mode 100644
>> index 0000000..3db342e
>> --- /dev/null
>> +++ b/package/sunxi-mali-driver-mainline/S80mali
>> @@ -0,0 +1,43 @@
>> +#!/bin/sh -e
>> +
>> +install_driver() {
>> +	DRIVER=$1
>> +	OPTS=$2
>> +
>> +	modprobe $DRIVER $OPTS
>> +	maj=$(awk "\$2==\"${DRIVER}\" { print \$1; }" /proc/devices)
>> +
>> +	rm -f /dev/${DRIVER}
>> +
>> +	mknod /dev/${DRIVER} c $maj 0
>> +	chmod 600 /dev/${DRIVER}
>> +}
>> +
>> +start() {
>> +	echo "mali: starting driver"
>> +
>> +	install_driver mali
>> +}
>> +
>> +stop() {
>> +	echo "mali: stopping driver"
>> +
>> +	rmmod mali
>> +}
>> +
>> +case "$1" in
>> +start)
>> +	start
>> +;;
>> +stop)
>> +	stop
>> +;;
>> +restart)
>> +	stop
>> +	start
>> +;;
>> +*)
>> +	echo "mali: Please use start, stop, or restart."
>> +	exit 1
>> +;;
>> +esac
> 
> Why do you need that script? The only thing it does apparently is to
> create the device node, which is useless since devtmpfs will do it for
> you, and to load the module, which might or might not be needed (if
> you have udev for example).

I agree with you, in fact I only took as a legacy from sunxi-mali,
but better to remove it.

> 
>> diff --git a/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>> new file mode 100644
>> index 0000000..73f7359
>> --- /dev/null
>> +++ b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>> @@ -0,0 +1,43 @@
>> +################################################################################
>> +#
>> +# sunxi-mali-driver-mainline
>> +#
>> +################################################################################
>> +
>> +# last sha1 character dropped to ensure unique filename
> 
> What do you mean?

Honestly I don't know, this is copied by legacy sunxi-mali.
Better remove and...

> 
>> +SUNXI_MALI_DRIVER_MAINLINE_VERSION = 88ba3cecfc7082bf8e52d7ded16cbbf0ef9e6ca
>> +SUNXI_MALI_DRIVER_MAINLINE_SITE = https://github.com/mripard/sunxi-mali.git
>> +SUNXI_MALI_DRIVER_MAINLINE_SITE_METHOD = git
> 
> You can use the github macros to do that.

sure I will use github macros, forgotten about it.

> 
>> +
>> +SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
>> +
>> +SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
>> +	KDIR=$(LINUX_DIR) \
>> +	USING_UMP=0 \
>> +	BUILD=release \
>> +	USING_DVFS=1 \
>> +	USING_DEVFREQ=1 \
>> +	CROSS_COMPILE=$(TARGET_CROSS)
>> +
>> +define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
>> +	$(APPLY_PATCHES) $(@D)/r6p2 $(@D)/patches \*.patch
>> +
>> +	$(SUNXI_MALI_MAINLINE_MAKE_ENV) $(MAKE) \
>> +		$(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
>> +		-C $(@D)/r6p2/src/devicedrv/mali
>> +endef
>> +
>> +define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
>> +	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/gpu/
>> +
>> +	cp $(@D)/r6p2/src/devicedrv/mali/mali.ko \
>> +		$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/gpu/
>> +
>> +	echo kernel/gpu/mali.ko >> \
>> +	$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/modules.dep
> 
> Why not using the build script that does all this already?

I misread Makefile, I didn't see that there was modules recipe...
Worked for nothing, I replace with modules pkg-kernel-module.

> 
> Thanks!
> Maxime
> 


-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

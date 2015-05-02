From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 17:12:23 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/openpowerlink2: add drivers
 packages
In-Reply-To: <1430494560-5196-2-git-send-email-romain.naour@openwide.fr>
References: <1430494560-5196-1-git-send-email-romain.naour@openwide.fr>
 <1430494560-5196-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <5544E957.7010607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 17:35, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: s/BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER/BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS/
>     The kernel module wasn't build due to a typo in the kconfig variable.
>     rename openpowerlink2-pcap-drivers to openpowerlink2-pcap-daemon.
> ---
>  package/openpowerlink2/Config.in                   |  1 +
>  .../openpowerlink2-drivers/Config.in               |  3 ++
>  .../openpowerlink2-drivers.mk                      |  2 +
>  .../openpowerlink2-kernel-drivers/Config.in        | 33 +++++++++++++++
>  .../openpowerlink2-kernel-drivers.mk               | 48 ++++++++++++++++++++++
>  .../openpowerlink2-pcap-daemon/Config.in           | 12 ++++++
>  .../openpowerlink2-pcap-daemon.mk                  | 34 +++++++++++++++
>  .../openpowerlink2/openpowerlink2-stack/Config.in  |  2 +
>  package/openpowerlink2/openpowerlink2.mk           |  1 +

 Again, this should be split into one patch per package, and without subdirectory.

>  9 files changed, 136 insertions(+)
>  create mode 100644 package/openpowerlink2/openpowerlink2-drivers/Config.in
>  create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
>  create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in
>  create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
>  create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/Config.in
>  create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk
> 
> diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
> index 8e61a7d..c651031 100644
> --- a/package/openpowerlink2/Config.in
> +++ b/package/openpowerlink2/Config.in
> @@ -35,6 +35,7 @@ choice
>  
>  endchoice
>  
> +source "package/openpowerlink2/openpowerlink2-drivers/Config.in"
>  source "package/openpowerlink2/openpowerlink2-stack/Config.in"

 It doesn't make sense to put the drivers before the stack, if you first have to
go to the stack to select the option that makes it possible to select drivers...
So IMHO this is a case were we can break alphabetical ordering.

>  
>  config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
> diff --git a/package/openpowerlink2/openpowerlink2-drivers/Config.in b/package/openpowerlink2/openpowerlink2-drivers/Config.in
> new file mode 100644
> index 0000000..b9239ae
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-drivers/Config.in
> @@ -0,0 +1,3 @@
> +
> +source "package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in"
> +source "package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/Config.in"

 This extra config file and non-package package isn't needed. So just make one
patch to add -kernel-drivers, and another patch to add -pcap-daemon.

> diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
> new file mode 100644
> index 0000000..ab5cd1c
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
> @@ -0,0 +1,2 @@
> +
> +include $(sort $(wildcard package/openpowerlink2/openpowerlink2-drivers/*/*.mk))
> diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in
> new file mode 100644
> index 0000000..461504c
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in
> @@ -0,0 +1,33 @@
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
> +	bool "openpowerlink kernel stack"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB

 That can't be right, you have both a depends here and a select in
BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB. Kconfig should error on that.

> +	help
> +	  The openPOWERLINK stack is implemented as Linux kernel module.
> +	  This solution provides the best performance, but is limited to
> +	  the available openPOWERLINK network drivers.

 This sentence should go to the choice in the stack.

 Perhaps the help text should also mention that the user is responsible for
making sure that the 'normal' driver for the ethernet chip isn't enabled or loaded.

> +
> +if BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
> +
> +choice
> +	prompt "select Ethernet Powerlink Driver"

 Are they really mutually exclusive?

> +
> +config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_82573
> +	bool "Intel 82573"
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_8255x
> +	bool "Intel 8255x"
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_I210
> +	bool "Intel I210"
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_RTL8111
> +	bool "Realtek RTL-8111/8168"
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_RTL8139
> +	bool "Realtek RTL-8139"
> +
> +endchoice
> +
> +endif # BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
> diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
> new file mode 100644
> index 0000000..a4470d8
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# openpowerlink2-kernel-drivers
> +#
> +################################################################################
> +
> +OPENPOWERLINK2_KERNEL_DRIVERS_VERSION = $(OPENPOWERLINK2_VERSION)
> +
> +OPENPOWERLINK2_KERNEL_DRIVERS_LICENSE = $(OPENPOWERLINK2_LICENSE)
> +OPENPOWERLINK2_KERNEL_DRIVERS_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
> +
> +# We want to use the same archive for all sub-packages.
> +OPENPOWERLINK2_KERNEL_DRIVERS_SOURCE =
> +OPENPOWERLINK2_KERNEL_DRIVERS_DEPENDENCIES = linux openpowerlink2-stack
> +
> +define OPENPOWERLINK2_KERNEL_DRIVERS_SYMLINK_TO_SRC_HOOK
> +	ln -s $(OPENPOWERLINK2_DIR) $(OPENPOWERLINK2_KERNEL_DRIVERS_DIR)/src
> +endef
> +
> +OPENPOWERLINK2_KERNEL_DRIVERS_POST_EXTRACT_HOOKS += \
> +	OPENPOWERLINK2_KERNEL_DRIVERS_SYMLINK_TO_SRC_HOOK

 Same here for extracting instead of symlinking, but I guess here you need just
src/drivers/linux/drv_kernelmod_edrv.

> +
> +OPENPOWERLINK2_KERNEL_DRIVERS_SUBDIR = src/drivers/linux/drv_kernelmod_edrv
> +
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS = \
> +	-DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL)) \
> +	-DCFG_KERNEL_DIR=$(LINUX_DIR) \
> +	-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_MN),y)
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_OPLK_MN=ON
> +else
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_OPLK_MN=OFF

 For consistency, it would be better to use the same $(if ...) construct that
you use in -stack.

 BTW, is there no corresponding option for CN?

> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_82573),y)
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_8255x),y)
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8255x
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_I210),y)
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=I210
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_RTL8139),y)
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_RTL8111),y)
> +OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8111
> +endif
> +
> +$(eval $(cmake-package))
> diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/Config.in b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/Config.in
> new file mode 100644
> index 0000000..896152e
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/Config.in
> @@ -0,0 +1,12 @@
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_PCAP_DAEMON
> +	bool "openpowerlink userspace (PCAP) stack"
> +	depends on BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
> +	select BR2_PACKAGE_LIBPCAP
> +	help
> +	  The Linux userspace implementation of the openPOWERLINK stack
> +	  provides all functions for a software based POWERLINK solution
> +	  running as Linux userspace application. The stack uses the
> +	  libpcap library for accessing the network interface and is
> +	  therefore totally independant of the used network card and
                            independent

> +	  driver.
> diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk
> new file mode 100644
> index 0000000..cc28d66
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# openpowerlink2-pcap-daemon
> +#
> +################################################################################
> +
> +OPENPOWERLINK2_PCAP_DAEMON_VERSION = $(OPENPOWERLINK2_VERSION)
> +
> +OPENPOWERLINK2_PCAP_DAEMON_LICENSE = $(OPENPOWERLINK2_LICENSE)
> +OPENPOWERLINK2_PCAP_DAEMON_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
> +
> +# We want to use the same archive for all sub-packages.
> +OPENPOWERLINK2_PCAP_DAEMON_SOURCE =
> +OPENPOWERLINK2_PCAP_DAEMON_DEPENDENCIES = libpcap openpowerlink2-stack
> +
> +define OPENPOWERLINK2_PCAP_DAEMON_SYMLINK_TO_SRC_HOOK
> +	ln -s $(OPENPOWERLINK2_DIR) $(OPENPOWERLINK2_PCAP_DAEMON_DIR)/src
> +endef
> +
> +OPENPOWERLINK2_PCAP_DAEMON_POST_EXTRACT_HOOKS += \
> +	OPENPOWERLINK2_PCAP_DAEMON_SYMLINK_TO_SRC_HOOK
> +
> +OPENPOWERLINK2_PCAP_DAEMON_SUBDIR = src/drivers/linux/drv_daemon_pcap
> +
> +OPENPOWERLINK2_PCAP_DAEMON_CONF_OPTS = \
> +	-DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_MN),y)
> +OPENPOWERLINK2_PCAP_DAEMON_CONF_OPTS += -DCFG_OPLK_MN=ON
> +else
> +OPENPOWERLINK2_PCAP_DAEMON_CONF_OPTS += -DCFG_OPLK_MN=OFF
> +endif

 Same here about the $(if).

 Since it's used so often, perhaps it's better to define a global

OPENPOWERLINK2_MN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF)
OPENPOWERLINK2_CN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF)

> +
> +$(eval $(cmake-package))
> diff --git a/package/openpowerlink2/openpowerlink2-stack/Config.in b/package/openpowerlink2/openpowerlink2-stack/Config.in
> index c3ddf47..f73d8c8 100644
> --- a/package/openpowerlink2/openpowerlink2-stack/Config.in
> +++ b/package/openpowerlink2/openpowerlink2-stack/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB
>  config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
>  	bool "build EPL stack as linux userspace pcap daemon."
>  	select BR2_PACKAGE_LIBPCAP

 Does the -stack use LIBPCAP directly in this case? If not, this select
shouldn't be there.

 Regards,
 Arnout

> +	select BR2_PACKAGE_OPENPOWERLINK2_PCAP_DAEMON
>  	help
>  	  Compile openPOWERLINK application library which contains the
>  	  interface to a Linux user space driver, and the Linux user space
> @@ -23,6 +24,7 @@ config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
>  config BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
>  	bool "build EPL stack as linux kernelspace module."
>  	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
> +	select BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
>  	help
>  	  Compile openPOWERLINK application library which contains the
>  	  interface to a Linux kernel space driver. It is used together
> diff --git a/package/openpowerlink2/openpowerlink2.mk b/package/openpowerlink2/openpowerlink2.mk
> index 82c4277..144fa98 100644
> --- a/package/openpowerlink2/openpowerlink2.mk
> +++ b/package/openpowerlink2/openpowerlink2.mk
> @@ -14,4 +14,5 @@ OPENPOWERLINK2_LICENSE_FILES = license.md
>  
>  $(eval $(generic-package))
>  
> +include package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
>  include package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

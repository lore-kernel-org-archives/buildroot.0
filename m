From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 14:59:31 +0100
Subject: [Buildroot] [PATCH v7] package/openpowerlink: bump to v2.2.2
In-Reply-To: <1454851728-16690-1-git-send-email-romain.naour@gmail.com>
References: <1454851728-16690-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160207145931.799b12e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  7 Feb 2016 14:28:48 +0100, Romain Naour wrote:
> From [1]
> With version 2.0, the source code has been cleanly split into
> an application-oriented user library and a time-critical stack
> driver. The latter may be moved to a dedicated communication
> processor or into a kernel module to deliver enhanced
> performance while still keeping the API in user space.
> 
> This new version break the API used in the v1.x but
> this is a complete rewrite of the Powerlink EPSG DS 301
> implementation. The v1.x is deprecated anyway.
> 
> The now build system has been split in several CMake projects

now -> new

> which makes it difficult to package in Buildroot CMake infra.

in -> with the

> So add a top level CMakeLists.txt to build each openpowerlink
> component without having to package each of them in a separate
> Buildroot packages. Also we need to fixes the build system to

fixes -> fix.


> diff --git a/package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch b/package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch
> new file mode 100644
> index 0000000..1844906
> --- /dev/null
> +++ b/package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch
> @@ -0,0 +1,34 @@
> +From cf3f84a815fc8ed415fbc9718ec5ae3c97fbe59f Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Mon, 4 May 2015 11:47:05 +0200
> +Subject: [PATCH] [FIX] cmake: install oplk headers files
> +
> +In order to be able to link a third paries application

third paries -> third party

> +with openpowerlink libraries, we need to install oplk
> +headers files related to openpowerlink stack.

*the* oplk header files.


>  choice
> -	prompt "stack implementation"
> +	prompt "Select MN/CN mode"

Remove "Select" here, i.e just:

	prompt "MN/CN mode"

> +
> +config BR2_PACKAGE_OPENPOWERLINK_MN
> +	bool "MN"

Replace with "Managing Node"

> +	help
> +	  Enable Managing Node (master) mode
> +
> +config BR2_PACKAGE_OPENPOWERLINK_CN
> +	bool "CN"

And "Controlled Node"

> +	help
> +	  Enable Controlled Node (slave) mode
> +
> +endchoice
> +
> +config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
> +	string "debug level for openpowerlink stack"
> +	default "0xEC000000L"
> +	depends on BR2_ENABLE_DEBUG

BR2_ENABLE_DEBUG should not be used by packages anymore, except to
enable debugging symbols. We have moved away from the idea of having
BR2_ENABLE_DEBUG enable some random debugging mechanism in various
packages, it was causing too much problems.

So, if you really want to keep this option, make it empty by default,
and only enable debugging when the value is non-empty.

Also, what about using the "hex" kconfig type rather than "string" ?
You could then have 0x0 be the default value which means "no debugging".

> +config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
> +	bool "the EPL stack is directly linked into application."

All other prompts in this choice start with "build EPL stack ...", but
I think it is a bit useless. Please change the prompt of the choice to:

prompt "EPL stack type"

and then three choices should be something like:

bool "linked into application"
bool "user-space pcap daemon"
bool "kernel-space driver"


>  endchoice
>  
> -if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
> +if BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
>  
>  choice
>  	prompt "select Ethernet Powerlink Driver"
>  
> -config BR2_PACKAGE_OPENPOWERLINK_82573
> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_82573
>  	bool "Intel 82573"
>  
> -config BR2_PACKAGE_OPENPOWERLINK_8255x
> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_8255x
>  	bool "Intel 8255x"
>  
> -config BR2_PACKAGE_OPENPOWERLINK_I210
> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_I210
>  	bool "Intel I210"
>  
> -config BR2_PACKAGE_OPENPOWERLINK_RTL8139
> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8111
> +	bool "Realtek RTL-8111/8168"
> +
> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8139
>  	bool "Realtek RTL-8139"

You didn't do any legacy handling here, so I'm not sure renaming the
symbols is a good idea. On the other hand, the new name is better (but
you should use DRIVER not DRIVERS), and anyway the option to select the
kernel stack has been renamed.

So I think it's OK to rename without adding legacy handling, but please
fix DRIVERS -> DRIVER.


> +# Extract the archive using a custom extract cmds to keep a correct directory
> +# tree
> +define OPENPOWERLINK_EXTRACT_CMDS
> +	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
> +		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
> +endef

Please explain in more details what's going on. And use
<pkg>_STRIP_COMPONENTS = 0 if possible, as discussed on IRC.

>  
> -ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
> -#  use the user space stack (libpcap)
> -OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=OFF
> -OPENPOWERLINK_DEPENDENCIES = libpcap
> -else
> -# use the kernel stack
> +# CFG_DEBUG_LVL is taken into account only in Debug
> +ifeq ($(BR2_ENABLE_DEBUG),y)

See comments above, don't use BR2_ENABLE_DEBUG.

> -ifeq ($(BR2_PACKAGE_OPENPOWERLINK_82573),y)
> +OPENPOWERLINK_MN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_MN),ON,OFF)
> +OPENPOWERLINK_CN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_CN),ON,OFF)

So it seems like OpenPowerLink allows to be MN and CN at the same time,
but you don't allow that in your Config.in. Is this intended ?

> +#### OPLK LIBRARY ####
> +
> +# Always build a oplk stack
> +OPENPOWERLINK_CONF_OPTS += -DCFG_OPLK_LIB=ON
> +
> +# All option are ON by default
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
> +OPENPOWERLINK_DEPENDENCIES += libpcap
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_COMPILE_LIB_MN=$(OPENPOWERLINK_MN_ONOFF) \
> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
> +	-DCFG_COMPILE_LIB_CN=$(OPENPOWERLINK_CN_ONOFF) \
> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
> +OPENPOWERLINK_DEPENDENCIES += libpcap
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_COMPILE_LIB_MN=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(OPENPOWERLINK_MN_ONOFF) \
> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(OPENPOWERLINK_MN_ONOFF) \
> +	-DCFG_COMPILE_LIB_CN=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(OPENPOWERLINK_CN_ONOFF) \
> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(OPENPOWERLINK_CN_ONOFF)
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_COMPILE_LIB_MN=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(OPENPOWERLINK_MN_ONOFF) \
> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
> +	-DCFG_COMPILE_LIB_CN=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(OPENPOWERLINK_CN_ONOFF) \
> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF

Ah, it took me a little while to understand how the options were
working, but OK.

> +endif
> +
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_COMPILE_SHARED_LIBRARY=$(if $(BR2_STATIC_LIBS),OFF,ON)
> +
> +#### OPLK KERNEL DRIVERS ####
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
> +OPENPOWERLINK_DEPENDENCIES += linux
> +
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_KERNEL_DRIVERS=ON \
> +	-DCFG_KERNEL_DIR="$(LINUX_DIR)" \
> +	-DCMAKE_SYSTEM_VERSION="$(LINUX_VERSION)" \
> +	-DCFG_OPLK_MN="$(OPENPOWERLINK_MN_ONOFF)" \
> +	-DMAKE_KERNEL_ARCH="$(KERNEL_ARCH)" \
> +	-DMAKE_KERNEL_CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_82573),y)
>  OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
> -else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_8255x),y)
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_8255x),y)
>  OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8255x
> -else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_I210),y)
> -OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=I210
> -else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_RTL8139),y)
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_I210),y)
> +OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=i210
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8111),y)
> +OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8111
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8139),y)
>  OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
>  endif
> -
> -ifeq ($(BR2_PACKAGE_OPENPOWERLINK_MN),y)
> -OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_MN=ON
> -else
> -OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_MN=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE),y)
> -OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_CONSOLE=ON
> -else
> -OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_CONSOLE=OFF
> +#### OPLK PCAP DAEMON ####
> +
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_PCAP_DAEMON=ON \
> +	-DCFG_OPLK_MN=$(OPENPOWERLINK_MN_ONOFF)
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT),y)
> -OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_QT=ON
> -OPENPOWERLINK_DEPENDENCIES += qt
> -else
> -OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_QT=OFF
> +#### OPLK DEMO APPS ####
> +
> +# See apps/common/cmake/configure-linux.cmake for available options list.
> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_BUILD_KERNEL_STACK="Link to Application"
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_BUILD_KERNEL_STACK="Linux Userspace Daemon"
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
> +OPENPOWERLINK_CONF_OPTS += \
> +	-DCFG_BUILD_KERNEL_STACK="Linux Kernel Module"
>  endif

What is this string doing ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

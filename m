From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 17:49:40 +0100
Subject: [Buildroot] [PATCH v7] package/openpowerlink: bump to v2.2.2
In-Reply-To: <20160207145931.799b12e8@free-electrons.com>
References: <1454851728-16690-1-git-send-email-romain.naour@gmail.com>
 <20160207145931.799b12e8@free-electrons.com>
Message-ID: <56B775A4.5030801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 07/02/2016 14:59, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 

[snip]

>> +config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
>> +	string "debug level for openpowerlink stack"
>> +	default "0xEC000000L"
>> +	depends on BR2_ENABLE_DEBUG
> 
> BR2_ENABLE_DEBUG should not be used by packages anymore, except to
> enable debugging symbols. We have moved away from the idea of having
> BR2_ENABLE_DEBUG enable some random debugging mechanism in various
> packages, it was causing too much problems.
> 
> So, if you really want to keep this option, make it empty by default,
> and only enable debugging when the value is non-empty.
> 
> Also, what about using the "hex" kconfig type rather than "string" ?
> You could then have 0x0 be the default value which means "no debugging".

CFG_DEBUG_LVL is only taken into account when CMAKE_BUILD_TYPE is set to Debug.
which is only the case when BR2_ENABLE_DEBUG is set.

The string type is used here since the default value end with a "L"
(0xEC000000L), I'm not sure this is meaningful.

I tried to override CMAKE_BUILD_TYPE when BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
is non 0x0 but it doesn't work since the debug library name is not the same as
for release mode. A "_d" is used as suffix :
-loplkcnapp-kernelintf for release
-loplkcnapp-kernelintf_d for debug

I use It sometime for debuging, but I can modify it manually in the .mk instead.
So, I will drop it in the end...

> 
>> +config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
>> +	bool "the EPL stack is directly linked into application."
> 
> All other prompts in this choice start with "build EPL stack ...", but
> I think it is a bit useless. Please change the prompt of the choice to:
> 
> prompt "EPL stack type"
> 
> and then three choices should be something like:
> 
> bool "linked into application"
> bool "user-space pcap daemon"
> bool "kernel-space driver"
> 
> 
>>  endchoice
>>  
>> -if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
>> +if BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
>>  
>>  choice
>>  	prompt "select Ethernet Powerlink Driver"
>>  
>> -config BR2_PACKAGE_OPENPOWERLINK_82573
>> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_82573
>>  	bool "Intel 82573"
>>  
>> -config BR2_PACKAGE_OPENPOWERLINK_8255x
>> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_8255x
>>  	bool "Intel 8255x"
>>  
>> -config BR2_PACKAGE_OPENPOWERLINK_I210
>> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_I210
>>  	bool "Intel I210"
>>  
>> -config BR2_PACKAGE_OPENPOWERLINK_RTL8139
>> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8111
>> +	bool "Realtek RTL-8111/8168"
>> +
>> +config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8139
>>  	bool "Realtek RTL-8139"
> 
> You didn't do any legacy handling here, so I'm not sure renaming the
> symbols is a good idea. On the other hand, the new name is better (but
> you should use DRIVER not DRIVERS), and anyway the option to select the
> kernel stack has been renamed.
> 
> So I think it's OK to rename without adding legacy handling, but please
> fix DRIVERS -> DRIVER.

DRIVERS come from a previous version of this series where the openpowerlink
drivers was in different package... thank for noticing.

> 
> 
>> +# Extract the archive using a custom extract cmds to keep a correct directory
>> +# tree
>> +define OPENPOWERLINK_EXTRACT_CMDS
>> +	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
>> +		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
>> +endef
> 
> Please explain in more details what's going on. And use
> <pkg>_STRIP_COMPONENTS = 0 if possible, as discussed on IRC.

I simply added:
# The archive has no leading component.
OPENPOWERLINK_STRIP_COMPONENTS = 0

> 
>>  
>> -ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
>> -#  use the user space stack (libpcap)
>> -OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=OFF
>> -OPENPOWERLINK_DEPENDENCIES = libpcap
>> -else
>> -# use the kernel stack
>> +# CFG_DEBUG_LVL is taken into account only in Debug
>> +ifeq ($(BR2_ENABLE_DEBUG),y)
> 
> See comments above, don't use BR2_ENABLE_DEBUG.
> 
>> -ifeq ($(BR2_PACKAGE_OPENPOWERLINK_82573),y)
>> +OPENPOWERLINK_MN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_MN),ON,OFF)
>> +OPENPOWERLINK_CN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_CN),ON,OFF)
> 
> So it seems like OpenPowerLink allows to be MN and CN at the same time,
> but you don't allow that in your Config.in. Is this intended ?

Yes, it's for the CFG_OPLK_MN boolean option.

- **CFG_OPLK_MN**

  If enabled, the POWERLINK stack will be compiled with MN functionality, otherwise
  it will be compiled only with CN functionality.

> 
>> +#### OPLK LIBRARY ####
>> +
>> +# Always build a oplk stack
>> +OPENPOWERLINK_CONF_OPTS += -DCFG_OPLK_LIB=ON
>> +
>> +# All option are ON by default
>> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
>> +OPENPOWERLINK_DEPENDENCIES += libpcap
>> +OPENPOWERLINK_CONF_OPTS += \
>> +	-DCFG_COMPILE_LIB_MN=$(OPENPOWERLINK_MN_ONOFF) \
>> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
>> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
>> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
>> +	-DCFG_COMPILE_LIB_CN=$(OPENPOWERLINK_CN_ONOFF) \
>> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
>> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
>> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
>> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
>> +OPENPOWERLINK_DEPENDENCIES += libpcap
>> +OPENPOWERLINK_CONF_OPTS += \
>> +	-DCFG_COMPILE_LIB_MN=OFF \
>> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(OPENPOWERLINK_MN_ONOFF) \
>> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
>> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(OPENPOWERLINK_MN_ONOFF) \
>> +	-DCFG_COMPILE_LIB_CN=OFF \
>> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(OPENPOWERLINK_CN_ONOFF) \
>> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
>> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(OPENPOWERLINK_CN_ONOFF)
>> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
>> +OPENPOWERLINK_CONF_OPTS += \
>> +	-DCFG_COMPILE_LIB_MN=OFF \
>> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
>> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(OPENPOWERLINK_MN_ONOFF) \
>> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
>> +	-DCFG_COMPILE_LIB_CN=OFF \
>> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
>> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(OPENPOWERLINK_CN_ONOFF) \
>> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
> 
> Ah, it took me a little while to understand how the options were
> working, but OK.

:)

>> +
>> +# See apps/common/cmake/configure-linux.cmake for available options list.
>> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
>> +OPENPOWERLINK_CONF_OPTS += \
>> +	-DCFG_BUILD_KERNEL_STACK="Link to Application"
>> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
>> +OPENPOWERLINK_CONF_OPTS += \
>> +	-DCFG_BUILD_KERNEL_STACK="Linux Userspace Daemon"
>> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
>> +OPENPOWERLINK_CONF_OPTS += \
>> +	-DCFG_BUILD_KERNEL_STACK="Linux Kernel Module"
>>  endif
> 
> What is this string doing ?

It tell to the demo application against which library we need to link.

I'll respin shortly.

Thanks.
Romain
> 
> Thomas
> 

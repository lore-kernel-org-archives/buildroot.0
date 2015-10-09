From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 9 Oct 2015 15:31:34 +0200
Subject: [Buildroot] [PATCH v2] package/iqvlinux: new package
In-Reply-To: <5612BFE6.8080408@mind.be>
References: <1444063730-26388-1-git-send-email-romain.naour@openwide.fr>
 <5612BFE6.8080408@mind.be>
Message-ID: <5617C1B6.7070606@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le 05/10/2015 20:22, Arnout Vandecappelle a ?crit :
> On 05-10-15 17:48, Romain Naour wrote:
>> The PCI support needs to be checked since this driver is based
>> on it. Otherwise the build fail with:
>>  #error "This driver requires PCI support to be available"
>>
>> But this message is concealed by several occurrence of this
>> one:
>>  error: implicit declaration of function 'pci_find_bus' [-Werror=implicit-function-declaration]
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> ---
>> v2: - rename the package simply to iqvlinux (ThomasP)
>>     - move it to "Hardware Handling" menu (ThomasP)
>>     - Cc Yann for the kernel-module infra
>>     - Add a check for CONFIG_PCI even if it's redundant with
>>       the message from the Makefile.
>>       (Do we really need this check ?)
> 
>  Yes, I think that's a good idea.
> 
>  Normally in such a case we would add a KCONFIG_ENABLE_OPT in linux.mk (cfr.
> xtables-addons). However, for PCI, it's just stupid to blindly enable PCI if it
> wasn't enabled by your config, because it wouldn't enable any actual root
> complex driver so you wouldn't be able to access the bus anyway.

Indeed, some architecture or CPU doesn't have a PCI bus, that why I didn't use
KCONFIG_ENABLE_OPT here.

> 
>  So the best alternative is indeed to add a check like you do. Actually, I think
> it would be a good idea if we would do that for xtables-addons and the like as well.
> 
>  It would be even better if the check was done as a LINUX_POST_CONFIGURE_HOOK,
> so it is caught as early as possible. It would be even betterer if it would be
> done immediately after menuconfig, but that's a bit more tricky (would require
> infra update).

Ok, I'll move the check to LINUX_POST_CONFIGURE_HOOK at first and see later if
we can do something better in the Buildroot infra (in a followup path).

> 
> 
>> ---
>>  package/Config.in                              |  1 +
>>  package/iqvlinux/0001-don-t-use-host-gcc.patch | 32 ++++++++++++++++++++++++++
>>  package/iqvlinux/Config.in                     | 17 ++++++++++++++
>>  package/iqvlinux/iqvlinux.hash                 |  5 ++++
>>  package/iqvlinux/iqvlinux.mk                   | 31 +++++++++++++++++++++++++
>>  5 files changed, 86 insertions(+)
>>  create mode 100644 package/iqvlinux/0001-don-t-use-host-gcc.patch
>>  create mode 100644 package/iqvlinux/Config.in
>>  create mode 100644 package/iqvlinux/iqvlinux.hash
>>  create mode 100644 package/iqvlinux/iqvlinux.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 3794f44..5e2ac80 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -364,6 +364,7 @@ endif
>>  	source "package/iostat/Config.in"
>>  	source "package/ipmitool/Config.in"
>>  	source "package/ipmiutil/Config.in"
>> +	source "package/iqvlinux/Config.in"
>>  	source "package/irda-utils/Config.in"
>>  	source "package/iucode-tool/Config.in"
>>  	source "package/kbd/Config.in"
>> diff --git a/package/iqvlinux/0001-don-t-use-host-gcc.patch b/package/iqvlinux/0001-don-t-use-host-gcc.patch
>> new file mode 100644
>> index 0000000..66820ee
>> --- /dev/null
>> +++ b/package/iqvlinux/0001-don-t-use-host-gcc.patch
>> @@ -0,0 +1,32 @@
>> +From e768f2a9f618d2b5ff0f4be452eaf1dfffdae844 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@openwide.fr>
>> +Date: Fri, 2 Oct 2015 11:50:08 +0200
>> +Subject: [PATCH] don't use host gcc
>> +
>> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> +---
>> + src/linux/driver/Makefile |    8 --------
>> + 1 file changed, 8 deletions(-)
>> +
>> +diff --git a/src/linux/driver/Makefile b/src/linux/driver/Makefile
>> +index c1dee29..3470d58 100644
>> +--- a/src/linux/driver/Makefile
>> ++++ b/src/linux/driver/Makefile
>> +@@ -100,14 +100,6 @@ ifeq (,$(wildcard $(CONFIG_FILE)))
>> +   $(error Linux kernel source not configured - missing autoconf.h)
>> + endif
>> + 
>> +-ifneq (,$(findstring egcs-2.91.66, $(shell cat /proc/version)))
>> +-  CC := kgcc gcc cc
>> +-else
>> +-  CC := gcc cc
>> +-endif
>> +-test_cc = $(shell $(cc) --version > /dev/null 2>&1 && echo $(cc))
>> +-CC := $(foreach cc, $(CC), $(test_cc))
>> +-CC := $(firstword $(CC))
> 
>  Instead of this patch, can' you just
> 
> IQVLINUX_MODULE_MAKE_OPTS += CC=$(TARGET_CC)
> 
> ? Except of course if the patch is upstreamable.

I thought that CC was already set by pkg-infra... but in fact it's set by
TARGET_CONFIGURE_OPTS which is not used by kernel-module infra.
It build fine without the patch and with your line added.

> 
>> + ifeq (,$(CC))
>> +   $(error Compiler not found)
>> + endif
>> +-- 
>> +1.7.10.4
>> +
>> diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
>> new file mode 100644
>> index 0000000..d0394f5
>> --- /dev/null
>> +++ b/package/iqvlinux/Config.in
>> @@ -0,0 +1,17 @@
>> +config BR2_PACKAGE_IQVLINUX
>> +	bool "iqvlinux"
>> +	depends on BR2_LINUX_KERNEL
>> +	help
>> +	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux), which
>> +	  supports kernel versions 2.6.x up through 4.0.x.
>> +
>> +	  This debug driver supports all Intel's networking Tools based on
>> +	  the SDK version 2.19.36.0 or higher.
> 
>  This sounds like mumbojumbo to me. Can't you state something like 'including
> e1000, e1000e, xxx'?

There is no explicit chip reference in the source, I'm using this driver with an
I210 Ethernet chip.

> 
>> +
>> +	  Note: This driver require PCI support is enabled in the kernel
>                             requires that PCI support is enabled
> or                          requires PCI support to be enabled
>> +	  (ie. CONFIG_PCI).
>            i.e.
> 

Typos fixed.

>> +
>> +	  http://sourceforge.net/projects/e1000/files/iqvlinux/
>> +
>> +comment "iqvlinux needs a Linux kernel to be built"
>> +	depends on !BR2_LINUX_KERNEL
>> diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
>> new file mode 100644
>> index 0000000..ddf57b7
>> --- /dev/null
>> +++ b/package/iqvlinux/iqvlinux.hash
>> @@ -0,0 +1,5 @@
>> +# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
>> +sha1	bd94416e4364015dbbd78a22e51080bf7ea81fac	iqvlinux.tar.gz
>> +md5	fb6a2a4dc122d39070fcb06985c97a05	iqvlinux.tar.gz
>> +# locally computed
>> +sha256	8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec	iqvlinux.tar.gz
>> diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
>> new file mode 100644
>> index 0000000..b84cfa3
>> --- /dev/null
>> +++ b/package/iqvlinux/iqvlinux.mk
>> @@ -0,0 +1,31 @@
>> +################################################################################
>> +#
>> +# iqvlinux
>> +#
>> +################################################################################
>> +
>> +IQVLINUX_VERSION = 1.1.5.3
>> +
>> +IQVLINUX_SITE = \
>> +	http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
>> +IQVLINUX_SOURCE = iqvlinux.tar.gz
>> +
>> +IQVLINUX_LICENSE = GPLv2 BSD-3c
> 
>  Is that AND or OR? Or is it some parts one and other parts the other? If it's
> AND, leave it like it is; if it's OR, add an 'or'.

It seems it's an OR, but I haven't checked in each files, at least in cardbus_t.h:
  "This file is provided under a dual BSD/GPLv2 license.  When using or
  redistributing this file, you may do so under either license."

I'll add an 'or'.

> 
>> +IQVLINUX_LICENSE_FILES = COPYING
>> +
>> +IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) \
>> +	KSRC=$(LINUX_DIR)
> 
>  I don't like this way of indenting. All in one line should be OK, no?

Ok, I'll fixes that.

> 
>> +
>> +IQVLINUX_MODULE_SUBDIRS = src/linux/driver
>> +
>> +define IQVLINUX_PCI_CHECK
>> +	@if ! grep -Fqx 'CONFIG_PCI=y' $(LINUX_DIR)/.config; then \
>> +		echo "ERROR: Kernel does not support PCI bus."; \
> 
>  There should be something like 'Enable CONFIG_PCI in the linux kernel config'.
> 
>  Also I'd send it to stderr 1>&2

Ok, Also this check should be done in the linux configure step only if this
package is enabled.

> 
>> +		exit 1; \
>> +	fi
>> +endef
>> +
>> +IQVLINUX_PRE_BUILD_HOOKS += IQVLINUX_PCI_CHECK
> 
>  Fits more as a PRE_CONFIGURE_HOOK IMHO. Or, as I said above, as a
> LINUX_POST_CONFIGURE_HOOK.

Thanks for your review !

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
>> +
>> +$(eval $(kernel-module))
>> +$(eval $(generic-package))
>>
> 
> 

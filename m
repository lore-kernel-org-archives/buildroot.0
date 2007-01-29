From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 30 Jan 2007 00:44:38 +0100
Subject: [Buildroot] Toolchain/Busybox configuration for AVR32
In-Reply-To: <1170026311.21218.13.camel@elrond.sweden.atmel.com>
References: <1170026311.21218.13.camel@elrond.sweden.atmel.com>
Message-ID: <45BE86E6.3070506@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson skrev:
> Author:	Ulf Samuelsson
> Date:	2007-01-28
>
>   
Please put this patchset on hold,
because Atmel released a new BSP for the AVR32 internally today,
and some of the versions should be updated to reflect this.
Will come back with an updated version as soon as I managed
to build the new stuff.
> Log:
> 	Config.in and *.mk for AVR32 configurations
>
> 	Working configuration file for busybox.
> 		insmod not supported...
> 	Create patch directory
> 		toolchain/binutils/2.16.1-atmel.0.99.2/
> 		The file "empty" is a workaround to 
> 		create the directory and is not needed...
> 		Once the directory is part of the
> 		patchset, it can be removed.
>
> 	Use Atmel mirror to download preconfigured binutils.
> 	Patching vanilla binutils-2.16.1 was a nightmare!
>
> 	Ensure in all Config.in that:
> 		gcc-4.0.2
> 		binutils-2.16.1-atmel.0.99.2 (prepatched)
> 		uClibc-0.9.28
> 		busybox-1.2.2.1
> 		2.6.19.2 kernel headers
> 	is the only toolchain.
> 	There is nothing more modern around just yet :-(
>
> 	gdb is disabled, since it does not work
>
> 	The remining part to support AVR32 are the 
> 	* patchsets for the toolchain.
> 		
> 	* updated MTD
>
> Modified:
> 	toolchain/binutils/2.16.1-atmel.0.99.2/empty
> 	toolchain/binutils/binutils.mk
> 	toolchain/binutils/Config.in
> 	toolchain/gcc/Config.in
> 	toolchain/gdb/Config.in
> 	toolchain/uClibc/Config.in
> 	toolchain/kernel-headers/Config.in
> 	package/busybox/Config.in
> 	package/busybox/busybox-1.2.2.1-avr32.config
>
>
> Changeset:
> 	toolchain/binutils/2.16.1-atmel.0.99.2/empty
> 	toolchain/binutils/binutils.mk
> 	toolchain/binutils/Config.in
> 	toolchain/gcc/Config.in
> 	toolchain/gdb/Config.in
> 	toolchain/uClibc/Config.in
> 	toolchain/kernel-headers/Config.in
> 	package/busybox/Config.in
> 	package/busybox/busybox-1.2.2.1-avr32.config
>
> Best Regards
> Ulf Samuelsson
>
>
>   
> ------------------------------------------------------------------------
>
> Author:	Ulf Samuelsson
> Date:	2007-01-28
>
> Log:
> 	Config.in and *.mk for AVR32 configurations
>
> 	Working configuration file for busybox.
> 		insmod not supported...
> 	Create patch directory
> 		toolchain/binutils/2.16.1-atmel.0.99.2/
> 		The file "empty" is a workaround to 
> 		create the directory and is not needed...
> 		Once the directory is part of the
> 		patchset, it can be removed.
>
> 	Use Atmel mirror to download preconfigured binutils.
> 	Patching vanilla binutils-2.16.1 was a nightmare!
>
> 	Ensure in all Config.in that:
> 		gcc-4.0.2
> 		binutils-2.16.1-atmel.0.99.2 (prepatched)
> 		uClibc-0.9.28
> 		busybox-1.2.2.1
> 		2.6.19.2 kernel headers
> 	is the only toolchain.
> 	There is nothing more modern around just yet :-(
>
> 	gdb is disabled, since it does not work
>
> 	The remining part to support AVR32 are the 
> 	* patchsets for the toolchain.
> 		
> 	* updated MTD
>
> Modified:
>
> Changeset:
> 	toolchain/binutils/2.16.1-atmel.0.99.2/empty
> 	toolchain/binutils/binutils.mk
> 	toolchain/binutils/Config.in
> 	toolchain/gcc/Config.in
> 	toolchain/gdb/Config.in
> 	toolchain/uClibc/Config.in
> 	toolchain/kernel-headers/Config.in
> 	package/busybox/Config.in
> 	package/busybox/busybox-1.2.2.1-avr32.config
>
> diff -urN buildroot-atmel/toolchain/binutils/2.16.1-atmel.0.99.2/empty buildroot-atmel-new/toolchain/binutils/2.16.1-atmel.0.99.2/empty
> --- buildroot-atmel/toolchain/binutils/2.16.1-atmel.0.99.2/empty	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot-atmel-new/toolchain/binutils/2.16.1-atmel.0.99.2/empty	2007-01-28 22:27:38.000000000 +0100
> @@ -0,0 +1 @@
> + 
> diff -urN buildroot-0rig/toolchain/binutils/binutils.mk buildroot-atmel/toolchain/binutils/binutils.mk
> --- buildroot-0rig/toolchain/binutils/binutils.mk	2007-01-28 18:54:25.000000000 +0100
> +++ buildroot-atmel/toolchain/binutils/binutils.mk	2007-01-28 19:34:15.000000000 +0100
> @@ -4,6 +4,7 @@
>  #
>  #############################################################
>  BINUTILS_VERSION:=$(strip $(subst ",, $(BR2_BINUTILS_VERSION)))
> +ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
>  #"))
>  
>  EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
> @@ -20,6 +21,10 @@
>  BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
>  BINUTILS_NO_MPFR:=y
>  endif
> +ifeq ($(BINUTILS_VERSION),2.16.1-atmel.0.99.2)
> +BINUTILS_SITE:=$(ATMEL_MIRROR)Source/
> +BINUTILS_NO_MPFR:=y
> +endif
>  ifeq ($(BINUTILS_VERSION),2.15)
>  BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
>  BINUTILS_NO_MPFR:=y
> @@ -62,7 +67,8 @@
>  
>  $(DL_DIR)/$(BINUTILS_SOURCE):
>  	mkdir -p $(DL_DIR)
> -	$(WGET) -P $(DL_DIR) $(BINUTILS_SITE)/$(BINUTILS_SOURCE)
> +	echo $(DL_DIR)/$(BINUTILS_SOURCE)
> +	$(WGET) -P $(DL_DIR) $(BINUTILS_SITE)$(BINUTILS_SOURCE)
>  
>  binutils-unpacked: $(BINUTILS_DIR)/.unpacked
>  $(BINUTILS_DIR)/.unpacked: $(DL_DIR)/$(BINUTILS_SOURCE)
> diff -urN buildroot-0rig/toolchain/binutils/Config.in buildroot-atmel/toolchain/binutils/Config.in
> --- buildroot-0rig/toolchain/binutils/Config.in	2007-01-28 16:12:22.000000000 +0100
> +++ buildroot-atmel/toolchain/binutils/Config.in	2007-01-28 16:49:29.000000000 +0100
> @@ -9,98 +9,104 @@
>  	  Select the version of binutils you wish to use.
>  
>  	config BR2_BINUTILS_VERSION_2_14_90_0_8
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.14.90.0.8"
>  
>  	config BR2_BINUTILS_VERSION_2_15
> +		depends !BR2_avr32
>  		bool "binutils 2.15"
>  
>  	config BR2_BINUTILS_VERSION_2_15_94_0_2_2
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.15.94.0.2.2"
>  
>  	config BR2_BINUTILS_VERSION_2_16_1
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.16.1"
>  
> +	config BR2_BINUTILS_VERSION_2_16_1_ATMEL_0_99_2
> +		depends BR2_avr32
> +		bool "binutils 2.16.1-atmel.0.99.2"
> +
>  	config BR2_BINUTILS_VERSION_2_16_90_0_3
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.16.90.0.3"
>  
>  	config BR2_BINUTILS_VERSION_2_16_91_0_5
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.16.91.0.5"
>  
>  	config BR2_BINUTILS_VERSION_2_16_91_0_6
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.16.91.0.6"
>  
>  	config BR2_BINUTILS_VERSION_2_16_91_0_7
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.16.91.0.7"
>  
>  	config BR2_BINUTILS_VERSION_2_17
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_2
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.2"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_3
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.3"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_4
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.4"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_5
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.5"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_6
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.6"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_7
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.7"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_8
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.8"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_9
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.9"
>  
>  	config BR2_BINUTILS_VERSION_2_17_50_0_10
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "binutils 2.17.50.0.10"
>  
>  endchoice
>  
>  config BR2_BINUTILS_VERSION
>  	string
> -	default "2.14.90.0.8"     if BR2_BINUTILS_VERSION_2_14_90_0_8
> -	default "2.15"            if BR2_BINUTILS_VERSION_2_15
> -	default "2.15.94.0.2.2"   if BR2_BINUTILS_VERSION_2_15_94_0_2_2
> -	default "2.16.1"          if BR2_BINUTILS_VERSION_2_16_1
> -	default "2.16.90.0.3"     if BR2_BINUTILS_VERSION_2_16_90_0_3
> -	default "2.16.91.0.5"     if BR2_BINUTILS_VERSION_2_16_91_0_5
> -	default "2.16.91.0.6"     if BR2_BINUTILS_VERSION_2_16_91_0_6
> -	default "2.16.91.0.7"     if BR2_BINUTILS_VERSION_2_16_91_0_7
> -	default "2.17"            if BR2_BINUTILS_VERSION_2_17
> -	default "2.17.50.0.2"     if BR2_BINUTILS_VERSION_2_17_50_0_2
> -	default "2.17.50.0.3"     if BR2_BINUTILS_VERSION_2_17_50_0_3
> -	default "2.17.50.0.4"     if BR2_BINUTILS_VERSION_2_17_50_0_4
> -	default "2.17.50.0.5"     if BR2_BINUTILS_VERSION_2_17_50_0_5
> -	default "2.17.50.0.6"     if BR2_BINUTILS_VERSION_2_17_50_0_6
> -	default "2.17.50.0.7"     if BR2_BINUTILS_VERSION_2_17_50_0_7
> -	default "2.17.50.0.8"     if BR2_BINUTILS_VERSION_2_17_50_0_8
> -	default "2.17.50.0.9"     if BR2_BINUTILS_VERSION_2_17_50_0_9
> -	default "2.17.50.0.10"    if BR2_BINUTILS_VERSION_2_17_50_0_10
> +	default "2.14.90.0.8"		if BR2_BINUTILS_VERSION_2_14_90_0_8
> +	default "2.15"			if BR2_BINUTILS_VERSION_2_15
> +	default "2.15.94.0.2.2"		if BR2_BINUTILS_VERSION_2_15_94_0_2_2
> +	default "2.16.1"		if BR2_BINUTILS_VERSION_2_16_1
> + 	default "2.16.1-atmel.0.99.2"	if BR2_BINUTILS_VERSION_2_16_1_ATMEL_0_99_2
> +	default "2.16.90.0.3"		if BR2_BINUTILS_VERSION_2_16_90_0_3
> +	default "2.16.91.0.5"		if BR2_BINUTILS_VERSION_2_16_91_0_5
> +	default "2.16.91.0.6"		if BR2_BINUTILS_VERSION_2_16_91_0_6
> +	default "2.16.91.0.7"		if BR2_BINUTILS_VERSION_2_16_91_0_7
> +	default "2.17"			if BR2_BINUTILS_VERSION_2_17
> +	default "2.17.50.0.2"		if BR2_BINUTILS_VERSION_2_17_50_0_2
> +	default "2.17.50.0.3"		if BR2_BINUTILS_VERSION_2_17_50_0_3
> +	default "2.17.50.0.4" 		if BR2_BINUTILS_VERSION_2_17_50_0_4
> +	default "2.17.50.0.5"		if BR2_BINUTILS_VERSION_2_17_50_0_5
> +	default "2.17.50.0.6"		if BR2_BINUTILS_VERSION_2_17_50_0_6
> +	default "2.17.50.0.7"		if BR2_BINUTILS_VERSION_2_17_50_0_7
> +	default "2.17.50.0.8"		if BR2_BINUTILS_VERSION_2_17_50_0_8
> +	default "2.17.50.0.9"		if BR2_BINUTILS_VERSION_2_17_50_0_9
> +	default "2.17.50.0.10"		if BR2_BINUTILS_VERSION_2_17_50_0_10
>  
>  config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
>  	string "Additional binutils options"
> diff -urN buildroot-0rig/toolchain/gcc/Config.in buildroot-atmel/toolchain/gcc/Config.in
> --- buildroot-0rig/toolchain/gcc/Config.in	2007-01-24 21:56:55.000000000 +0100
> +++ buildroot-atmel/toolchain/gcc/Config.in	2007-01-24 22:01:21.000000000 +0100
> @@ -9,34 +9,39 @@
>  	  Select the version of gcc you wish to use.
>  
>  	config BR2_GCC_VERSION_3_3_5
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "gcc 3.3.5"
>  
>  	config BR2_GCC_VERSION_3_3_6
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "gcc 3.3.6"
>  
>  	config BR2_GCC_VERSION_3_4_2
> +		depends !BR2_avr32
>  		bool "gcc 3.4.2"
>  
>  	config BR2_GCC_VERSION_3_4_3
> +		depends !BR2_avr32
>  		bool "gcc 3.4.3"
>  
>  	config BR2_GCC_VERSION_3_4_4
> +		depends !BR2_avr32
>  		bool "gcc 3.4.4"
>  
>  	config BR2_GCC_VERSION_3_4_5
> +		depends !BR2_avr32
>  		bool "gcc 3.4.5"
>  
>  	config BR2_GCC_VERSION_3_4_6
> +		depends !BR2_avr32
>  		bool "gcc 3.4.6"
>  
>  	config BR2_GCC_VERSION_4_0_0
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "gcc 4.0.0"
>  
>  	config BR2_GCC_VERSION_4_0_1
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "gcc 4.0.1"
>  
>  	config BR2_GCC_VERSION_4_0_2
> @@ -44,19 +49,19 @@
>  		bool "gcc 4.0.2"
>  
>  	config BR2_GCC_VERSION_4_0_3
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "gcc 4.0.3"
>  
>  	config BR2_GCC_VERSION_4_1_0
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "gcc 4.1.0"
>  
>  	config BR2_GCC_VERSION_4_1_1
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "gcc 4.1.1"
>  
>  	config BR2_GCC_VERSION_4_2
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		select BR2_GCC_IS_SNAP
>  		bool "gcc 4.2"
>  
> diff -urN buildroot-0rig/toolchain/gdb/Config.in buildroot-atmel/toolchain/gdb/Config.in
> --- buildroot-0rig/toolchain/gdb/Config.in	2007-01-24 21:56:56.000000000 +0100
> +++ buildroot-atmel/toolchain/gdb/Config.in	2007-01-24 22:01:21.000000000 +0100
> @@ -3,12 +3,14 @@
>  config BR2_PACKAGE_GDB
>  	bool "Build gdb debugger for the Target"
>  	default n
> +	depends on !BR2_avr32
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	    Build the full gdb debugger to run on the target.
>  
>  config BR2_PACKAGE_GDB_SERVER
>  	bool "Build gdb server for the Target"
> +	depends on !BR2_avr32
>  	default n
>  	help
>  	    Build the gdbserver stub to run on the target.
> @@ -16,6 +18,7 @@
>  
>  config BR2_PACKAGE_GDB_HOST
>  	bool "Build gdb for the Host"
> +	depends on !BR2_avr32
>  	default n
>  	help
>  	    Build gdb to run on the host to debug programs run on the target.
> diff -urN buildroot-0rig/toolchain/kernel-headers/Config.in buildroot-atmel/toolchain/kernel-headers/Config.in
> --- buildroot-0rig/toolchain/kernel-headers/Config.in	2007-01-28 18:54:25.000000000 +0100
> +++ buildroot-atmel/toolchain/kernel-headers/Config.in	2007-01-28 19:52:55.000000000 +0100
> @@ -13,29 +13,31 @@
>  	  the kernel you intend to use on your target system.
>  
>  	config BR2_KERNEL_HEADERS_2_4_25
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "Linux 2.4.25 kernel headers"
>  
>  	config BR2_KERNEL_HEADERS_2_4_27
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "Linux 2.4.27 kernel headers"
>  
>  	config BR2_KERNEL_HEADERS_2_4_29
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "Linux 2.4.29 kernel headers"
>  
>  	config BR2_KERNEL_HEADERS_2_4_31
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "Linux 2.4.31 kernel headers"
>  
>  	config BR2_KERNEL_HEADERS_2_6_9
> +		depends !BR2_avr32
>  		bool "Linux 2.6.9 kernel headers"
>  
>  	config BR2_KERNEL_HEADERS_2_6_11
> +		depends !BR2_avr32
>  		bool "Linux 2.6.11 kernel headers"
>  
>  	config BR2_KERNEL_HEADERS_2_6_12
> -		depends !BR2_nios2
> +		depends !BR2_nios2 && !BR2_avr32
>  		bool "Linux 2.6.12 kernel headers"
>  
>  	config BR2_KERNEL_HEADERS_2_6_19_2
> diff -urN buildroot-0rig/toolchain/uClibc/Config.in buildroot-atmel/toolchain/uClibc/Config.in
> --- buildroot-0rig/toolchain/uClibc/Config.in	2007-01-28 19:57:58.000000000 +0100
> +++ buildroot-atmel/toolchain/uClibc/Config.in	2007-01-28 20:12:32.000000000 +0100
> @@ -13,9 +13,11 @@
>  		bool "uClibc 0.9.28"
>  
>  	config BR2_UCLIBC_VERSION_0_9_28_1
> +		depends on !BR2_avr32
>  		bool "uClibc 0.9.28.1"
>  
>  	config BR2_UCLIBC_VERSION_SNAPSHOT
> +		depends on !BR2_avr32
>  		bool "daily snapshot"
>  
>  endchoice
> diff -urN buildroot-atmel/package/busybox/Config.in buildroot-atmel-new/package/busybox/Config.in
> --- buildroot-atmel/package/busybox/Config.in	2007-01-28 21:18:11.000000000 +0100
> +++ buildroot-atmel-new/package/busybox/Config.in	2007-01-28 21:21:45.000000000 +0100
> @@ -16,9 +16,11 @@
>  	  Select the version of BusyBox you wish to use.
>  
>  	config BR2_BUSYBOX_VERSION_1_0_1
> +		depends !BR_avr32
>  		bool "BusyBox 1.0.1"
>  
>  	config BR2_BUSYBOX_VERSION_1_1_3
> +		depends !BR_avr32
>  		bool "BusyBox 1.1.3"
>  
>  	config BR2_BUSYBOX_VERSION_1_2_2_1
> diff -urN buildroot-0rig/package/busybox/busybox-1.2.2.1-avr32.config buildroot-atmel/package/busybox/busybox-1.2.2.1-avr32.config
> --- buildroot-0rig/package/busybox/busybox-1.2.2.1-avr32.config	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot-atmel/package/busybox/busybox-1.2.2.1-avr32.config	2007-01-24 22:01:20.000000000 +0100
> @@ -0,0 +1,643 @@
> +#
> +# Automatically generated make config: don't edit
> +#
> +HAVE_DOT_CONFIG=y
> +
> +#
> +# Busybox Settings
> +#
> +
> +#
> +# General Configuration
> +#
> +# CONFIG_NITPICK is not set
> +# CONFIG_FEATURE_BUFFERS_USE_MALLOC is not set
> +# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
> +# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
> +CONFIG_SHOW_USAGE=y
> +CONFIG_FEATURE_VERBOSE_USAGE=y
> +# CONFIG_FEATURE_COMPRESS_USAGE is not set
> +# CONFIG_FEATURE_INSTALLER is not set
> +# CONFIG_LOCALE_SUPPORT is not set
> +CONFIG_GETOPT_LONG=y
> +CONFIG_FEATURE_DEVPTS=y
> +# CONFIG_FEATURE_CLEAN_UP is not set
> +CONFIG_FEATURE_SUID=y
> +# CONFIG_FEATURE_SUID_CONFIG is not set
> +# CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
> +# CONFIG_SELINUX is not set
> +CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
> +
> +#
> +# Build Options
> +#
> +# CONFIG_STATIC is not set
> +# CONFIG_BUILD_LIBBUSYBOX is not set
> +# CONFIG_FEATURE_FULL_LIBBUSYBOX is not set
> +# CONFIG_FEATURE_SHARED_BUSYBOX is not set
> +CONFIG_LFS=y
> +# USING_CROSS_COMPILER is not set
> +CROSS_COMPILER_PREFIX=""
> +# CONFIG_BUILD_AT_ONCE is not set
> +
> +#
> +# Debugging Options
> +#
> +# CONFIG_DEBUG is not set
> +# CONFIG_DEBUG_PESSIMIZE is not set
> +# CONFIG_NO_DEBUG_LIB is not set
> +# CONFIG_DMALLOC is not set
> +# CONFIG_EFENCE is not set
> +CONFIG_DEBUG_YANK_SUSv2=y
> +
> +#
> +# Installation Options
> +#
> +# CONFIG_INSTALL_NO_USR is not set
> +CONFIG_INSTALL_APPLET_SYMLINKS=y
> +# CONFIG_INSTALL_APPLET_HARDLINKS is not set
> +# CONFIG_INSTALL_APPLET_DONT is not set
> +PREFIX="./_install"
> +
> +#
> +# Busybox Library Tuning
> +#
> +CONFIG_MD5_SIZE_VS_SPEED=2
> +
> +#
> +# Applets
> +#
> +
> +#
> +# Archival Utilities
> +#
> +# CONFIG_AR is not set
> +# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
> +CONFIG_BUNZIP2=y
> +# CONFIG_CPIO is not set
> +# CONFIG_DPKG is not set
> +# CONFIG_DPKG_DEB is not set
> +# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
> +CONFIG_GUNZIP=y
> +# CONFIG_FEATURE_GUNZIP_UNCOMPRESS is not set
> +CONFIG_GZIP=y
> +# CONFIG_RPM2CPIO is not set
> +# CONFIG_RPM is not set
> +CONFIG_TAR=y
> +CONFIG_FEATURE_TAR_CREATE=y
> +CONFIG_FEATURE_TAR_BZIP2=y
> +# CONFIG_FEATURE_TAR_LZMA is not set
> +# CONFIG_FEATURE_TAR_FROM is not set
> +CONFIG_FEATURE_TAR_GZIP=y
> +# CONFIG_FEATURE_TAR_COMPRESS is not set
> +# CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY is not set
> +CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
> +# CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
> +# CONFIG_UNCOMPRESS is not set
> +# CONFIG_UNLZMA is not set
> +# CONFIG_FEATURE_LZMA_FAST is not set
> +CONFIG_UNZIP=y
> +
> +#
> +# Common options for cpio and tar
> +#
> +# CONFIG_FEATURE_UNARCHIVE_TAPE is not set
> +# CONFIG_FEATURE_DEB_TAR_GZ is not set
> +# CONFIG_FEATURE_DEB_TAR_BZ2 is not set
> +# CONFIG_FEATURE_DEB_TAR_LZMA is not set
> +
> +#
> +# Coreutils
> +#
> +CONFIG_BASENAME=y
> +# CONFIG_CAL is not set
> +CONFIG_CAT=y
> +# CONFIG_CATV is not set
> +CONFIG_CHGRP=y
> +CONFIG_CHMOD=y
> +CONFIG_CHOWN=y
> +CONFIG_CHROOT=y
> +# CONFIG_CKSUM is not set
> +CONFIG_CMP=y
> +# CONFIG_COMM is not set
> +CONFIG_CP=y
> +CONFIG_CUT=y
> +CONFIG_DATE=y
> +CONFIG_FEATURE_DATE_ISOFMT=y
> +CONFIG_DD=y
> +# CONFIG_FEATURE_DD_SIGNAL_HANDLING is not set
> +# CONFIG_FEATURE_DD_IBS_OBS is not set
> +CONFIG_DF=y
> +# CONFIG_DIFF is not set
> +# CONFIG_FEATURE_DIFF_BINARY is not set
> +# CONFIG_FEATURE_DIFF_DIR is not set
> +# CONFIG_FEATURE_DIFF_MINIMAL is not set
> +CONFIG_DIRNAME=y
> +CONFIG_DOS2UNIX=y
> +CONFIG_UNIX2DOS=y
> +CONFIG_DU=y
> +CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
> +CONFIG_ECHO=y
> +CONFIG_FEATURE_FANCY_ECHO=y
> +CONFIG_ENV=y
> +# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
> +CONFIG_EXPR=y
> +CONFIG_EXPR_MATH_SUPPORT_64=y
> +CONFIG_FALSE=y
> +# CONFIG_FOLD is not set
> +CONFIG_HEAD=y
> +# CONFIG_FEATURE_FANCY_HEAD is not set
> +CONFIG_HOSTID=y
> +CONFIG_ID=y
> +CONFIG_INSTALL=y
> +# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
> +# CONFIG_LENGTH is not set
> +CONFIG_LN=y
> +CONFIG_LOGNAME=y
> +CONFIG_LS=y
> +CONFIG_FEATURE_LS_FILETYPES=y
> +CONFIG_FEATURE_LS_FOLLOWLINKS=y
> +CONFIG_FEATURE_LS_RECURSIVE=y
> +CONFIG_FEATURE_LS_SORTFILES=y
> +CONFIG_FEATURE_LS_TIMESTAMPS=y
> +CONFIG_FEATURE_LS_USERNAME=y
> +CONFIG_FEATURE_LS_COLOR=y
> +CONFIG_FEATURE_LS_COLOR_IS_DEFAULT=y
> +CONFIG_MD5SUM=y
> +CONFIG_MKDIR=y
> +# CONFIG_FEATURE_MKDIR_LONG_OPTIONS is not set
> +# CONFIG_MKFIFO is not set
> +CONFIG_MKNOD=y
> +CONFIG_MV=y
> +# CONFIG_FEATURE_MV_LONG_OPTIONS is not set
> +# CONFIG_NICE is not set
> +# CONFIG_NOHUP is not set
> +# CONFIG_OD is not set
> +# CONFIG_PRINTENV is not set
> +# CONFIG_PRINTF is not set
> +CONFIG_PWD=y
> +# CONFIG_REALPATH is not set
> +CONFIG_RM=y
> +CONFIG_RMDIR=y
> +# CONFIG_SEQ is not set
> +CONFIG_SHA1SUM=y
> +CONFIG_SLEEP=y
> +# CONFIG_FEATURE_FANCY_SLEEP is not set
> +CONFIG_SORT=y
> +CONFIG_FEATURE_SORT_BIG=y
> +# CONFIG_STAT is not set
> +# CONFIG_FEATURE_STAT_FORMAT is not set
> +CONFIG_STTY=y
> +# CONFIG_SUM is not set
> +CONFIG_SYNC=y
> +CONFIG_TAIL=y
> +CONFIG_FEATURE_FANCY_TAIL=y
> +CONFIG_TEE=y
> +CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
> +CONFIG_TEST=y
> +CONFIG_FEATURE_TEST_64=y
> +CONFIG_TOUCH=y
> +# CONFIG_TR is not set
> +# CONFIG_FEATURE_TR_CLASSES is not set
> +# CONFIG_FEATURE_TR_EQUIV is not set
> +CONFIG_TRUE=y
> +CONFIG_TTY=y
> +CONFIG_UNAME=y
> +CONFIG_UNIQ=y
> +CONFIG_USLEEP=y
> +CONFIG_UUDECODE=y
> +CONFIG_UUENCODE=y
> +# CONFIG_WATCH is not set
> +CONFIG_WC=y
> +# CONFIG_WHO is not set
> +CONFIG_WHOAMI=y
> +CONFIG_YES=y
> +
> +#
> +# Common options for cp and mv
> +#
> +CONFIG_FEATURE_PRESERVE_HARDLINKS=y
> +
> +#
> +# Common options for ls, more and telnet
> +#
> +CONFIG_FEATURE_AUTOWIDTH=y
> +
> +#
> +# Common options for df, du, ls
> +#
> +CONFIG_FEATURE_HUMAN_READABLE=y
> +
> +#
> +# Common options for md5sum, sha1sum
> +#
> +CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
> +
> +#
> +# Console Utilities
> +#
> +CONFIG_CHVT=y
> +CONFIG_CLEAR=y
> +CONFIG_DEALLOCVT=y
> +# CONFIG_DUMPKMAP is not set
> +# CONFIG_LOADFONT is not set
> +# CONFIG_LOADKMAP is not set
> +CONFIG_OPENVT=y
> +CONFIG_RESET=y
> +# CONFIG_SETCONSOLE is not set
> +# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
> +# CONFIG_SETKEYCODES is not set
> +# CONFIG_SETLOGCONS is not set
> +
> +#
> +# Debian Utilities
> +#
> +CONFIG_MKTEMP=y
> +# CONFIG_PIPE_PROGRESS is not set
> +CONFIG_READLINK=y
> +CONFIG_FEATURE_READLINK_FOLLOW=y
> +CONFIG_RUN_PARTS=y
> +CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
> +CONFIG_START_STOP_DAEMON=y
> +CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
> +CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
> +CONFIG_WHICH=y
> +
> +#
> +# Editors
> +#
> +# CONFIG_AWK is not set
> +# CONFIG_FEATURE_AWK_MATH is not set
> +# CONFIG_ED is not set
> +# CONFIG_PATCH is not set
> +CONFIG_SED=y
> +CONFIG_VI=y
> +CONFIG_FEATURE_VI_COLON=y
> +CONFIG_FEATURE_VI_YANKMARK=y
> +CONFIG_FEATURE_VI_SEARCH=y
> +CONFIG_FEATURE_VI_USE_SIGNALS=y
> +CONFIG_FEATURE_VI_DOT_CMD=y
> +CONFIG_FEATURE_VI_READONLY=y
> +CONFIG_FEATURE_VI_SETOPTS=y
> +CONFIG_FEATURE_VI_SET=y
> +CONFIG_FEATURE_VI_WIN_RESIZE=y
> +CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
> +
> +#
> +# Finding Utilities
> +#
> +CONFIG_FIND=y
> +CONFIG_FEATURE_FIND_PRINT0=y
> +CONFIG_FEATURE_FIND_MTIME=y
> +# CONFIG_FEATURE_FIND_MMIN is not set
> +CONFIG_FEATURE_FIND_PERM=y
> +CONFIG_FEATURE_FIND_TYPE=y
> +CONFIG_FEATURE_FIND_XDEV=y
> +# CONFIG_FEATURE_FIND_NEWER is not set
> +# CONFIG_FEATURE_FIND_INUM is not set
> +CONFIG_FEATURE_FIND_EXEC=y
> +CONFIG_GREP=y
> +CONFIG_FEATURE_GREP_EGREP_ALIAS=y
> +CONFIG_FEATURE_GREP_FGREP_ALIAS=y
> +CONFIG_FEATURE_GREP_CONTEXT=y
> +CONFIG_XARGS=y
> +# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
> +CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
> +CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
> +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
> +
> +#
> +# Init Utilities
> +#
> +CONFIG_INIT=y
> +# CONFIG_DEBUG_INIT is not set
> +CONFIG_FEATURE_USE_INITTAB=y
> +CONFIG_FEATURE_INIT_SCTTY=y
> +CONFIG_FEATURE_EXTRA_QUIET=y
> +# CONFIG_FEATURE_INIT_COREDUMPS is not set
> +CONFIG_FEATURE_INITRD=y
> +CONFIG_HALT=y
> +# CONFIG_MESG is not set
> +
> +#
> +# Login/Password Management Utilities
> +#
> +CONFIG_FEATURE_SHADOWPASSWDS=y
> +# CONFIG_USE_BB_SHADOW is not set
> +# CONFIG_USE_BB_PWD_GRP is not set
> +CONFIG_ADDGROUP=y
> +CONFIG_DELGROUP=y
> +CONFIG_ADDUSER=y
> +CONFIG_DELUSER=y
> +CONFIG_GETTY=y
> +# CONFIG_FEATURE_UTMP is not set
> +# CONFIG_FEATURE_WTMP is not set
> +CONFIG_LOGIN=y
> +CONFIG_FEATURE_SECURETTY=y
> +CONFIG_PASSWD=y
> +CONFIG_SU=y
> +CONFIG_SULOGIN=y
> +CONFIG_VLOCK=y
> +
> +#
> +# Linux Ext2 FS Progs
> +#
> +# CONFIG_CHATTR is not set
> +# CONFIG_E2FSCK is not set
> +# CONFIG_FSCK is not set
> +# CONFIG_LSATTR is not set
> +# CONFIG_MKE2FS is not set
> +# CONFIG_TUNE2FS is not set
> +# CONFIG_E2LABEL is not set
> +# CONFIG_FINDFS is not set
> +
> +#
> +# Linux Module Utilities
> +#
> +# CONFIG_INSMOD is not set
> +# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
> +# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
> +# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
> +# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
> +# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
> +CONFIG_RMMOD=y
> +CONFIG_LSMOD=y
> +CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
> +CONFIG_MODPROBE=y
> +CONFIG_FEATURE_MODPROBE_MULTIPLE_OPTIONS=y
> +
> +#
> +# Options common to multiple modutils
> +#
> +CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
> +CONFIG_FEATURE_2_4_MODULES=y
> +CONFIG_FEATURE_2_6_MODULES=y
> +# CONFIG_FEATURE_QUERY_MODULE_INTERFACE is not set
> +
> +#
> +# Linux System Utilities
> +#
> +CONFIG_DMESG=y
> +# CONFIG_FBSET is not set
> +# CONFIG_FEATURE_FBSET_FANCY is not set
> +# CONFIG_FEATURE_FBSET_READMODE is not set
> +# CONFIG_FDFLUSH is not set
> +CONFIG_FDFORMAT=y
> +CONFIG_FDISK=y
> +FDISK_SUPPORT_LARGE_DISKS=y
> +CONFIG_FEATURE_FDISK_WRITABLE=y
> +# CONFIG_FEATURE_AIX_LABEL is not set
> +# CONFIG_FEATURE_SGI_LABEL is not set
> +# CONFIG_FEATURE_SUN_LABEL is not set
> +# CONFIG_FEATURE_OSF_LABEL is not set
> +# CONFIG_FEATURE_FDISK_ADVANCED is not set
> +# CONFIG_FREERAMDISK is not set
> +# CONFIG_FSCK_MINIX is not set
> +# CONFIG_MKFS_MINIX is not set
> +# CONFIG_FEATURE_MINIX2 is not set
> +CONFIG_GETOPT=y
> +CONFIG_HEXDUMP=y
> +CONFIG_HWCLOCK=y
> +# CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS is not set
> +# CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS is not set
> +# CONFIG_IPCRM is not set
> +# CONFIG_IPCS is not set
> +# CONFIG_LOSETUP is not set
> +# CONFIG_MDEV is not set
> +# CONFIG_FEATURE_MDEV_CONF is not set
> +# CONFIG_FEATURE_MDEV_EXEC is not set
> +# CONFIG_MKSWAP is not set
> +# CONFIG_FEATURE_MKSWAP_V0 is not set
> +CONFIG_MORE=y
> +CONFIG_FEATURE_USE_TERMIOS=y
> +CONFIG_MOUNT=y
> +CONFIG_FEATURE_MOUNT_NFS=y
> +CONFIG_PIVOT_ROOT=y
> +CONFIG_RDATE=y
> +# CONFIG_READPROFILE is not set
> +# CONFIG_SETARCH is not set
> +CONFIG_SWAPONOFF=y
> +CONFIG_SWITCH_ROOT=y
> +CONFIG_UMOUNT=y
> +CONFIG_FEATURE_UMOUNT_ALL=y
> +
> +#
> +# Common options for mount/umount
> +#
> +CONFIG_FEATURE_MOUNT_LOOP=y
> +# CONFIG_FEATURE_MTAB_SUPPORT is not set
> +
> +#
> +# Miscellaneous Utilities
> +#
> +# CONFIG_ADJTIMEX is not set
> +# CONFIG_BBCONFIG is not set
> +# CONFIG_CROND is not set
> +# CONFIG_DEBUG_CROND_OPTION is not set
> +# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
> +# CONFIG_CRONTAB is not set
> +CONFIG_DC=y
> +# CONFIG_DEVFSD is not set
> +# CONFIG_DEVFSD_MODLOAD is not set
> +# CONFIG_DEVFSD_FG_NP is not set
> +# CONFIG_DEVFSD_VERBOSE is not set
> +# CONFIG_FEATURE_DEVFS is not set
> +# CONFIG_EJECT is not set
> +# CONFIG_LAST is not set
> +CONFIG_LESS=y
> +# CONFIG_FEATURE_LESS_BRACKETS is not set
> +# CONFIG_FEATURE_LESS_FLAGS is not set
> +# CONFIG_FEATURE_LESS_FLAGCS is not set
> +# CONFIG_FEATURE_LESS_MARKS is not set
> +CONFIG_FEATURE_LESS_REGEXP=y
> +# CONFIG_HDPARM is not set
> +# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
> +# CONFIG_MAKEDEVS is not set
> +# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
> +# CONFIG_FEATURE_MAKEDEVS_TABLE is not set
> +# CONFIG_MOUNTPOINT is not set
> +CONFIG_MT=y
> +# CONFIG_RUNLEVEL is not set
> +# CONFIG_RX is not set
> +CONFIG_STRINGS=y
> +# CONFIG_SETSID is not set
> +# CONFIG_TASKSET is not set
> +CONFIG_TIME=y
> +# CONFIG_WATCHDOG is not set
> +
> +#
> +# Networking Utilities
> +#
> +# CONFIG_FEATURE_IPV6 is not set
> +# CONFIG_ARPING is not set
> +# CONFIG_DNSD is not set
> +# CONFIG_ETHER_WAKE is not set
> +# CONFIG_FAKEIDENTD is not set
> +# CONFIG_FTPGET is not set
> +# CONFIG_FTPPUT is not set
> +# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
> +CONFIG_HOSTNAME=y
> +# CONFIG_HTTPD is not set
> +# CONFIG_FEATURE_HTTPD_WITHOUT_INETD is not set
> +# CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP is not set
> +# CONFIG_FEATURE_HTTPD_SETUID is not set
> +# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
> +# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
> +# CONFIG_FEATURE_HTTPD_CONFIG_WITH_MIME_TYPES is not set
> +# CONFIG_FEATURE_HTTPD_CGI is not set
> +# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
> +# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
> +# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
> +CONFIG_IFCONFIG=y
> +CONFIG_FEATURE_IFCONFIG_STATUS=y
> +# CONFIG_FEATURE_IFCONFIG_SLIP is not set
> +# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
> +# CONFIG_FEATURE_IFCONFIG_HW is not set
> +# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
> +CONFIG_IFUPDOWN=y
> +# CONFIG_FEATURE_IFUPDOWN_IP is not set
> +CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN=y
> +CONFIG_FEATURE_IFUPDOWN_IPV4=y
> +# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
> +# CONFIG_FEATURE_IFUPDOWN_IPX is not set
> +# CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
> +# CONFIG_INETD is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
> +# CONFIG_FEATURE_INETD_RPC is not set
> +# CONFIG_IP is not set
> +# CONFIG_FEATURE_IP_ADDRESS is not set
> +# CONFIG_FEATURE_IP_LINK is not set
> +# CONFIG_FEATURE_IP_ROUTE is not set
> +# CONFIG_FEATURE_IP_TUNNEL is not set
> +# CONFIG_FEATURE_IP_SHORT_FORMS is not set
> +# CONFIG_IPADDR is not set
> +# CONFIG_IPLINK is not set
> +# CONFIG_IPROUTE is not set
> +# CONFIG_IPTUNNEL is not set
> +# CONFIG_IPCALC is not set
> +# CONFIG_FEATURE_IPCALC_FANCY is not set
> +# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
> +# CONFIG_NAMEIF is not set
> +# CONFIG_NC is not set
> +# CONFIG_NC_GAPING_SECURITY_HOLE is not set
> +CONFIG_NETSTAT=y
> +CONFIG_NSLOOKUP=y
> +CONFIG_PING=y
> +CONFIG_FEATURE_FANCY_PING=y
> +# CONFIG_PING6 is not set
> +# CONFIG_FEATURE_FANCY_PING6 is not set
> +CONFIG_ROUTE=y
> +CONFIG_TELNET=y
> +CONFIG_FEATURE_TELNET_TTYPE=y
> +# CONFIG_FEATURE_TELNET_AUTOLOGIN is not set
> +# CONFIG_TELNETD is not set
> +# CONFIG_FEATURE_TELNETD_INETD is not set
> +# CONFIG_TFTP is not set
> +# CONFIG_FEATURE_TFTP_GET is not set
> +# CONFIG_FEATURE_TFTP_PUT is not set
> +# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
> +# CONFIG_DEBUG_TFTP is not set
> +# CONFIG_TRACEROUTE is not set
> +# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
> +# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
> +# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
> +
> +#
> +# udhcp Server/Client
> +#
> +# CONFIG_APP_UDHCPD is not set
> +CONFIG_APP_UDHCPC=y
> +# CONFIG_APP_DUMPLEASES is not set
> +CONFIG_FEATURE_UDHCP_SYSLOG=y
> +# CONFIG_FEATURE_UDHCP_DEBUG is not set
> +# CONFIG_VCONFIG is not set
> +CONFIG_WGET=y
> +CONFIG_FEATURE_WGET_STATUSBAR=y
> +CONFIG_FEATURE_WGET_AUTHENTICATION=y
> +# CONFIG_FEATURE_WGET_IP6_LITERAL is not set
> +# CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
> +# CONFIG_ZCIP is not set
> +
> +#
> +# Process Utilities
> +#
> +CONFIG_FREE=y
> +# CONFIG_FUSER is not set
> +CONFIG_KILL=y
> +CONFIG_KILLALL=y
> +CONFIG_PIDOF=y
> +# CONFIG_FEATURE_PIDOF_SINGLE is not set
> +# CONFIG_FEATURE_PIDOF_OMIT is not set
> +CONFIG_PS=y
> +CONFIG_FEATURE_PS_WIDE=y
> +# CONFIG_RENICE is not set
> +# CONFIG_BB_SYSCTL is not set
> +# CONFIG_TOP is not set
> +# CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE is not set
> +CONFIG_UPTIME=y
> +
> +#
> +# Shells
> +#
> +CONFIG_FEATURE_SH_IS_ASH=y
> +# CONFIG_FEATURE_SH_IS_HUSH is not set
> +# CONFIG_FEATURE_SH_IS_LASH is not set
> +# CONFIG_FEATURE_SH_IS_MSH is not set
> +# CONFIG_FEATURE_SH_IS_NONE is not set
> +CONFIG_ASH=y
> +
> +#
> +# Ash Shell Options
> +#
> +CONFIG_ASH_JOB_CONTROL=y
> +CONFIG_ASH_READ_NCHARS=y
> +CONFIG_ASH_READ_TIMEOUT=y
> +CONFIG_ASH_ALIAS=y
> +CONFIG_ASH_MATH_SUPPORT=y
> +CONFIG_ASH_MATH_SUPPORT_64=y
> +# CONFIG_ASH_GETOPTS is not set
> +CONFIG_ASH_BUILTIN_ECHO=y
> +CONFIG_ASH_BUILTIN_TEST=y
> +# CONFIG_ASH_CMDCMD is not set
> +# CONFIG_ASH_MAIL is not set
> +CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_ASH_RANDOM_SUPPORT is not set
> +CONFIG_ASH_EXPAND_PRMT=y
> +# CONFIG_HUSH is not set
> +# CONFIG_LASH is not set
> +# CONFIG_MSH is not set
> +
> +#
> +# Bourne Shell Options
> +#
> +# CONFIG_FEATURE_SH_EXTRA_QUIET is not set
> +# CONFIG_FEATURE_SH_STANDALONE_SHELL is not set
> +CONFIG_FEATURE_COMMAND_EDITING=y
> +# CONFIG_FEATURE_COMMAND_EDITING_VI is not set
> +CONFIG_FEATURE_COMMAND_HISTORY
> +CONFIG_FEATURE_COMMAND_SAVEHISTORY=y
> +CONFIG_FEATURE_COMMAND_TAB_COMPLETION=y
> +# CONFIG_FEATURE_COMMAND_USERNAME_COMPLETION is not set
> +CONFIG_FEATURE_SH_FANCY_PROMPT=y
> +
> +#
> +# System Logging Utilities
> +#
> +CONFIG_SYSLOGD=y
> +CONFIG_FEATURE_ROTATE_LOGFILE=y
> +# CONFIG_FEATURE_REMOTE_LOG is not set
> +# CONFIG_FEATURE_IPC_SYSLOG is not set
> +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
> +# CONFIG_LOGREAD is not set
> +# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
> +CONFIG_KLOGD=y
> +CONFIG_LOGGER=y
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


-- 
Best Regards,
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com 
links: www.avrfreaks.net; www.at91.com; avr32linux.org

-------------- next part --------------
A non-text attachment was scrubbed...
Name: ulf.vcf
Type: text/x-vcard
Size: 301 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070130/4d8437ac/attachment-0001.vcf 

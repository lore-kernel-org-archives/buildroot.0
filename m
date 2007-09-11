From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 11 Sep 2007 23:56:56 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
References: <20070911190713.A0773A614E@busybox.net>
Message-ID: <000301c7f4be$e8d51230$2d03310a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers


> Author: andersen
> Date: 2007-09-11 12:07:12 -0700 (Tue, 11 Sep 2007)
> New Revision: 19817
> 
> Log:
> bump up a few version numbers.  kill dead 2.6.19 option.
> accomodate powerpc64
> 
> 
> Modified:
>   trunk/buildroot/toolchain/kernel-headers/Config.in
>   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
>   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
> 


This patch breaks all the AT91 and AVR32 and x86 boards
since patches are applied based on linux kernel version numbers.
linux-2.6.22.1 should be the default option...

Best Regards
Ulf Samuelsson



> 
> Changeset:
> Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
> ===================================================================
> --- trunk/buildroot/toolchain/kernel-headers/Config.in 2007-09-11 16:28:14 UTC (rev 19816)
> +++ trunk/buildroot/toolchain/kernel-headers/Config.in 2007-09-11 19:07:12 UTC (rev 19817)
> @@ -40,10 +40,6 @@
>  depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
>  bool "Linux 2.6.12 kernel headers"
> 
> - config BR2_KERNEL_HEADERS_2_6_19_2
> - depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
> - bool "Linux 2.6.19.2 kernel headers"
> -
>  config BR2_KERNEL_HEADERS_2_6_20
>  depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
>  bool "Linux 2.6.20 kernel headers"
> @@ -91,9 +87,8 @@
>  default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
>  default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
>  default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
> - default "2.6.19.2"  if BR2_KERNEL_HEADERS_2_6_19_2
> - default "2.6.20.4"  if BR2_KERNEL_HEADERS_2_6_20
> - default "2.6.21.5"  if BR2_KERNEL_HEADERS_2_6_21
> - default "2.6.22.1"  if BR2_KERNEL_HEADERS_2_6_22
> + default "2.6.20.19"  if BR2_KERNEL_HEADERS_2_6_20
> + default "2.6.21.7"  if BR2_KERNEL_HEADERS_2_6_21
> + default "2.6.22.6"  if BR2_KERNEL_HEADERS_2_6_22
> 
> endmenu
> 
> Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
> ===================================================================
> --- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile 2007-09-11 16:28:14 UTC (rev 19816)
> +++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile 2007-09-11 19:07:12 UTC (rev 19817)
> @@ -3,11 +3,11 @@
> # full kernel tarballs >= 2.6.19.1
> #
> #############################################################
> -ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.1")
> +ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.6")
> VERSION:=2
> PATCHLEVEL:=6
> SUBLEVEL:=22
> -EXTRAVERSION:=.1
> +EXTRAVERSION:=.6
> LOCALVERSION:=
> LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
> @@ -18,11 +18,11 @@
> LINUX_HEADERS_IS_KERNEL=y
> endif
> 
> -ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.5")
> +ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.7")
> VERSION:=2
> PATCHLEVEL:=6
> SUBLEVEL:=21
> -EXTRAVERSION:=.5
> +EXTRAVERSION:=.7
> LOCALVERSION:=
> LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
> @@ -33,11 +33,11 @@
> LINUX_HEADERS_IS_KERNEL=y
> endif
> 
> -ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.4")
> +ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.19")
> VERSION:=2
> PATCHLEVEL:=6
> SUBLEVEL:=20
> -EXTRAVERSION:=.4
> +EXTRAVERSION:=.19
> LOCALVERSION:=
> LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
> 
> Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
> ===================================================================
> --- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk 2007-09-11 16:28:14 UTC (rev 19816)
> +++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk 2007-09-11 19:07:12 UTC (rev 19817)
> @@ -16,6 +16,7 @@
>  -e s/i.86/i386/ -e s/sun4u/sparc64/ \
>  -e s/arm.*/arm/ -e s/sa110/arm/ \
>  -e s/s390x/s390/ -e s/parisc64/parisc/ \
> + -e s/powerpc64/powerpc/ \
>  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>  -e s/sh2.*/sh/ -e s/sh3.*/sh/ -e s/sh4.*/sh/")
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>

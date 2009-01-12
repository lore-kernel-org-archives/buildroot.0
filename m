From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 14:36:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/liboil
	package/multimed etc...
Message-ID: <20090112143615.56E83766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-12 14:36:14 +0000 (Mon, 12 Jan 2009)
New Revision: 24796

Log:
buildroot: get rid of s390 support

As discussed on the list. It isn't supported by uclibc, so I strongly doubt
anyone has been using it.

Modified:
   trunk/buildroot/.defconfig
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/liboil/liboil.mk
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
   trunk/buildroot/target/Config.in.arch
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/.defconfig
===================================================================
--- trunk/buildroot/.defconfig	2009-01-12 14:11:40 UTC (rev 24795)
+++ trunk/buildroot/.defconfig	2009-01-12 14:36:14 UTC (rev 24796)
@@ -15,7 +15,6 @@
 # BR2_mipsel is not set
 # BR2_nios2 is not set
 # BR2_powerpc is not set
-# BR2_s390 is not set
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-01-12 14:11:40 UTC (rev 24795)
+++ trunk/buildroot/package/Makefile.in	2009-01-12 14:36:14 UTC (rev 24796)
@@ -298,9 +298,6 @@
 ifeq ($(BR2_m68k),y)
 BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
 endif
-ifeq ($(BR2_s390),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
 ifeq ($(BR2_powerpc)$(BR2_ENDIAN),yBIG)
 BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
 endif

Modified: trunk/buildroot/package/liboil/liboil.mk
===================================================================
--- trunk/buildroot/package/liboil/liboil.mk	2009-01-12 14:11:40 UTC (rev 24795)
+++ trunk/buildroot/package/liboil/liboil.mk	2009-01-12 14:36:14 UTC (rev 24796)
@@ -22,9 +22,6 @@
 ifeq ($(BR2_nios2),y)
 LIBOIL_CONF_ENV = as_cv_unaligned_access=no
 endif
-ifeq ($(BR2_s390),y)
-LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
-endif
 ifeq ($(BR2_x86_64),y)
 LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
 endif

Modified: trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-12 14:11:40 UTC (rev 24795)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-12 14:36:14 UTC (rev 24796)
@@ -17,9 +17,6 @@
 ifeq ($(BR2_nios2),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
-ifeq ($(BR2_s390),y)
-GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
-endif
 
 GSTREAMER_CONF_OPT = \
 		$(DISABLE_NLS) \

Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2009-01-12 14:11:40 UTC (rev 24795)
+++ trunk/buildroot/target/Config.in.arch	2009-01-12 14:36:14 UTC (rev 24796)
@@ -30,8 +30,6 @@
 	bool "nios2"
 config BR2_powerpc
 	bool "powerpc"
-config BR2_s390
-	bool "s390"
 config BR2_sh
 	bool "superh"
 config BR2_sh64
@@ -310,25 +308,6 @@
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_s390
-	default BR2_s390_g5
-	help
-	  Specific CPU variant to use
-
-config BR2_s390_g5
-	bool "g5"
-config BR2_s390_g6
-	bool "g6"
-config BR2_s390_z900
-	bool "z900"
-config BR2_s390_z990
-	bool "z990"
-config BR2_s390_z9_109
-	bool "z9_109"
-endchoice
-
-choice
-	prompt "Target Architecture Variant"
 	depends on BR2_sparc
 	default BR2_sparc_v7
 	help
@@ -497,8 +476,6 @@
 	default "mipsel"	if BR2_mipsel
 	default "nios2"		if BR2_nios2
 	default "powerpc"	if BR2_powerpc
-	default "s390"		if BR2_s390
-	default "s390"		if BR2_s390x
 	default "sh2a_nofpueb"	if BR2_sh2a_nofpueb
 	default "sh2eb"		if BR2_sh2eb
 	default "sh3"		if BR2_sh3
@@ -646,11 +623,6 @@
 	default ultrasparc	if BR2_sparc_ultrasparc || BR2_sparc64_ultrasparc
 	default ultrasparc3	if BR2_sparc_ultrasparc3 || BR2_sparc64_ultrasparc3
 	default niagara		if BR2_sparc_niagara || BR2_sparc64_niagara
-	default g5		if BR2_s390_g5
-	default g6		if BR2_s390_g6
-	default z900		if BR2_s390_z900
-	default z990		if BR2_s390_z990
-	default z9-109		if BR2_s390_z9_109
 
 config BR2_GCC_TARGET_ARCH
 	string
@@ -690,11 +662,6 @@
 	default 68030		if BR2_m68k_68030
 	default 68040		if BR2_m68k_68040
 	default 68060		if BR2_m68k_68060
-	default g5		if BR2_s390_g5
-	default g6		if BR2_s390_g6
-	default z900		if BR2_s390_z900
-	default z990		if BR2_s390_z990
-	default z9-109		if BR2_s390_z9_109
 
 config BR2_GCC_TARGET_ABI
 	string

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-01-12 14:11:40 UTC (rev 24795)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-01-12 14:36:14 UTC (rev 24796)
@@ -17,7 +17,7 @@
 KERNEL_ARCH:=$(shell $(SHELL) -c "echo \"$(ARCH)\" | sed -e \"s/-.*//\" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
-	-e s/s390x/s390/ -e s/parisc64/parisc/ \
+	-e s/parisc64/parisc/ \
 	-e s/powerpc64/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/sh2.*/sh/ -e s/sh3.*/sh/ -e s/sh4.*/sh/ \

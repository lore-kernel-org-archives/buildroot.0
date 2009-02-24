From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 08:56:27 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090224085627.3BACE7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-24 08:56:26 +0000 (Tue, 24 Feb 2009)
New Revision: 25436

Log:
kernel-headers: remove deprecated 2.4 support

Removed:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-24 08:56:14 UTC (rev 25435)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-24 08:56:26 UTC (rev 25436)
@@ -16,10 +16,6 @@
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_4_31
-		depends on !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "Linux 2.4.31 kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_6_20_4
 		depends on !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.20.4 kernel headers"

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-02-24 08:56:14 UTC (rev 25435)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-02-24 08:56:26 UTC (rev 25436)
@@ -4,8 +4,6 @@
 #
 #############################################################
 
-# new-style kernels?
-ifeq ($(LINUX_HEADERS_VERSION),)
 # parse linux version string
 LNXVER:=$(subst ., , $(strip $(DEFAULT_KERNEL_HEADERS)))
 VERSION:=$(word 1, $(LNXVER))
@@ -23,8 +21,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_IS_KERNEL=y
-endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.1")
 LINUX_RT_VERSION:=rt9
@@ -34,7 +30,6 @@
 LINUX_RT_VERSION:=rt20
 endif
 
-ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 # Need to redefine KERNEL_HEADERS_PATCH_DIR if you want
 # board specific kernel headers
 KERNEL_HEADERS_PATCH_DIR:=toolchain/kernel-headers/empty
@@ -92,5 +87,3 @@
 	$(SED) "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
 endif
 	touch $@
-
-endif

Deleted: trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile	2009-02-24 08:56:14 UTC (rev 25435)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile	2009-02-24 08:56:26 UTC (rev 25436)
@@ -1,103 +0,0 @@
-#############################################################
-#
-# Setup the kernel headers. I include a generic package of
-# kernel headers here, so you shouldn't need to include your
-# own. Be aware these kernel headers _will_ get blown away
-# by a 'make clean' so don't put anything sacred in here...
-#
-#############################################################
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.25")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=25
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.25.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.25
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.27")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=27
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.27.tar.bz2
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.27
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.29")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=29
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.29.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.29
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.31")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=31
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.31.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.31
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.9")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=9
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.9.1.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.9.1
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.10")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=10
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.10.0.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.10.0
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.11")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=11
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.11.0.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.11.0
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.12")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=12
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.12.0.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.12.0
-endif

Deleted: trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile	2009-02-24 08:56:14 UTC (rev 25435)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile	2009-02-24 08:56:26 UTC (rev 25436)
@@ -1,87 +0,0 @@
-#############################################################
-#
-# Setup the kernel headers. I include a generic package of
-# kernel headers here, so you shouldn't need to include your
-# own. Be aware these kernel headers _will_ get blown away
-# by a 'make clean' so don't put anything sacred in here...
-#
-#############################################################
-
-# the old sanitized kernel-headers
-ifeq ($(LINUX_HEADERS_IS_KERNEL),n)
-
-$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
-	@echo "Using old sanitized kernel-headers"
-	rm -rf $(LINUX_HEADERS_DIR)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(LINUX_HEADERS_UNPACK_DIR),$(LINUX_HEADERS_DIR))
-	ln -fs $(LINUX_HEADERS_UNPACK_DIR) $(LINUX_HEADERS_DIR)
-endif
-	touch $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
-
-$(LINUX_HEADERS_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_DIR) toolchain/kernel-headers \
-		linux-libc-headers-$(LINUX_HEADERS_VERSION)\*.patch
-ifeq ($(strip $(ARCH)),nios2)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_DIR) toolchain/kernel-headers \
-		linux-libc-headers-$(LINUX_HEADERS_VERSION)-nios2nommu.patch.conditional
-endif
-	touch $(LINUX_HEADERS_DIR)/.patched
-
-$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_DIR)/.patched
-	rm -f $(LINUX_HEADERS_DIR)/include/asm
-	@if [ ! -f $(LINUX_HEADERS_DIR)/Makefile ] ; then \
-	    /bin/echo -e "VERSION = $(VERSION)\nPATCHLEVEL = $(PATCHLEVEL)\n" > \
-		    $(LINUX_HEADERS_DIR)/Makefile; \
-	    /bin/echo -e "SUBLEVEL = $(SUBLEVEL)\nEXTRAVERSION =\n" >> \
-		    $(LINUX_HEADERS_DIR)/Makefile; \
-	    /bin/echo -e "KERNELRELEASE=\$$(VERSION).\$$(PATCHLEVEL).\$$(SUBLEVEL)\$$(EXTRAVERSION)" >> \
-		    $(LINUX_HEADERS_DIR)/Makefile; \
-	fi
-	@if [ "$(ARCH)" = "powerpc" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-ppc$(NOMMU) asm;) \
-	elif [ "$(ARCH)" = "mips" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-mips$(NOMMU) asm;) \
-	elif [ "$(ARCH)" = "mipsel" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-mips$(NOMMU) asm;) \
-	elif [ "$(ARCH)" = "nios2" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-nios2nommu asm;) \
-	elif [ "$(ARCH)" = "arm" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-arm$(NOMMU) asm; \
-	     cd asm; \
-	     if [ ! -L proc ] ; then \
-	     ln -fs proc-armv proc; \
-	     ln -fs arch-ebsa285 arch; fi); \
-	elif [ "$(ARCH)" = "armeb" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-arm$(NOMMU) asm; \
-	     cd asm; \
-	     if [ ! -L proc ] ; then \
-	     ln -fs proc-armv proc; \
-	     ln -fs arch-ebsa285 arch; fi); \
-	elif [ "$(ARCH)" = "cris" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-cris asm;) \
-	elif [ "$(ARCH)" = "sh3" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-sh asm; \
-	     cd asm; \
-	     ln -s cpu-sh3 cpu) \
-	elif [ "$(ARCH)" = "sh3eb" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-sh asm; \
-	     cd asm; \
-	     ln -s cpu-sh3 cpu) \
-	elif [ "$(ARCH)" = "sh4" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-sh asm; \
-	     cd asm; \
-	     ln -s cpu-sh4 cpu) \
-	elif [ "$(ARCH)" = "sh4eb" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-sh asm; \
-	     cd asm; \
-	     ln -s cpu-sh4 cpu) \
-	elif [ "$(ARCH)" = "i386" -o "$(ARCH)" = "i486" -o "$(ARCH)" = "i586" -o "$(ARCH)" = "i686" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-i386$(NOMMU) asm;) \
-	else \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-$(ARCH)$(NOMMU) asm;) \
-	fi
-	touch $(LINUX_HEADERS_DIR)/include/linux/autoconf.h
-	touch $(LINUX_HEADERS_DIR)/.configured
-
-endif

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-02-24 08:56:14 UTC (rev 25435)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-02-24 08:56:26 UTC (rev 25436)
@@ -22,13 +22,7 @@
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/sh.*/sh/ -e s/nios2.*/nios2nommu/")
 
-# assume old manually sanitized kernel-headers
-LINUX_HEADERS_IS_KERNEL=n
-
-# this needs to be included before kernel-headers-new to set old-style mode
-include toolchain/kernel-headers/kernel-headers-old-versions.makefile
 include toolchain/kernel-headers/kernel-headers-new.makefile
-include toolchain/kernel-headers/kernel-headers-old.makefile
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 	$(call DOWNLOAD,$(LINUX_HEADERS_SITE),$(LINUX_HEADERS_SOURCE))

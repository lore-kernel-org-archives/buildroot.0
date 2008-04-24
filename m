From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 09:54:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  oprofile
Message-ID: <20080424165429.5E3993C7F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 09:54:29 -0700 (Thu, 24 Apr 2008)
New Revision: 21847

Log:
add oprofile

Added:
   trunk/buildroot/package/oprofile/
   trunk/buildroot/package/oprofile/Config.in
   trunk/buildroot/package/oprofile/oprofile-0.9.3-avr32.patch
   trunk/buildroot/package/oprofile/oprofile-dont-use-kill-s.patch
   trunk/buildroot/package/oprofile/oprofile-fix-autoconf-brain-damage.patch
   trunk/buildroot/package/oprofile/oprofile.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-24 16:52:16 UTC (rev 21846)
+++ trunk/buildroot/package/Config.in	2008-04-24 16:54:29 UTC (rev 21847)
@@ -52,6 +52,7 @@
 source "package/libtool/Config.in"
 source "package/m4/Config.in"
 source "package/mpatrol/Config.in"
+source "package/oprofile/Config.in"
 source "package/pkgconfig/Config.in"
 source "package/readline/Config.in"
 source "package/valgrind/Config.in"

Added: trunk/buildroot/package/oprofile/Config.in
===================================================================
--- trunk/buildroot/package/oprofile/Config.in	                        (rev 0)
+++ trunk/buildroot/package/oprofile/Config.in	2008-04-24 16:54:29 UTC (rev 21847)
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_OPROFILE
+	bool "oprofile"
+	default n
+	select BR2_PACKAGE_POPT
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  OProfile is a system-wide profiler for Linux systems,
+	  capable of profiling all running code at low overhead.
+	  OProfile is released under the GNU GPL.
+
+	  It consists of a kernel driver and a daemon for collecting
+	  sample data, and several post-profiling tools for turning
+	  data into information.
+
+	  OProfile leverages the hardware performance counters of the
+	  CPU to enable profiling of a wide variety of interesting
+	  statistics, which can also be used for basic time-spent
+	  profiling. All code is profiled: hardware and software
+	  interrupt handlers, kernel modules, the kernel, shared
+	  libraries, and applications. 

Added: trunk/buildroot/package/oprofile/oprofile-0.9.3-avr32.patch
===================================================================
--- trunk/buildroot/package/oprofile/oprofile-0.9.3-avr32.patch	                        (rev 0)
+++ trunk/buildroot/package/oprofile/oprofile-0.9.3-avr32.patch	2008-04-24 16:54:29 UTC (rev 21847)
@@ -0,0 +1,128 @@
+From 39ec366414a52eec3ac9db6b639965fef78601e3 Mon Sep 17 00:00:00 2001
+From: Haavard Skinnemoen <hskinnemoen@atmel.com>
+Date: Wed, 31 Oct 2007 20:38:48 +0100
+Subject: [PATCH] Oprofile: Add support for AVR32
+
+Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
+---
+ events/Makefile.am      |    1 +
+ events/avr32/events     |   27 +++++++++++++++++++++++++++
+ events/avr32/unit_masks |    4 ++++
+ libop/op_cpu_type.c     |    1 +
+ libop/op_cpu_type.h     |    1 +
+ libop/op_events.c       |    1 +
+ utils/ophelp.c          |    5 +++++
+ 7 files changed, 40 insertions(+), 0 deletions(-)
+ create mode 100644 events/avr32/events
+ create mode 100644 events/avr32/unit_masks
+
+diff --git a/events/Makefile.am b/events/Makefile.am
+index 6efaa2e..4681d34 100644
+--- a/events/Makefile.am
++++ b/events/Makefile.am
+@@ -32,6 +32,7 @@ event_files = \
+ 	arm/xscale2/events arm/xscale2/unit_masks \
+ 	arm/armv6/events arm/armv6/unit_masks \
+ 	arm/mpcore/events arm/mpcore/unit_masks \
++	avr32/events avr32/unit_masks \
+ 	mips/20K/events mips/20K/unit_masks \
+ 	mips/24K/events mips/24K/unit_masks \
+ 	mips/25K/events mips/25K/unit_masks \
+diff --git a/events/avr32/events b/events/avr32/events
+new file mode 100644
+index 0000000..489d914
+--- /dev/null
++++ b/events/avr32/events
+@@ -0,0 +1,27 @@
++# AVR32 events
++#
++event:0x00 counters:1,2 um:zero minimum:500 name:IFU_IFETCH_MISS : number of instruction fetch misses
++event:0x01 counters:1,2 um:zero minimum:500 name:CYCLES_IFU_MEM_STALL : cycles instruction fetch pipe is stalled
++event:0x02 counters:1,2 um:zero minimum:500 name:CYCLES_DATA_STALL : cycles stall due to data dependency
++event:0x03 counters:1,2 um:zero minimum:500 name:ITLB_MISS : number of Instruction TLB misses
++event:0x04 counters:1,2 um:zero minimum:500 name:DTLB_MISS : number of Data TLB misses
++event:0x05 counters:1,2 um:zero minimum:500 name:BR_INST_EXECUTED : branch instruction executed w/ or w/o program flow change
++event:0x06 counters:1,2 um:zero minimum:500 name:BR_INST_MISS_PRED : branch mispredicted
++event:0x07 counters:1,2 um:zero minimum:500 name:INSN_EXECUTED : instructions executed
++event:0x08 counters:1,2 um:zero minimum:500 name:DCACHE_WBUF_FULL : data cache write buffers full
++event:0x09 counters:1,2 um:zero minimum:500 name:CYCLES_DCACHE_WBUF_FULL : cycles stalled due to data cache write buffers full
++event:0x0a counters:1,2 um:zero minimum:500 name:DCACHE_READ_MISS : data cache read miss
++event:0x0b counters:1,2 um:zero minimum:500 name:CYCLES_DCACHE_READ_MISS : cycles stalled due to data cache read miss
++event:0x0c counters:1,2 um:zero minimum:500 name:WRITE_ACCESS : write access
++event:0x0d counters:1,2 um:zero minimum:500 name:CYCLES_WRITE_ACCESS : cycles when write access is ongoing
++event:0x0e counters:1,2 um:zero minimum:500 name:READ_ACCESS : read access
++event:0x0f counters:1,2 um:zero minimum:500 name:CYCLES_READ_ACCESS : cycles when read access is ongoing
++event:0x10 counters:1,2 um:zero minimum:500 name:CACHE_STALL : read or write access that stalled
++event:0x11 counters:1,2 um:zero minimum:500 name:CYCLES_CACHE_STALL : cycles stalled doing read or write access
++event:0x12 counters:1,2 um:zero minimum:500 name:DCACHE_ACCESS : data cache access
++event:0x13 counters:1,2 um:zero minimum:500 name:CYCLES_DCACHE_ACCESS : cycles when data cache access is ongoing
++event:0x14 counters:1,2 um:zero minimum:500 name:DCACHE_WB : data cache line writeback
++event:0x15 counters:1,2 um:zero minimum:500 name:ACCUMULATOR_HIT : accumulator cache hit
++event:0x16 counters:1,2 um:zero minimum:500 name:ACCUMULATOR_MISS : accumulator cache miss
++event:0x17 counters:1,2 um:zero minimum:500 name:BTB_HIT : branch target buffer hit
++event:0xff counters:0 um:zero minimum:500 name:CPU_CYCLES : clock cycles counter
+diff --git a/events/avr32/unit_masks b/events/avr32/unit_masks
+new file mode 100644
+index 0000000..37d9839
+--- /dev/null
++++ b/events/avr32/unit_masks
+@@ -0,0 +1,4 @@
++# AVR32 performance counters possible unit masks
++#
++name:zero type:mandatory default:0x00
++	0x00 No unit mask
+diff --git a/libop/op_cpu_type.c b/libop/op_cpu_type.c
+index 04647f0..023397c 100644
+--- a/libop/op_cpu_type.c
++++ b/libop/op_cpu_type.c
+@@ -72,6 +72,7 @@ static struct cpu_descr const cpu_descrs[MAX_CPU_TYPE] = {
+ 	{ "ARM MPCore", "arm/mpcore", CPU_ARM_MPCORE, 2 },
+ 	{ "ARM V6 PMU", "arm/armv6", CPU_ARM_V6, 3 },
+ 	{ "ppc64 POWER5++", "ppc64/power5++", CPU_PPC64_POWER5pp, 6 },
++	{ "AVR32", "avr32", CPU_AVR32, 3 },
+ };
+  
+ static size_t const nr_cpu_descrs = sizeof(cpu_descrs) / sizeof(struct cpu_descr);
+diff --git a/libop/op_cpu_type.h b/libop/op_cpu_type.h
+index 5c9bde7..d2a624e 100644
+--- a/libop/op_cpu_type.h
++++ b/libop/op_cpu_type.h
+@@ -70,6 +70,7 @@ typedef enum {
+ 	CPU_ARM_MPCORE, /**< ARM MPCore */
+ 	CPU_ARM_V6, /**< ARM V6 */
+ 	CPU_PPC64_POWER5pp,  /**< ppc64 Power5++ family */
++	CPU_AVR32, /**< AVR32 */
+ 	MAX_CPU_TYPE
+ } op_cpu;
+ 
+diff --git a/libop/op_events.c b/libop/op_events.c
+index 2b3c9a9..1ab4bcc 100644
+--- a/libop/op_events.c
++++ b/libop/op_events.c
+@@ -788,6 +788,7 @@ void op_default_event(op_cpu cpu_type, struct op_default_event_descr * descr)
+ 		case CPU_ARM_XSCALE2:
+ 		case CPU_ARM_MPCORE:
+ 		case CPU_ARM_V6:
++		case CPU_AVR32:
+ 			descr->name = "CPU_CYCLES";
+ 			break;
+ 
+diff --git a/utils/ophelp.c b/utils/ophelp.c
+index a5a7a02..10ed606 100644
+--- a/utils/ophelp.c
++++ b/utils/ophelp.c
+@@ -511,6 +511,11 @@ int main(int argc, char const * argv[])
+ 		       "Downloadable from http://www.freescale.com\n");
+ 		break;
+ 
++	case CPU_AVR32:
++		printf("See AVR32 Architecture Manual\n"
++			"Chapter 6: Performance Counters\n"
++			"http://www.atmel.com/dyn/resources/prod_documents/doc32000.pdf\n");
++
+ 	case CPU_RTC:
+ 		break;
+ 
+-- 
+1.5.3.4
+

Added: trunk/buildroot/package/oprofile/oprofile-dont-use-kill-s.patch
===================================================================
--- trunk/buildroot/package/oprofile/oprofile-dont-use-kill-s.patch	                        (rev 0)
+++ trunk/buildroot/package/oprofile/oprofile-dont-use-kill-s.patch	2008-04-24 16:54:29 UTC (rev 21847)
@@ -0,0 +1,65 @@
+From 34a0afeb251d14c2c98e8b61a85f6621a9ffe3d0 Mon Sep 17 00:00:00 2001
+From: Haavard Skinnemoen <hskinnemoen@atmel.com>
+Date: Tue, 6 Nov 2007 19:38:24 +0100
+Subject: [PATCH] opcontrol: don't use kill -s
+
+Busybox's implementation of "kill" doesn't understand the "-s SIG"
+option. Use "-SIG" instead.
+
+Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
+---
+ utils/opcontrol |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/utils/opcontrol b/utils/opcontrol
+index 7cb68a7..5a75cd2 100644
+--- a/utils/opcontrol
++++ b/utils/opcontrol
+@@ -908,7 +908,7 @@ do_stop()
+ 		return
+ 	fi
+ 
+-	kill -s 0 `cat $LOCK_FILE` 2>/dev/null
++	kill -0 `cat $LOCK_FILE` 2>/dev/null
+ 	if test "$?" -ne 0; then
+ 		echo "Detected stale lock file. Removing." >&2
+ 		rm -f "$LOCK_FILE"
+@@ -919,7 +919,7 @@ do_stop()
+ 		echo "Stopping profiling."
+ 		echo 0 >/dev/oprofile/enable
+ 	fi
+-	kill -s USR2 `cat $LOCK_FILE` 2>/dev/null
++	kill -USR2 `cat $LOCK_FILE` 2>/dev/null
+ }
+ 
+ 
+@@ -932,7 +932,7 @@ do_kill_daemon()
+ 		return
+ 	fi
+ 
+-	kill -s 0 `cat $LOCK_FILE` 2>/dev/null
++	kill -0 `cat $LOCK_FILE` 2>/dev/null
+ 	if test "$?" -ne 0; then
+ 		echo "Detected stale lock file. Removing." >&2
+ 		rm -f "$LOCK_FILE"
+@@ -1274,7 +1274,7 @@ do_start_daemon()
+ {
+  
+ 	if test -f "$LOCK_FILE"; then
+-		kill -s 0 `cat $LOCK_FILE` 2>/dev/null
++		kill -0 `cat $LOCK_FILE` 2>/dev/null
+ 		if test "$?" -eq 0; then
+ 			return;
+ 		else
+@@ -1341,7 +1341,7 @@ do_start()
+ 	if test "$KERNEL_SUPPORT" = "yes"; then
+ 		echo 1 >$MOUNT/enable
+ 	fi
+-	kill -s USR1 `cat $LOCK_FILE` 2>/dev/null
++	kill -USR1 `cat $LOCK_FILE` 2>/dev/null
+ 	echo "Profiler running."
+ }
+ 
+-- 
+1.5.3.4
+

Added: trunk/buildroot/package/oprofile/oprofile-fix-autoconf-brain-damage.patch
===================================================================
--- trunk/buildroot/package/oprofile/oprofile-fix-autoconf-brain-damage.patch	                        (rev 0)
+++ trunk/buildroot/package/oprofile/oprofile-fix-autoconf-brain-damage.patch	2008-04-24 16:54:29 UTC (rev 21847)
@@ -0,0 +1,13 @@
+diff --git a/libutil++/bfd_support.cpp b/libutil++/bfd_support.cpp
+index a33836f..9b0d1b2 100644
+--- a/libutil++/bfd_support.cpp
++++ b/libutil++/bfd_support.cpp
+@@ -415,7 +415,7 @@ void bfd_info::close()
+ }
+ 
+ 
+-#if SYNTHESIZE_SYMBOLS
++#if SYNTHESIZE_SYMBOLS && 0
+ bool bfd_info::get_synth_symbols()
+ {
+ 	extern const bfd_target bfd_elf64_powerpc_vec;

Added: trunk/buildroot/package/oprofile/oprofile.mk
===================================================================
--- trunk/buildroot/package/oprofile/oprofile.mk	                        (rev 0)
+++ trunk/buildroot/package/oprofile/oprofile.mk	2008-04-24 16:54:29 UTC (rev 21847)
@@ -0,0 +1,74 @@
+#############################################################
+#
+# oprofile
+#
+#############################################################
+OPROFILE_VERSION	:= 0.9.3
+OPROFILE_DIR		:= $(BUILD_DIR)/oprofile-$(OPROFILE_VERSION)
+OPROFILE_SITE		:= http://prdownloads.sourceforge.net/oprofile
+OPROFILE_SOURCE		:= oprofile-$(OPROFILE_VERSION).tar.gz
+OPROFILE_CAT		:= $(ZCAT)
+
+OPROFILE_BINARIES	:= utils/ophelp
+OPROFILE_BINARIES	+= pp/opannotate pp/oparchive pp/opgprof pp/opreport
+OPROFILE_BINARIES	+= daemon/oprofiled
+
+$(DL_DIR)/$(OPROFILE_SOURCE):
+	$(WGET) -P $(DL_DIR) $(OPROFILE_SITE)/$(OPROFILE_SOURCE)
+
+oprofile-source: $(DL_DIR)/$(OPROFILE_SOURCE)
+
+$(OPROFILE_DIR)/.unpacked: $(DL_DIR)/$(OPROFILE_SOURCE)
+	$(OPROFILE_CAT) $(DL_DIR)/$(OPROFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(OPROFILE_DIR) package/oprofile/ \*.patch*
+	$(CONFIG_UPDATE) $(OPROFILE_DIR)
+	touch $@
+
+$(OPROFILE_DIR)/.configured: $(OPROFILE_DIR)/.unpacked
+	(cd $(OPROFILE_DIR); rm -f config.cache;		\
+		$(TARGET_CONFIGURE_OPTS)			\
+		$(TARGET_CONFIGURE_ARGS)			\
+		./configure					\
+			--target=$(GNU_TARGET_NAME)		\
+			--host=$(GNU_TARGET_NAME)		\
+			--build=$(GNU_HOST_NAME)		\
+			--prefix=/usr				\
+			--sysconfdir=/etc			\
+			--localstatedir=/var			\
+			--includedir=/include			\
+	);
+	touch $@
+
+$(OPROFILE_DIR)/daemon/oprofiled: $(OPROFILE_DIR)/.configured
+	PATH=$(TARGET_PATH) $(MAKE) -C $(OPROFILE_DIR)
+	touch -c $@
+
+$(TARGET_DIR)/usr/bin/oprofiled: $(OPROFILE_DIR)/daemon/oprofiled
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile/avr32
+	$(INSTALL) -m 644 $(addprefix $(OPROFILE_DIR)/events/avr32/, events unit_masks) $(TARGET_DIR)/usr/share/oprofile/avr32
+	$(INSTALL) -m 644 $(OPROFILE_DIR)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
+	$(INSTALL) -m 755 $(OPROFILE_DIR)/utils/opcontrol $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 755 $(addprefix $(OPROFILE_DIR)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
+	$(STRIP) --strip-unneeded $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
+	touch -c $@
+
+oprofile: uclibc popt binutils_target $(TARGET_DIR)/usr/bin/oprofiled
+
+oprofile-clean:
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
+	rm -f $(TARGET_DIR)/usr/bin/opcontrol
+	rm -rf $(TARGET_DIR)/usr/share/oprofile
+	-$(MAKE) -C $(OPROFILE_DIR) clean
+
+oprofile-dirclean:
+	rm -rf $(OPROFILE_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_OPROFILE)),y)
+TARGETS		+= oprofile
+endif

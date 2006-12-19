From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 19 Dec 2006 05:24:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  kexec
Message-ID: <20061219132428.5C97D485B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-19 05:24:27 -0800 (Tue, 19 Dec 2006)
New Revision: 17005

Log:
- add kexec package


Added:
   trunk/buildroot/package/kexec/
   trunk/buildroot/package/kexec/Config.in
   trunk/buildroot/package/kexec/kexec-tools-arm.patch
   trunk/buildroot/package/kexec/kexec.mk


Changeset:
Added: trunk/buildroot/package/kexec/Config.in
===================================================================
--- trunk/buildroot/package/kexec/Config.in	2006-12-19 08:55:38 UTC (rev 17004)
+++ trunk/buildroot/package/kexec/Config.in	2006-12-19 13:24:27 UTC (rev 17005)
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_KEXEC
+	bool "kexec"
+	default n
+	help
+	  Kexec is a user space utiltity for loading another kernel
+	  and asking the currently running kernel to do something with it.
+
+	  http://www.xmission.com/~ebiederm/files/kexec/
+
+config BR2_PACKAGE_KEXEC_ZLIB
+	bool "Kexec with zlib support"
+	depends on BR2_PACKAGE_KEXEC
+	default n
+	select BR2_PACKAGE_ZLIB
+	help
+	  Support for compressed kernel images

Added: trunk/buildroot/package/kexec/kexec-tools-arm.patch
===================================================================
--- trunk/buildroot/package/kexec/kexec-tools-arm.patch	2006-12-19 08:55:38 UTC (rev 17004)
+++ trunk/buildroot/package/kexec/kexec-tools-arm.patch	2006-12-19 13:24:27 UTC (rev 17005)
@@ -0,0 +1,391 @@
+diff -uNr kexec-tools-1.101.orig/configure kexec-tools-1.101/configure
+--- kexec-tools-1.101.orig/configure	2005-02-16 13:37:44.000000000 +0100
++++ kexec-tools-1.101/configure	2006-12-17 23:05:16.000000000 +0100
+@@ -1381,6 +1381,9 @@
+ 	i?86 )
+ 		host_cpu="i386"
+ 		;;
++	arm )
++		host_cpu="arm"
++		;;
+ 	powerpc )
+ 		host_cpu="ppc"
+ 		;;
+@@ -1389,7 +1392,7 @@
+ 		;;
+ esac
+ case $host_cpu in
+-	i386|ppc|x86_64|alpha|ppc64|ia64|s390)
++	i386|ppc|x86_64|alpha|ppc64|ia64|s390|arm)
+ 		;;
+ 	* )
+ 		{ { echo "$as_me:$LINENO: error:  unsupported architecture $host_cpu" >&5
+diff -uNr kexec-tools-1.101.orig/kexec/arch/arm/Makefile kexec-tools-1.101/kexec/arch/arm/Makefile
+--- kexec-tools-1.101.orig/kexec/arch/arm/Makefile	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/kexec/arch/arm/Makefile	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,8 @@
++#
++# kexec arm (linux booting linux)
++#
++KEXEC_C_SRCS+= kexec/arch/arm/kexec-elf-rel-arm.c
++KEXEC_C_SRCS+= kexec/arch/arm/kexec-zImage-arm.c 
++KEXEC_C_SRCS+= kexec/arch/arm/kexec-arm.c 
++
++KEXEC_S_SRCS+=
+
+diff -uNr kexec-tools-1.101.orig/kexec/arch/arm/include/arch/options.h kexec-tools-1.101/kexec/arch/arm/include/arch/options.h
+--- kexec-tools-1.101.orig/kexec/arch/arm/include/arch/options.h	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/kexec/arch/arm/include/arch/options.h	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,11 @@
++#ifndef KEXEC_ARCH_ARM_OPTIONS_H
++#define KEXEC_ARCH_ARM_OPTIONS_H
++
++#define OPT_ARCH_MAX   (OPT_MAX+0)
++
++#define KEXEC_ARCH_OPTIONS \
++	KEXEC_OPTIONS \
++
++#define KEXEC_ARCH_OPT_STR KEXEC_OPT_STR ""
++
++#endif /* KEXEC_ARCH_ARM_OPTIONS_H */
+diff -uNr kexec-tools-1.101.orig/kexec/arch/arm/kexec-arm.c kexec-tools-1.101/kexec/arch/arm/kexec-arm.c
+--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-arm.c	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/kexec/arch/arm/kexec-arm.c	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,133 @@
++/*
++ * kexec: Linux boots Linux
++ *
++ * modified from kexec-ppc.c
++ *
++ */
++
++#define _GNU_SOURCE
++#include <stddef.h>
++#include <stdio.h>
++#include <errno.h>
++#include <stdint.h>
++#include <string.h>
++#include <getopt.h>
++#include <sys/utsname.h>
++#include "../../kexec.h"
++#include "../../kexec-syscall.h"
++#include "kexec-arm.h"
++#include <arch/options.h>
++
++#define MAX_MEMORY_RANGES 64
++#define MAX_LINE 160
++static struct memory_range memory_range[MAX_MEMORY_RANGES];
++
++/* Return a sorted list of available memory ranges. */
++int get_memory_ranges(struct memory_range **range, int *ranges)
++{
++	const char iomem[]= "/proc/iomem";
++	int memory_ranges = 0;
++	char line[MAX_LINE];
++	FILE *fp;
++	fp = fopen(iomem, "r");
++	if (!fp) {
++		fprintf(stderr, "Cannot open %s: %s\n", 
++			iomem, strerror(errno));
++		return -1;
++	}
++
++	while(fgets(line, sizeof(line), fp) != 0) {
++		unsigned long long start, end;
++		char *str;
++		int type;
++		int consumed;
++		int count;
++		if (memory_ranges >= MAX_MEMORY_RANGES)
++			break;
++		count = sscanf(line, "%Lx-%Lx : %n",
++			&start, &end, &consumed);
++		if (count != 2) 
++			continue;
++		str = line + consumed;
++		end = end + 1;
++
++		if (memcmp(str, "System RAM\n", 11) == 0) {
++			type = RANGE_RAM;
++		} 
++		else if (memcmp(str, "reserved\n", 9) == 0) {
++			type = RANGE_RESERVED;
++		}
++		else {
++			continue;
++		}
++
++		memory_range[memory_ranges].start = start;
++		memory_range[memory_ranges].end = end;
++		memory_range[memory_ranges].type = type;
++		memory_ranges++;
++	}
++	fclose(fp);
++	*range = memory_range;
++	*ranges = memory_ranges;
++	return 0;
++}
++
++/* Supported file types and callbacks */
++struct file_type file_type[] = {
++	{"zImage", zImage_arm_probe, zImage_arm_load, zImage_arm_usage},
++};
++int file_types = sizeof(file_type) / sizeof(file_type[0]);
++
++
++void arch_usage(void)
++{
++}
++
++int arch_process_options(int argc, char **argv)
++{
++	static const struct option options[] = {
++		KEXEC_ARCH_OPTIONS
++		{ 0, 			0, NULL, 0 },
++	};
++	static const char short_options[] = KEXEC_ARCH_OPT_STR;
++	int opt;
++
++	opterr = 0; /* Don't complain about unrecognized options here */
++	while((opt = getopt_long(argc, argv, short_options, options, 0)) != -1) {
++		switch(opt) {
++		default:
++			break;
++		}
++	}
++	/* Reset getopt for the next pass; called in other source modules */
++	opterr = 1;
++	optind = 1;
++	return 0;
++}
++
++int arch_compat_trampoline(struct kexec_info *info, unsigned long *flags)
++{
++	int result;
++	struct utsname utsname;
++	result = uname(&utsname);
++	if (result < 0) {
++		fprintf(stderr, "uname failed: %s\n",
++			strerror(errno));
++		return -1;
++	}
++	if (strncmp(utsname.machine, "arm",3) == 0)
++	{
++		*flags |= KEXEC_ARCH_ARM;
++	}
++	else {
++		fprintf(stderr, "Unsupported machine type: %s\n",
++			utsname.machine);
++		return -1;
++	}
++	return 0;
++}
++
++void arch_update_purgatory(struct kexec_info *info)
++{
++}
++
+diff -uNr kexec-tools-1.101.orig/kexec/arch/arm/kexec-arm.h kexec-tools-1.101/kexec/arch/arm/kexec-arm.h
+--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-arm.h	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/kexec/arch/arm/kexec-arm.h	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,9 @@
++#ifndef KEXEC_ARM_H
++#define KEXEC_ARM_H
++
++int zImage_arm_probe(const char *buf, off_t len);
++int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
++		        struct kexec_info *info);
++void zImage_arm_usage(void);
++
++#endif /* KEXEC_ARM_H */
+diff -uNr kexec-tools-1.101.orig/kexec/arch/arm/kexec-elf-rel-arm.c kexec-tools-1.101/kexec/arch/arm/kexec-elf-rel-arm.c
+--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-elf-rel-arm.c	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/kexec/arch/arm/kexec-elf-rel-arm.c	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,35 @@
++#include <stdio.h>
++#include <elf.h>
++#include "../../kexec.h"
++#include "../../kexec-elf.h"
++
++int machine_verify_elf_rel(struct mem_ehdr *ehdr)
++{
++	if (ehdr->ei_data != ELFDATA2MSB) {
++		return 0;
++	}
++	if (ehdr->ei_class != ELFCLASS32) {
++		return 0;
++	}
++	if (ehdr->e_machine != EM_ARM) 
++	{
++		return 0;
++	}
++	return 1;
++}
++
++void machine_apply_elf_rel(struct mem_ehdr *ehdr, unsigned long r_type,
++	void *location, unsigned long address, unsigned long value)
++{
++	switch(r_type) {
++	case R_ARM_ABS32:
++		*((uint32_t *)location) += value;
++		break;
++	case R_ARM_REL32:
++		*((uint32_t *)location) += value - address;
++		break;
++	default:
++		die("Unknown rel relocation: %lu\n", r_type);
++		break;
++	}
++}
+diff -uNr kexec-tools-1.101.orig/kexec/arch/arm/kexec-zImage-arm.c kexec-tools-1.101/kexec/arch/arm/kexec-zImage-arm.c
+--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-zImage-arm.c	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/kexec/arch/arm/kexec-zImage-arm.c	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,34 @@
++#define _GNU_SOURCE
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++#include <errno.h>
++#include <limits.h>
++#include "../../kexec.h"
++
++int zImage_arm_probe(const char *buf, off_t len)
++{
++	/* 
++	 * Only zImage loading is supported. Do not check if
++	 * the buffer is valid kernel image
++	 */	
++	return 0;
++}
++void zImage_arm_usage(void)
++{
++}
++int zImage_arm_load(int argc, char **argv, const char *buf, off_t len, 
++	struct kexec_info *info)
++{
++	unsigned long base;
++	unsigned int offset = 0x8000; /* 32k offset from memory start */
++	base = locate_hole(info,len+offset,0,0,ULONG_MAX,INT_MAX);
++	if (base == ULONG_MAX)
++	{
++		return -1;
++	}
++	base += offset;
++	add_segment(info,buf,len,base,len);
++	info->entry = (void*)base;
++	return 0;
++}
+diff -uNr kexec-tools-1.101.orig/kexec/kexec-syscall.h kexec-tools-1.101/kexec/kexec-syscall.h
+--- kexec-tools-1.101.orig/kexec/kexec-syscall.h	2005-01-06 07:59:50.000000000 +0100
++++ kexec-tools-1.101/kexec/kexec-syscall.h	2006-12-17 23:05:16.000000000 +0100
+@@ -37,6 +37,9 @@
+ #ifdef __s390__
+ #define __NR_kexec_load		277
+ #endif
++#ifdef __arm__
++#define __NR_kexec_load		__NR_SYSCALL_BASE + 189  
++#endif
+ #ifndef __NR_kexec_load
+ #error Unknown processor architecture.  Needs a kexec_load syscall number.
+ #endif
+@@ -67,6 +70,7 @@
+ #define KEXEC_ARCH_PPC64   (21 << 16)
+ #define KEXEC_ARCH_IA_64   (50 << 16)
+ #define KEXEC_ARCH_S390    (22 << 16)
++#define KEXEC_ARCH_ARM     (40 << 16)
+ 
+ #define KEXEC_MAX_SEGMENTS 16
+ 
+diff -uNr kexec-tools-1.101.orig/purgatory/arch/arm/Makefile kexec-tools-1.101/purgatory/arch/arm/Makefile
+--- kexec-tools-1.101.orig/purgatory/arch/arm/Makefile	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/purgatory/arch/arm/Makefile	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,7 @@
++#
++# Purgatory arm
++#
++
++PURGATORY_S_SRCS += 
++PURGATORY_C_SRCS += 
++
+diff -uNr kexec-tools-1.101.orig/purgatory/arch/arm/include/limits.h kexec-tools-1.101/purgatory/arch/arm/include/limits.h
+--- kexec-tools-1.101.orig/purgatory/arch/arm/include/limits.h	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/purgatory/arch/arm/include/limits.h	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,58 @@
++#ifndef LIMITS_H
++#define LIMITS_H	1
++
++
++/* Number of bits in a `char' */
++#define CHAR_BIT	8
++
++/* Minimum and maximum values a `signed char' can hold */
++#define SCHAR_MIN	(-128)
++#define SCHAR_MAX	127
++
++/* Maximum value an `unsigned char' can hold. (Minimum is 0.) */
++#define UCHAR_MAX	255
++
++/* Minimum and maximum values a `char' can hold */
++#define CHAR_MIN	SCHAR_MIN
++#define CHAR_MAX	SCHAR_MAX
++
++/* Minimum and maximum values a `signed short int' can hold */
++#define SHRT_MIN	(-32768)
++#define SHRT_MAX	32767
++
++/* Maximum value an `unsigned short' can hold. (Minimum is 0.) */
++#define USHRT_MAX	65535
++
++
++/* Minimum and maximum values a `signed int' can hold */
++#define INT_MIN		(-INT_MAX - 1)
++#define INT_MAX		2147483647
++
++/* Maximum value an `unsigned int' can hold. (Minimum is 0.) */
++#define UINT_MAX	4294967295U
++
++
++/* Minimum and maximum values a `signed int' can hold */
++#define INT_MIN		(-INT_MAX - 1)
++#define INT_MAX		2147483647
++
++/* Maximum value an `unsigned int' can hold. (Minimum is 0.) */
++#define UINT_MAX	4294967295U
++
++/* Minimum and maximum values a `signed long' can hold */
++#define LONG_MAX	2147483647L
++#define LONG_MIN	(-LONG_MAX - 1L)
++
++/* Maximum value an `unsigned long' can hold. (Minimum is 0.) */
++#define ULONG_MAX	4294967295UL
++
++/* Minimum and maximum values a `signed long long' can hold */
++#define LLONG_MAX	9223372036854775807LL
++#define LLONG_MIN	(-LONG_MAX - 1LL)
++
++
++/* Maximum value an `unsigned long long' can hold. (Minimum is 0.) */
++#define ULLONG_MAX	18446744073709551615ULL
++
++
++#endif /* LIMITS_H */
+diff -uNr kexec-tools-1.101.orig/purgatory/arch/arm/include/stdint.h kexec-tools-1.101/purgatory/arch/arm/include/stdint.h
+--- kexec-tools-1.101.orig/purgatory/arch/arm/include/stdint.h	1970-01-01 01:00:00.000000000 +0100
++++ kexec-tools-1.101/purgatory/arch/arm/include/stdint.h	2006-12-17 23:05:16.000000000 +0100
+@@ -0,0 +1,16 @@
++#ifndef STDINT_H
++#define STDINT_H
++
++typedef unsigned long      size_t;
++
++typedef unsigned char      uint8_t;
++typedef unsigned short     uint16_t;
++typedef unsigned int       uint32_t;
++typedef unsigned long long uint64_t;
++
++typedef signed char        int8_t;
++typedef signed short       int16_t;
++typedef signed int         int32_t;
++typedef signed long long   int64_t;
++
++#endif /* STDINT_H */

Added: trunk/buildroot/package/kexec/kexec.mk
===================================================================
--- trunk/buildroot/package/kexec/kexec.mk	2006-12-19 08:55:38 UTC (rev 17004)
+++ trunk/buildroot/package/kexec/kexec.mk	2006-12-19 13:24:27 UTC (rev 17005)
@@ -0,0 +1,79 @@
+#############################################################
+#
+# kexec
+#
+#############################################################
+KEXEC_VER:=1.101
+KEXEC_SOURCE:=kexec-tools_$(KEXEC_VER)-kdump10.orig.tar.gz
+KEXEC_PATCH:=kexec-tools_$(KEXEC_VER)-kdump10-2.diff.gz
+KEXEC_SITE:=ftp://ftp.debian.org/debian/pool/main/k/kexec-tools/
+KEXEC_DIR:=$(BUILD_DIR)/kexec-tools-$(KEXEC_VER)
+KEXEC_CAT:=$(ZCAT)
+KEXEC_BINARY:=kexec
+KEXEC_TARGET_BINARY:=sbin/kexec
+
+KEXEC_CONFIG_OPTS:=
+KEXEC_DEPS_y:=
+
+KEXEC_DEPS_$(KEXEC_PACKAGE_KEXEC)	+= zlib
+
+ifeq ($(strip $(BR2_PACKAGE_KEXEC_ZLIB)),y)
+KEXEC_CONFIG_OPTS += --with-zlib
+else
+KEXEC_CONFIG_OPTS += --without-zlib
+endif
+
+$(DL_DIR)/$(KEXEC_SOURCE):
+	$(WGET) -P $(DL_DIR) $(KEXEC_SITE)/$(KEXEC_SOURCE)
+
+$(DL_DIR)/$(KEXEC_PATCH):
+	$(WGET) -P $(DL_DIR) $(KEXEC_SITE)/$(KEXEC_PATCH)
+
+kexec-source: $(DL_DIR)/$(KEXEC_SOURCE) $(DL_DIR)/$(KEXEC_PATCH)
+
+$(KEXEC_DIR)/.unpacked: $(DL_DIR)/$(KEXEC_SOURCE) $(DL_DIR)/$(KEXEC_PATCH)
+	$(KEXEC_CAT) $(DL_DIR)/$(KEXEC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(KEXEC_DIR) package/kexec/ kexec\*.patch
+ifneq ($(KEXEC_PATCH),)
+	(cd $(KEXEC_DIR) && $(KEXEC_CAT) $(DL_DIR)/$(KEXEC_PATCH) | patch -p1)
+	toolchain/patch-kernel.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches \*.patch
+endif
+
+	touch $(KEXEC_DIR)/.unpacked
+
+$(KEXEC_DIR)/.configured: $(KEXEC_DIR)/.unpacked
+	(cd $(KEXEC_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/ \
+		$(KEXEC_CONFIG_OPTS) \
+	);
+	touch $(KEXEC_DIR)/.configured
+
+$(KEXEC_DIR)/$(KEXEC_BINARY): $(KEXEC_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(KEXEC_DIR)
+
+$(TARGET_DIR)/$(KEXEC_TARGET_BINARY): $(KEXEC_DIR)/$(KEXEC_BINARY)
+	cp -dpf $(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY) \
+		$(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/kdump \
+		$(TARGET_DIR)/sbin/
+
+kexec: uclibc host-fakeroot $(TARGET_DIR)/$(KEXEC_TARGET_BINARY)
+
+kexec-clean:
+	-$(MAKE) -C $(KEXEC_DIR) clean
+	rm -f $(TARGET_DIR)/sbin/k{exec,dump}
+
+kexec-dirclean:
+	rm -rf $(KEXEC_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_KEXEC)),y)
+TARGETS+=kexec
+endif

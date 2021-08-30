Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB88CC432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF1460F35
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DF1460F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9485C40400;
	Mon, 30 Aug 2021 04:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hmLnyRIsmAT; Mon, 30 Aug 2021 04:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EAA940412;
	Mon, 30 Aug 2021 04:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DDF91BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DF8C606EF
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YP-daI-zoFIS for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BF5B60755
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298463; x=1661834463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VD3qGyn4LEOPY6JZJ6J4zp8E4Cytpdp7j+EsvFxORrI=;
 b=fKCLeE0MJnHe8mW9FMPRfNQi8wLgRYctgNG/AxkJK/G4xzix8Vyfw4Vl
 slEvnE8JaU5NcWr1bzUEB9CgCclKmnf18rrbrJ02ftFMH1SIBx1A5yb01
 wdYedfA1AtOCTGI6byFd/cK5T1bz+SwcihlxPsUfJyZrLWSG5MWf4Ap+z
 z5Koja46Dgz4juoWG3s64Unt5PEE619cdc5U+/0EMWFeRCBN0BJIgddPc
 66LQ0q3OUZuLqvW8WIJi4MdZv1HYdjcP2jc9sn8U1lWuuoeVjEJW0cauO
 5nJRTmS05leIsMWJ8W5zYwyWg0B2tKR0T1xahD4rflLvcYVVn5Q3V6+0X w==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842482"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:03 +0800
IronPort-SDR: pERv0YHzLho5cWgBL69eNQSjIENsqjv+qEg9MZqvL4s+88seUcoNkwCfreHu2GBuiRdtxwsi9/
 BATQbxA0HadFVyyCGXSpNQqgJ/odgxoDHEyshbYyefw75mTj2ufqii93+fgzhR4VS5+xErlET5
 RMXvfydir9tKjod6qYMqvzJ06tNkMeTSfwbKH0l2yyyxxd2SkxbVawCEJNrCweNbnfOZ3bgBsd
 la1JB1wD/ozhVsVwjNeiAABOwgCBKyQJXRkKwvionzEB5iWNBMSaGN4gdWXoJ0N6wSQsJo+xJL
 HvK/98M/v53MMwlRy9AhXYp0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:17:54 -0700
IronPort-SDR: 5JHOgxAd6jNmYLP1yr7CTZF1jNowXQH3I1ggklv0FOAJRPm1VmJLcAxfxlViOalVShYeeNLltu
 w0xaCQezOJe0ftXZ1aj18rg5cbPYBicHciRRMFWGmISZ3HTQmw0lTGmP9zdMTQwkdCE/iCMTc+
 fJUurcsvglNwRXwUs8jXL7M5Grg23zgfBY36cjhgxvt26IjbQFeID2HSvFyjb9sSuh+V7Ji4Eo
 mEycPjZ+2uE0QyVOvT4cOszrkT2X/ntH62GtTIRtCWRjEc4S2BIN5eZ/9xmc0nO3U+FsSiAnIA
 yRQ=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:02 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:52 +0900
Message-Id: <20210830044100.260173-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/9] package/elf2flt: add RISC-V 64-bits
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Christoph Hellwig <hch@lst.de>

Enable selecting elf2flt for RISC-V 64-bits no MMU builds and add
support for it in the form of an additional patch (upstream pull request
https://github.com/uclinux-dev/elf2flt/pull/19).

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 ...04-elf2flt-add-riscv-64-bits-support.patch | 299 ++++++++++++++++++
 package/elf2flt/Config.in.host                |   2 +-
 2 files changed, 300 insertions(+), 1 deletion(-)
 create mode 100644 package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch

diff --git a/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
new file mode 100644
index 0000000000..11e8df2d87
--- /dev/null
+++ b/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
@@ -0,0 +1,299 @@
+From 45d27f1e2ec2a5ec793bb3cf9e326160a85e5bac Mon Sep 17 00:00:00 2001
+From: Christoph Hellwig <hch@lst.de>
+Date: Wed, 9 Sep 2020 17:31:33 +0900
+Subject: [PATCH] elf2flt: add riscv 64-bits support
+
+Upstream pull request https://github.com/uclinux-dev/elf2flt/pull/19
+
+Add support for riscv 64bits ISA by defining the relocation types
+R_RISCV_32_PCREL, R_RISCV_ADD32, R_RISCV_SUB32 and R_RISCV_64.
+riscv64 support also needs a new linker script as the global_pointer
+variable __global_pointer$ needs to be defined right after the
+relocation tables in the data section and section ordering changes are
+needed. With these changes, buildroot/busybox builds and run on NOMMU
+systems with kernel 5.13. Tested on Canaan Kendryte K210 boards.
+
+Signed-off-by: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
+---
+ Makefile.in        |   4 +-
+ elf2flt.c          |  22 +++++
+ riscv64-elf2flt.ld | 197 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 222 insertions(+), 1 deletion(-)
+ create mode 100644 riscv64-elf2flt.ld
+
+diff --git a/Makefile.in b/Makefile.in
+index 0529c7f..121a2a7 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -44,7 +44,9 @@ endif
+ LDFILE= elf2flt.ld
+ ifeq ($(strip $(CPU)),e1)
+ SRC_LDFILE= $(srcdir)/$(CPU)-elf2flt.ld
+-else 
++else ifeq ($(strip $(CPU)),riscv64)
++SRC_LDFILE= $(srcdir)/$(CPU)-elf2flt.ld
++else
+ SRC_LDFILE= elf2flt.ld
+ endif
+ 
+diff --git a/elf2flt.c b/elf2flt.c
+index b93aecd..62d4c50 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -81,6 +81,8 @@ const char *elf2flt_progname;
+ #include <elf/v850.h>
+ #elif defined(TARGET_xtensa)
+ #include <elf/xtensa.h>
++#elif defined(TARGET_riscv64)
++#include <elf/riscv.h>
+ #endif
+ 
+ #if defined(__MINGW32__)
+@@ -123,6 +125,8 @@ const char *elf2flt_progname;
+ #define ARCH	"nios2"
+ #elif defined(TARGET_xtensa)
+ #define ARCH	"xtensa"
++#elif defined(TARGET_riscv64)
++#define ARCH	"riscv64"
+ #else
+ #error "Don't know how to support your CPU architecture??"
+ #endif
+@@ -811,6 +815,15 @@ output_relocs (
+ 					goto good_32bit_resolved_reloc;
+ 				default:
+ 					goto bad_resolved_reloc;
++#elif defined(TARGET_riscv64)
++				case R_RISCV_32_PCREL:
++				case R_RISCV_ADD32:
++				case R_RISCV_SUB32:
++					break;
++				case R_RISCV_64:
++					goto good_32bit_resolved_reloc;
++				default:
++					goto bad_resolved_reloc;
+ #else
+ 				default:
+ 					/* The default is to assume that the
+@@ -1831,6 +1844,15 @@ int main(int argc, char *argv[])
+   if (!load_to_ram && !pfile)
+     load_to_ram = 1;
+ 
++#if defined(TARGET_riscv64)
++  /*
++   * riscv only supports loading text and data contiguously.
++   * So fail if load_to_ram is false.
++   */
++  if (!load_to_ram)
++    fatal("Loading to RAM ('-r' option) is required");
++#endif
++
+   fname = argv[argc-1];
+ 
+   if (pfile) {
+diff --git a/riscv64-elf2flt.ld b/riscv64-elf2flt.ld
+new file mode 100644
+index 0000000..5861f95
+--- /dev/null
++++ b/riscv64-elf2flt.ld
+@@ -0,0 +1,197 @@
++ENTRY (_start)
++
++MEMORY {
++	flatmem : ORIGIN = 0x0, LENGTH = 0xfffffff
++}
++
++PHDRS {
++	text PT_LOAD ;
++	data PT_LOAD ;
++}
++
++SECTIONS {
++
++	.text 0x0 : {
++		. = . + 4;
++		. = ALIGN(0x4) ;
++		_stext = . ;
++		*(.literal .text)
++		*(.literal.* .text.*)
++		*(.gnu.warning)
++		*(.stub)
++		*(.gnu.linkonce.literal.*)
++		*(.gnu.linkonce.t*)
++		*(.glue_7t)
++		*(.glue_7)
++		*(.jcr)
++		*(.init.literal)
++		KEEP (*(.init))
++		*(.fini.literal)
++		KEEP (*(.fini))
++
++W_RODAT		*(.rodata)
++W_RODAT		*(.rodata1)
++W_RODAT		*(.rodata.*)
++W_RODAT		*(.gnu.linkonce.r*)
++
++		/* This is special code area at the end of the normal
++		   text section.  It contains a small lookup table at
++		   the start followed by the code pointed to by entries
++		   in the lookup table.  */
++		. = ALIGN (4) ;
++		PROVIDE(__ctbp = .);
++		*(.call_table_data)
++		*(.call_table_text)
++
++		. = ALIGN(0x10) ;
++		_etext = . ;
++	} > flatmem :text
++
++	.data : {
++		. = ALIGN(0x20) ;
++		_sdata = . ;
++		__data_start = . ;
++		data_start = . ;
++		*(.got)
++		*(.got.plt)
++		*(.igot)
++		*(.igot.plt)
++		FILL(0) ;
++		. = ALIGN(0x20) ;
++		LONG(-1)
++		. = ALIGN(0x20) ;
++
++		__global_pointer$ = . + 0x800;
++
++R_RODAT		*(.rodata)
++R_RODAT		*(.rodata1)
++R_RODAT		*(.rodata.*)
++R_RODAT		*(.gnu.linkonce.r*)
++		*(.data)
++		*(.data1)
++		*(.data.*)
++		*(.gnu.linkonce.d*)
++
++		*(.gnu.linkonce.s.*)
++		*(__libc_atexit)
++		*(__libc_subinit)
++		*(__libc_subfreeres)
++
++		. = ALIGN(4) ;
++TOR:		__CTOR_LIST__ = .;
++TOR:		LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
++SINGLE_LINK:	/* gcc uses crtbegin.o to find the start of
++SINGLE_LINK:	   the constructors, so we make sure it is
++SINGLE_LINK:	   first.  Because this is a wildcard, it
++SINGLE_LINK:	   doesn't matter if the user does not
++SINGLE_LINK:	   actually link against crtbegin.o; the
++SINGLE_LINK:	   linker won't look for a file to match a
++SINGLE_LINK:	   wildcard.  The wildcard also means that it
++SINGLE_LINK:	   doesn't matter which directory crtbegin.o
++SINGLE_LINK:	   is in.  */
++SINGLE_LINK:	KEEP (*crtbegin*.o(.ctors))
++SINGLE_LINK:	/* We don't want to include the .ctor section from
++SINGLE_LINK:	   from the crtend.o file until after the sorted ctors.
++SINGLE_LINK:	   The .ctor section from the crtend file contains the
++SINGLE_LINK:	   end of ctors marker and it must be last */
++SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .ctors))
++SINGLE_LINK:	KEEP (*(SORT(.ctors.*)))
++		KEEP (*(.ctors))
++TOR:		LONG(0)
++TOR:		__CTOR_END__ = .;
++TOR:		__DTOR_LIST__ = .;
++TOR:		LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
++SINGLE_LINK:	KEEP (*crtbegin*.o(.dtors))
++SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .dtors))
++SINGLE_LINK:	KEEP (*(SORT(.dtors.*)))
++		KEEP (*(.dtors))
++TOR:		LONG(0)
++TOR:		__DTOR_END__ = .;
++
++		PROVIDE (__preinit_array_start = .);
++		KEEP (*(.preinit_array))
++		PROVIDE (__preinit_array_end = .);
++
++		PROVIDE (__init_array_start = .);
++		KEEP (*(SORT(.init_array.*)))
++		KEEP (*(.init_array))
++		PROVIDE (__init_array_end = .);
++
++		PROVIDE (__fini_array_start = .);
++		KEEP (*(.fini_array))
++		KEEP (*(SORT(.fini_array.*)))
++		PROVIDE (__fini_array_end = .);
++
++		. = ALIGN(0x10) ;
++		_edata = . ;
++	} > flatmem :data
++
++	.note.ABI-tag : { *(.note.ABI-tag) } > flatmem
++	.eh_frame_hdr : { *(.eh_frame_hdr) } > flatmem
++	.eh_frame : { KEEP(*(.eh_frame)) } > flatmem
++	.gcc_except_table : {
++		KEEP(*(.gcc_except_table))
++		KEEP(*(.gcc_except_table.*))
++	} > flatmem
++
++	.bss : {
++		. = ALIGN(0x4) ;
++		_sbss = ALIGN(0x4) ;
++		__bss_start = . ;
++		*(.dynsbss)
++		*(.sbss)
++		*(.sbss.*)
++		*(.scommon)
++		*(.dynbss)
++		*(.bss)
++		*(.bss.*)
++		*(.bss*)
++		*(.gnu.linkonce.b*)
++		*(COMMON)
++		. = ALIGN(0x10) ;
++		_ebss = . ;
++		_end = . ;
++		end = . ;
++	} > flatmem
++
++	.stack : {
++		. = ALIGN(0x4);
++		_stack_start = .;
++	} > flatmem
++
++	.junk 0 : { *(.rel*) *(.rela*) }
++	/DISCARD/ : { *(.note.GNU-stack) }
++	/* Stabs debugging sections.    */
++	.stab 0 : { *(.stab) }
++	.stabstr 0 : { *(.stabstr) }
++	.stab.excl 0 : { *(.stab.excl) }
++	.stab.exclstr 0 : { *(.stab.exclstr) }
++	.stab.index 0 : { *(.stab.index) }
++	.stab.indexstr 0 : { *(.stab.indexstr) }
++	.comment 0 : { *(.comment) }
++	/* DWARF debug sections.
++	   Symbols in the DWARF debugging sections are relative to the beginning
++	   of the section so we begin them at 0.  */
++	/* DWARF 1 */
++	.debug          0 : { *(.debug) }
++	.line           0 : { *(.line) }
++	/* GNU DWARF 1 extensions */
++	.debug_srcinfo  0 : { *(.debug_srcinfo) }
++	.debug_sfnames  0 : { *(.debug_sfnames) }
++	/* DWARF 1.1 and DWARF 2 */
++	.debug_aranges  0 : { *(.debug_aranges) }
++	.debug_pubnames 0 : { *(.debug_pubnames) }
++	/* DWARF 2 */
++	.debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
++	.debug_abbrev   0 : { *(.debug_abbrev) }
++	.debug_line     0 : { *(.debug_line) }
++	.debug_frame    0 : { *(.debug_frame) }
++	.debug_str      0 : { *(.debug_str) }
++	.debug_loc      0 : { *(.debug_loc) }
++	.debug_macinfo  0 : { *(.debug_macinfo) }
++	/* SGI/MIPS DWARF 2 extensions */
++	.debug_weaknames 0 : { *(.debug_weaknames) }
++	.debug_funcnames 0 : { *(.debug_funcnames) }
++	.debug_typenames 0 : { *(.debug_typenames) }
++	.debug_varnames  0 : { *(.debug_varnames) }
++}
+-- 
+2.31.1
+
diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index d6685a7ff6..2bab0095c2 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

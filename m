From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 22:54:03 +0200
Subject: [Buildroot] [git commit] boot/syslinux: fix i386 bios build with
	recent binutils
Message-ID: <20170816210159.0ED707F9A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11089e20624052dbef4c3960713ba3c8b5ddc30c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we use the cross-compiler to build syslinux with a recent binutils
version, it fails with:

/builds/arnout/buildroot/output/host/bin/i586-buildroot-linux-uclibc-ld  -Bsymbolic -pie -E --hash-style=gnu -T
/builds/arnout/buildroot/output/build/syslinux-6.03/core/i386/syslinux.ld -M -o ldlinux.elf ldlinux.o \
	--start-group libcom32.a --whole-archive /builds/arnout/buildroot/output/build/syslinux-6.03/bios/com32/lib/libcom32core.a libldlinux.a --end-group -N
--no-omagic \
	> ldlinux.map
/builds/arnout/buildroot/output/host/bin/i586-buildroot-linux-uclibc-ld: ldlinux.elf: Not enough room for program headers, try linking with -N
/builds/arnout/buildroot/output/host/bin/i586-buildroot-linux-uclibc-ld: final link failed: Bad value
/builds/arnout/buildroot/output/build/syslinux-6.03/core/Makefile:167: recipe for target 'ldlinux.elf' failed

Backport an upstream patch that reorganises the i386 bios build by
removing some symbols and making others hidden. To simplify the
backport, an additional patch that also touches the link script is
also included - it anyway looks like that patch could be relevant as
well.

Partially fixes: https://gitlab.com/arnout/buildroot/-/jobs/28979377

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Don-t-try-to-guess-the-sections-alignment.patch | 295 ++++++++++
 .../0010-core-Clean-up-the-i386-bios-build.patch   | 622 +++++++++++++++++++++
 2 files changed, 917 insertions(+)

diff --git a/boot/syslinux/0009-bios-Don-t-try-to-guess-the-sections-alignment.patch b/boot/syslinux/0009-bios-Don-t-try-to-guess-the-sections-alignment.patch
new file mode 100644
index 0000000..916012f
--- /dev/null
+++ b/boot/syslinux/0009-bios-Don-t-try-to-guess-the-sections-alignment.patch
@@ -0,0 +1,295 @@
+From 76946dd67bc856eaf4fe69d0826547a794176f78 Mon Sep 17 00:00:00 2001
+From: Sylvain Gault <sylvain.gault@gmail.com>
+Date: Tue, 29 Sep 2015 04:45:09 +0200
+Subject: [PATCH] bios: Don't try to guess the sections alignment
+
+For the compression / decompression to succeed, the sections layout must
+be the same between the virtual memory and load memory. The section
+alignment was kept in sync by introducing aligment that should be
+greater or equal to the actual section alignment.
+
+This patch compute the load memory addresses of the sections so that
+the layout is the same as the virtual memory addresses.
+
+Signed-off-by: Sylvain Gault <sylvain.gault@gmail.com>
+Tested-by: poma <pomidorabelisima@gmail.com>
+Signed-off-by: Paulo Alcantara <pcacjr@zytor.com>
+
+Upstream: 0cc9a99e560a2f52bcf052fd85b1efae35ee812f
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ core/i386/syslinux.ld   | 63 ++++++++++---------------------------------------
+ core/x86_64/syslinux.ld | 63 ++++++++++---------------------------------------
+ 2 files changed, 24 insertions(+), 102 deletions(-)
+
+diff --git a/core/i386/syslinux.ld b/core/i386/syslinux.ld
+index 73904510..92b75b11 100644
+--- a/core/i386/syslinux.ld
++++ b/core/i386/syslinux.ld
+@@ -255,10 +255,9 @@ SECTIONS
+ 	. = 0x100000;
+ 
+ 	__pm_code_start = .;
++	__vma_to_lma = __pm_code_lma - __pm_code_start;
+ 
+-	__text_vma = .;
+-	__text_lma = __pm_code_lma;
+-	.text : AT(__text_lma) {
++	.text : AT(ADDR(.text) + __vma_to_lma) {
+ 		FILL(0x90909090)
+ 		__text_start = .;
+ 		*(.text)
+@@ -266,106 +265,68 @@ SECTIONS
+ 		__text_end = .;
+ 	}
+ 
+-	. = ALIGN(32);
+-
+-	__rodata_vma = .;
+-	__rodata_lma = __rodata_vma + __text_lma - __text_vma;
+-	.rodata : AT(__rodata_lma) {
++	.rodata : AT(ADDR(.rodata) + __vma_to_lma) {
+ 		__rodata_start = .;
+ 		*(.rodata)
+ 		*(.rodata.*)
+ 		__rodata_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__ctors_vma = .;
+-	__ctors_lma = __ctors_vma + __text_lma - __text_vma;
+-	.ctors : AT(__ctors_lma) {
++	.ctors : AT(ADDR(.ctors) + __vma_to_lma) {
+ 		__ctors_start = .;
+ 		KEEP (*(SORT(.ctors.*)))
+ 		KEEP (*(.ctors))
+ 		__ctors_end = .;
+ 	}
+ 
+-	__dtors_vma = .;
+-	__dtors_lma = __dtors_vma + __text_lma - __text_vma;
+-	.dtors : AT(__dtors_lma) {
++	.dtors : AT(ADDR(.dtors) + __vma_to_lma) {
+ 		__dtors_start = .;
+ 		KEEP (*(SORT(.dtors.*)))
+ 		KEEP (*(.dtors))
+ 		__dtors_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__dynsym_vma = .;
+-	__dynsym_lma = __dynsym_vma + __text_lma - __text_vma;
+-	.dynsym : AT(__dynsym_lma) {
++	.dynsym : AT(ADDR(.dynsym) + __vma_to_lma) {
+ 		__dynsym_start = .;
+ 		*(.dynsym)
+ 		__dynsym_end = .;
+ 	}
+ 	__dynsym_len = __dynsym_end - __dynsym_start;
+ 
+-	. = ALIGN(4);
+-
+-	__dynstr_vma = .;
+-	__dynstr_lma = __dynstr_vma + __text_lma - __text_vma;
+-	.dynstr : AT(__dynstr_lma) {
++	.dynstr : AT(ADDR(.dynstr) + __vma_to_lma) {
+ 		__dynstr_start = .;
+ 		*(.dynstr)
+ 		__dynstr_end = .;
+ 	}
+ 	__dynstr_len = __dynstr_end - __dynstr_start;
+ 
+-	. = ALIGN(4);
+-
+-	__gnu_hash_vma = .;
+-	__gnu_hash_lma = __gnu_hash_vma + __text_lma - __text_vma;
+-	.gnu.hash : AT(__gnu_hash_lma) {
++	.gnu.hash : AT(ADDR(.gnu.hash) + __vma_to_lma) {
+ 		__gnu_hash_start = .;
+ 		*(.gnu.hash)
+ 		__gnu_hash_end = .;
+ 	}
+ 
+ 
+-	. = ALIGN(4);
+-
+-	__dynlink_vma = .;
+-	__dynlink_lma = __dynlink_vma + __text_lma - __text_vma;
+-	.dynlink : AT(__dynlink_lma) {
++	.dynlink : AT(ADDR(.dynlink) + __vma_to_lma) {
+ 		__dynlink_start = .;
+ 		*(.dynlink)
+ 		__dynlink_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__got_vma = .;
+-	__got_lma = __got_vma + __text_lma - __text_vma;
+-	.got : AT(__got_lma) {
++	.got : AT(ADDR(.got) + __vma_to_lma) {
+ 		__got_start = .;
+ 		KEEP (*(.got.plt))
+ 		KEEP (*(.got))
+ 		__got_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__dynamic_vma = .;
+-	__dynamic_lma = __dynamic_vma + __text_lma - __text_vma;
+-	.dynamic : AT(__dynamic_lma) {
++	.dynamic : AT(ADDR(.dynamic) + __vma_to_lma) {
+ 		__dynamic_start = .;
+ 		*(.dynamic)
+ 		__dynamic_end = .;
+ 	}
+ 
+-	. = ALIGN(32);
+-
+-	__data_vma = .;
+-	__data_lma = __data_vma + __text_lma - __text_vma;
+-	.data : AT(__data_lma) {
++	.data : AT(ADDR(.data) + __vma_to_lma) {
+ 		__data_start = .;
+ 		*(.data)
+ 		*(.data.*)
+diff --git a/core/x86_64/syslinux.ld b/core/x86_64/syslinux.ld
+index bf815c46..70c6e00a 100644
+--- a/core/x86_64/syslinux.ld
++++ b/core/x86_64/syslinux.ld
+@@ -255,10 +255,9 @@ SECTIONS
+ 	. = 0x100000;
+ 
+ 	__pm_code_start = .;
++	__vma_to_lma = __pm_code_lma - __pm_code_start;
+ 
+-	__text_vma = .;
+-	__text_lma = __pm_code_lma;
+-	.text : AT(__text_lma) {
++	.text : AT(ADDR(.text) + __vma_to_lma) {
+ 		FILL(0x90909090)
+ 		__text_start = .;
+ 		*(.text)
+@@ -266,106 +265,68 @@ SECTIONS
+ 		__text_end = .;
+ 	}
+ 
+-	. = ALIGN(32);
+-
+-	__rodata_vma = .;
+-	__rodata_lma = __rodata_vma + __text_lma - __text_vma;
+-	.rodata : AT(__rodata_lma) {
++	.rodata : AT(ADDR(.rodata) + __vma_to_lma) {
+ 		__rodata_start = .;
+ 		*(.rodata)
+ 		*(.rodata.*)
+ 		__rodata_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__ctors_vma = .;
+-	__ctors_lma = __ctors_vma + __text_lma - __text_vma;
+-	.ctors : AT(__ctors_lma) {
++	.ctors : AT(ADDR(.ctors) + __vma_to_lma) {
+ 		__ctors_start = .;
+ 		KEEP (*(SORT(.ctors.*)))
+ 		KEEP (*(.ctors))
+ 		__ctors_end = .;
+ 	}
+ 
+-	__dtors_vma = .;
+-	__dtors_lma = __dtors_vma + __text_lma - __text_vma;
+-	.dtors : AT(__dtors_lma) {
++	.dtors : AT(ADDR(.dtors) + __vma_to_lma) {
+ 		__dtors_start = .;
+ 		KEEP (*(SORT(.dtors.*)))
+ 		KEEP (*(.dtors))
+ 		__dtors_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__dynsym_vma = .;
+-	__dynsym_lma = __dynsym_vma + __text_lma - __text_vma;
+-	.dynsym : AT(__dynsym_lma) {
++	.dynsym : AT(ADDR(.dynsym) + __vma_to_lma) {
+ 		__dynsym_start = .;
+ 		*(.dynsym)
+ 		__dynsym_end = .;
+ 	}
+ 	__dynsym_len = __dynsym_end - __dynsym_start;
+ 
+-	. = ALIGN(4);
+-
+-	__dynstr_vma = .;
+-	__dynstr_lma = __dynstr_vma + __text_lma - __text_vma;
+-	.dynstr : AT(__dynstr_lma) {
++	.dynstr : AT(ADDR(.dynstr) + __vma_to_lma) {
+ 		__dynstr_start = .;
+ 		*(.dynstr)
+ 		__dynstr_end = .;
+ 	}
+ 	__dynstr_len = __dynstr_end - __dynstr_start;
+ 
+-	. = ALIGN(4);
+-
+-	__gnu_hash_vma = .;
+-	__gnu_hash_lma = __gnu_hash_vma + __text_lma - __text_vma;
+-	.gnu.hash : AT(__gnu_hash_lma) {
++	.gnu.hash : AT(ADDR(.gnu.hash) + __vma_to_lma) {
+ 		__gnu_hash_start = .;
+ 		*(.gnu.hash)
+ 		__gnu_hash_end = .;
+ 	}
+ 
+ 
+-	. = ALIGN(4);
+-
+-	__dynlink_vma = .;
+-	__dynlink_lma = __dynlink_vma + __text_lma - __text_vma;
+-	.dynlink : AT(__dynlink_lma) {
++	.dynlink : AT(ADDR(.dynlink) + __vma_to_lma) {
+ 		__dynlink_start = .;
+ 		*(.dynlink)
+ 		__dynlink_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__got_vma = .;
+-	__got_lma = __got_vma + __text_lma - __text_vma;
+-	.got : AT(__got_lma) {
++	.got : AT(ADDR(.got) + __vma_to_lma) {
+ 		__got_start = .;
+ 		KEEP (*(.got.plt))
+ 		KEEP (*(.got))
+ 		__got_end = .;
+ 	}
+ 
+-	. = ALIGN(4);
+-
+-	__dynamic_vma = .;
+-	__dynamic_lma = __dynamic_vma + __text_lma - __text_vma;
+-	.dynamic : AT(__dynamic_lma) {
++	.dynamic : AT(ADDR(.dynamic) + __vma_to_lma) {
+ 		__dynamic_start = .;
+ 		*(.dynamic)
+ 		__dynamic_end = .;
+ 	}
+ 
+-	. = ALIGN(32);
+-
+-	__data_vma = .;
+-	__data_lma = __data_vma + __text_lma - __text_vma;
+-	.data : AT(__data_lma) {
++	.data : AT(ADDR(.data) + __vma_to_lma) {
+ 		__data_start = .;
+ 		*(.data)
+ 		*(.data.*)
+-- 
+2.13.3
+
diff --git a/boot/syslinux/0010-core-Clean-up-the-i386-bios-build.patch b/boot/syslinux/0010-core-Clean-up-the-i386-bios-build.patch
new file mode 100644
index 0000000..8b6d525
--- /dev/null
+++ b/boot/syslinux/0010-core-Clean-up-the-i386-bios-build.patch
@@ -0,0 +1,622 @@
+From a14b1b3d3e375d2e8af8804171ef5e52574dbb2a Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@zytor.com>
+Date: Tue, 9 Feb 2016 18:15:50 -0800
+Subject: [PATCH] core: Clean up the i386-bios build
+
+Remove symbols and data structures not used in the i386-bios build,
+and clean up the linker script so that most internal symbols are
+HIDDEN.
+
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+
+Upstream: ff859050fa4e6535cae098dc35d88a265466448d
+
+This patch fixes the following build failure with i386 binutils 2.28.1:
+
+/builds/arnout/buildroot/output/host/bin/i586-buildroot-linux-uclibc-ld  -Bsymbolic -pie -E --hash-style=gnu -T
+/builds/arnout/buildroot/output/build/syslinux-6.03/core/i386/syslinux.ld -M -o ldlinux.elf ldlinux.o \
+	--start-group libcom32.a --whole-archive /builds/arnout/buildroot/output/build/syslinux-6.03/bios/com32/lib/libcom32core.a libldlinux.a --end-group -N
+--no-omagic \
+	> ldlinux.map
+/builds/arnout/buildroot/output/host/bin/i586-buildroot-linux-uclibc-ld: ldlinux.elf: Not enough room for program headers, try linking with -N
+/builds/arnout/buildroot/output/host/bin/i586-buildroot-linux-uclibc-ld: final link failed: Bad value
+/builds/arnout/buildroot/output/build/syslinux-6.03/core/Makefile:167: recipe for target 'ldlinux.elf' failed
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ core/extern.inc       |  17 +--
+ core/i386/syslinux.ld | 287 +++++++++++++++++++++++++-------------------------
+ core/layout.inc       |  11 --
+ 3 files changed, 143 insertions(+), 172 deletions(-)
+
+diff --git a/core/extern.inc b/core/extern.inc
+index af8eb04c..ce4abfab 100644
+--- a/core/extern.inc
++++ b/core/extern.inc
+@@ -12,27 +12,17 @@
+ 	; hello.c
+ 	extern hello
+ 
+-	;abort.c
+-	extern abort_load_new
+-
+ 	; elflink/load_env32.c
+ 	extern load_env32, pm_env32_run
+ 
+-	; memscan.c
+-	extern highmem_init
+-
+-	extern linux_kernel
+-
+ 	extern mp1, mp2, mp3, mp4, mp5
+ 
+-	extern hexdump, mydump
++	extern hexdump
+ 
+ 	extern mem_init
+ 
+ 	; fs.c
+-	extern pm_fs_init, pm_searchdir, getfssec, getfsbytes
+-	extern pm_mangle_name, pm_load_config
+-        extern pm_open_file, pm_close_file
++	extern pm_fs_init
+ 	extern SectorSize, SectorShift
+ 
+ 	; chdir.c
+@@ -41,9 +31,6 @@
+         ; readdir.c
+         extern opendir, readdir, closedir
+ 
+-	; newconfig.c
+-	extern pm_is_config_file
+-
+ 	; idle.c
+ 	extern __idle
+ 
+diff --git a/core/i386/syslinux.ld b/core/i386/syslinux.ld
+index 92b75b11..39198d75 100644
+--- a/core/i386/syslinux.ld
++++ b/core/i386/syslinux.ld
+@@ -1,7 +1,7 @@
+ /* -----------------------------------------------------------------------
+  *   
+  *   Copyright 2008-2009 H. Peter Anvin - All Rights Reserved
+- *   Copyright 2009 Intel Corporation; author: H. Peter Anvin
++ *   Copyright 2009-2016 Intel Corporation; author: H. Peter Anvin
+  *
+  *   This program is free software; you can redistribute it and/or modify
+  *   it under the terms of the GNU General Public License as published by
+@@ -12,7 +12,7 @@
+  * ----------------------------------------------------------------------- */
+ 
+ /*
+- * Linker script for the SYSLINUX core
++ * Linker script for the SYSLINUX core when built for i386-bios
+  */
+ 
+ OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
+@@ -26,7 +26,7 @@ SECTIONS
+ {
+ 	/* Prefix structure for the compression program */
+ 	. = 0;
+-	__module_start = .;
++	HIDDEN(__module_start = ABSOLUTE(.));
+ 	.prefix : {
+ 		*(.prefix)
+ 	}
+@@ -35,81 +35,82 @@ SECTIONS
+ 	. = 0x1000;
+ 
+ 	.earlybss (NOLOAD) : {
+-		__earlybss_start = .;
++		HIDDEN(__earlybss_start = .);
+ 		*(.earlybss)
+-		__earlybss_end = .;
++		HIDDEN(__earlybss_end = .);
+ 	}
+-	__earlybss_len = ABSOLUTE(__earlybss_end) - ABSOLUTE(__earlybss_start);
+-	__earlybss_dwords = (__earlybss_len + 3) >> 2;
++	HIDDEN(__earlybss_len = ABSOLUTE(__earlybss_end) - ABSOLUTE(__earlybss_start));
++	HIDDEN(__earlybss_dwords = (__earlybss_len + 3) >> 2);
+ 
+ 	. = ALIGN(4);
+ 	.bss16 (NOLOAD) : {
+-		__bss16_start = .;
++		HIDDEN(__bss16_start = .);
+ 		*(.bss16)
+-		__bss16_end = .;
++		HIDDEN(__bss16_end = .);
+ 	}
+-	__bss16_len = ABSOLUTE(__bss16_end) - ABSOLUTE(__bss16_start);
+-	__bss16_dwords = (__bss16_len + 3) >> 2;
++	HIDDEN(__bss16_len = ABSOLUTE(__bss16_end) - ABSOLUTE(__bss16_start));
++	HIDDEN(__bss16_dwords = (__bss16_len + 3) >> 2);
+ 
+ 	. = ALIGN(4);
+  	.config : AT (__config_lma) {
+-		__config_start = .;
++		HIDDEN(__config_start = .);
+ 		*(.config)
+-		__config_end = .;
++		HIDDEN(__config_end = .);
+ 	}
+-	__config_len = ABSOLUTE(__config_end) - ABSOLUTE(__config_start);
+-	__config_dwords = (__config_len + 3) >> 2;
++	HIDDEN(__config_len = ABSOLUTE(__config_end) - ABSOLUTE(__config_start));
++	HIDDEN(__config_dwords = (__config_len + 3) >> 2);
+ 
+ 	/* Generated and/or copied code */
+ 
+ 	. = ALIGN(128);		/* Minimum separation from mutable data */
+  	.replacestub : AT (__replacestub_lma) {
+-		__replacestub_start = .;
++		HIDDEN(__replacestub_start = .);
+ 		*(.replacestub)
+-		__replacestub_end = .;
++		HIDDEN(__replacestub_end = .);
+ 	}
+-	__replacestub_len = ABSOLUTE(__replacestub_end) - ABSOLUTE(__replacestub_start);
+-	__replacestub_dwords = (__replacestub_len + 3) >> 2;
++	HIDDEN(__replacestub_len = ABSOLUTE(__replacestub_end) - ABSOLUTE(__replacestub_start));
++	HIDDEN(__replacestub_dwords = (__replacestub_len + 3) >> 2);
+ 
+ 	. = ALIGN(16);
+-	__gentextnr_lma = .;
++	HIDDEN(__gentextnr_lma = .);
+ 	.gentextnr : AT(__gentextnr_lma) {
+-		__gentextnr_start = .;
++		HIDDEN(__gentextnr_start = .);
+ 		*(.gentextnr)
+-		__gentextnr_end = .;
++		HIDDEN(__gentextnr_end = .);
+ 	}
+-	__gentextnr_len = ABSOLUTE(__gentextnr_end) - ABSOLUTE(__gentextnr_start);
+-	__gentextnr_dwords = (__gentextnr_len + 3) >> 2;
++	HIDDEN(__gentextnr_len = ABSOLUTE(__gentextnr_end) - ABSOLUTE(__gentextnr_start));
++	HIDDEN(__gentextnr_dwords = (__gentextnr_len + 3) >> 2);
+ 
+ 	. = STACK_BASE;
+ 	.stack16 : AT(STACK_BASE) {
+-		__stack16_start = .;
++		HIDDEN(__stack16_start = .);
+ 		. += STACK_LEN;
+-		__stack16_end = .;
++		HIDDEN(__stack16_end = .);
+ 	}
+-	__stack16_len = ABSOLUTE(__stack16_end) - ABSOLUTE(__stack16_start);
+-	__stack16_dwords = (__stack16_len + 3) >> 2;
++	HIDDEN(__stack16_len = ABSOLUTE(__stack16_end) - ABSOLUTE(__stack16_start));
++	HIDDEN(__stack16_dwords = (__stack16_len + 3) >> 2);
+ 
+ 	/* Initialized sections */
+ 
+ 	. = 0x7c00;
+ 	.init : {
+ 		FILL(0x90909090)
+-		__init_start = .;
++		HIDDEN(__init_start = .);
+ 		*(.init)
+-		__init_end = .;
++		HIDDEN(__init_end = .);
+ 	}
+-	__init_len = ABSOLUTE(__init_end) - ABSOLUTE(__init_start);
+-	__init_dwords = (__init_len + 3) >> 2;
++	HIDDEN(__init_len = ABSOLUTE(__init_end) - ABSOLUTE(__init_start));
++	HIDDEN(__init_dwords = (__init_len + 3) >> 2);
+ 
++	. = ALIGN(4);
+ 	.text16 : {
+ 		FILL(0x90909090)
+-		__text16_start = .;
++		HIDDEN(__text16_start = .);
+ 		*(.text16)
+-		__text16_end = .;
++		HIDDEN(__text16_end = .);
+ 	}
+-	__text16_len = ABSOLUTE(__text16_end) - ABSOLUTE(__text16_start);
+-	__text16_dwords = (__text16_len + 3) >> 2;
++	HIDDEN(__text16_len = ABSOLUTE(__text16_end) - ABSOLUTE(__text16_start));
++	HIDDEN(__text16_dwords = (__text16_len + 3) >> 2);
+ 
+ 	/*
+ 	 * .textnr is used for 32-bit code that is used on the code
+@@ -118,99 +119,92 @@ SECTIONS
+ 	. = ALIGN(16);
+ 	.textnr : {
+ 		FILL(0x90909090)
+-		__textnr_start = .;
++		HIDDEN(__textnr_start = .);
+ 		*(.textnr)
+-		__textnr_end = .;
++		HIDDEN(__textnr_end = .);
+ 	}
+-	__textnr_len = ABSOLUTE(__textnr_end) - ABSOLUTE(__textnr_start);
+-	__textnr_dwords = (__textnr_len + 3) >> 2;
++	HIDDEN(__textnr_len = ABSOLUTE(__textnr_end) - ABSOLUTE(__textnr_start));
++	HIDDEN(__textnr_dwords = (__textnr_len + 3) >> 2);
+ 
+ 	. = ALIGN(16);
+-	__bcopyxx_start = .;
++	HIDDEN(__bcopyxx_start = .);
+ 
+ 	.bcopyxx.text : {
+ 		FILL(0x90909090)
+-		__bcopyxx_text_start = .;
++		HIDDEN(__bcopyxx_text_start = .);
+ 		*(.bcopyxx.text)
+-		__bcopyxx_text_end = .;
++		HIDDEN(__bcopyxx_text_end = .);
+ 	}
+-	__bcopyxx_text_len = ABSOLUTE(__bcopyxx_text_end) - ABSOLUTE(__bcopyxx_text_start);
+-	__bcopyxx_text_dwords = (__bcopyxx_text_len + 3) >> 2;
++	HIDDEN(__bcopyxx_text_len = ABSOLUTE(__bcopyxx_text_end) - ABSOLUTE(__bcopyxx_text_start));
++	HIDDEN(__bcopyxx_text_dwords = (__bcopyxx_text_len + 3) >> 2);
+ 
+ 	.bcopyxx.data : {
+-		__bcopyxx_data_start = .;
++		HIDDEN(__bcopyxx_data_start = .);
+ 		*(.bcopyxx.text)
+-		__bcopyxx_data_end = .;
++		HIDDEN(__bcopyxx_data_end = .);
+ 	}
+-	__bcopyxx_data_len = ABSOLUTE(__bcopyxx_data_end) - ABSOLUTE(__bcopyxx_data_start);
+-	__bcopyxx_data_dwords = (__bcopyxx_data_len + 3) >> 2;
++	HIDDEN(__bcopyxx_data_len = ABSOLUTE(__bcopyxx_data_end) - ABSOLUTE(__bcopyxx_data_start));
++	HIDDEN(__bcopyxx_data_dwords = (__bcopyxx_data_len + 3) >> 2);
+ 
+-	__bcopyxx_end = .;
+-	__bcopyxx_len = ABSOLUTE(__bcopyxx_end) - ABSOLUTE(__bcopyxx_start);
+-	__bcopyxx_dwords = (__bcopyxx_len + 3) >> 2;
++	HIDDEN(__bcopyxx_end = .);
++	HIDDEN(__bcopyxx_len = ABSOLUTE(__bcopyxx_end) - ABSOLUTE(__bcopyxx_start));
++	HIDDEN(__bcopyxx_dwords = (__bcopyxx_len + 3) >> 2);
+ 
+ 	. = ALIGN(4);
+ 	.data16 : {
+-	      __data16_start = .;
++	      HIDDEN(__data16_start = .);
+ 	      *(.data16)
+-	      __data16_end = .;
++	      HIDDEN(__data16_end = .);
+ 	}
+-	__data16_len = ABSOLUTE(__data16_end) - ABSOLUTE(__data16_start);
+-	__data16_dwords = (__data16_len + 3) >> 2;
++	HIDDEN(__data16_len = ABSOLUTE(__data16_end) - ABSOLUTE(__data16_start));
++	HIDDEN(__data16_dwords = (__data16_len + 3) >> 2);
+ 
+ 	. = ALIGN(4);
+-	__config_lma = .;
++	HIDDEN(__config_lma = ABSOLUTE(.));
+ 	. += SIZEOF(.config);
+ 
+ 	. = ALIGN(4);
+-	__replacestub_lma = .;
++	HIDDEN(__replacestub_lma = ABSOLUTE(.));
+ 	. += SIZEOF(.replacestub);
+ 
+ 	/* The 32-bit code loads above the non-progbits sections */
+ 
+ 	. = ALIGN(16);
+-	__pm_code_lma = .;
++	HIDDEN(__pm_code_lma = ABSOLUTE(.));
+ 
+-	__high_clear_start = .;
++	HIDDEN(__high_clear_start = .);
+ 
+ 	. = ALIGN(512);
+ 	.adv (NOLOAD) : {
+-		__adv_start = .;
++		HIDDEN(__adv_start = .);
+ 		*(.adv)
+-		__adv_end = .;
++		HIDDEN(__adv_end = .);
+ 	}
+-	__adv_len = ABSOLUTE(__adv_end) - ABSOLUTE(__adv_start);
+-	__adv_dwords = (__adv_len + 3) >> 2;
++	HIDDEN(__adv_len = ABSOLUTE(__adv_end) - ABSOLUTE(__adv_start));
++	HIDDEN(__adv_dwords = (__adv_len + 3) >> 2);
+ 
+ 	/* Late uninitialized sections */
+ 
+ 	. = ALIGN(4);
+ 	.uibss (NOLOAD) : {
+-		__uibss_start = .;
++		HIDDEN(__uibss_start = .);
+ 		*(.uibss)
+-		__uibss_end = .;
++		HIDDEN(__uibss_end = .);
+ 	}
+-	__uibss_len = ABSOLUTE(__uibss_end) - ABSOLUTE(__uibss_start);
+-	__uibss_dwords = (__uibss_len + 3) >> 2;
++	HIDDEN(__uibss_len = ABSOLUTE(__uibss_end) - ABSOLUTE(__uibss_start));
++	HIDDEN(__uibss_dwords = (__uibss_len + 3) >> 2);
+ 
+-	_end16 = .;
+-	__assert_end16 = ASSERT(_end16 <= 0x10000, "64K overflow");
++	HIDDEN(_end16 = .);
++	HIDDEN(__assert_end16 = ASSERT(_end16 <= 0x10000, "64K overflow"));
+ 
+ 	/*
+ 	 * Special 16-bit segments
+ 	 */
+-
+-	. = ALIGN(65536);
+-	.real_mode (NOLOAD) : {
+-		*(.real_mode)
+-	}
+-	real_mode_seg = core_real_mode >> 4;
+-
+ 	. = ALIGN(65536);
+ 	.xfer_buf (NOLOAD) : {
+ 		*(.xfer_buf)
+ 	}
+-	xfer_buf_seg = core_xfer_buf >> 4;
++	HIDDEN(xfer_buf_seg = core_xfer_buf >> 4);
+ 
+ 	/*
+ 	 * The auxilliary data segment is used by the 16-bit code
+@@ -219,33 +213,33 @@ SECTIONS
+ 
+ 	. = ALIGN(16);
+ 	.auxseg (NOLOAD) : {
+-		__auxseg_start = .;
++		HIDDEN(__auxseg_start = .);
+ 		*(.auxseg)
+-		__auxseg_end = .;
++		HIDDEN(__auxseg_end = .);
+ 	}
+-	__auxseg_len = ABSOLUTE(__auxseg_end) - ABSOLUTE(__auxseg_start);
+-	__auxseg_dwords = (__auxseg_len + 3) >> 2;
+-	aux_seg = __auxseg_start >> 4;
++	HIDDEN(__auxseg_len = ABSOLUTE(__auxseg_end) - ABSOLUTE(__auxseg_start));
++	HIDDEN(__auxseg_dwords = (__auxseg_len + 3) >> 2);
++	HIDDEN(aux_seg = __auxseg_start >> 4);
+ 
+ 	/*
+ 	 * Used to allocate lowmem buffers from 32-bit code
+ 	 */
+ 	.lowmem (NOLOAD) : {
+-		__lowmem_start = .;
++		HIDDEN(__lowmem_start = .);
+ 		*(.lowmem)
+-		__lowmem_end = .;
++		HIDDEN(__lowmem_end = .);
+ 	}
+-	__lowmem_len = ABSOLUTE(__lowmem_end) - ABSOLUTE(__lowmem_start);
+-	__lowmem_dwords = (__lowmem_len + 3) >> 2;
++	HIDDEN(__lowmem_len = ABSOLUTE(__lowmem_end) - ABSOLUTE(__lowmem_start));
++	HIDDEN(__lowmem_dwords = (__lowmem_len + 3) >> 2);
+ 
+-	__high_clear_end = .;
++	HIDDEN(__high_clear_end = .);
+ 
+-	__high_clear_len = ABSOLUTE(__high_clear_end) - ABSOLUTE(__high_clear_start);
+-	__high_clear_dwords = (__high_clear_len + 3) >> 2;
++	HIDDEN(__high_clear_len = ABSOLUTE(__high_clear_end) - ABSOLUTE(__high_clear_start));
++	HIDDEN(__high_clear_dwords = (__high_clear_len + 3) >> 2);
+ 
+ 	/* Start of the lowmem heap */
+ 	. = ALIGN(16);
+-	__lowmem_heap = .;
++	HIDDEN(__lowmem_heap = .);
+ 
+ 	/*
+ 	 * 32-bit code.  This is a hack for the moment due to the
+@@ -254,136 +248,137 @@ SECTIONS
+ 
+ 	. = 0x100000;
+ 
+-	__pm_code_start = .;
+-	__vma_to_lma = __pm_code_lma - __pm_code_start;
++	HIDDEN(__pm_code_start = .);
++	HIDDEN(__vma_to_lma = ABSOLUTE(__pm_code_lma - __pm_code_start));
+ 
+ 	.text : AT(ADDR(.text) + __vma_to_lma) {
+ 		FILL(0x90909090)
+-		__text_start = .;
++		HIDDEN(__text_start = .);
+ 		*(.text)
+ 		*(.text.*)
+-		__text_end = .;
++		HIDDEN(__text_end = .);
+ 	}
+ 
+ 	.rodata : AT(ADDR(.rodata) + __vma_to_lma) {
+-		__rodata_start = .;
++		HIDDEN(__rodata_start = .);
+ 		*(.rodata)
+ 		*(.rodata.*)
+-		__rodata_end = .;
++		HIDDEN(__rodata_end = .);
+ 	}
+ 
+ 	.ctors : AT(ADDR(.ctors) + __vma_to_lma) {
+-		__ctors_start = .;
++		HIDDEN(__ctors_start = .);
+ 		KEEP (*(SORT(.ctors.*)))
+ 		KEEP (*(.ctors))
+-		__ctors_end = .;
++		HIDDEN(__ctors_end = .);
+ 	}
+ 
+ 	.dtors : AT(ADDR(.dtors) + __vma_to_lma) {
+-		__dtors_start = .;
++		HIDDEN(__dtors_start = .);
+ 		KEEP (*(SORT(.dtors.*)))
+ 		KEEP (*(.dtors))
+-		__dtors_end = .;
++		HIDDEN(__dtors_end = .);
+ 	}
+ 
+ 	.dynsym : AT(ADDR(.dynsym) + __vma_to_lma) {
+-		__dynsym_start = .;
+-		*(.dynsym)
+-		__dynsym_end = .;
++		HIDDEN(__dynsym_start = .);
++		KEEP (*(.dynsym))
++		HIDDEN(__dynsym_end = .);
+ 	}
+-	__dynsym_len = __dynsym_end - __dynsym_start;
++	HIDDEN(__dynsym_len = __dynsym_end - __dynsym_start);
+ 
+ 	.dynstr : AT(ADDR(.dynstr) + __vma_to_lma) {
+-		__dynstr_start = .;
+-		*(.dynstr)
+-		__dynstr_end = .;
++		HIDDEN(__dynstr_start = .);
++		KEEP (*(.dynstr))
++		HIDDEN(__dynstr_end = .);
+ 	}
+-	__dynstr_len = __dynstr_end - __dynstr_start;
++	HIDDEN(__dynstr_len = __dynstr_end - __dynstr_start);
+ 
+ 	.gnu.hash : AT(ADDR(.gnu.hash) + __vma_to_lma) {
+-		__gnu_hash_start = .;
+-		*(.gnu.hash)
+-		__gnu_hash_end = .;
++		HIDDEN(__gnu_hash_start = .);
++		KEEP (*(.gnu.hash))
++		HIDDEN(__gnu_hash_end = .);
+ 	}
+ 
+ 
+ 	.dynlink : AT(ADDR(.dynlink) + __vma_to_lma) {
+-		__dynlink_start = .;
+-		*(.dynlink)
+-		__dynlink_end = .;
++		HIDDEN(__dynlink_start = .);
++		KEEP (*(.dynlink))
++		HIDDEN(__dynlink_end = .);
+ 	}
+ 
+ 	.got : AT(ADDR(.got) + __vma_to_lma) {
+-		__got_start = .;
+-		KEEP (*(.got.plt))
++		HIDDEN(__got_start = .);
+ 		KEEP (*(.got))
+-		__got_end = .;
++		KEEP (*(.got.plt))
++		HIDDEN(__got_end = .);
+ 	}
+ 
+ 	.dynamic : AT(ADDR(.dynamic) + __vma_to_lma) {
+-		__dynamic_start = .;
+-		*(.dynamic)
+-		__dynamic_end = .;
++		HIDDEN(__dynamic_start = .);
++		KEEP (*(.dynamic))
++		HIDDEN(__dynamic_end = .);
+ 	}
+ 
+ 	.data : AT(ADDR(.data) + __vma_to_lma) {
+-		__data_start = .;
++		HIDDEN(__data_start = .);
+ 		*(.data)
+ 		*(.data.*)
+-		__data_end = .;
++		HIDDEN(__data_end = .);
+ 	}
+ 
+-	__pm_code_end = .;
+-	__pm_code_len = ABSOLUTE(__pm_code_end) - ABSOLUTE(__pm_code_start);
+-	__pm_code_dwords = (__pm_code_len + 3) >> 2;
++	HIDDEN(__pm_code_end = .);
++	HIDDEN(__pm_code_len = ABSOLUTE(__pm_code_end) - ABSOLUTE(__pm_code_start));
++	HIDDEN(__pm_code_dwords = (__pm_code_len + 3) >> 2);
+ 
+ 	. = ALIGN(128);
+ 
+-	__bss_vma = .;
+-	__bss_lma = .;		/* Dummy */
++	HIDDEN(__bss_vma = .);
++	HIDDEN(__bss_lma = ABSOLUTE(.));		/* Dummy */
+ 	.bss (NOLOAD) : AT (__bss_lma) {
+-		__bss_start = .;
++		HIDDEN(__bss_start = .);
+ 		*(.bss)
+ 		*(.bss.*)
+ 		*(COMMON)
+-		__bss_end = .;
++		HIDDEN(__bss_end = .);
+ 	}
+-	__bss_len = ABSOLUTE(__bss_end) - ABSOLUTE(__bss_start);
+-	__bss_dwords = (__bss_len + 3) >> 2;
++	HIDDEN(__bss_len = ABSOLUTE(__bss_end) - ABSOLUTE(__bss_start));
++	HIDDEN(__bss_dwords = (__bss_len + 3) >> 2);
+ 
+ 	/* Very large objects which don't need to be zeroed */
+ 
+-	__hugebss_vma = .;
+-	__hugebss_lma = .;		/* Dummy */
++	HIDDEN(__hugebss_vma = .);
++	HIDDEN(__hugebss_lma = ABSOLUTE(.));		/* Dummy */
+ 	.hugebss (NOLOAD) : AT (__hugebss_lma) {
+-		__hugebss_start = .;
++		HIDDEN(__hugebss_start = .);
+ 		*(.hugebss)
+ 		*(.hugebss.*)
+-		__hugebss_end = .;
++		HIDDEN(__hugebss_end = .);
+ 	}
+-	__hugebss_len = ABSOLUTE(__hugebss_end) - ABSOLUTE(__hugebss_start);
+-	__hugebss_dwords = (__hugebss_len + 3) >> 2;
++	HIDDEN(__hugebss_len = ABSOLUTE(__hugebss_end) - ABSOLUTE(__hugebss_start));
++	HIDDEN(__hugebss_dwords = (__hugebss_len + 3) >> 2);
+ 
+ 
+ 	/* XXX: This stack should be unified with the COM32 stack */
+-	__stack_vma = .;
+-	__stack_lma = .;	/* Dummy */
++	HIDDEN(__stack_vma = .);
++	HIDDEN(__stack_lma = ABSOLUTE(.));		/* Dummy */
+ 	.stack (NOLOAD) : AT(__stack_lma) {
+-		__stack_start = .;
++		HIDDEN(__stack_start = .);
+ 		*(.stack)
+-		__stack_end = .;
++		HIDDEN(__stack_end = .);
+ 	}
+-	__stack_len = ABSOLUTE(__stack_end) - ABSOLUTE(__stack_start);
+-	__stack_dwords = (__stack_len + 3) >> 2;
++	HIDDEN(__stack_len = ABSOLUTE(__stack_end) - ABSOLUTE(__stack_start));
++	HIDDEN(__stack_dwords = (__stack_len + 3) >> 2);
+ 
+-	_end = .;
++	HIDDEN(_end = .);
+ 
+ 	/* COM32R and kernels are loaded after our own PM code */
+ 	. = ALIGN(65536);
+-	free_high_memory = .;
++	HIDDEN(free_high_memory = .);
+ 
+ 	/* Stuff we don't need... */
+ 	/DISCARD/ : {
+ 		*(.eh_frame)
++		*(.interp)
+ 	}
+ }
+diff --git a/core/layout.inc b/core/layout.inc
+index 53ca783d..635df537 100644
+--- a/core/layout.inc
++++ b/core/layout.inc
+@@ -139,17 +139,6 @@ serial_buf_size	equ 4096		; Should be a power of 2
+ core_xfer_buf	resb 65536
+ 
+ ;
+-; Segment for the real mode code (needed as long as we have a in-kernel
+-; loader and/or COM16 support.
+-; One symbol for the segment number, one for the absolute address
+-;
+-		extern	real_mode_seg
+-		section .real_mode	write nobits align=65536
+-		global	core_real_mode:data hidden
+-core_real_mode	resb 65536
+-comboot_seg	equ real_mode_seg	; COMBOOT image loading zone
+-
+-;
+ ; At the very end, the lowmem heap
+ ;
+ 		extern __lowmem_heap
+-- 
+2.13.3
+

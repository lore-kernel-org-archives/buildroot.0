From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Thu, 27 Aug 2015 21:11:18 +0200
Subject: [Buildroot] elf2flt .ARM.exidx and .ARM.extab section handling
Message-ID: <1990856.EDz1xKh0BM@raillard-dv6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

Cortex M3 no-MMU toolchain includes the elf2flt tool to convert ELF to bFLT.
However, it does not seem to be able to do its job when given the ELF output
of gcc 4.9.3 and uClibc 0.9.33.
The problem is: .ARM.exidx sections and .ARM.extab input sections are
not kept by the elf2flt linker script and libgcc apparently needs that
information (actually, a symbol for the beginning and the end of the 
.ARM.exidx sections):
output/build/host-gcc-final-4.9.3/build/arm-buildroot-uclinux-uclibcgnueabi/libgcc/../../../libgcc/unwind-arm-common.inc:275: undefined reference to ? __exidx_start ?
This error shows up during the final link of a binary, not when
compiling the toolchain itself.

A patch has been sent here 3 years ago but for some reasons, has not been
checked in buildroot:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/40885/match=elf2flt

Now elf2flt sources had been moved out of the buildroot tree, but the currently
used upstream has no obvious mean of contact so here is a serie of small patches that
allow the elf2flt toolchain to compile cleanly C code (C++ not tested).
Also, support for two relocations types (R_ARM_NONE, R_ARM_PREL31) must be
added to elf2flt in order to process the content of .ARM.exidx section.
Note that I have not already tested the resulting binaries, only that 
buildroot builds the root image without error, but Sourcery 2010q1 
uClinux prebuilt toolchain default linker script does a similar thing.
Unfortunately, I have not been able to find the sources of the elf2flt 
binary included in that prebuilt toolchain yet.
Here is the URL of that prebuilt toolchain:
https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 



--- host-elf2flt-21c6a41885ad544763ccd19883c1353f3b0b7a47/elf2flt.ld.in	2012-10-04 04:32:38.000000000 +0200
+++ host-elf2flt-21c6a41885ad544763ccd19883c1353f3b0b7a47/elf2flt.ld.in	2015-08-27 17:21:14.115151557 +0200
@@ -142,8 +142,12 @@
 	.gcc_except_table : {
 		KEEP(*(.gcc_except_table))
 		KEEP(*(.gcc_except_table.*))
-	} >flatmem
-
+	} >flatmem	
+	.ARM.extab   : { *(.ARM.extab* .gnu.linkonce.armextab.*) } > flatmem
+	PROVIDE_HIDDEN (@SYMBOL_PREFIX at __exidx_start = .);
+	.ARM.exidx   : { *(.ARM.exidx* .gnu.linkonce.armexidx.*) } > flatmem
+	PROVIDE_HIDDEN (@SYMBOL_PREFIX at __exidx_end = .);
+	
 	. = ALIGN(0x10) ;
 	@SYMBOL_PREFIX at _edata = . ;
 


--- host-elf2flt-21c6a41885ad544763ccd19883c1353f3b0b7a47//elf2flt.c	2012-10-04 04:32:38.000000000 +0200
+++ host-elf2flt-21c6a41885ad544763ccd19883c1353f3b0b7a47/elf2flt.c	2015-08-27 16:42:51.599398857 +0200
@@ -638,6 +638,8 @@
 				case R_ARM_ABS32:
 					relocation_needed = 1;
 					break;
+				case R_ARM_NONE:
+				case R_ARM_PREL31:                                    
 				case R_ARM_REL32:
 				case R_ARM_THM_PC11:
 				case R_ARM_THM_PC22:


--- host-elf2flt-21c6a41885ad544763ccd19883c1353f3b0b7a47/cygwin-elf.h	2012-10-04 04:32:38.000000000 +0200
+++ host-elf2flt-21c6a41885ad544763ccd19883c1353f3b0b7a47/cygwin-elf.h	2015-08-25 23:00:09.971202559 +0200
@@ -1882,6 +1882,7 @@
 #define R_ARM_LDR_SBREL_11_0	35
 #define R_ARM_ALU_SBREL_19_12	36
 #define R_ARM_ALU_SBREL_27_20	37
+#define R_ARM_PREL31		42	/* 32 bit PLT address */
 #define R_ARM_GNU_VTENTRY	100
 #define R_ARM_GNU_VTINHERIT	101
 #define R_ARM_THM_PC11		102	/* thumb unconditional branch */





-- 

Douglas RAILLARD

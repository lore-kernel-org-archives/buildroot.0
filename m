From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:18 +0100
Subject: [Buildroot] [PATCH 12/16] elf2flt: use new upstream site and add
	ARM patch
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClinux developers now have a Github with elf2flt code, with an
upstream that is again active. Let's switch to this upstream, to which
Waldemar is contributing as well.

We also add an ARM patch from Waldemar, which was on his elf2flt
repository and he submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-allow-to-build-arm-flat-binaries.patch    | 123 +++++++++++++++++++++
 package/elf2flt/elf2flt.mk                         |   5 +-
 2 files changed, 125 insertions(+), 3 deletions(-)
 create mode 100644 package/elf2flt/0001-allow-to-build-arm-flat-binaries.patch

diff --git a/package/elf2flt/0001-allow-to-build-arm-flat-binaries.patch b/package/elf2flt/0001-allow-to-build-arm-flat-binaries.patch
new file mode 100644
index 0000000..a6c63c5
--- /dev/null
+++ b/package/elf2flt/0001-allow-to-build-arm-flat-binaries.patch
@@ -0,0 +1,123 @@
+From 56b082412c6f49d21f5e54831a40d1e7c45b3ee4 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 12 Mar 2016 22:09:30 +0100
+Subject: [PATCH] allow to build arm flat binaries
+
+Add patchset from ptxdist which is required to produce working
+ARM flat binaries. Tested with busybox on Kinetis K70.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ elf2flt.c     | 19 ++++++++++++-------
+ elf2flt.ld.in | 17 ++++++++++++++---
+ 2 files changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index fcd797c..c6978e1 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -56,6 +56,8 @@ const char *elf2flt_progname;
+ 
+ #if defined(TARGET_h8300)
+ #include <elf/h8.h>      /* TARGET_* ELF support for the BFD library            */
++#elif defined(TARGET_arm)
++#include <elf/arm.h>
+ #elif defined(__CYGWIN__) || defined(__MINGW32__) || defined(TARGET_nios) || defined(TARGET_nios2)
+ #include "cygwin-elf.h"	/* Cygwin uses a local copy */
+ #elif defined(TARGET_xtensa)
+@@ -646,16 +648,23 @@ dump_symbols(symbols, number_of_symbols);
+ 				default:
+ 					goto good_32bit_resolved_reloc;
+ #elif defined(TARGET_arm)
++				case R_ARM_TARGET1:
++				case R_ARM_TARGET2:
+ 				case R_ARM_ABS32:
+ 					relocation_needed = 1;
+ 					break;
+ 				case R_ARM_REL32:
++				case R_ARM_JUMP24:
++				case R_ARM_CALL:
+ 				case R_ARM_THM_PC11:
+ 				case R_ARM_THM_PC22:
++				case R_ARM_THM_JUMP24:
+ 				case R_ARM_PC24:
+ 				case R_ARM_PLT32:
+ 				case R_ARM_GOTPC:
+ 				case R_ARM_GOT32:
++				case R_ARM_PREL31:
++				case R_ARM_NONE:
+ 					relocation_needed = 0;
+ 					break;
+ 				default:
+@@ -871,9 +880,7 @@ dump_symbols(symbols, number_of_symbols);
+ 					relocation_needed = 1;
+ 					if (verbose)
+ 						fprintf(stderr,
+-							"%s vma=0x%x, "
+-							"value=0x%"BFD_VMA_FMT"x, "
+-							"address=0x%"BFD_VMA_FMT"x "
++							"%s vma=0x%x, value=0x%x, address=0x%x "
+ 							"sym_addr=0x%x rs=0x%x, opcode=0x%x\n",
+ 							"ABS32",
+ 							sym_vma, (*(q->sym_ptr_ptr))->value,
+@@ -890,9 +897,7 @@ dump_symbols(symbols, number_of_symbols);
+ 				case R_ARM_PLT32:
+ 					if (verbose)
+ 						fprintf(stderr,
+-							"%s vma=0x%x, "
+-							"value=0x%"BFD_VMA_FMT"x, "
+-							"address=0x%"BFD_VMA_FMT"x "
++							"%s vma=0x%x, value=0x%x, address=0x%x "
+ 							"sym_addr=0x%x rs=0x%x, opcode=0x%x\n",
+ 							"PLT32",
+ 							sym_vma, (*(q->sym_ptr_ptr))->value,
+@@ -1446,7 +1451,7 @@ DIS29_RELOCATION:
+ 				}
+ 			}
+ 
+-			sprintf(&addstr[0], "+0x%lx", sym_addr - (*(q->sym_ptr_ptr))->value -
++			sprintf(&addstr[0], "+0x%x", sym_addr - (*(q->sym_ptr_ptr))->value -
+ 					 bfd_section_vma(abs_bfd, sym_section));
+ 
+ 
+diff --git a/elf2flt.ld.in b/elf2flt.ld.in
+index bfda0ef..ec1fe6f 100644
+--- a/elf2flt.ld.in
++++ b/elf2flt.ld.in
+@@ -35,6 +35,8 @@ W_RODAT		*(.rodata1)
+ W_RODAT		*(.rodata.*)
+ W_RODAT		*(.gnu.linkonce.r*)
+ 
++		/* .ARM.extab name sections containing exception unwinding information */
++		*(.ARM.extab* .gnu.linkonce.armextab.*)
+ 		/* This is special code area at the end of the normal
+ 		   text section.  It contains a small lookup table at
+ 		   the start followed by the code pointed to by entries
+@@ -43,11 +45,20 @@ W_RODAT		*(.gnu.linkonce.r*)
+ 		PROVIDE(@SYMBOL_PREFIX at __ctbp = .);
+ 		*(.call_table_data)
+ 		*(.call_table_text)
+-
+-		. = ALIGN(0x20) ;
+-		@SYMBOL_PREFIX at _etext = . ;
+ 	} > flatmem :text
+ 
++	/* .ARM.exidx name sections containing index entries for section unwinding */
++	/* .ARM.exidx is sorted, so has to go in its own output section.  */
++	@SYMBOL_PREFIX at __exidx_start = .;
++	.ARM.exidx :
++	{
++		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
++	} > flatmem
++	@SYMBOL_PREFIX at __exidx_end = .;
++
++	. = ALIGN(0x20) ;
++	@SYMBOL_PREFIX at _etext = . ;
++
+ 	.data : {
+ 		. = ALIGN(0x4) ;
+ 		@SYMBOL_PREFIX at _sdata = . ;
+-- 
+2.6.4
+
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index bec270b..796313b 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = f859213b18a67fcfc09961267e0a1122d35186f4
-ELF2FLT_SITE = http://cgit.openadk.org/cgi/cgit/elf2flt.git
-ELF2FLT_SITE_METHOD = git
+ELF2FLT_VERSION = 177ec2701aba30270ec1260746b8db5442c77ef4
+ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPLv2+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
-- 
2.6.4

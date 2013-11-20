From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Wed, 20 Nov 2013 23:33:28 +0100
Subject: [Buildroot] [PATCH 1/1] Added stage2 ldscripts
Message-ID: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building stage2 with binutils >= 2.19.1, grub says it is corrupted
I have not tried to downgrade binutils to that version, since buildroot
offers 2.20.1 as oldest. The issue was reproduced with 2.23.2.

The following patch is clearly not mine.
I have found it at that location https://dev.openwrt.org/ticket/10444
where the issue is described, and the patch offered.

Successfully tested with an iso image in kvm, that else would hang on 
"Loading stage2 ..."

Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
---
 boot/grub/grub.500-add-stage2-ldscripts.patch |   58 +++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 boot/grub/grub.500-add-stage2-ldscripts.patch

diff --git a/boot/grub/grub.500-add-stage2-ldscripts.patch b/boot/grub/grub.500-add-stage2-ldscripts.patch
new file mode 100644
index 0000000..e940daf
--- /dev/null
+++ b/boot/grub/grub.500-add-stage2-ldscripts.patch
@@ -0,0 +1,58 @@
+diff -Nru grub-0.97.orig/stage2/Makefile.am grub-0.97/stage2/Makefile.am
+--- grub-0.97.orig/stage2/Makefile.am	2013-11-20 23:06:38.770592458 +0100
++++ grub-0.97/stage2/Makefile.am	2013-11-20 23:14:15.296535523 +0100
+@@ -55,7 +55,7 @@
+ endif
+ MOSTLYCLEANFILES = $(noinst_PROGRAMS)
+ 
+-PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8200
++PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Tstage2.ldscripts 
+ START_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8000
+ NBLOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,0
+ PXELOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,7C00
+diff -Nru grub-0.97.orig/stage2/Makefile.in grub-0.97/stage2/Makefile.in
+--- grub-0.97.orig/stage2/Makefile.in	2013-11-20 23:06:38.770592458 +0100
++++ grub-0.97/stage2/Makefile.in	2013-11-20 23:14:33.279985473 +0100
+@@ -470,7 +470,7 @@
+ @DISKLESS_SUPPORT_FALSE at noinst_DATA = pre_stage2 start start_eltorito
+ @DISKLESS_SUPPORT_TRUE at noinst_DATA = pre_stage2 start start_eltorito nbloader pxeloader diskless
+ MOSTLYCLEANFILES = $(noinst_PROGRAMS)
+-PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8200
++PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Tstage2.ldscripts 
+ START_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8000
+ NBLOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,0
+ PXELOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,7C00
+diff -Nru grub-0.97.orig/stage2/stage2.ldscripts grub-0.97/stage2/stage2.ldscripts
+--- grub-0.97.orig/stage2/stage2.ldscripts	1970-01-01 01:00:00.000000000 +0100
++++ grub-0.97/stage2/stage2.ldscripts	2013-11-20 23:14:51.282622012 +0100
+@@ -0,0 +1,30 @@
++/* Script for -N: mix text and data on same page; don't align data */ 
++OUTPUT_FORMAT("elf32-i386", "elf32-i386", 
++             "elf32-i386") 
++OUTPUT_ARCH(i386) 
++ENTRY(_start) 
++SECTIONS 
++{ 
++  . = 0x8200; 
++  .text           : 
++  { 
++    _start = .; 
++    *(.text .text.* ) 
++  } 
++  .rodata         : { *(.rodata .rodata.* ) } 
++  /* Adjust the address for the data segment.  We want to adjust up to 
++     the same address within the page on the next page up.  */ 
++  . = .; 
++  .data           : { *(.data .data.* ) } 
++  __bss_start = .; 
++  .bss            : 
++  { 
++   *(.bss .bss.* ) 
++   *(COMMON) 
++   . = ALIGN(. != 0 ? 32 / 8 : 1); 
++  } 
++  . = ALIGN(32 / 8); 
++  . = ALIGN(32 / 8); 
++  _end = .; PROVIDE (end = .); 
++  .comment       0 : { *(.comment) } 
++} 
-- 
1.7.1

From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 25 Jul 2012 21:31:04 +0100
Subject: [Buildroot] [PATCH] at91bootstrap: bump version to 3.2
Message-ID: <1343248264-6435-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/at91bootstrap/Config.in                       |   28 +-
 .../at91bootstrap-1.16-eabi-fix.patch              |  334 ---------
 .../at91bootstrap-1.16-u-boot-relocation-fix.patch |  299 --------
 .../at91bootstrap-3.2-u-boot-relocation-fix.patch  |  750 ++++++++++++++++++++
 boot/at91bootstrap/at91bootstrap.mk                |   34 +-
 5 files changed, 769 insertions(+), 676 deletions(-)
 delete mode 100644 boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
 delete mode 100644 boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
 create mode 100644 boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 9cbaf81..d4adabd 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -19,32 +19,10 @@ config BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
-config BR2_TARGET_AT91BOOTSTRAP_BOARD
-	string "Bootstrap board"
+config BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG
+	string "Bootstrap defconfig"
 	default ""
 	help
-	  This is used to do a make <board>_config
-
-choice
-	prompt "Boot Memory"
-	default BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
-	help
-	  Select Chip for which AT91 bootstrap should be built
-
-config BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
-	bool "Data Flash"
-
-config BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
-	bool "NAND Flash"
-
-endchoice
-
-config BR2_TARGET_AT91BOOTSTRAP_MEMORY
-	string
-	default	"dataflash"	if	BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
-	default	"nandflash"	if	BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
+	  This is used to do a make <DEFCONFIG>_defconfig
 
 endif
-
-
-
diff --git a/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
deleted file mode 100644
index eab3c20..0000000
--- a/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
+++ /dev/null
@@ -1,334 +0,0 @@
-When using an EABI toolchain, the default compilation generates
-references to __aeabi_unwind_cpp_pr0(). This symbol is defined in
-libgcc, but we don't want to use it for a bootloader.
-
-Therefore, this patch passes some additional CFLAGS to disable the
-generation of such references by avoiding unwind tables, exceptions,
-etc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- board/at91cap9adk/dataflash/Makefile      |    2 +-
- board/at91cap9adk/norflash/Makefile       |    2 +-
- board/at91cap9stk/nandflash/Makefile      |    2 +-
- board/at91sam9260ek/dataflash/Makefile    |    2 +-
- board/at91sam9260ek/nandflash/Makefile    |    2 +-
- board/at91sam9261ek/dataflash/Makefile    |    2 +-
- board/at91sam9261ek/nandflash/Makefile    |    2 +-
- board/at91sam9263ek/dataflash/Makefile    |    2 +-
- board/at91sam9263ek/nandflash/Makefile    |    2 +-
- board/at91sam9g10ek/dataflash/Makefile    |    2 +-
- board/at91sam9g10ek/nandflash/Makefile    |    2 +-
- board/at91sam9g20ek/dataflash/Makefile    |    2 +-
- board/at91sam9g20ek/nandflash/Makefile    |    2 +-
- board/at91sam9g45ekes/nandflash/Makefile  |    2 +-
- board/at91sam9m10ekes/dataflash/Makefile  |    2 +-
- board/at91sam9m10ekes/nandflash/Makefile  |    2 +-
- board/at91sam9m10g45ek/dataflash/Makefile |    2 +-
- board/at91sam9m10g45ek/nandflash/Makefile |    2 +-
- board/at91sam9rlek/dataflash/Makefile     |    2 +-
- board/at91sam9rlek/nandflash/Makefile     |    2 +-
- board/at91sam9xeek/dataflash/Makefile     |    2 +-
- board/at91sam9xeek/nandflash/Makefile     |    2 +-
- lib/Makefile                              |    2 +-
- 23 files changed, 23 insertions(+), 23 deletions(-)
-
-Index: Bootstrap-v1.16/board/at91cap9adk/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91cap9adk/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91cap9adk/dataflash/Makefile
-@@ -34,7 +34,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91cap9adk/norflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91cap9adk/norflash/Makefile
-+++ Bootstrap-v1.16/board/at91cap9adk/norflash/Makefile
-@@ -34,7 +34,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91cap9stk/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91cap9stk/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91cap9stk/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- 
-Index: Bootstrap-v1.16/board/at91sam9260ek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9260ek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9260ek/dataflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9260ek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9260ek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9260ek/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9261ek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9261ek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9261ek/dataflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9261ek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9261ek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9261ek/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9263ek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9263ek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9263ek/dataflash/Makefile
-@@ -34,7 +34,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9263ek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9263ek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9263ek/nandflash/Makefile
-@@ -33,7 +33,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9g10ek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9g10ek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9g10ek/dataflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9g10ek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9g10ek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9g10ek/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9g20ek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9g20ek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9g20ek/dataflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9g20ek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9g20ek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9g20ek/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9g45ekes/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9g45ekes/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9g45ekes/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9m10ekes/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9m10ekes/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9m10ekes/dataflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9m10ekes/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9m10ekes/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9m10ekes/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9m10g45ek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9m10g45ek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9m10g45ek/dataflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9m10g45ek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9m10g45ek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9m10g45ek/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9rlek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9rlek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9rlek/dataflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9rlek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9rlek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9rlek/nandflash/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9xeek/dataflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9xeek/dataflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9xeek/dataflash/Makefile
-@@ -38,7 +38,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/board/at91sam9xeek/nandflash/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/board/at91sam9xeek/nandflash/Makefile
-+++ Bootstrap-v1.16/board/at91sam9xeek/nandflash/Makefile
-@@ -38,7 +38,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
-Index: Bootstrap-v1.16/lib/Makefile
-===================================================================
---- Bootstrap-v1.16.orig/lib/Makefile
-+++ Bootstrap-v1.16/lib/Makefile
-@@ -37,7 +37,7 @@
- SIZE=$(CROSS_COMPILE)size
- OBJCOPY=$(CROSS_COMPILE)objcopy
- OBJDUMP=$(CROSS_COMPILE)objdump
--CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
-+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
- ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
- 
- # Linker flags.
diff --git a/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
deleted file mode 100644
index 884519c..0000000
--- a/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
+++ /dev/null
@@ -1,299 +0,0 @@
-Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
-of the relocation changes.
-
-We have to get JUMP_ADDR consistant with what is used by u-boot
-(CONFIG_SYS_TEXT_BASE).
-
-I didn't know what to do with at91sam9m10g45ek as it doesn't seems to be
-converted yet. But anyway, that means that it is either not working or
-doesn't care so changing it here shouldn't harm.
-
-I also chose to "repartition" the dataflash. u-boot is now living at
-0x4000, letting 16kB for the bootstrap. We also have to increase the
-IMG_SIZE as u-boot as grown larger than the default value.
-As requested on the u-boot ML, we assume that it could be up to 512kB
-big.
-
-It means that now, you have to flash your kernel at 0x0008C000 instead
-of 0x00042000. And so you also have to load it from that adress from
-u-boot.
-
-Then, remember that you could decrease IMG_SIZE to boot faster.
-
-Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
----
- board/at91sam9260ek/dataflash/at91sam9260ek.h      |    6 +++---
- board/at91sam9260ek/nandflash/at91sam9260ek.h      |    2 +-
- board/at91sam9261ek/dataflash/at91sam9261ek.h      |    6 +++---
- board/at91sam9261ek/nandflash/at91sam9261ek.h      |    2 +-
- board/at91sam9263ek/dataflash/at91sam9263ek.h      |    6 +++---
- board/at91sam9263ek/nandflash/at91sam9263ek.h      |    2 +-
- board/at91sam9g10ek/dataflash/at91sam9g10ek.h      |    6 +++---
- board/at91sam9g10ek/nandflash/at91sam9g10ek.h      |    2 +-
- board/at91sam9g20ek/dataflash/at91sam9g20ek.h      |    6 +++---
- board/at91sam9g20ek/nandflash/at91sam9g20ek.h      |    2 +-
- board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h  |    4 ++--
- .../at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h  |    4 ++--
- board/at91sam9rlek/dataflash/at91sam9rlek.h        |    6 +++---
- board/at91sam9rlek/nandflash/at91sam9rlek.h        |    2 +-
- board/at91sam9xeek/dataflash/at91sam9xeek.h        |    6 +++---
- board/at91sam9xeek/nandflash/at91sam9xeek.h        |    2 +-
- 16 files changed, 32 insertions(+), 32 deletions(-)
-
-diff --git a/board/at91sam9260ek/dataflash/at91sam9260ek.h b/board/at91sam9260ek/dataflash/at91sam9260ek.h
-index 1834246..5c52bc6 100644
---- a/board/at91sam9260ek/dataflash/at91sam9260ek.h
-+++ b/board/at91sam9260ek/dataflash/at91sam9260ek.h
-@@ -73,11 +73,11 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS0 */
- 
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
- 
- #define MACH_TYPE       0x44B       /* AT91SAM9260-EK */
--#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9260ek/nandflash/at91sam9260ek.h b/board/at91sam9260ek/nandflash/at91sam9260ek.h
-index 2cac601..f8fdff2 100644
---- a/board/at91sam9260ek/nandflash/at91sam9260ek.h
-+++ b/board/at91sam9260ek/nandflash/at91sam9260ek.h
-@@ -92,7 +92,7 @@
- #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
- 
- #define MACH_TYPE       	0x44B		/* AT91SAM9260-EK */
--#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9261ek/dataflash/at91sam9261ek.h b/board/at91sam9261ek/dataflash/at91sam9261ek.h
-index 8ce30e9..675f80b 100644
---- a/board/at91sam9261ek/dataflash/at91sam9261ek.h
-+++ b/board/at91sam9261ek/dataflash/at91sam9261ek.h
-@@ -96,11 +96,11 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
- 
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
- 
- #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
--#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9261ek/nandflash/at91sam9261ek.h b/board/at91sam9261ek/nandflash/at91sam9261ek.h
-index badc3ac..e628c97 100644
---- a/board/at91sam9261ek/nandflash/at91sam9261ek.h
-+++ b/board/at91sam9261ek/nandflash/at91sam9261ek.h
-@@ -114,7 +114,7 @@
- #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
- 
- #define MACH_TYPE       	0x350		/* AT91SAM9261-EK */
--#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9263ek/dataflash/at91sam9263ek.h b/board/at91sam9263ek/dataflash/at91sam9263ek.h
-index 5c9da4b..d07b5d1 100644
---- a/board/at91sam9263ek/dataflash/at91sam9263ek.h
-+++ b/board/at91sam9263ek/dataflash/at91sam9263ek.h
-@@ -95,11 +95,11 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
- 
--#define IMG_ADDRESS 			0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE			0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 			0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE			0x80000			/* Image Size in DataFlash    */
- 
- #define MACH_TYPE       		0x4B2       		/* AT91SAM9263-EK */
--#define JUMP_ADDR			0x23F00000		/* Final Jump Address 	      */
-+#define JUMP_ADDR			0x21F00000		/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9263ek/nandflash/at91sam9263ek.h b/board/at91sam9263ek/nandflash/at91sam9263ek.h
-index 505afc7..8ab4f46 100644
---- a/board/at91sam9263ek/nandflash/at91sam9263ek.h
-+++ b/board/at91sam9263ek/nandflash/at91sam9263ek.h
-@@ -108,7 +108,7 @@
- #define	IMG_SIZE	0x40000		/* Image Size in NandFlash    */
- 
- #define MACH_TYPE       1202       	/* AT91SAM9263-EK */
--#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
-+#define JUMP_ADDR	0x21F00000	/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
-index b2faf44..0882644 100644
---- a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
-+++ b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
-@@ -97,11 +97,11 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
- 
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
- 
- #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
--#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9g10ek/nandflash/at91sam9g10ek.h b/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
-index 66c40a3..6c3ecda 100644
---- a/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
-+++ b/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
-@@ -115,7 +115,7 @@
- #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
- 
- #define MACH_TYPE       	0x350		/* AT91SAM9G10-EK */
--#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
-index eea0439..44bd578 100644
---- a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
-+++ b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
-@@ -74,11 +74,11 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
- 
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
- 
- #define MACH_TYPE		0x658			/* AT91SAM9G20-EK */
--#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
-+#define JUMP_ADDR		0x21F00000		/* Final Jump Address */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9g20ek/nandflash/at91sam9g20ek.h b/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
-index 31bd499..e797e4d 100644
---- a/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
-+++ b/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
-@@ -93,7 +93,7 @@
- #define	IMG_SIZE		0x40000			/* Image Size in NandFlash */
- 
- #define MACH_TYPE		0x658			/* AT91SAM9G20-EK */
--#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
-+#define JUMP_ADDR		0x21F00000		/* Final Jump Address */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
-index a60fd41..144dd6d 100644
---- a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
-+++ b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
-@@ -88,8 +88,8 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
- 
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
- 
- #define MACH_TYPE		0x9CD			/* AT91SAM9M10-EKES */
- #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
-diff --git a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
-index 5c726b5..3152b79 100644
---- a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
-+++ b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
-@@ -84,8 +84,8 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
- 
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
- 
- #define MACH_TYPE		0x726			/* AT91SAM9M10G45-EK */
- #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
-diff --git a/board/at91sam9rlek/dataflash/at91sam9rlek.h b/board/at91sam9rlek/dataflash/at91sam9rlek.h
-index 05c42dc..be277b6 100644
---- a/board/at91sam9rlek/dataflash/at91sam9rlek.h
-+++ b/board/at91sam9rlek/dataflash/at91sam9rlek.h
-@@ -88,11 +88,11 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
- 
--#define IMG_ADDRESS 	0x8400		/* Image Address in DataFlash */
--#define	IMG_SIZE	0x33900		/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 	0x4000		/* Image Address in DataFlash */
-+#define	IMG_SIZE	0x80000		/* Image Size in DataFlash    */
- 
- #define MACH_TYPE       1326       	/* AT91SAM9RL-EK */
--#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
-+#define JUMP_ADDR	0x21F00000	/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9rlek/nandflash/at91sam9rlek.h b/board/at91sam9rlek/nandflash/at91sam9rlek.h
-index 656b4ba..594db8f 100644
---- a/board/at91sam9rlek/nandflash/at91sam9rlek.h
-+++ b/board/at91sam9rlek/nandflash/at91sam9rlek.h
-@@ -112,7 +112,7 @@
- #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
- 
- #define MACH_TYPE       1326       		/* AT91SAM9RL-EK */
--#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9xeek/dataflash/at91sam9xeek.h b/board/at91sam9xeek/dataflash/at91sam9xeek.h
-index 27d1822..e3172da 100644
---- a/board/at91sam9xeek/dataflash/at91sam9xeek.h
-+++ b/board/at91sam9xeek/dataflash/at91sam9xeek.h
-@@ -73,11 +73,11 @@
- /* ******************************************************************* */
- #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
- 
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
--#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
- 
- #define MACH_TYPE		0x44B			/* AT91SAM9XE-EK same id as AT91SAM9260-EK*/
--#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
-diff --git a/board/at91sam9xeek/nandflash/at91sam9xeek.h b/board/at91sam9xeek/nandflash/at91sam9xeek.h
-index 5dbc63e..9fac7cb 100644
---- a/board/at91sam9xeek/nandflash/at91sam9xeek.h
-+++ b/board/at91sam9xeek/nandflash/at91sam9xeek.h
-@@ -94,7 +94,7 @@
- #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
- 
- #define MACH_TYPE		0x44B			/* AT91SAM9XE-EK same id as AT91SAM9260-EK*/
--#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
-+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
- 
- /* ******************************************************************* */
- /* Application Settings                                                */
--- 
-1.7.5.4
-
diff --git a/boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch b/boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch
new file mode 100644
index 0000000..51000e6
--- /dev/null
+++ b/boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch
@@ -0,0 +1,750 @@
+Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
+of the relocation changes.
+
+We have to get JUMP_ADDR consistant with what is used by u-boot
+(CONFIG_SYS_TEXT_BASE).
+
+I didn't know what to do with at91sam9m10g45ek as it doesn't seems to be
+converted yet. But anyway, that means that it is either not working or
+doesn't care so changing it here shouldn't harm.
+
+I also chose to "repartition" the dataflash. u-boot is now living at
+0x4000, letting 16kB for the bootstrap. We also have to increase the
+IMG_SIZE as u-boot as grown larger than the default value.
+As requested on the u-boot ML, we assume that it could be up to 512kB
+big.
+
+It means that now, you have to flash your kernel at 0x0008C000 instead
+of 0x00042000. And so you also have to load it from that adress from
+u-boot.
+
+Then, remember that you could decrease IMG_SIZE to boot faster.
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nurp a/board/afeb9260/afeb9260_defconfig b/board/afeb9260/afeb9260_defconfig
+--- a/board/afeb9260/afeb9260_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/afeb9260/afeb9260_defconfig	2012-07-25 20:52:17.967694276 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91cap9adk/at91cap9adk_defconfig b/board/at91cap9adk/at91cap9adk_defconfig
+--- a/board/at91cap9adk/at91cap9adk_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9adk/at91cap9adk_defconfig	2012-07-25 20:52:30.603693814 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9adk/at91cap9df_defconfig b/board/at91cap9adk/at91cap9df_defconfig
+--- a/board/at91cap9adk/at91cap9df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9adk/at91cap9df_defconfig	2012-07-25 20:52:23.807694041 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9adk/at91cap9f_defconfig b/board/at91cap9adk/at91cap9f_defconfig
+--- a/board/at91cap9adk/at91cap9f_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9adk/at91cap9f_defconfig	2012-07-25 21:25:20.839605245 +0100
+@@ -72,7 +72,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+ CONFIG_IMG_ADDRESS="0x00008000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9stk/at91cap9stk_defconfig b/board/at91cap9stk/at91cap9stk_defconfig
+--- a/board/at91cap9stk/at91cap9stk_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9stk/at91cap9stk_defconfig	2012-07-25 20:52:59.663692456 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9stk/at91cap9stkdf_defconfig b/board/at91cap9stk/at91cap9stkdf_defconfig
+--- a/board/at91cap9stk/at91cap9stkdf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9stk/at91cap9stkdf_defconfig	2012-07-25 20:52:52.255692671 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9stk/at91cap9stkf_defconfig b/board/at91cap9stk/at91cap9stkf_defconfig
+--- a/board/at91cap9stk/at91cap9stkf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9stk/at91cap9stkf_defconfig	2012-07-25 21:25:35.235605140 +0100
+@@ -72,7 +72,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+ CONFIG_IMG_ADDRESS="0x00008000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260dfc_defconfig b/board/at91sam9260ek/at91sam9260dfc_defconfig
+--- a/board/at91sam9260ek/at91sam9260dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260dfc_defconfig	2012-07-25 20:35:23.259739521 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260df_defconfig b/board/at91sam9260ek/at91sam9260df_defconfig
+--- a/board/at91sam9260ek/at91sam9260df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260df_defconfig	2012-07-25 20:34:19.231742964 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260ek_defconfig b/board/at91sam9260ek/at91sam9260ek_defconfig
+--- a/board/at91sam9260ek/at91sam9260ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260ek_defconfig	2012-07-25 20:32:17.711747794 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260nf_defconfig b/board/at91sam9260ek/at91sam9260nf_defconfig
+--- a/board/at91sam9260ek/at91sam9260nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260nf_defconfig	2012-07-25 21:25:57.079604719 +0100
+@@ -87,8 +87,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9261ek/at91sam9261dfc_defconfig b/board/at91sam9261ek/at91sam9261dfc_defconfig
+--- a/board/at91sam9261ek/at91sam9261dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261dfc_defconfig	2012-07-25 20:37:07.515735228 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9261ek/at91sam9261df_defconfig b/board/at91sam9261ek/at91sam9261df_defconfig
+--- a/board/at91sam9261ek/at91sam9261df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261df_defconfig	2012-07-25 20:36:44.351735615 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9261ek/at91sam9261ek_defconfig b/board/at91sam9261ek/at91sam9261ek_defconfig
+--- a/board/at91sam9261ek/at91sam9261ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261ek_defconfig	2012-07-25 20:36:09.111737459 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9261ek/at91sam9261nf_defconfig b/board/at91sam9261ek/at91sam9261nf_defconfig
+--- a/board/at91sam9261ek/at91sam9261nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261nf_defconfig	2012-07-25 21:24:45.843607437 +0100
+@@ -86,8 +86,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263dfc_defconfig b/board/at91sam9263ek/at91sam9263dfc_defconfig
+--- a/board/at91sam9263ek/at91sam9263dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263dfc_defconfig	2012-07-25 20:38:55.555730059 +0100
+@@ -100,9 +100,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263df_defconfig b/board/at91sam9263ek/at91sam9263df_defconfig
+--- a/board/at91sam9263ek/at91sam9263df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263df_defconfig	2012-07-25 20:38:37.395730195 +0100
+@@ -105,11 +105,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263ek_defconfig b/board/at91sam9263ek/at91sam9263ek_defconfig
+--- a/board/at91sam9263ek/at91sam9263ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263ek_defconfig	2012-07-25 20:38:08.379732395 +0100
+@@ -105,11 +105,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263nf_defconfig b/board/at91sam9263ek/at91sam9263nf_defconfig
+--- a/board/at91sam9263ek/at91sam9263nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263nf_defconfig	2012-07-25 21:25:39.195605069 +0100
+@@ -89,8 +89,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g10ek/at91sam9g10df_defconfig b/board/at91sam9g10ek/at91sam9g10df_defconfig
+--- a/board/at91sam9g10ek/at91sam9g10df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g10ek/at91sam9g10df_defconfig	2012-07-25 20:40:18.087726292 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20068000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g10ek/at91sam9g10ek_defconfig b/board/at91sam9g10ek/at91sam9g10ek_defconfig
+--- a/board/at91sam9g10ek/at91sam9g10ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g10ek/at91sam9g10ek_defconfig	2012-07-25 20:39:53.543727636 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20068000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g10ek/at91sam9g10nf_defconfig b/board/at91sam9g10ek/at91sam9g10nf_defconfig
+--- a/board/at91sam9g10ek/at91sam9g10nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g10ek/at91sam9g10nf_defconfig	2012-07-25 21:25:28.975605503 +0100
+@@ -86,8 +86,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20068000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20dfc_defconfig b/board/at91sam9g20ek/at91sam9g20dfc_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20dfc_defconfig	2012-07-25 20:41:48.275722343 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20df_defconfig b/board/at91sam9g20ek/at91sam9g20df_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20df_defconfig	2012-07-25 20:42:07.091721310 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20ek_defconfig b/board/at91sam9g20ek/at91sam9g20ek_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20ek_defconfig	2012-07-25 20:41:23.179723541 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20nf_defconfig b/board/at91sam9g20ek/at91sam9g20nf_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20nf_defconfig	2012-07-25 21:25:49.291603975 +0100
+@@ -87,8 +87,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g45ek/at91sam9g45df_defconfig b/board/at91sam9g45ek/at91sam9g45df_defconfig
+--- a/board/at91sam9g45ek/at91sam9g45df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ek/at91sam9g45df_defconfig	2012-07-25 20:47:46.055707221 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ek/at91sam9g45ek_defconfig b/board/at91sam9g45ek/at91sam9g45ek_defconfig
+--- a/board/at91sam9g45ek/at91sam9g45ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ek/at91sam9g45ek_defconfig	2012-07-25 20:47:02.303708341 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ek/at91sam9g45nf_defconfig b/board/at91sam9g45ek/at91sam9g45nf_defconfig
+--- a/board/at91sam9g45ek/at91sam9g45nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ek/at91sam9g45nf_defconfig	2012-07-25 21:25:24.547605601 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
+--- a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig	2012-07-25 20:47:33.895706968 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
+--- a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig	2012-07-25 20:46:49.043708951 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
+--- a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig	2012-07-25 21:25:44.823604805 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ek/at91sam9m10df_defconfig b/board/at91sam9m10ek/at91sam9m10df_defconfig
+--- a/board/at91sam9m10ek/at91sam9m10df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ek/at91sam9m10df_defconfig	2012-07-25 20:44:34.975714928 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ek/at91sam9m10ek_defconfig b/board/at91sam9m10ek/at91sam9m10ek_defconfig
+--- a/board/at91sam9m10ek/at91sam9m10ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ek/at91sam9m10ek_defconfig	2012-07-25 20:43:34.543717453 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ek/at91sam9m10nf_defconfig b/board/at91sam9m10ek/at91sam9m10nf_defconfig
+--- a/board/at91sam9m10ek/at91sam9m10nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ek/at91sam9m10nf_defconfig	2012-07-25 21:21:40.419615800 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
+--- a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig	2012-07-25 20:44:18.687715650 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
+--- a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig	2012-07-25 20:43:57.255716814 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
+--- a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig	2012-07-25 21:26:10.179603831 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9n12ek/at91sam9n12df_defconfig b/board/at91sam9n12ek/at91sam9n12df_defconfig
+--- a/board/at91sam9n12ek/at91sam9n12df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9n12ek/at91sam9n12df_defconfig	2012-07-25 20:52:40.675693207 +0100
+@@ -107,7 +107,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+ CONFIG_IMG_SIZE="0x00050000"
+diff -Nurp a/board/at91sam9rlek/at91sam9rldf_defconfig b/board/at91sam9rlek/at91sam9rldf_defconfig
+--- a/board/at91sam9rlek/at91sam9rldf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9rlek/at91sam9rldf_defconfig	2012-07-25 20:48:53.183703493 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9rlek/at91sam9rlek_defconfig b/board/at91sam9rlek/at91sam9rlek_defconfig
+--- a/board/at91sam9rlek/at91sam9rlek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9rlek/at91sam9rlek_defconfig	2012-07-25 20:48:29.659704460 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9rlek/at91sam9rlnf_defconfig b/board/at91sam9rlek/at91sam9rlnf_defconfig
+--- a/board/at91sam9rlek/at91sam9rlnf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9rlek/at91sam9rlnf_defconfig	2012-07-25 21:24:49.335607485 +0100
+@@ -85,8 +85,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9x5ek/at91sam9x5df_defconfig b/board/at91sam9x5ek/at91sam9x5df_defconfig
+--- a/board/at91sam9x5ek/at91sam9x5df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9x5ek/at91sam9x5df_defconfig	2012-07-25 20:52:45.375693059 +0100
+@@ -106,7 +106,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+ CONFIG_IMG_SIZE="0x00050000"
+diff -Nurp a/board/at91sam9xeek/at91sam9xedfc_defconfig b/board/at91sam9xeek/at91sam9xedfc_defconfig
+--- a/board/at91sam9xeek/at91sam9xedfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xedfc_defconfig	2012-07-25 20:50:10.643699991 +0100
+@@ -96,9 +96,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9xeek/at91sam9xedf_defconfig b/board/at91sam9xeek/at91sam9xedf_defconfig
+--- a/board/at91sam9xeek/at91sam9xedf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xedf_defconfig	2012-07-25 20:50:26.967699568 +0100
+@@ -103,11 +103,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x23F00000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9xeek/at91sam9xeek_defconfig b/board/at91sam9xeek/at91sam9xeek_defconfig
+--- a/board/at91sam9xeek/at91sam9xeek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xeek_defconfig	2012-07-25 20:49:46.131699600 +0100
+@@ -103,11 +103,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x23F00000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9xeek/at91sam9xenf_defconfig b/board/at91sam9xeek/at91sam9xenf_defconfig
+--- a/board/at91sam9xeek/at91sam9xenf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xenf_defconfig	2012-07-25 21:26:05.627603826 +0100
+@@ -88,8 +88,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x23F00000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index d8caed7..00199e4 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -3,23 +3,14 @@
 # at91bootstrap
 #
 #############################################################
-AT91BOOTSTRAP_VERSION = 1.16
-AT91BOOTSTRAP_SITE = http://www.atmel.com/dyn/resources/prod_documents/
-AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
-
-AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
-AT91BOOTSTRAP_MEMORY = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
-AT91BOOTSTRAP_MAKE_SUBDIR = board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
-AT91BOOTSTRAP_BINARY = $(AT91BOOTSTRAP_MAKE_SUBDIR)/$(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
+AT91BOOTSTRAP_VERSION = 3.2
+AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap/AT91Bootstrap3.2
+AT91BOOTSTRAP_SOURCE = at91bootstrap_9n12.tar.gz
 
 AT91BOOTSTRAP_INSTALL_IMAGES = YES
 AT91BOOTSTRAP_INSTALL_TARGET = NO
 
-define AT91BOOTSTRAP_EXTRACT_CMDS
-	unzip -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
-	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
-	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
-endef
+AT91BOOTSTRAP_MAKE_OPT += CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
 
 ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
 define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
@@ -30,21 +21,28 @@ endef
 AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
 endif
 
+define AT91BOOTSTRAP_CONFIGURE_CMDS
+	cp $(@D)/board/*/$(BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG)_defconfig \
+		$(@D)/.config
+	$(info Fixing Linux kernel image filename in configuration)
+	/bin/sed -r -i -e 's/image.bin/uImage/' $(@D)/.config
+endef
+
 define AT91BOOTSTRAP_BUILD_CMDS
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
+	$(MAKE) $(AT91BOOTSTRAP_MAKE_OPT) -C $(@D) boot
 endef
 
 define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
-	cp $(@D)/$(AT91BOOTSTRAP_BINARY) $(BINARIES_DIR)
+	$(MAKE) $(AT91BOOTSTRAP_MAKE_OPT) -C $(@D) bootstrap
 endef
 
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
-# we NEED a board name unless we're at make source
+# we NEED a defconfig name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
-ifeq ($(AT91BOOTSTRAP_BOARD),)
-$(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG),)
+$(error No AT91Bootstrap defconfig name set. Check your BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG setting)
 endif
 endif
 endif
-- 
1.7.9.5

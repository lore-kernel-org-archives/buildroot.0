From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: switch to the
	official version
Message-ID: <20101217160158.7217A8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1c881c08a385addb185d08cc85499cfa3a4341e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot makefile was fetching and building the special
AT91Bootstrap of Ulf, which is not the Atmel official version. While
Ulf's variant has a better configuration/build system, the Atmel
version, as officially supported, is probably a better choice for the
future.

The Atmel version only needed a small tweak to work with EABI
toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/Config.in                       |   60 +----
 .../at91bootstrap-1.16-eabi-fix.patch              |  334 ++++++++++++++++++++
 boot/at91bootstrap/at91bootstrap.mk                |   70 ++---
 3 files changed, 358 insertions(+), 106 deletions(-)
 create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 67604cd..b148973 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -18,78 +18,22 @@ config BR2_TARGET_AT91BOOTSTRAP_BOARD
 
 choice
 	prompt "Boot Memory"
-	default BR2_TARGET_AT91BOOT_DATAFLASHCARD
+	default BR2_TARGET_AT91BOOT_DATAFLASH
 	help
 	  Select Chip for which AT91 bootstrap should be built
 
 config BR2_TARGET_AT91BOOT_DATAFLASH
-	bool "AT45 Dataflash"
-
-config BR2_TARGET_AT91BOOT_DATAFLASHCARD
-	bool "AT45 Dataflash Card"
+	bool "Data Flash"
 
 config BR2_TARGET_AT91BOOT_NANDFLASH
 	bool "NAND Flash"
 
-config BR2_TARGET_AT91BOOT_FLASH
-	bool "Internal Flash or external parallel flash"
-
-config BR2_TARGET_AT91BOOT_SDCARD
-	bool "SD-Card"
-
-config BR2_TARGET_AT91BOOT_EEPROM
-	bool "EEPROM"
-
 endchoice
 
 config BR2_TARGET_AT91BOOTSTRAP_MEMORY
 	string
 	default	"dataflash"	if	BR2_TARGET_AT91BOOT_DATAFLASH
-	default	"dataflashcard"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	default	"nandflash"	if	BR2_TARGET_AT91BOOT_NANDFLASH
-	default	"flash"		if	BR2_TARGET_AT91BOOT_FLASH
-	default	"sdcard"	if	BR2_TARGET_AT91BOOT_SDCARD
-	default	"eeprom"	if	BR2_TARGET_AT91BOOT_EEPROM
-
-config	BR2_AT91BOOTSTRAP_IMG_SIZE
-	string	"Image Size to copy to SDRAM"
-	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASH
-	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
-	default	"0x30000"	if	BR2_TARGET_AT91BOOT_NANDFLASH
-	default	"0x100000"	if	BR2_TARGET_AT91BOOT_FLASH
-	default	"0x30000"	if	BR2_TARGET_AT91BOOT_SDCARD
-	default	"0x30000"	if	BR2_TARGET_AT91BOOT_EEPROM
-	help
-	  Select the size of your application
-	  AT91 Bootstrap will copy this amount from flash to SDRAM
-
-choice
-	prompt "Start address of application"
-	default BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
-	help
-	  Location of the application start address
-
-config	BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
-	bool "Copy to the default U-Boot start location in the SDRAM"
-	help
-	  This is where you copy the U-Boot boot loader
-
-config	BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM
-	bool "Copy to the last Megabyte of the SDRAM"
-	help
-	  This is where you copy a boot loader
-
-config	BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
-	bool "Copy to the start of the SDRAM"
-	help
-	  This is where you copy a standalone application
-endchoice
-
-config	BR2_AT91BOOTSTRAP_JUMP_ADDR
-	string
-	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
-	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM
-	default "0x20000000" if BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
 
 endif
 
diff --git a/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
new file mode 100644
index 0000000..eab3c20
--- /dev/null
+++ b/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
@@ -0,0 +1,334 @@
+When using an EABI toolchain, the default compilation generates
+references to __aeabi_unwind_cpp_pr0(). This symbol is defined in
+libgcc, but we don't want to use it for a bootloader.
+
+Therefore, this patch passes some additional CFLAGS to disable the
+generation of such references by avoiding unwind tables, exceptions,
+etc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ board/at91cap9adk/dataflash/Makefile      |    2 +-
+ board/at91cap9adk/norflash/Makefile       |    2 +-
+ board/at91cap9stk/nandflash/Makefile      |    2 +-
+ board/at91sam9260ek/dataflash/Makefile    |    2 +-
+ board/at91sam9260ek/nandflash/Makefile    |    2 +-
+ board/at91sam9261ek/dataflash/Makefile    |    2 +-
+ board/at91sam9261ek/nandflash/Makefile    |    2 +-
+ board/at91sam9263ek/dataflash/Makefile    |    2 +-
+ board/at91sam9263ek/nandflash/Makefile    |    2 +-
+ board/at91sam9g10ek/dataflash/Makefile    |    2 +-
+ board/at91sam9g10ek/nandflash/Makefile    |    2 +-
+ board/at91sam9g20ek/dataflash/Makefile    |    2 +-
+ board/at91sam9g20ek/nandflash/Makefile    |    2 +-
+ board/at91sam9g45ekes/nandflash/Makefile  |    2 +-
+ board/at91sam9m10ekes/dataflash/Makefile  |    2 +-
+ board/at91sam9m10ekes/nandflash/Makefile  |    2 +-
+ board/at91sam9m10g45ek/dataflash/Makefile |    2 +-
+ board/at91sam9m10g45ek/nandflash/Makefile |    2 +-
+ board/at91sam9rlek/dataflash/Makefile     |    2 +-
+ board/at91sam9rlek/nandflash/Makefile     |    2 +-
+ board/at91sam9xeek/dataflash/Makefile     |    2 +-
+ board/at91sam9xeek/nandflash/Makefile     |    2 +-
+ lib/Makefile                              |    2 +-
+ 23 files changed, 23 insertions(+), 23 deletions(-)
+
+Index: Bootstrap-v1.16/board/at91cap9adk/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91cap9adk/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91cap9adk/dataflash/Makefile
+@@ -34,7 +34,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91cap9adk/norflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91cap9adk/norflash/Makefile
++++ Bootstrap-v1.16/board/at91cap9adk/norflash/Makefile
+@@ -34,7 +34,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91cap9stk/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91cap9stk/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91cap9stk/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ 
+Index: Bootstrap-v1.16/board/at91sam9260ek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9260ek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9260ek/dataflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9260ek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9260ek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9260ek/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9261ek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9261ek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9261ek/dataflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9261ek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9261ek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9261ek/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9263ek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9263ek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9263ek/dataflash/Makefile
+@@ -34,7 +34,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9263ek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9263ek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9263ek/nandflash/Makefile
+@@ -33,7 +33,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9g10ek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9g10ek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9g10ek/dataflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9g10ek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9g10ek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9g10ek/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9g20ek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9g20ek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9g20ek/dataflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9g20ek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9g20ek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9g20ek/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9g45ekes/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9g45ekes/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9g45ekes/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9m10ekes/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9m10ekes/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9m10ekes/dataflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9m10ekes/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9m10ekes/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9m10ekes/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9m10g45ek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9m10g45ek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9m10g45ek/dataflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9m10g45ek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9m10g45ek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9m10g45ek/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9rlek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9rlek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9rlek/dataflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9rlek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9rlek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9rlek/nandflash/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9xeek/dataflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9xeek/dataflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9xeek/dataflash/Makefile
+@@ -38,7 +38,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/board/at91sam9xeek/nandflash/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/board/at91sam9xeek/nandflash/Makefile
++++ Bootstrap-v1.16/board/at91sam9xeek/nandflash/Makefile
+@@ -38,7 +38,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
+Index: Bootstrap-v1.16/lib/Makefile
+===================================================================
+--- Bootstrap-v1.16.orig/lib/Makefile
++++ Bootstrap-v1.16/lib/Makefile
+@@ -37,7 +37,7 @@
+ SIZE=$(CROSS_COMPILE)size
+ OBJCOPY=$(CROSS_COMPILE)objcopy
+ OBJDUMP=$(CROSS_COMPILE)objdump
+-CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
+ ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+ # Linker flags.
diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index d7723c4..bfffe11 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -3,73 +3,47 @@
 # at91bootstrap
 #
 #############################################################
-AT91BOOTSTRAP_VERSION:=2.13
-AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
-AT91BOOTSTRAP_SITE:=ftp://www.at91.com/pub/buildroot/
-AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
-AT91BOOTSTRAP_DIR:=$(BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
-AT91BOOTSTRAP:=$(call qstrip,$(BR2_AT91BOOTSTRAP))
-AT91BOOTSTRAP_ZCAT:=$(BZCAT)
+AT91BOOTSTRAP_VERSION:=1.16
+AT91BOOTSTRAP_NAME:=AT91Bootstrap$(AT91BOOTSTRAP_VERSION)
+AT91BOOTSTRAP_SITE:=http://www.atmel.com/dyn/resources/prod_documents/
+AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).zip
+AT91BOOTSTRAP_DIR:=$(BUILD_DIR)/at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 
 AT91BOOTSTRAP_BOARD:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
 AT91BOOTSTRAP_MEMORY:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
-AT91BOOTSTRAP_BINARY:=$(AT91BOOTSTRAP_BOARD)-$(AT91BOOTSTRAP_MEMORY)boot.bin
-AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
-AT91BOOTSTRAP_JUMP_ADDR:=$(call qstrip,$(BR2_AT91BOOTSTRAP_JUMP_ADDR))
-AT91BOOTSTRAP_IMG_SIZE:=$(call qstrip,$(BR2_AT91BOOTSTRAP_IMG_SIZE))
-
-AT91_CUSTOM_FLAGS:=
-ifneq ($(AT91BOOTSTRAP_JUMP_ADDR),)
-AT91_CUSTOM_FLAGS+=-DJUMP_ADDR=$(AT91BOOTSTRAP_JUMP_ADDR)
-endif
-ifneq ($(AT91BOOTSTRAP_IMG_SIZE),)
-AT91_CUSTOM_FLAGS+=-DIMG_SIZE=$(AT91BOOTSTRAP_IMG_SIZE)
-endif
+AT91BOOTSTRAP_BINARY:=$(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
+AT91BOOTSTRAP_BUILD_DIR:=$(AT91BOOTSTRAP_DIR)/board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
+AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_BUILD_DIR)/$(AT91BOOTSTRAP_BINARY)
 
 $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
 	 $(call DOWNLOAD,$(AT91BOOTSTRAP_SITE),$(AT91BOOTSTRAP_SOURCE))
 
 $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mkdir -p $(BUILD_DIR)
-	$(AT91BOOTSTRAP_ZCAT) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) boot/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
-	touch $(AT91BOOTSTRAP_DIR)/.unpacked
-
-$(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked
-	$(MAKE) \
-		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
-		CROSS_COMPILE=$(TARGET_CROSS) \
-		-C $(AT91BOOTSTRAP_DIR) \
-		$(AT91BOOTSTRAP_BOARD)_defconfig
-	touch $(AT91BOOTSTRAP_DIR)/.configured
-
-$(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
-	$(MAKE) \
-		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
-		CROSS_COMPILE=$(TARGET_CROSS) \
-		AT91_CUSTOM_FLAGS="$(AT91_CUSTOM_FLAGS)" \
-		-C $(AT91BOOTSTRAP_DIR)
+	unzip -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
+	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION) $(AT91BOOTSTRAP_DIR)
+	touch $@
 
-$(AT91BOOTSTRAP_DIR)/.installed:: $(AT91BOOTSTRAP_TARGET)
-	mkdir -p $(BINARIES_DIR)
-	make MEMORY=$(AT91BOOTSTRAP_MEMORY) 	\
-		CROSS_COMPILE=$(TARGET_CROSS) 	\
-		DESTDIR=$(BINARIES_DIR) 	\
-		-C $(AT91BOOTSTRAP_DIR) install
+$(AT91BOOTSTRAP_DIR)/.patched: $(AT91BOOTSTRAP_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) boot/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
 	touch $@
 
-.PHONY: at91bootstrap at91bootstrap-source
+$(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.patched
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		-C $(AT91BOOTSTRAP_BUILD_DIR)
 
-at91bootstrap: $(AT91BOOTSTRAP_DIR)/.installed
+$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY): $(AT91BOOTSTRAP_TARGET)
+	mkdir -p $(dir $@)
+	cp $^ $@
+
+at91bootstrap: $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
 
 at91bootstrap-source: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 
 at91bootstrap-unpacked: $(AT91BOOTSTRAP_DIR)/.unpacked
 
-.PHONY: at91bootstrap-clean at91bootstrap-dirclean
-
 at91bootstrap-clean:
-	make -C $(AT91BOOTSTRAP_DIR) clean
+	make -C $(AT91BOOTSTRAP_BUILD_DIR) clean
 
 at91bootstrap-dirclean:
 	rm -rf $(AT91BOOTSTRAP_DIR)
-- 
1.7.2.2

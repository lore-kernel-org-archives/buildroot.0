From: gregory hermant <gregory.hermant@calao-systems.com>
Date: Fri, 06 Jul 2012 12:13:59 +0200
Subject: [Buildroot] [PATCH] Add support for the Calao-systems USB-A9263
Message-ID: <4FF6BA67.3070207@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Attached a patch for the USB-A9263.
More info at <http://www.calao-systems.com>. 


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 .../usb-a9263/at91bootstrap-1.16-usb-a9263.patch   |  851 ++++++++++
 board/calao/usb-a9263/usb-a9263_defconfig          | 1662 ++++++++++++++++++++
 configs/usb_a9263_defconfig                        | 1247 +++++++++++++++
 3 files changed, 3760 insertions(+), 0 deletions(-)
 create mode 100644 board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch
 create mode 100644 board/calao/usb-a9263/usb-a9263_defconfig
 create mode 100644 configs/usb_a9263_defconfig

diff --git a/board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch b/board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch
new file mode 100644
index 0000000..5798930
--- /dev/null
+++ b/board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch
@@ -0,0 +1,851 @@
+From 74796655212d321f50ab89e8c5570245901f4cba Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Thu, 5 Jul 2012 18:44:07 +0200
+Subject: [PATCH] Add support for the Calao-systems USB-A9263
+
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ board/usb_a9263/dataflash/Makefile    |  115 +++++++++++++
+ board/usb_a9263/dataflash/usb-a9263.h |   97 +++++++++++
+ board/usb_a9263/nandflash/Makefile    |  117 ++++++++++++++
+ board/usb_a9263/nandflash/usb-a9263.h |  116 +++++++++++++
+ board/usb_a9263/usb_a9263.c           |  285 +++++++++++++++++++++++++++++++++
+ crt0_gnu.S                            |    7 +
+ driver/dataflash.c                    |    6 +-
+ include/part.h                        |    6 +-
+ 8 files changed, 745 insertions(+), 4 deletions(-)
+ create mode 100644 board/usb_a9263/dataflash/Makefile
+ create mode 100644 board/usb_a9263/dataflash/usb-a9263.h
+ create mode 100644 board/usb_a9263/nandflash/Makefile
+ create mode 100644 board/usb_a9263/nandflash/usb-a9263.h
+ create mode 100644 board/usb_a9263/usb_a9263.c
+
+diff --git a/board/usb_a9263/dataflash/Makefile b/board/usb_a9263/dataflash/Makefile
+new file mode 100644
+index 0000000..332685e
+--- /dev/null
++++ b/board/usb_a9263/dataflash/Makefile
+@@ -0,0 +1,115 @@
++# TODO: set this appropriately for your local toolchain
++#SHELL=C:\CYGWIN_REP\dwn_071004\bin\BASH.exe
++CROSS_COMPILE=arm-elf-
++#CROSS_COMPILE = arm-softfloat-linux-gnu-
++
++TOOLCHAIN=gcc
++
++BOOTSTRAP_PATH=../../..
++
++# DataFlashBoot Configuration for USB-A9263
++
++# Target name (case sensitive!!!)
++TARGET=AT91SAM9263
++# Board name (case sensitive!!!)
++BOARD=usb_a9263
++# Link Address and Top_of_Memory
++LINK_ADDR=0x300000
++TOP_OF_MEMORY=0x314000
++# Name of current directory
++PROJECT=dataflash
++
++ifndef BOOT_NAME
++BOOT_NAME=$(PROJECT)_$(BOARD)
++endif
++
++INCL=./$(BOOTSTRAP_PATH)/board/$(BOARD)/$(PROJECT)
++
++ifeq ($(TOOLCHAIN), gcc)
++
++AS=$(CROSS_COMPILE)gcc
++CC=$(CROSS_COMPILE)gcc
++LD=$(CROSS_COMPILE)gcc
++NM= $(CROSS_COMPILE)nm
++SIZE=$(CROSS_COMPILE)size
++OBJCOPY=$(CROSS_COMPILE)objcopy
++OBJDUMP=$(CROSS_COMPILE)objdump
++CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
++ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
++
++# Linker flags.
++#  -Wl,...:     tell GCC to pass this to linker.
++#    -Map:      create map file
++#    --cref:    add cross reference to map file
++LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
++OBJS=crt0_gnu.o
++
++endif
++
++OBJS+=\
++	$(BOARD).o \
++	main.o \
++	gpio.o \
++	pmc.o \
++	debug.o \
++	sdramc.o \
++	dataflash.o \
++	_udivsi3.o \
++	_umodsi3.o \
++	div0.o \
++	udiv.o \
++	string.o
++
++rebuild: clean all
++
++all: 	$(BOOT_NAME)
++
++ifeq ($(TOOLCHAIN), gcc)
++$(BOOT_NAME): $(OBJS)
++	$(LD) $(LDFLAGS) -n -o $(BOOT_NAME).elf $(OBJS)
++	$(OBJCOPY) --strip-debug --strip-unneeded $(BOOT_NAME).elf -O binary $(BOOT_NAME).bin
++endif
++	
++	
++$(BOARD).o: $(BOOTSTRAP_PATH)/board/$(BOARD)/$(BOARD).c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/board/$(BOARD)/$(BOARD).c -o $(BOARD).o
++
++main.o: $(BOOTSTRAP_PATH)/main.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/main.c -o main.o
++
++gpio.o: $(BOOTSTRAP_PATH)/driver/gpio.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/gpio.c -o gpio.o
++
++pmc.o:  $(BOOTSTRAP_PATH)/driver/pmc.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/pmc.c -o pmc.o
++
++debug.o: $(BOOTSTRAP_PATH)/driver/debug.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/debug.c -o debug.o
++
++sdramc.o:  $(BOOTSTRAP_PATH)/driver/sdramc.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/sdramc.c -o sdramc.o
++
++dataflash.o:  $(BOOTSTRAP_PATH)/driver/dataflash.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/dataflash.c -o dataflash.o
++
++crt0_gnu.o:  $(BOOTSTRAP_PATH)/crt0_gnu.S
++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/crt0_gnu.S -o crt0_gnu.o
++
++div0.o:  $(BOOTSTRAP_PATH)/lib/div0.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/div0.c -o div0.o
++
++string.o:  $(BOOTSTRAP_PATH)/lib/string.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/string.c -o string.o
++
++udiv.o:  $(BOOTSTRAP_PATH)/lib/udiv.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/udiv.c -o udiv.o
++
++_udivsi3.o:  $(BOOTSTRAP_PATH)/lib/_udivsi3.S
++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/lib/_udivsi3.S -o _udivsi3.o
++
++_umodsi3.o:  $(BOOTSTRAP_PATH)/lib/_umodsi3.S
++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/lib/_umodsi3.S -o _umodsi3.o
++
++clean:
++	rm -f *.o *.bin *.elf *.map
+diff --git a/board/usb_a9263/dataflash/usb-a9263.h b/board/usb_a9263/dataflash/usb-a9263.h
+new file mode 100644
+index 0000000..40a3af8
+--- /dev/null
++++ b/board/usb_a9263/dataflash/usb-a9263.h
+@@ -0,0 +1,97 @@
++/* ----------------------------------------------------------------------------
++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
++ * ----------------------------------------------------------------------------
++ * Copyright (c) 2006, Atmel Corporation
++
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *
++ * - Redistributions of source code must retain the above copyright notice,
++ * this list of conditions and the disclaimer below.
++ *
++ * Atmel's name may not be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
++ * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
++ * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
++ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
++ * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ * ----------------------------------------------------------------------------
++ * File Name           : usb-a9263.h
++ * Object              :
++ * Creation            : GH Jun 28th 2012
++ *-----------------------------------------------------------------------------
++ */
++#ifndef _USB_A9263_H
++#define _USB_A9263_H
++
++/* ******************************************************************* */
++/* PMC Settings                                                        */
++/*                                                                     */
++/* The main oscillator is enabled as soon as possible in the c_startup */
++/* and MCK is switched on the main oscillator.                         */
++/* PLL initialization is done later in the hw_init() function          */
++/* ******************************************************************* */
++#define MASTER_CLOCK		(180000000/2)
++#define PLL_LOCK_TIMEOUT	1000000
++
++#define PLLA_SETTINGS	0x20593F06
++#define PLLB_SETTINGS	0x10483F0E
++
++/* Switch MCK on PLLA output PCK = PLLA = 2 * MCK */
++#define MCKR_SETTINGS		(AT91C_PMC_PRES_CLK | AT91C_PMC_MDIV_2)
++#define MCKR_CSS_SETTINGS	(AT91C_PMC_CSS_PLLA_CLK | MCKR_SETTINGS)
++
++/* ******************************************************************* */
++/* DataFlash Settings                                                  */
++/*                                                                     */
++/* ******************************************************************* */
++#define AT91C_BASE_SPI	AT91C_BASE_SPI0
++#define AT91C_ID_SPI	AT91C_ID_SPI0
++
++/* SPI CLOCK */
++#define AT91C_SPI_CLK 		 8000000
++/* AC characteristics */
++/* DLYBS = tCSS= 250ns min and DLYBCT = tCSH = 250ns */
++#define DATAFLASH_TCSS		(0x1a << 16)	/* 250ns min (tCSS) <=> 12/48000000 = 250ns */
++#define DATAFLASH_TCHS		(0x1 << 24)	/* 250ns min (tCSH) <=> (64*1+SCBR)/(2*48000000) */
++
++#define DF_CS_SETTINGS 		(AT91C_SPI_NCPHA | (AT91C_SPI_DLYBS & DATAFLASH_TCSS) | (AT91C_SPI_DLYBCT & DATAFLASH_TCHS) | ((MASTER_CLOCK / AT91C_SPI_CLK) << 8))
++
++/* ******************************************************************* */
++/* SDRAMC Settings                                                     */
++/*                                                                     */
++/* ******************************************************************* */
++#define AT91C_BASE_SDRAMC 	AT91C_BASE_SDRAMC0
++#define AT91C_EBI_SDRAM		AT91C_EBI0_SDRAM
++
++/* ******************************************************************* */
++/* BootStrap Settings                                                  */
++/*                                                                     */
++/* ******************************************************************* */
++#define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
++
++#define IMG_ADDRESS 			0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE			0x40000			/* Image Size in DataFlash    */
++
++#define MACH_TYPE       		0x6AE       		/* USB-A9263 */
++#define JUMP_ADDR			0x23F00000		/* Final Jump Address 	      */
++
++/* ******************************************************************* */
++/* Application Settings                                                */
++/* ******************************************************************* */
++#define CFG_HW_INIT
++#define CFG_SDRAM
++#undef	CFG_DEBUG
++
++#define CFG_DATAFLASH
++
++#endif	/* _USB_A9263_H */
+diff --git a/board/usb_a9263/nandflash/Makefile b/board/usb_a9263/nandflash/Makefile
+new file mode 100644
+index 0000000..c453098
+--- /dev/null
++++ b/board/usb_a9263/nandflash/Makefile
+@@ -0,0 +1,117 @@
++# TODO: set this appropriately for your local toolchain
++#SHELL=C:\CYGWIN_REP\dwn_071004\bin\BASH.exe
++CROSS_COMPILE=arm-elf-
++
++TOOLCHAIN=gcc
++
++BOOTSTRAP_PATH=../../..
++
++# NandFlashBoot Configuration for USB-A9263
++
++# Target name (case sensitive!!!)
++TARGET=AT91SAM9263
++# Board name (case sensitive!!!)
++BOARD=usb_a9263
++# Link Address and Top_of_Memory
++LINK_ADDR=0x300000
++TOP_OF_MEMORY=0x314000
++# Name of current directory
++PROJECT=nandflash
++
++ifndef BOOT_NAME
++BOOT_NAME=$(PROJECT)_$(BOARD)
++endif
++
++INCL=./$(BOOTSTRAP_PATH)/board/$(BOARD)/$(PROJECT)
++
++ifeq ($(TOOLCHAIN), gcc)
++
++AS=$(CROSS_COMPILE)gcc
++CC=$(CROSS_COMPILE)gcc
++LD=$(CROSS_COMPILE)gcc
++NM= $(CROSS_COMPILE)nm
++SIZE=$(CROSS_COMPILE)size
++OBJCOPY=$(CROSS_COMPILE)objcopy
++OBJDUMP=$(CROSS_COMPILE)objdump
++CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
++ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
++
++# Linker flags.
++#  -Wl,...:     tell GCC to pass this to linker.
++#    -Map:      create map file
++#    --cref:    add cross reference to map file
++LDFLAGS+=-nostartfiles -nostdlib  -Wl,-Map=$(BOOT_NAME).map,--cref
++LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
++OBJS=crt0_gnu.o
++
++endif
++
++OBJS+=\
++	$(BOARD).o \
++	main.o \
++	gpio.o \
++	pmc.o \
++	debug.o \
++	sdramc.o \
++	nandflash.o \
++	_udivsi3.o \
++	_umodsi3.o \
++	div0.o \
++	udiv.o \
++	string.o
++
++rebuild: clean all
++
++all: 	$(BOOT_NAME)
++
++ifeq ($(TOOLCHAIN), gcc)
++$(BOOT_NAME): $(OBJS)
++	$(LD) $(LDFLAGS) -n -o $(BOOT_NAME).elf $(OBJS)
++	$(OBJCOPY) --strip-debug --strip-unneeded $(BOOT_NAME).elf -O binary $(BOOT_NAME).bin
++endif
++	
++	
++$(BOARD).o: $(BOOTSTRAP_PATH)/board/$(BOARD)/$(BOARD).c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/board/$(BOARD)/$(BOARD).c -o $(BOARD).o
++
++main.o: $(BOOTSTRAP_PATH)/main.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/main.c -o main.o
++
++gpio.o: $(BOOTSTRAP_PATH)/driver/gpio.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/gpio.c -o gpio.o
++
++pmc.o:  $(BOOTSTRAP_PATH)/driver/pmc.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/pmc.c -o pmc.o
++
++debug.o: $(BOOTSTRAP_PATH)/driver/debug.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/debug.c -o debug.o
++
++sdramc.o:  $(BOOTSTRAP_PATH)/driver/sdramc.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/sdramc.c -o sdramc.o
++
++dataflash.o:  $(BOOTSTRAP_PATH)/driver/dataflash.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/dataflash.c -o dataflash.o
++
++nandflash.o:  $(BOOTSTRAP_PATH)/driver/nandflash.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/nandflash.c -o nandflash.o
++
++crt0_gnu.o:  $(BOOTSTRAP_PATH)/crt0_gnu.S
++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/crt0_gnu.S -o crt0_gnu.o
++
++div0.o:  $(BOOTSTRAP_PATH)/lib/div0.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/div0.c -o div0.o
++
++string.o:  $(BOOTSTRAP_PATH)/lib/string.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/string.c -o string.o
++
++udiv.o:  $(BOOTSTRAP_PATH)/lib/udiv.c 
++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/udiv.c -o udiv.o
++
++_udivsi3.o:  $(BOOTSTRAP_PATH)/lib/_udivsi3.S
++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/lib/_udivsi3.S -o _udivsi3.o
++
++_umodsi3.o:  $(BOOTSTRAP_PATH)/lib/_umodsi3.S
++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/lib/_umodsi3.S -o _umodsi3.o
++
++clean:
++	rm -f *.o *.bin *.elf *.map
+diff --git a/board/usb_a9263/nandflash/usb-a9263.h b/board/usb_a9263/nandflash/usb-a9263.h
+new file mode 100644
+index 0000000..24e2cf1
+--- /dev/null
++++ b/board/usb_a9263/nandflash/usb-a9263.h
+@@ -0,0 +1,116 @@
++/* ----------------------------------------------------------------------------
++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
++ * ----------------------------------------------------------------------------
++ * Copyright (c) 2006, Atmel Corporation
++
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *
++ * - Redistributions of source code must retain the above copyright notice,
++ * this list of conditions and the disclaimer below.
++ *
++ * Atmel's name may not be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
++ * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
++ * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
++ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
++ * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ * ----------------------------------------------------------------------------
++ * File Name           : usb-a9263.h
++ * Object              :
++ * Creation            : GH Jun 28th 2012
++ *-----------------------------------------------------------------------------
++ */
++#ifndef _USB_A9263_H
++#define _USB_A9263_H
++
++/* ******************************************************************* */
++/* PMC Settings                                                        */
++/*                                                                     */
++/* The main oscillator is enabled as soon as possible in the c_startup */
++/* and MCK is switched on the main oscillator.                         */
++/* PLL initialization is done later in the hw_init() function          */
++/* ******************************************************************* */
++#define MASTER_CLOCK		(180000000/2)
++#define PLL_LOCK_TIMEOUT	1000000
++
++#define PLLA_SETTINGS	0x20593F06
++#define PLLB_SETTINGS	0x10483F0E
++
++/* Switch MCK on PLLA output PCK = PLLA = 2 * MCK */
++#define MCKR_SETTINGS		(AT91C_PMC_PRES_CLK | AT91C_PMC_MDIV_2)
++#define MCKR_CSS_SETTINGS	(AT91C_PMC_CSS_PLLA_CLK | MCKR_SETTINGS)
++
++/* ******************************************************************* */
++/* NandFlash Settings                                                  */
++/*                                                                     */
++/* ******************************************************************* */
++#define AT91C_SMARTMEDIA_BASE	0x40000000
++
++#define AT91_SMART_MEDIA_ALE    (1 << 21)	/* our ALE is AD21 */
++#define AT91_SMART_MEDIA_CLE    (1 << 22)	/* our CLE is AD22 */
++
++#define NAND_DISABLE_CE() do { *(volatile unsigned int *)AT91C_PIOD_SODR = AT91C_PIO_PD15;} while(0)
++#define NAND_ENABLE_CE()  do { *(volatile unsigned int *)AT91C_PIOD_CODR = AT91C_PIO_PD15;} while(0)
++#define NAND_WAIT_READY() while (!(*(volatile unsigned int *)AT91C_PIOA_PDSR & AT91C_PIO_PA22))
++
++/* ******************************************************************* */
++/* SDRAMC Settings                                                     */
++/*                                                                     */
++/* ******************************************************************* */
++#define AT91C_BASE_SDRAMC 	AT91C_BASE_SDRAMC0
++#define AT91C_EBI_SDRAM		AT91C_EBI0_SDRAM
++
++/* ******************************************************************** */
++/* SMC Chip Select 3 Timings for NandFlash for MASTER_CLOCK = 90000000. */
++/* Please refer to SMC section in AT91SAM9x datasheet to learn how 	*/
++/* to generate these values. 						*/
++/* ******************************************************************** */
++#define AT91C_SM_NWE_SETUP	(1 << 0)
++#define AT91C_SM_NCS_WR_SETUP	(0 << 8)
++#define AT91C_SM_NRD_SETUP	(1 << 16)
++#define AT91C_SM_NCS_RD_SETUP	(0 << 24)
++  
++#define AT91C_SM_NWE_PULSE 	(3 << 0)
++#define AT91C_SM_NCS_WR_PULSE	(3 << 8)
++#define AT91C_SM_NRD_PULSE	(3 << 16)
++#define AT91C_SM_NCS_RD_PULSE	(3 << 24)
++  
++#define AT91C_SM_NWE_CYCLE 	(5 << 0)
++#define AT91C_SM_NRD_CYCLE	(5 << 16)
++
++#define AT91C_SM_TDF	        (2 << 16)
++
++/* ******************************************************************* */
++/* BootStrap Settings                                                  */
++/*                                                                     */
++/* ******************************************************************* */
++#define IMG_ADDRESS 	0x20000		/* Image Address in NandFlash */
++#define	IMG_SIZE	0x40000		/* Image Size in NandFlash    */
++
++#define MACH_TYPE       0x6AE  		/* USB-A9263 */
++#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
++
++/* ******************************************************************* */
++/* Application Settings                                                */
++/* ******************************************************************* */
++#undef CFG_DEBUG
++#undef CFG_DATAFLASH
++
++#define CFG_NANDFLASH
++#undef	NANDFLASH_SMALL_BLOCKS	/* NANDFLASH_LARGE_BLOCKS used instead */
++
++#define CFG_HW_INIT
++#define CFG_SDRAM
++
++
++#endif	/* _USB_A9263_H */
+diff --git a/board/usb_a9263/usb_a9263.c b/board/usb_a9263/usb_a9263.c
+new file mode 100644
+index 0000000..5630f99
+--- /dev/null
++++ b/board/usb_a9263/usb_a9263.c
+@@ -0,0 +1,285 @@
++/* ----------------------------------------------------------------------------
++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
++ * ----------------------------------------------------------------------------
++ * Copyright (c) 2006, Atmel Corporation
++
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *
++ * - Redistributions of source code must retain the above copyright notice,
++ * this list of conditions and the disclaiimer below.
++ *
++ * Atmel's name may not be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
++ * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
++ * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
++ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
++ * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ * ----------------------------------------------------------------------------
++ * File Name           : usb_a9263.c
++ * Object              :
++ * Creation            : GH Jun 28th 2012
++ *-----------------------------------------------------------------------------
++ */
++#include "../../include/part.h"
++#include "../../include/gpio.h"
++#include "../../include/pmc.h"
++#include "../../include/debug.h"
++#include "../../include/sdramc.h"
++#include "../../include/main.h"
++#ifdef CFG_NANDFLASH
++#include "../../include/nandflash.h"
++#endif
++#ifdef CFG_DATAFLASH
++#include "../../include/dataflash.h"
++#endif
++
++static inline unsigned int get_cp15(void)
++{
++	unsigned int value;
++	__asm__("mrc p15, 0, %0, c1, c0, 0" : "=r" (value));
++	return value;
++}
++
++static inline void set_cp15(unsigned int value)
++{
++	__asm__("mcr p15, 0, %0, c1, c0, 0" : : "r" (value));
++}
++
++
++#ifdef CFG_HW_INIT
++/*---------------------------------------------------------------------------- */
++/* \fn    hw_init							       */
++/* \brief This function performs very low level HW initialization	       */
++/* This function is invoked as soon as possible during the c_startup	       */
++/* The bss segment must be initialized					       */
++/*---------------------------------------------------------------------------- */
++void hw_init(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc hw_pio[] = {
++#ifdef CFG_DEBUG
++		{"RXD", AT91C_PIN_PC(30), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"TXD", AT91C_PIN_PC(31), 0, PIO_DEFAULT, PIO_PERIPH_A},
++#endif
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Disable watchdog */
++	writel(AT91C_WDTC_WDDIS, AT91C_BASE_WDTC + WDTC_WDMR);
++
++	/* At this stage the main oscillator is supposed to be enabled
++	 * PCK = MCK = MOSC */
++
++	/* Configure PLLA = MOSC * (PLL_MULA + 1) / PLL_DIVA */
++	pmc_cfg_plla(PLLA_SETTINGS, PLL_LOCK_TIMEOUT);
++
++	/* PCK = PLLA = 2 * MCK */
++	pmc_cfg_mck(MCKR_SETTINGS, PLL_LOCK_TIMEOUT);
++	/* Switch MCK on PLLA output */
++	pmc_cfg_mck(MCKR_CSS_SETTINGS, PLL_LOCK_TIMEOUT);
++
++
++	/* Configure PLLB */
++	pmc_cfg_pllb(PLLB_SETTINGS, PLL_LOCK_TIMEOUT);
++
++	/* Configure the PIO controller to output PCK0 */
++	pio_setup(hw_pio);
++
++	/* Configure the EBI0 Slave Slot Cycle to 64 */
++	writel( (readl((AT91C_BASE_MATRIX + MATRIX_SCFG4)) & ~0xFF) | 0x40, (AT91C_BASE_MATRIX + MATRIX_SCFG4));
++
++#ifdef CFG_DEBUG
++	/* Enable Debug messages on the DBGU */
++	dbg_init(BAUDRATE(MASTER_CLOCK, 115200));
++	dbg_print("Start AT91Bootstrap...\n\r");
++#endif /* CFG_DEBUG */
++
++#ifdef CFG_SDRAM
++	/* Initialize the matrix */
++	/* VDDIOMSEL = 1 -> Memories are 3.3V powered */
++	writel(readl(AT91C_BASE_CCFG + CCFG_EBI0CSA) | (1 << 16) | AT91C_EBI_CS1A_SDRAMC, AT91C_BASE_CCFG + CCFG_EBI0CSA);
++
++	/* Configure SDRAM Controller */
++	sdram_init(	AT91C_SDRAMC_NC_9  |
++				AT91C_SDRAMC_NR_13 |
++				AT91C_SDRAMC_CAS_2 |
++				AT91C_SDRAMC_NB_4_BANKS |
++				AT91C_SDRAMC_DBW_32_BITS |
++				AT91C_SDRAMC_TWR_2 |
++				AT91C_SDRAMC_TRC_7 |
++				AT91C_SDRAMC_TRP_2 |
++				AT91C_SDRAMC_TRCD_2 |
++				AT91C_SDRAMC_TRAS_5 |
++				AT91C_SDRAMC_TXSR_8,		/* Control Register       */
++				(MASTER_CLOCK * 7)/1000000,	/* Refresh Timer Register */
++				AT91C_SDRAMC_MD_SDRAM);		/* SDRAM (no low power)   */ 
++#endif	/* CFG_SDRAM */
++}
++#endif /* CFG_HW_INIT */
++
++
++#ifdef CFG_SDRAM
++//*----------------------------------------------------------------------------
++//* \fn    sdramc_hw_init
++//* \brief This function performs SDRAMC HW initialization
++//*----------------------------------------------------------------------------*/
++void sdramc_hw_init(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc sdramc_pio[] = {
++		{"D16", AT91C_PIN_PD(16), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D17", AT91C_PIN_PD(17), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D18", AT91C_PIN_PD(18), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D19", AT91C_PIN_PD(19), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D20", AT91C_PIN_PD(20), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D21", AT91C_PIN_PD(21), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D22", AT91C_PIN_PD(22), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D23", AT91C_PIN_PD(23), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D24", AT91C_PIN_PD(24), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D25", AT91C_PIN_PD(25), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D26", AT91C_PIN_PD(26), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D27", AT91C_PIN_PD(27), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D28", AT91C_PIN_PD(28), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D29", AT91C_PIN_PD(29), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D30", AT91C_PIN_PD(30), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D31", AT91C_PIN_PD(31), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the SDRAMC PIO controller */
++	pio_setup(sdramc_pio);
++}
++#endif
++
++#ifdef CFG_DATAFLASH
++/*------------------------------------------------------------------------------*/
++/* \fn    df_recovery								*/
++/* \brief This function erases DataFlash Page 0 if USER PB is pressed 		*/
++/*        during boot sequence							*/
++/*------------------------------------------------------------------------------*/
++void df_recovery(AT91PS_DF pDf)
++{
++#if (AT91C_SPI_PCS_DATAFLASH == AT91C_SPI_PCS0_DATAFLASH)
++	/* Configure PIOs */
++	const struct pio_desc usrpb_pio[] = {
++		{"USRPB", AT91C_PIN_PB(10), 0, PIO_PULLUP, PIO_INPUT},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
++	pio_setup(usrpb_pio);
++	
++	/* If USER PB is pressed during Boot sequence */
++	/* Erase NandFlash block 0*/
++	if ( !pio_get_value(AT91C_PIN_PB(10)) )
++		df_page_erase(pDf, 0);
++#endif
++}
++/*------------------------------------------------------------------------------*/
++/* \fn    df_hw_init								*/
++/* \brief This function performs DataFlash HW initialization			*/
++/*------------------------------------------------------------------------------*/
++void df_hw_init(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc df_pio[] = {
++		{"MISO",  AT91C_PIN_PA(0), 0, PIO_DEFAULT, PIO_PERIPH_B},
++		{"MOSI",  AT91C_PIN_PA(1), 0, PIO_DEFAULT, PIO_PERIPH_B},
++		{"SPCK",  AT91C_PIN_PA(2), 0, PIO_DEFAULT, PIO_PERIPH_B},
++		{"NPCS0", AT91C_PIN_PA(5), 0, PIO_DEFAULT, PIO_PERIPH_B},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	pio_setup(df_pio);
++}
++#endif /* CFG_DATAFLASH */
++
++
++#ifdef CFG_NANDFLASH
++/*------------------------------------------------------------------------------*/
++/* \fn    nand_recovery								*/
++/* \brief This function erases NandFlash Block 0 if USER PB is pressed 		*/
++/*        during boot sequence							*/
++/*------------------------------------------------------------------------------*/
++static void nand_recovery(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc usrpb_pio[] = {
++		{"USRPB", AT91C_PIN_PB(10), 0, PIO_PULLUP, PIO_INPUT},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
++	pio_setup(usrpb_pio);
++	
++	/* If USER PB is pressed during Boot sequence */
++	/* Erase NandFlash block 0*/
++	if (!pio_get_value(AT91C_PIN_PB(10)) )
++		AT91F_NandEraseBlock0();
++}
++/*------------------------------------------------------------------------------*/
++/* \fn    nandflash_hw_init							*/
++/* \brief NandFlash HW init							*/
++/*------------------------------------------------------------------------------*/
++void nandflash_hw_init(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc nand_pio[] = {
++		{"RDY_BSY", AT91C_PIN_PA(22), 0, PIO_PULLUP, PIO_INPUT},
++		{"NANDCS",  AT91C_PIN_PD(15), 0, PIO_PULLUP, PIO_OUTPUT},
++		{(char *) 0, 0, 0,  PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Setup Smart Media, first enable the address range of CS3 in HMATRIX user interface */
++	writel(readl(AT91C_BASE_CCFG + CCFG_EBI0CSA) | AT91C_EBI_CS3A_SM, AT91C_BASE_CCFG + CCFG_EBI0CSA);
++		    
++	/* Configure SMC CS3 */
++ 	writel((AT91C_SM_NWE_SETUP | AT91C_SM_NCS_WR_SETUP | AT91C_SM_NRD_SETUP | AT91C_SM_NCS_RD_SETUP), AT91C_BASE_SMC0 + SMC_SETUP3);
++  	writel((AT91C_SM_NWE_PULSE | AT91C_SM_NCS_WR_PULSE | AT91C_SM_NRD_PULSE | AT91C_SM_NCS_RD_PULSE), AT91C_BASE_SMC0 + SMC_PULSE3);
++	writel((AT91C_SM_NWE_CYCLE | AT91C_SM_NRD_CYCLE)						, AT91C_BASE_SMC0 + SMC_CYCLE3);
++	writel((AT91C_SMC_READMODE | AT91C_SMC_WRITEMODE | AT91C_SMC_NWAITM_NWAIT_DISABLE | 
++  		AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS | AT91C_SM_TDF)						, AT91C_BASE_SMC0 + SMC_CTRL3);
++
++	/* Configure the PIO controller */
++	writel((1 << AT91C_ID_PIOA), PMC_PCER + AT91C_BASE_PMC);
++	writel((1 << AT91C_ID_PIOCDE), PMC_PCER + AT91C_BASE_PMC);
++
++	pio_setup(nand_pio);
++
++	nand_recovery();
++}
++
++/*------------------------------------------------------------------------------*/
++/* \fn    nandflash_cfg_16bits_dbw_init						*/
++/* \brief Configure SMC in 16 bits mode						*/
++/*------------------------------------------------------------------------------*/
++void nandflash_cfg_16bits_dbw_init(void)
++{
++	writel(readl(AT91C_BASE_SMC0 + SMC_CTRL3) | AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS, AT91C_BASE_SMC0 + SMC_CTRL3);
++}
++
++/*------------------------------------------------------------------------------*/
++/* \fn    nandflash_cfg_8bits_dbw_init						*/
++/* \brief Configure SMC in 8 bits mode						*/
++/*------------------------------------------------------------------------------*/
++void nandflash_cfg_8bits_dbw_init(void)
++{
++	writel((readl(AT91C_BASE_SMC0 + SMC_CTRL3) & ~(AT91C_SMC_DBW)) | AT91C_SMC_DBW_WIDTH_EIGTH_BITS, AT91C_BASE_SMC0 + SMC_CTRL3);
++}
++
++#endif /* #ifdef CFG_NANDFLASH */
++
++
+diff --git a/crt0_gnu.S b/crt0_gnu.S
+index 042b617..002feef 100644
+--- a/crt0_gnu.S
++++ b/crt0_gnu.S
+@@ -106,6 +106,13 @@ _relocate_to_sram:
+ #endif /* CFG_NORFLASH */
+ 
+ _setup_clocks:
++/* Test if main osc is bypassed */
++	ldr 	r0,=AT91C_PMC_MOR
++	ldr 	r1, [r0]
++	ldr 	r2,=AT91C_CKGR_OSCBYPASS 
++	ands 	r1, r1, r2
++	bne	_init_data	/* branch if OSCBYPASS=1 */
++
+ /* Test if main oscillator is enabled */
+ 	ldr 	r0,=AT91C_PMC_SR
+ 	ldr 	r1, [r0]
+diff --git a/driver/dataflash.c b/driver/dataflash.c
+index e28e49e..4de295a 100644
+--- a/driver/dataflash.c
++++ b/driver/dataflash.c
+@@ -293,14 +293,14 @@ static int df_init (AT91PS_DF pDf)
+ 			pDf->dfDescription.pages_size = 264;
+ 			pDf->dfDescription.page_offset = 9;
+ 			break;
+-
++*/
+ 		case AT45DB021B:
+ 			pDf->dfDescription.pages_number = 1024;
+ 			pDf->dfDescription.pages_size = 264;
+ 			pDf->dfDescription.page_offset = 9;
+ 			break;
+ 
+-		case AT45DB041B:
++/*		case AT45DB041B:
+ 			pDf->dfDescription.pages_number = 2048;
+ 			pDf->dfDescription.pages_size = 264;
+ 			pDf->dfDescription.page_offset = 9;
+@@ -373,7 +373,7 @@ int load_df(unsigned int pcs, unsigned int img_addr, unsigned int img_size, unsi
+     if (!df_init(pDf))
+         return -1;
+ 
+-#if defined(AT91SAM9260) || defined(AT91SAM9XE) || defined(AT91SAM9G20)
++#if defined(AT91SAM9260) || defined(AT91SAM9263) || defined(AT91SAM9XE) || defined(AT91SAM9G20)
+     /* Test if a button has been pressed or not */
+     /* Erase Page 0 to avoid infinite loop */
+     df_recovery(pDf);
+diff --git a/include/part.h b/include/part.h
+index ba5985a..a1863d0 100644
+--- a/include/part.h
++++ b/include/part.h
+@@ -61,7 +61,11 @@
+ 
+ #ifdef AT91SAM9263
+ #include "AT91SAM9263_inc.h"
+-#include "at91sam9263ek.h"
++	#ifdef at91sam9263ek
++	#include "at91sam9263ek.h"
++	#elif usb_a9263
++	#include "usb-a9263.h"
++	#endif
+ #endif
+ 
+ #ifdef AT91CAP9
+-- 
+1.5.6.3
+
diff --git a/board/calao/usb-a9263/usb-a9263_defconfig b/board/calao/usb-a9263/usb-a9263_defconfig
new file mode 100644
index 0000000..eabe852
--- /dev/null
+++ b/board/calao/usb-a9263/usb-a9263_defconfig
@@ -0,0 +1,1662 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.4.4 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_XZ is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_IRQ_DOMAIN=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+CONFIG_NAMESPACES=y
+CONFIG_UTS_NS=y
+CONFIG_IPC_NS=y
+CONFIG_USER_NS=y
+CONFIG_PID_NS=y
+CONFIG_NET_NS=y
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+# CONFIG_EXPERT is not set
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+# CONFIG_EMBEDDED is not set
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_PERF_COUNTERS is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+CONFIG_ARCH_AT91=y
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C24XX is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
+CONFIG_HAVE_AT91_DBGU1=y
+CONFIG_AT91_SAM9_ALT_RESET=y
+CONFIG_AT91_SAM9G45_RESET=y
+
+#
+# Atmel AT91 System-on-Chip
+#
+# CONFIG_ARCH_AT91RM9200 is not set
+# CONFIG_ARCH_AT91SAM9260 is not set
+# CONFIG_ARCH_AT91SAM9261 is not set
+# CONFIG_ARCH_AT91SAM9G10 is not set
+CONFIG_ARCH_AT91SAM9263=y
+# CONFIG_ARCH_AT91SAM9RL is not set
+# CONFIG_ARCH_AT91SAM9G20 is not set
+# CONFIG_ARCH_AT91SAM9G45 is not set
+# CONFIG_ARCH_AT91SAM9X5 is not set
+# CONFIG_ARCH_AT91X40 is not set
+CONFIG_AT91_PMC_UNIT=y
+
+#
+# AT91SAM9263 Board Type
+#
+# CONFIG_MACH_AT91SAM9263EK is not set
+CONFIG_MACH_USB_A9263=y
+# CONFIG_MACH_NEOCORE926 is not set
+
+#
+# Generic Board Type
+#
+# CONFIG_MACH_AT91SAM_DT is not set
+
+#
+# AT91 Board Options
+#
+
+#
+# AT91 Feature Selections
+#
+# CONFIG_AT91_PROGRAMMABLE_CLOCKS is not set
+CONFIG_AT91_SLOW_CLOCK=y
+CONFIG_AT91_TIMER_HZ=100
+CONFIG_AT91_EARLY_DBGU1=y
+# CONFIG_AT91_EARLY_USART0 is not set
+# CONFIG_AT91_EARLY_USART1 is not set
+# CONFIG_AT91_EARLY_USART2 is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# System MMU
+#
+
+#
+# Processor Type
+#
+CONFIG_CPU_ARM926T=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5TJ=y
+CONFIG_CPU_PABRT_LEGACY=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_COPY_V4WB=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_CPU_USE_DOMAINS=y
+
+#
+# Processor Features
+#
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+# CONFIG_ARM_THUMB is not set
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_ARM_NR_BANKS=8
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+# CONFIG_NO_HZ is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_ARCH_NR_GPIO=0
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="mem=64M console=ttyS0,115200"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_CMDLINE_EXTEND is not set
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+# CONFIG_CRASH_DUMP is not set
+# CONFIG_AUTO_ZRELADDR is not set
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
+CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+# CONFIG_APM_EMULATION is not set
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+# CONFIG_UNIX_DIAG is not set
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+# CONFIG_IP_FIB_TRIE_STATS is not set
+# CONFIG_IP_MULTIPLE_TABLES is not set
+# CONFIG_IP_ROUTE_MULTIPATH is not set
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_PNP=y
+# CONFIG_IP_PNP_DHCP is not set
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+CONFIG_IP_MROUTE=y
+# CONFIG_IP_MROUTE_MULTIPLE_TABLES is not set
+CONFIG_IP_PIMSM_V1=y
+CONFIG_IP_PIMSM_V2=y
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+# CONFIG_OPENVSWITCH is not set
+CONFIG_BQL=y
+CONFIG_HAVE_BPF_JIT=y
+# CONFIG_BPF_JIT is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+# CONFIG_LIB80211 is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+# CONFIG_DEVTMPFS is not set
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_GENERIC_CPU_DEVICES is not set
+# CONFIG_DMA_SHARED_BUFFER is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_SM_FTL is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+# CONFIG_MTD_CFI is not set
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+CONFIG_MTD_DATAFLASH=y
+# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
+# CONFIG_MTD_DATAFLASH_OTP is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SST25L is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+# CONFIG_MTD_DOCG3 is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_DOCG4 is not set
+CONFIG_MTD_NAND_ATMEL=y
+# CONFIG_MTD_NAND_ATMEL_ECC_HW is not set
+CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
+# CONFIG_MTD_NAND_ATMEL_ECC_NONE is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=1
+# CONFIG_MTD_UBI_GLUEBI is not set
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+
+#
+# Misc devices
+#
+# CONFIG_SENSORS_LIS3LV02D is not set
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
+# CONFIG_ATMEL_TCLIB is not set
+# CONFIG_ATMEL_SSC is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_TI_DAC7512 is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_EEPROM_93XX46 is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
+# CONFIG_SENSORS_LIS3_SPI is not set
+
+#
+# Altera FPGA firmware download module
+#
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=y
+# CONFIG_NET_TEAM is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_HAVE_NET_MACB=y
+CONFIG_NET_CADENCE=y
+CONFIG_MACB=y
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+# CONFIG_NET_CALXEDA_XGMAC is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+CONFIG_NET_VENDOR_CIRRUS=y
+# CONFIG_CS89x0 is not set
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_AX88796 is not set
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+# CONFIG_SMC91X is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_AMD_PHY is not set
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_MICREL_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+# CONFIG_MICREL_KS8995MA is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_USB_IPHETH is not set
+CONFIG_WLAN=y
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_HOSTAP is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_EVBUG=y
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_SAMSUNG is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_OMAP4 is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_VT_CONSOLE_SLEEP=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=256
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_SERIAL_ATMEL_PDC=y
+# CONFIG_SERIAL_ATMEL_TTYAT is not set
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+# CONFIG_I2C is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+CONFIG_SPI_ATMEL=y
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_OC_TINY is not set
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_HSI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+
+#
+# I2C GPIO expanders:
+#
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+CONFIG_HAVE_FB_ATMEL=y
+# CONFIG_DRM is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+# CONFIG_FB is not set
+# CONFIG_EXYNOS_VIDEO is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+# CONFIG_USB_HID is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_DWC3 is not set
+CONFIG_USB_MON=y
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+# CONFIG_USB_EHCI_HCD is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+CONFIG_USB_OHCI_HCD=y
+# CONFIG_USB_OHCI_HCD_PLATFORM is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_RENESAS_USBHS is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_REALTEK is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_STORAGE_ENE_UB6250 is not set
+# CONFIG_USB_UAS is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_AT91 is not set
+# CONFIG_USB_FUSB300 is not set
+# CONFIG_USB_R8A66597 is not set
+# CONFIG_USB_MV_UDC is not set
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+# CONFIG_USB_DUMMY_HCD is not set
+# CONFIG_USB_ZERO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_ETH_EEM is not set
+# CONFIG_USB_G_NCM is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FUNCTIONFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_MASS_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+# CONFIG_USB_G_ACM_MS is not set
+# CONFIG_USB_G_MULTI is not set
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_USB_ULPI is not set
+# CONFIG_NOP_USB_XCEIV is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+# CONFIG_LEDS_OT200 is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+# CONFIG_LEDS_TRIGGER_TIMER is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=y
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_IOMMU_SUPPORT=y
+
+#
+# Remoteproc drivers (EXPERIMENTAL)
+#
+
+#
+# Rpmsg drivers (EXPERIMENTAL)
+#
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+# CONFIG_EXT3_FS is not set
+# CONFIG_EXT4_FS is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+# CONFIG_AUTOFS4_FS is not set
+CONFIG_FUSE_FS=m
+# CONFIG_CUSE is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_TMPFS_XATTR is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_XATTR=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_QNX6FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+# CONFIG_SUNRPC_DEBUG is not set
+# CONFIG_CEPH_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=y
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_AT91_DEBUG_LL_DBGU1=y
+# CONFIG_DEBUG_LL_UART_NONE is not set
+# CONFIG_DEBUG_ICEDCC is not set
+# CONFIG_DEBUG_SEMIHOSTING is not set
+# CONFIG_EARLY_PRINTK is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=m
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_USER is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
+
+#
+# Random Number Generation
+#
+CONFIG_CRYPTO_ANSI_CPRNG=m
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_GENERIC_IO=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC32_SELFTEST is not set
+CONFIG_CRC32_SLICEBY8=y
+# CONFIG_CRC32_SLICEBY4 is not set
+# CONFIG_CRC32_SARWATE is not set
+# CONFIG_CRC32_BIT is not set
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_DQL=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+# CONFIG_AVERAGE is not set
+# CONFIG_CORDIC is not set
diff --git a/configs/usb_a9263_defconfig b/configs/usb_a9263_defconfig
new file mode 100644
index 0000000..7c6c1e9
--- /dev/null
+++ b/configs/usb_a9263_defconfig
@@ -0,0 +1,1247 @@
+#
+# Automatically generated make config: don't edit
+# Buildroot 2012.08-git-00229-g2955c69-dirty Configuration
+#
+BR2_HAVE_DOT_CONFIG=y
+BR2_arm=y
+# BR2_armeb is not set
+# BR2_avr32 is not set
+# BR2_bfin is not set
+# BR2_i386 is not set
+# BR2_microblazeel is not set
+# BR2_microblazebe is not set
+# BR2_mips is not set
+# BR2_mipsel is not set
+# BR2_powerpc is not set
+# BR2_sh is not set
+# BR2_sh64 is not set
+# BR2_sparc is not set
+# BR2_x86_64 is not set
+# BR2_generic_arm is not set
+# BR2_arm7tdmi is not set
+# BR2_arm610 is not set
+# BR2_arm710 is not set
+# BR2_arm720t is not set
+# BR2_arm920t is not set
+# BR2_arm922t is not set
+BR2_arm926t=y
+# BR2_arm10t is not set
+# BR2_arm1136jf_s is not set
+# BR2_arm1176jz_s is not set
+# BR2_arm1176jzf_s is not set
+# BR2_cortex_a8 is not set
+# BR2_cortex_a9 is not set
+# BR2_sa110 is not set
+# BR2_sa1100 is not set
+# BR2_xscale is not set
+# BR2_iwmmxt is not set
+BR2_ARM_TYPE="ARM926T"
+BR2_ARM_EABI=y
+# BR2_ARM_OABI is not set
+BR2_ARCH="arm"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_TUNE="arm926ej-s"
+BR2_GCC_TARGET_ARCH="armv5te"
+BR2_GCC_TARGET_ABI="aapcs-linux"
+
+#
+# Build options
+#
+
+#
+# Commands
+#
+BR2_WGET="wget --passive-ftp -nd -t 3"
+BR2_SVN="svn"
+BR2_BZR="bzr"
+BR2_GIT="git"
+BR2_LOCALFILES="cp"
+BR2_SCP="scp"
+BR2_SSH="ssh"
+BR2_HG="hg"
+BR2_ZCAT="gzip -d -c"
+BR2_BZCAT="bzcat"
+BR2_XZCAT="xzcat"
+BR2_TAR_OPTIONS=""
+BR2_DL_DIR="$(TOPDIR)/dl"
+BR2_HOST_DIR="$(BASE_DIR)/host"
+
+#
+# Mirrors and Download locations
+#
+BR2_PRIMARY_SITE=""
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
+BR2_SOURCEFORGE_MIRROR="kent"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
+BR2_JLEVEL=2
+# BR2_CCACHE is not set
+# BR2_DEPRECATED is not set
+# BR2_ENABLE_DEBUG is not set
+BR2_STRIP_strip=y
+# BR2_STRIP_sstrip is not set
+# BR2_STRIP_none is not set
+BR2_STRIP_EXCLUDE_FILES=""
+BR2_STRIP_EXCLUDE_DIRS=""
+# BR2_OPTIMIZE_0 is not set
+# BR2_OPTIMIZE_1 is not set
+# BR2_OPTIMIZE_2 is not set
+# BR2_OPTIMIZE_3 is not set
+BR2_OPTIMIZE_S=y
+# BR2_PREFER_STATIC_LIB is not set
+# BR2_HAVE_DOCUMENTATION is not set
+# BR2_HAVE_DEVFILES is not set
+BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"
+
+#
+# Toolchain
+#
+BR2_TOOLCHAIN_BUILDROOT=y
+# BR2_TOOLCHAIN_EXTERNAL is not set
+# BR2_TOOLCHAIN_CTNG is not set
+
+#
+# Kernel Header Options
+#
+# BR2_KERNEL_HEADERS_2_6_38 is not set
+# BR2_KERNEL_HEADERS_2_6_39 is not set
+# BR2_KERNEL_HEADERS_3_0 is not set
+# BR2_KERNEL_HEADERS_3_1 is not set
+# BR2_KERNEL_HEADERS_3_2 is not set
+# BR2_KERNEL_HEADERS_3_3 is not set
+BR2_KERNEL_HEADERS_3_4=y
+# BR2_KERNEL_HEADERS_VERSION is not set
+# BR2_KERNEL_HEADERS_SNAP is not set
+BR2_DEFAULT_KERNEL_HEADERS="3.4.4"
+
+#
+# uClibc Options
+#
+# BR2_UCLIBC_VERSION_0_9_31 is not set
+# BR2_UCLIBC_VERSION_0_9_32 is not set
+BR2_UCLIBC_VERSION_0_9_33=y
+# BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.33.2"
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.33.config"
+# BR2_PTHREAD_DEBUG is not set
+# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
+
+#
+# Binutils Options
+#
+# BR2_BINUTILS_VERSION_2_20 is not set
+# BR2_BINUTILS_VERSION_2_20_1 is not set
+# BR2_BINUTILS_VERSION_2_21 is not set
+BR2_BINUTILS_VERSION_2_21_1=y
+# BR2_BINUTILS_VERSION_2_22 is not set
+BR2_BINUTILS_VERSION="2.21.1"
+BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
+
+#
+# GCC Options
+#
+# BR2_GCC_VERSION_4_3_X is not set
+# BR2_GCC_VERSION_4_4_X is not set
+BR2_GCC_VERSION_4_5_X=y
+# BR2_GCC_VERSION_4_6_X is not set
+# BR2_GCC_VERSION_4_7_X is not set
+# BR2_GCC_VERSION_SNAP is not set
+BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
+BR2_GCC_VERSION="4.5.3"
+BR2_EXTRA_GCC_CONFIG_OPTIONS=""
+# BR2_INSTALL_OBJC is not set
+# BR2_INSTALL_FORTRAN is not set
+BR2_GCC_SHARED_LIBGCC=y
+BR2_GCC_ENABLE_TLS=y
+# BR2_GCC_ENABLE_OPENMP is not set
+
+#
+# Gdb Options
+#
+
+#
+# Gdb debugger for the target needs WCHAR support in toolchain
+#
+# BR2_PACKAGE_GDB_SERVER is not set
+# BR2_PACKAGE_GDB_HOST is not set
+BR2_TOOLCHAIN_HAS_THREADS=y
+BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
+BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
+# BR2_ENABLE_LOCALE_PURGE is not set
+BR2_GENERATE_LOCALE=""
+BR2_NEEDS_GETTEXT=y
+BR2_USE_MMU=y
+BR2_PREFER_SOFT_FLOAT=y
+BR2_SOFT_FLOAT=y
+BR2_TARGET_OPTIMIZATION="-pipe"
+BR2_TARGET_LDFLAGS=""
+
+#
+# Toolchain Options
+#
+# BR2_TOOLCHAIN_BUILDROOT_LARGEFILE is not set
+# BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 is not set
+# BR2_TOOLCHAIN_BUILDROOT_INET_RPC is not set
+# BR2_TOOLCHAIN_BUILDROOT_WCHAR is not set
+# BR2_TOOLCHAIN_BUILDROOT_LOCALE is not set
+# BR2_TOOLCHAIN_BUILDROOT_CXX is not set
+# BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+# BR2_PTHREADS_OLD is not set
+BR2_PTHREADS_NATIVE=y
+# BR2_ELF2FLT is not set
+
+#
+# System configuration
+#
+BR2_TARGET_GENERIC_HOSTNAME="buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
+# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
+
+#
+# udev requires a toolchain with LARGEFILE + WCHAR support
+#
+BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
+BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
+BR2_ROOTFS_SKELETON_DEFAULT=y
+# BR2_ROOTFS_SKELETON_CUSTOM is not set
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
+BR2_ROOTFS_POST_BUILD_SCRIPT=""
+
+#
+# Package Selection for the target
+#
+BR2_PACKAGE_BUSYBOX=y
+# BR2_BUSYBOX_VERSION_1_19_X is not set
+BR2_BUSYBOX_VERSION_1_20_X=y
+# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
+BR2_BUSYBOX_VERSION="1.20.1"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.20.x.config"
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_BUSYBOX_WATCHDOG is not set
+
+#
+# Audio and video applications
+#
+
+#
+# alsa-utils requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_AUMIX is not set
+
+#
+# bellagio requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_FAAD2 is not set
+# BR2_PACKAGE_FLAC is not set
+
+#
+# ffmpeg requires a toolchain with LARGEFILE and IPV6 support
+#
+
+#
+# gstreamer requires a toolchain with WCHAR support
+#
+
+#
+# gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support
+#
+# BR2_PACKAGE_LAME is not set
+# BR2_PACKAGE_MADPLAY is not set
+
+#
+# mpd requires a toolchain with C++ and WCHAR support
+#
+# BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_MPLAYER is not set
+# BR2_PACKAGE_MUSEPACK is not set
+
+#
+# pulseaudio requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_VORBIS_TOOLS is not set
+# BR2_PACKAGE_WAVPACK is not set
+
+#
+# Compressors and decompressors
+#
+# BR2_PACKAGE_BZIP2 is not set
+# BR2_PACKAGE_LZOP is not set
+# BR2_PACKAGE_XZ is not set
+
+#
+# Debugging, profiling and benchmark
+#
+
+#
+# bonnie++ requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_DHRYSTONE is not set
+
+#
+# dstat requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_KEXEC is not set
+
+#
+# latencytop requires a toolchain with WCHAR support
+#
+
+#
+# lmbench requires a toolchain with RPC support
+#
+# BR2_PACKAGE_LTP_TESTSUITE is not set
+# BR2_PACKAGE_LTTNG_MODULES is not set
+# BR2_PACKAGE_LTRACE is not set
+# BR2_PACKAGE_MEMSTAT is not set
+# BR2_PACKAGE_NETPERF is not set
+
+#
+# oprofile requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_RAMSPEED is not set
+# BR2_PACKAGE_RT_TESTS is not set
+# BR2_PACKAGE_STRACE is not set
+# BR2_PACKAGE_STRESS is not set
+# BR2_PACKAGE_WHETSTONE is not set
+# BR2_PACKAGE_PV is not set
+
+#
+# Development tools
+#
+# BR2_PACKAGE_AUTOCONF is not set
+# BR2_PACKAGE_AUTOMAKE is not set
+# BR2_PACKAGE_BINUTILS is not set
+
+#
+# bison requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_CCACHE is not set
+
+#
+# cvs requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_DISTCC is not set
+# BR2_PACKAGE_FLEX is not set
+
+#
+# gcc needs development files in target filesystem
+#
+
+#
+# gettext requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_GMP is not set
+
+#
+# gperf requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_MAKE is not set
+# BR2_PACKAGE_MPC is not set
+# BR2_PACKAGE_MPFR is not set
+# BR2_PACKAGE_LIBTOOL is not set
+
+#
+# m4 requires a toolchain with WCHAR support
+#
+
+#
+# pkg-config requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_SSTRIP is not set
+
+#
+# Games
+#
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_PRBOOM is not set
+
+#
+# Graphic libraries and applications (graphic/text)
+#
+
+#
+# Graphic applications
+#
+
+#
+# rrdtool requires a toolchain with WCHAR support
+#
+
+#
+# graphic libraries
+#
+# BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
+# BR2_PACKAGE_FBGRAB is not set
+
+#
+# fbterm requires a toolchain with C++, WCHAR and locale support
+#
+# BR2_PACKAGE_FBV is not set
+# BR2_PACKAGE_IMAGEMAGICK is not set
+# BR2_PACKAGE_LINUX_FUSION is not set
+# BR2_PACKAGE_SDL is not set
+
+#
+# other GUIs
+#
+
+#
+# EFL requires WCHAR support in toolchain
+#
+
+#
+# qt requires a toolchain with C++ support enabled
+#
+
+#
+# X.org requires a toolchain with WCHAR support
+#
+
+#
+# X libraries and helper libraries
+#
+# BR2_PACKAGE_LIBERATION is not set
+
+#
+# X Window managers
+#
+
+#
+# X applications
+#
+
+#
+# gob2 requires a toolchain with WCHAR support
+#
+
+#
+# midori requires C++, WCHAR in toolchain and libgtk2
+#
+
+#
+# vala requires a toolchain with WCHAR support
+#
+
+#
+# Hardware handling
+#
+
+#
+# cdrkit requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_CRAMFS is not set
+# BR2_PACKAGE_DBUS is not set
+
+#
+# dmraid requires a toolchain with LARGEFILE support
+#
+
+#
+# dosfstools requires a toolchain with LARGEFILE support
+#
+
+#
+# e2fsprogs requires a toolchain with LARGEFILE + WCHAR support
+#
+# BR2_PACKAGE_EEPROG is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
+# BR2_PACKAGE_FMTOOLS is not set
+# BR2_PACKAGE_GADGETFS_TEST is not set
+
+#
+# gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled
+#
+# BR2_PACKAGE_GENEXT2FS is not set
+# BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_GPSD is not set
+
+#
+# gvfs requires a toolchain with LARGEFILE and WCHAR support
+#
+# BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_I2C_TOOLS is not set
+# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
+# BR2_PACKAGE_INPUT_TOOLS is not set
+# BR2_PACKAGE_IOSTAT is not set
+# BR2_PACKAGE_IRDA_UTILS is not set
+# BR2_PACKAGE_KBD is not set
+# BR2_PACKAGE_LCDPROC is not set
+# BR2_PACKAGE_LINUX_FIRMWARE is not set
+# BR2_PACKAGE_LM_SENSORS is not set
+
+#
+# lshw requires a toolchain with C++, LARGEFILE & WCHAR support enabled
+#
+# BR2_PACKAGE_LSUIO is not set
+
+#
+# lvm2 requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_MAKEDEVS is not set
+# BR2_PACKAGE_MDADM is not set
+
+#
+# memtester requires a toolchain with LARGEFILE support
+#
+
+#
+# minicom requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_MTD is not set
+# BR2_PACKAGE_NANOCOM is not set
+
+#
+# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
+#
+
+#
+# ofono requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_OPEN2300 is not set
+# BR2_PACKAGE_OPENOCD is not set
+
+#
+# parted requires a toolchain with LARGEFILE+WCHAR support
+#
+# BR2_PACKAGE_PCIUTILS is not set
+# BR2_PACKAGE_PICOCOM is not set
+# BR2_PACKAGE_RNG_TOOLS is not set
+# BR2_PACKAGE_SANE_BACKENDS is not set
+# BR2_PACKAGE_SDPARM is not set
+# BR2_PACKAGE_SETSERIAL is not set
+
+#
+# smartmontools requires a toolchain with C++ support enabled
+#
+
+#
+# squashfs requires a toolchain with LARGEFILE and threads support
+#
+# BR2_PACKAGE_SREDIRD is not set
+
+#
+# sshfs requires a toolchain with LARGEFILE and WCHAR support
+#
+# BR2_PACKAGE_STATSERIAL is not set
+# BR2_PACKAGE_SYSSTAT is not set
+# BR2_PACKAGE_TI_UTILS is not set
+# BR2_PACKAGE_UBOOT_TOOLS is not set
+
+#
+# udev requires /dev mgmnt set to udev under System configuration
+#
+
+#
+# unionfs requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_USB_MODESWITCH is not set
+# BR2_PACKAGE_USBUTILS is not set
+# BR2_PACKAGE_WIPE is not set
+
+#
+# xfsprogs requires a toolchain with LARGEFILE + WCHAR support
+#
+
+#
+# Interpreter languages and scripting
+#
+# BR2_PACKAGE_HASERL is not set
+# BR2_PACKAGE_LUA is not set
+# BR2_PACKAGE_MICROPERL is not set
+# BR2_PACKAGE_PHP is not set
+
+#
+# python requires a toolchain with WCHAR support
+#
+
+#
+# ruby requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_TCL is not set
+
+#
+# Libraries
+#
+
+#
+# Audio/Sound
+#
+# BR2_PACKAGE_ALSA_LIB is not set
+
+#
+# audiofile requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBAO is not set
+# BR2_PACKAGE_LIBCDAUDIO is not set
+# BR2_PACKAGE_LIBCUE is not set
+# BR2_PACKAGE_LIBCUEFILE is not set
+# BR2_PACKAGE_LIBID3TAG is not set
+# BR2_PACKAGE_LIBMAD is not set
+
+#
+# libmpd requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBREPLAYGAIN is not set
+# BR2_PACKAGE_LIBSAMPLERATE is not set
+# BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBVORBIS is not set
+# BR2_PACKAGE_PORTAUDIO is not set
+# BR2_PACKAGE_SPEEX is not set
+
+#
+# taglib requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_TREMOR is not set
+
+#
+# webrtc-audio-processing requires a toolchain with C++ support enabled
+#
+
+#
+# Compression and decompression
+#
+
+#
+# libarchive requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LZO is not set
+# BR2_PACKAGE_ZLIB is not set
+
+#
+# Crypto
+#
+# BR2_PACKAGE_BEECRYPT is not set
+# BR2_PACKAGE_GNUTLS is not set
+# BR2_PACKAGE_LIBGCRYPT is not set
+# BR2_PACKAGE_LIBGPG_ERROR is not set
+
+#
+# libnss requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_OCF_LINUX is not set
+# BR2_PACKAGE_OPENSSL is not set
+# BR2_PACKAGE_POLARSSL is not set
+
+#
+# Database
+#
+# BR2_PACKAGE_BERKELEYDB is not set
+
+#
+# Mysql client requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_SQLCIPHER is not set
+# BR2_PACKAGE_SQLITE is not set
+
+#
+# Filesystem
+#
+
+#
+# gamin requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
+
+#
+# libfuse requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LIBLOCKFILE is not set
+# BR2_PACKAGE_LIBSYSFS is not set
+
+#
+# Graphics
+#
+
+#
+# atk requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_CAIRO is not set
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_IMLIB2 is not set
+# BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBART is not set
+# BR2_PACKAGE_LIBDMTX is not set
+# BR2_PACKAGE_LIBEXIF is not set
+# BR2_PACKAGE_LIBGEOTIFF is not set
+
+#
+# libgtk2 requires a toolchain with WCHAR and C++ support
+#
+# BR2_PACKAGE_LIBPNG is not set
+
+#
+# libraw requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBSVGTINY is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+
+#
+# opencv requires a toolchain with C++ and WCHAR support
+#
+
+#
+# pango requires a toolchain with WCHAR and C++ support
+#
+# BR2_PACKAGE_PIXMAN is not set
+# BR2_PACKAGE_TIFF is not set
+
+#
+# webkit requires C++, WCHAR in toolchain and libgtk2
+#
+
+#
+# zxing requires a toolchain with C++ support
+#
+
+#
+# Hardware handling
+#
+# BR2_PACKAGE_LIBAIO is not set
+# BR2_PACKAGE_LIBRAW1394 is not set
+# BR2_PACKAGE_TSLIB is not set
+# BR2_PACKAGE_LIBFREEFARE is not set
+# BR2_PACKAGE_LIBFTDI is not set
+# BR2_PACKAGE_LIBHID is not set
+# BR2_PACKAGE_LIBIQRF is not set
+# BR2_PACKAGE_LIBNFC is not set
+# BR2_PACKAGE_LIBUSB is not set
+
+#
+# libv4l requires a toolchain with LARGEFILE support
+#
+
+#
+# Javascript
+#
+# BR2_PACKAGE_EXPLORERCANVAS is not set
+# BR2_PACKAGE_FLOT is not set
+# BR2_PACKAGE_JQUERY is not set
+# BR2_PACKAGE_JQUERY_SPARKLINE is not set
+# BR2_PACKAGE_JQUERY_VALIDATION is not set
+# BR2_PACKAGE_JSMIN is not set
+
+#
+# Multimedia
+#
+
+#
+# libdvdread requires a toolchain with LARGEFILE support
+#
+
+#
+# libdvdnav requires a toolchain with LARGEFILE support
+#
+
+#
+# libmms requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBMPEG2 is not set
+# BR2_PACKAGE_LIBOGG is not set
+
+#
+# libplayer requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LIBTHEORA is not set
+
+#
+# Live555 needs C++ compiler
+#
+
+#
+# mediastreamer requires a toolchain with C++ support enabled
+#
+
+#
+# Networking
+#
+
+#
+# glib-networking requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBCGI is not set
+
+#
+# libcgicc requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
+# BR2_PACKAGE_LIBESMTP is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBFCGI is not set
+# BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBOAUTH is not set
+# BR2_PACKAGE_LIBMICROHTTPD is not set
+# BR2_PACKAGE_NEON is not set
+
+#
+# libmnl requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LIBMODBUS is not set
+# BR2_PACKAGE_LIBMBUS is not set
+# BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
+
+#
+# libnetfilter_cttimout requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LIBNFNETLINK is not set
+# BR2_PACKAGE_LIBNL is not set
+
+#
+# liboping requires a toolchain with IPv6 support enabled
+#
+# BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBRSYNC is not set
+
+#
+# libsoup requires a toolchain with WCHAR support
+#
+
+#
+# libtorrent requires a toolchain with C++ support enabled
+#
+
+#
+# libupnp requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LIBVNCSERVER is not set
+# BR2_PACKAGE_ORTP is not set
+
+#
+# zeromq requires a toolchain with C++, LARGEFILE + WCHAR support
+#
+
+#
+# Other
+#
+# BR2_PACKAGE_APR is not set
+# BR2_PACKAGE_APR_UTIL is not set
+# BR2_PACKAGE_FFTW is not set
+# BR2_PACKAGE_LIBARGTABLE2 is not set
+# BR2_PACKAGE_ARGP_STANDALONE is not set
+
+#
+# boost requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBCAP is not set
+# BR2_PACKAGE_LIBCAP_NG is not set
+# BR2_PACKAGE_LIBDAEMON is not set
+# BR2_PACKAGE_LIBELF is not set
+# BR2_PACKAGE_LIBEVENT is not set
+# BR2_PACKAGE_LIBEV is not set
+# BR2_PACKAGE_LIBFFI is not set
+
+#
+# libglib2 requires a toolchain with WCHAR support
+#
+
+#
+# libical requires a toolchain with WCHAR support
+#
+
+#
+# libnspr requires a toolchain with LARGEFILE support
+#
+
+#
+# libsigc++ requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBTPL is not set
+# BR2_PACKAGE_LIBURCU is not set
+
+#
+# lttng-libust needs WCHAR and LARGEFILE support
+#
+# BR2_PACKAGE_ORC is not set
+
+#
+# poco requires a toolchain with WCHAR and C++ support
+#
+
+#
+# protobuf requires a toolchain with C++ support enabled
+#
+
+#
+# Text and terminal handling
+#
+
+#
+# enchant requires a toolchain with C++ and WCHAR support enabled
+#
+
+#
+# icu requires a toolchain with C++ support and WCHAR enabled
+#
+# BR2_PACKAGE_LIBICONV is not set
+# BR2_PACKAGE_NCURSES is not set
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_PCRE is not set
+# BR2_PACKAGE_POPT is not set
+# BR2_PACKAGE_READLINE is not set
+# BR2_PACKAGE_SLANG is not set
+
+#
+# JSON/XML
+#
+# BR2_PACKAGE_CJSON is not set
+# BR2_PACKAGE_EXPAT is not set
+# BR2_PACKAGE_EZXML is not set
+# BR2_PACKAGE_JSON_C is not set
+# BR2_PACKAGE_LIBROXML is not set
+# BR2_PACKAGE_LIBXML2 is not set
+# BR2_PACKAGE_LIBXSLT is not set
+# BR2_PACKAGE_LIBYAML is not set
+# BR2_PACKAGE_MXML is not set
+
+#
+# xerces-c++ requires a toolchain with C++ and WCHAR support enabled
+#
+# BR2_PACKAGE_YAJL is not set
+
+#
+# Miscellaneous
+#
+# BR2_PACKAGE_COLLECTD is not set
+# BR2_PACKAGE_EMPTY is not set
+# BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
+
+#
+# shared-mime-info requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_SOUND_THEME_FREEDESKTOP is not set
+
+#
+# Networking applications
+#
+# BR2_PACKAGE_ARGUS is not set
+# BR2_PACKAGE_AVAHI is not set
+# BR2_PACKAGE_AXEL is not set
+
+#
+# bluez-utils require a toolchain with WCHAR support
+#
+
+#
+# bind requires a toolchain with LARGEFILE and IPV6 support
+#
+
+#
+# bmon requires a toolchain with IPv6 support
+#
+# BR2_PACKAGE_BRIDGE_UTILS is not set
+# BR2_PACKAGE_BWM_NG is not set
+# BR2_PACKAGE_CAN_UTILS is not set
+
+#
+# connman needs a toolchain with IPv6, WCHAR and resolver support
+#
+
+#
+# ctorrent requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_CIFS_UTILS is not set
+
+#
+# conntrack-tools requires a toolchain with IPV6 and LARGEFILE support
+#
+# BR2_PACKAGE_CUPS is not set
+# BR2_PACKAGE_DHCPDUMP is not set
+# BR2_PACKAGE_DNSMASQ is not set
+# BR2_PACKAGE_DROPBEAR is not set
+
+#
+# ebtables requires a toolchain with IPv6 support
+#
+# BR2_PACKAGE_ETHTOOL is not set
+# BR2_PACKAGE_HEIRLOOM_MAILX is not set
+# BR2_PACKAGE_HOSTAPD is not set
+# BR2_PACKAGE_IGH_ETHERCAT is not set
+# BR2_PACKAGE_INADYN is not set
+
+#
+# iperf requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_IPROUTE2 is not set
+# BR2_PACKAGE_IPSEC_TOOLS is not set
+
+#
+# ipset requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_IPTABLES is not set
+# BR2_PACKAGE_IW is not set
+
+#
+# Kismet requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LINKS is not set
+
+#
+# linphone requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LRZSZ is not set
+# BR2_PACKAGE_MII_DIAG is not set
+# BR2_PACKAGE_MROUTED is not set
+# BR2_PACKAGE_MSMTP is not set
+
+#
+# mutt requires a toolchain with WCHAR support
+#
+
+#
+# nbd requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_NCFTP is not set
+
+#
+# ndisc6 requires a toolchain with IPv6 support
+#
+# BR2_PACKAGE_NETATALK is not set
+# BR2_PACKAGE_NETPLUG is not set
+# BR2_PACKAGE_NETSNMP is not set
+# BR2_PACKAGE_NETSTAT_NAT is not set
+
+#
+# NetworkManager requires a toolchain with IPV6, LARGEFILE and WCHAR support
+#
+# BR2_PACKAGE_NOIP is not set
+
+#
+# nfs-utils requires a toolchain with RPC and LARGEFILE support
+#
+# BR2_PACKAGE_NGIRCD is not set
+# BR2_PACKAGE_NGREP is not set
+# BR2_PACKAGE_NTP is not set
+# BR2_PACKAGE_NUTTCP is not set
+
+#
+# olsr requires a toolchain with IPv6 support
+#
+# BR2_PACKAGE_OPENNTPD is not set
+# BR2_PACKAGE_OPENSSH is not set
+# BR2_PACKAGE_OPENSWAN is not set
+# BR2_PACKAGE_OPENVPN is not set
+
+#
+# portmap requires a toolchain with RPC support
+#
+# BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
+# BR2_PACKAGE_PROFTPD is not set
+# BR2_PACKAGE_QUAGGA is not set
+
+#
+# radvd requires a toolchain with IPV6 support
+#
+# BR2_PACKAGE_RSH_REDONE is not set
+# BR2_PACKAGE_RSYNC is not set
+
+#
+# rtorrent requires a toolchain with C++ and WCHAR support
+#
+# BR2_PACKAGE_SAMBA is not set
+# BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SOCAT is not set
+# BR2_PACKAGE_SOCKETCAND is not set
+# BR2_PACKAGE_SPAWN_FCGI is not set
+
+#
+# Squid requires a toolchain with C++ and IPv6 support enabled
+#
+# BR2_PACKAGE_STUNNEL is not set
+# BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_TCPREPLAY is not set
+# BR2_PACKAGE_TN5250 is not set
+
+#
+# Transmission requires a toolchain with IPv6 support
+#
+
+#
+# udpcast requires a toolchain with LARGEFILE support
+#
+
+#
+# ushare requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_VPNC is not set
+# BR2_PACKAGE_VSFTPD is not set
+# BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WIRELESS_TOOLS is not set
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
+# BR2_PACKAGE_XINETD is not set
+# BR2_PACKAGE_XL2TP is not set
+
+#
+# Package managers
+#
+# BR2_PACKAGE_IPKG is not set
+# BR2_PACKAGE_OPKG is not set
+
+#
+# Real-Time
+#
+# BR2_PACKAGE_XENOMAI is not set
+
+#
+# Shell and utilities
+#
+# BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_DIALOG is not set
+# BR2_PACKAGE_FILE is not set
+
+#
+# inotify-tools requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LOCKFILE_PROGS is not set
+
+#
+# logrotate requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LOGSURFER is not set
+# BR2_PACKAGE_SCREEN is not set
+# BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_XMLSTARLET is not set
+
+#
+# System tools
+#
+
+#
+# acl requires a toolchain with LARGEFILE support
+#
+
+#
+# attr requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_HTOP is not set
+# BR2_PACKAGE_KMOD is not set
+# BR2_PACKAGE_MONIT is not set
+
+#
+# quota requires a toolchain with RPC + LARGEFILE + WCHAR support
+#
+
+#
+# systemd not available (depends on /dev management with udev and ipv6 support)
+#
+
+#
+# util-linux requires a toolchain with LARGEFILE + WCHAR support
+#
+
+#
+# Text editors and viewers
+#
+# BR2_PACKAGE_ED is not set
+# BR2_PACKAGE_NANO is not set
+# BR2_PACKAGE_UEMACS is not set
+
+#
+# Host utilities
+#
+# BR2_PACKAGE_HOST_LPC3250LOADER is not set
+# BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS is not set
+# BR2_PACKAGE_HOST_OPENOCD is not set
+BR2_PACKAGE_HOST_SAM_BA=y
+# BR2_PACKAGE_HOST_UBOOT_TOOLS is not set
+
+#
+# Filesystem images
+#
+# BR2_TARGET_ROOTFS_CRAMFS is not set
+# BR2_TARGET_ROOTFS_CLOOP is not set
+# BR2_TARGET_ROOTFS_EXT2 is not set
+# BR2_TARGET_ROOTFS_JFFS2 is not set
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f800
+BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048
+# BR2_TARGET_ROOTFS_UBIFS_RT_NONE is not set
+# BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB is not set
+BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
+BR2_TARGET_ROOTFS_UBIFS_NONE=y
+# BR2_TARGET_ROOTFS_UBIFS_GZIP is not set
+# BR2_TARGET_ROOTFS_UBIFS_BZIP2 is not set
+# BR2_TARGET_ROOTFS_UBIFS_LZMA is not set
+# BR2_TARGET_ROOTFS_UBI is not set
+# BR2_TARGET_ROOTFS_SQUASHFS is not set
+BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_TAR_NONE=y
+# BR2_TARGET_ROOTFS_TAR_GZIP is not set
+# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
+# BR2_TARGET_ROOTFS_TAR_LZMA is not set
+BR2_TARGET_ROOTFS_TAR_OPTIONS=""
+# BR2_TARGET_ROOTFS_CPIO is not set
+# BR2_TARGET_ROOTFS_INITRAMFS is not set
+# BR2_TARGET_ROOTFS_ROMFS is not set
+
+#
+# Bootloaders
+#
+BR2_TARGET_AT91BOOTSTRAP=y
+BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/usb-a9263/"
+BR2_TARGET_AT91BOOTSTRAP_BOARD="usb_a9263"
+# BR2_TARGET_AT91BOOTSTRAP_DATAFLASH is not set
+BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
+BR2_TARGET_AT91BOOTSTRAP_MEMORY="nandflash"
+# BR2_TARGET_AT91DATAFLASHBOOT is not set
+BR2_TARGET_BAREBOX=y
+# BR2_TARGET_BAREBOX_2012_02 is not set
+# BR2_TARGET_BAREBOX_2012_03 is not set
+BR2_TARGET_BAREBOX_2012_04=y
+# BR2_TARGET_BAREBOX_CUSTOM_TARBALL is not set
+# BR2_TARGET_BAREBOX_CUSTOM_GIT is not set
+BR2_TARGET_BAREBOX_VERSION="2012.04.0"
+BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR=""
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9263"
+# BR2_TARGET_BAREBOX_BAREBOXENV is not set
+# BR2_TARGET_LPC32XXCDL is not set
+# BR2_TARGET_UBOOT is not set
+
+#
+# Kernel
+#
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_3_4=y
+# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
+# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
+# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
+# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
+BR2_LINUX_KERNEL_VERSION="3.4.4"
+BR2_LINUX_KERNEL_PATCH=""
+# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9263/usb-a9263_defconfig"
+BR2_LINUX_KERNEL_UIMAGE=y
+# BR2_LINUX_KERNEL_ZIMAGE is not set
+# BR2_LINUX_KERNEL_VMLINUX is not set
+# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
+# BR2_LINUX_KERNEL_INSTALL_TARGET is not set
+
+#
+# Linux Kernel Extensions
+#
+# BR2_LINUX_KERNEL_EXT_XENOMAI is not set
+# BR2_LINUX_KERNEL_EXT_OCF_LINUX is not set
+# BR2_LINUX_KERNEL_EXT_RTAI is not set
-- 
1.5.6.3

From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 02:42:34 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20070815094234.92943A45F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 02:42:33 -0700 (Wed, 15 Aug 2007)
New Revision: 19512

Log:
Add programmable start adr/size to at91bootstrap + support for at91sam9260pf

Added:
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.1.patch
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.2.patch

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2007-08-15 09:40:59 UTC (rev 19511)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2007-08-15 09:42:33 UTC (rev 19512)
@@ -1,5 +1,5 @@
 config BR2_TARGET_AT91BOOTSTRAP
-	depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9260DFC || \
+	depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9260DFC || BR2_TARGET_AT91SAM9260PF || \
 	BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK
 	bool "Build AT91 Bootstrap for selected chip"
 
@@ -26,8 +26,8 @@
 	bool "NAND Flash"
 
 config BR2_TARGET_AT91BOOT_FLASH
-        depends on BR2_TARGET_AT91SAM9XEEK
-	bool "Internal Flash"
+        depends on BR2_TARGET_AT91SAM9XEEK || BR2_TARGET_AT91SAM9260PF
+	bool "Internal Flash or external parallel flash"
 
 endchoice
 
@@ -37,3 +37,47 @@
 	default	"dataflashcard"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	default	"nandflash"	if	BR2_TARGET_AT91BOOT_NANDFLASH
 	default	"flash"		if	BR2_TARGET_AT91BOOT_FLASH
+
+config	BR2_AT91BOOTSTRAP_IMG_SIZE
+	string	"Image Size to copy to SDRAM"
+	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASH || BR2_TARGET_AT91BOOT_DATAFLASHCARD
+	default	"0x30000"	if	BR2_TARGET_AT91BOOT_NANDFLASH
+	default	"0x100000"	if	BR2_TARGET_AT91BOOT_FLASH
+	depends BR2_TARGET_AT91BOOTSTRAP
+	help
+	  Select the size of your application
+	  AT91 Bootstrap will copy this amount from flash to SDRAM
+
+choice	
+	prompt "Start address of application"
+	default BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
+	depends on BR2_TARGET_AT91BOOTSTRAP
+	help
+	  Select Chip for which AT91 bootstrap should be built
+	  Currently supports AT91SAM9260EK, AT91SAM9261EK, AT91SAM9XEEK, AT91SAM9263EK
+
+config	BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
+	bool "Copy to the default U-Boot start location in the SDRAM"
+	help
+	  This is where you copy the U-Boot boot loader
+
+config	BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM
+	bool "Copy to the last Megabyte of the SDRAM"
+	help
+	  This is where you copy a boot loader
+
+config	BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
+	bool "Copy to the start of the SDRAM"
+	help
+	  This is where you copy a standalone application
+endchoice
+
+config	BR2_AT91BOOTSTRAP_JUMP_ADDR
+	string
+	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
+	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM	
+	default "0x20000000" if BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
+	depends on BR2_TARGET_AT91BOOTSTRAP
+
+comment "It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)"
+

Added: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.1.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.1.patch	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.1.patch	2007-08-15 09:42:33 UTC (rev 19512)
@@ -0,0 +1,223 @@
+diff -urN at91bootstrap-2.3/board/at91sam9260ek/dataflash/at91sam9260ek.h at91bootstrap-2.3.1/board/at91sam9260ek/dataflash/at91sam9260ek.h
+--- at91bootstrap-2.3/board/at91sam9260ek/dataflash/at91sam9260ek.h	2007-04-22 13:42:03.000000000 +0200
++++ at91bootstrap-2.3.1/board/at91sam9260ek/dataflash/at91sam9260ek.h	2007-08-14 15:33:06.000000000 +0200
+@@ -74,12 +74,21 @@
+ /* BootStrap Settings                                                  */
+ /*                                                                     */
+ /* ******************************************************************* */
++#define MACH_TYPE       	0x44B		/* AT91SAM9260-EK */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x30000			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x8400		/* Image Address in DataFlash */
+ 
+-#define MACH_TYPE       	0x44B       		/* AT91SAM9260-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#if	defined(IMG_SIZE)
++#warning			"IMG_SIZE redefined"
++#else
++#define	IMG_SIZE		0x32000		/* Image Size in DataFlash    */
++#endif
++
++#if	defined(JUMP_ADDR)
++#warning			"JUMP_ADDR redefined"
++#else
++#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#endif
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff -urN at91bootstrap-2.3/board/at91sam9260ek/dataflashcard/at91sam9260ek.h at91bootstrap-2.3.1/board/at91sam9260ek/dataflashcard/at91sam9260ek.h
+--- at91bootstrap-2.3/board/at91sam9260ek/dataflashcard/at91sam9260ek.h	2007-04-22 13:42:15.000000000 +0200
++++ at91bootstrap-2.3.1/board/at91sam9260ek/dataflashcard/at91sam9260ek.h	2007-08-14 15:31:04.000000000 +0200
+@@ -74,12 +74,21 @@
+ /* BootStrap Settings                                                  */
+ /*                                                                     */
+ /* ******************************************************************* */
++#define MACH_TYPE       	0x44B		/* AT91SAM9260-EK */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x30000			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x8400		/* Image Address in DataFlash */
+ 
+-#define MACH_TYPE       	0x44B       		/* AT91SAM9260-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#if	defined(IMG_SIZE)
++#warning			"IMG_SIZE redefined"
++#else
++#define	IMG_SIZE		0x32000		/* Image Size in DataFlash    */
++#endif
++
++#if	defined(JUMP_ADDR)
++#warning			"JUMP_ADDR redefined"
++#else
++#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#endif
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff -urN at91bootstrap-2.3/board/at91sam9260ek/nandflash/at91sam9260ek.h at91bootstrap-2.3.1/board/at91sam9260ek/nandflash/at91sam9260ek.h
+--- at91bootstrap-2.3/board/at91sam9260ek/nandflash/at91sam9260ek.h	2007-04-22 13:54:38.000000000 +0200
++++ at91bootstrap-2.3.1/board/at91sam9260ek/nandflash/at91sam9260ek.h	2007-08-14 15:28:19.000000000 +0200
+@@ -116,11 +116,21 @@
+ /* BootStrap Settings                                                  */
+ /*                                                                     */
+ /* ******************************************************************* */
++#define MACH_TYPE      		0x44B       	/* AT91SAM9260-EK */
++
+ #define IMG_ADDRESS 		0x20000		/* Image Address in NandFlash */
++
++#if	defined(IMG_SIZE)
++#warning			"IMG_SIZE redefined"
++#else
+ #define	IMG_SIZE		0x30000		/* Image Size in NandFlash    */
++#endif
+ 
+-#define MACH_TYPE       0x44B       /* AT91SAM9260-EK */
++#if	defined(JUMP_ADDR)
++#warning			"JUMP_ADDR redefined"
++#else
+ #define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#endif
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff -urN at91bootstrap-2.3/board/at91sam9261ek/dataflash/at91sam9261ek.h at91bootstrap-2.3.1/board/at91sam9261ek/dataflash/at91sam9261ek.h
+--- at91bootstrap-2.3/board/at91sam9261ek/dataflash/at91sam9261ek.h	2007-04-22 13:54:21.000000000 +0200
++++ at91bootstrap-2.3.1/board/at91sam9261ek/dataflash/at91sam9261ek.h	2007-08-14 15:29:35.000000000 +0200
+@@ -94,12 +94,21 @@
+ /* BootStrap Settings                                                  */
+ /*                                                                     */
+ /* ******************************************************************* */
++#define MACH_TYPE       	0x350		/* AT91SAM9261-EK */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x32000			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x8400		/* Image Address in DataFlash */
+ 
+-#define MACH_TYPE       0x350       /* AT91SAM9261-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#if	defined(IMG_SIZE)
++#warning			"IMG_SIZE redefined"
++#else
++#define	IMG_SIZE		0x32000		/* Image Size in DataFlash    */
++#endif
++
++#if	defined(JUMP_ADDR)
++#warning			"JUMP_ADDR redefined"
++#else
++#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#endif
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff -urN at91bootstrap-2.3/board/at91sam9261ek/nandflash/at91sam9261ek.h at91bootstrap-2.3.1/board/at91sam9261ek/nandflash/at91sam9261ek.h
+--- at91bootstrap-2.3/board/at91sam9261ek/nandflash/at91sam9261ek.h	2007-04-22 13:54:09.000000000 +0200
++++ at91bootstrap-2.3.1/board/at91sam9261ek/nandflash/at91sam9261ek.h	2007-08-14 15:26:21.000000000 +0200
+@@ -137,11 +137,21 @@
+ /* BootStrap Settings                                                  */
+ /*                                                                     */
+ /* ******************************************************************* */
++#define MACH_TYPE       	0x350       	/* AT91SAM9261-EK */
++
+ #define IMG_ADDRESS 		0x20000		/* Image Address in NandFlash */
++
++#if	defined(IMG_SIZE)
++#warning			"IMG_SIZE redefined"
++#else
+ #define	IMG_SIZE		0x30000		/* Image Size in NandFlash    */
++#endif
+ 
+-#define MACH_TYPE       	0x350       	/* AT91SAM9261-EK */
++#if	defined(JUMP_ADDR)
++#warning			"JUMP_ADDR redefined"
++#else
+ #define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#endif
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff -urN at91bootstrap-2.3/board/at91sam9263ek/dataflash/at91sam9263ek.h at91bootstrap-2.3.1/board/at91sam9263ek/dataflash/at91sam9263ek.h
+--- at91bootstrap-2.3/board/at91sam9263ek/dataflash/at91sam9263ek.h	2007-04-22 13:53:52.000000000 +0200
++++ at91bootstrap-2.3.1/board/at91sam9263ek/dataflash/at91sam9263ek.h	2007-08-14 15:29:05.000000000 +0200
+@@ -94,12 +94,21 @@
+ /* BootStrap Settings                                                  */
+ /*                                                                     */
+ /* ******************************************************************* */
++#define MACH_TYPE       	0x4B2       	/* AT91SAM9263-EK */
+ 
+-#define IMG_ADDRESS 			0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE			0x32000			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x8400		/* Image Address in DataFlash */
+ 
+-#define MACH_TYPE       		0x4B2       		/* AT91SAM9263-EK */
+-#define JUMP_ADDR			0x23F00000		/* Final Jump Address 	      */
++#if	defined(IMG_SIZE)
++#warning			"IMG_SIZE redefined"
++#else
++#define	IMG_SIZE		0x32000		/* Image Size in DataFlash    */
++#endif
++
++#if	defined(JUMP_ADDR)
++#warning			"JUMP_ADDR redefined"
++#else
++#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#endif
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff -urN at91bootstrap-2.3/Makefile at91bootstrap-2.3.1/Makefile
+--- at91bootstrap-2.3/Makefile	2007-04-22 13:47:48.000000000 +0200
++++ at91bootstrap-2.3.1/Makefile	2007-08-14 16:14:14.000000000 +0200
+@@ -8,7 +8,7 @@
+ 
+ TOPDIR	:=	$(CURDIR)
+ 
+-VERSION:=2.3
++VERSION:=2.3.1
+ 
+ include	.config
+ 
+@@ -63,7 +63,8 @@
+ CPPFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET)		\
+ 	-I$(INCL) -Iinclude				\
+ 	-DTOP_OF_MEM=$(TOP_OF_MEMORY) 			\
+-	-D$(SPI_MODE) -D$(SPI_BOOT) -DSPI_CLK=$(SPI_CLK)
++	-D$(SPI_MODE) -D$(SPI_BOOT) -DSPI_CLK=$(SPI_CLK) \
++	$(AT91_CUSTOM_FLAGS)
+ 
+ ASFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -Iinclude -DTOP_OF_MEM=$(TOP_OF_MEMORY)
+ 
+@@ -141,9 +142,6 @@
+ toolchain:	../buildroot/.config
+ 	make -C ../buildroot
+ 
+-tarball:
+-	./tarball.sh
+-
+ #	echo $PCK 1  $(PCK) 2  ${PCK} 3 $$PCK 4  $$(PCK) 5  $${PCK}  )
+ 	
+ #	cd .. ; tar -cvf `basename $$(TOPDIR)`.tar `basename $$(TOPDIR)` ; bzip2 `basename $$(TOPDIR)`.tar )
+@@ -177,4 +175,4 @@
+ 	tar --force-local -cvf $$F.tar $$F; \
+ 	rm -f $$F.tar.bz2 ; \
+ 	bzip2 $$F.tar ; \
+-	mv -f $$F.tar.bz2 /usr/local/install/downloads
++	cp -f $$F.tar.bz2 /usr/local/install/downloads
+diff -urN at91bootstrap-2.3/tarball.sh at91bootstrap-2.3.1/tarball.sh
+--- at91bootstrap-2.3/tarball.sh	2007-03-25 17:09:37.000000000 +0200
++++ at91bootstrap-2.3.1/tarball.sh	1970-01-01 01:00:00.000000000 +0100
+@@ -1,13 +0,0 @@
+-#!/bin/bash
+-TOPDIR=`pwd`
+-DATE=`date +%F`
+-PACKAGE=`basename ${TOPDIR}`
+-TARBALL=${PACKAGE}-${DATE}
+-
+-
+-make clean
+-cd ..
+-tar -cvf ${PACKAGE}.tar ${PACKAGE}
+-mv	${PACKAGE}.tar	${TARBALL}.tar
+-rm -f  ${TARBALL}.tar.bz2
+-bzip2 ${TARBALL}.tar

Added: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.2.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.2.patch	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap-2.3.2.patch	2007-08-15 09:42:33 UTC (rev 19512)
@@ -0,0 +1,506 @@
+diff -urN at91bootstrap-2.3/board/at91sam9260ek/at91sam9260ek.c at91bootstrap-2.3.2/board/at91sam9260ek/at91sam9260ek.c
+--- at91bootstrap-2.3/board/at91sam9260ek/at91sam9260ek.c	2007-03-28 16:05:09.000000000 +0200
++++ at91bootstrap-2.3.2/board/at91sam9260ek/at91sam9260ek.c	2007-08-14 23:20:24.000000000 +0200
+@@ -47,7 +47,9 @@
+ #ifdef CFG_DATAFLASH
+ #include "../../include/dataflash.h"
+ #endif
+-
++#ifdef CFG_FLASH
++#include "../../include/flash.h"
++#endif
+ static inline unsigned int get_cp15(void)
+ {
+ 	unsigned int value;
+@@ -129,6 +131,10 @@
+ 				(MASTER_CLOCK * 7)/1000000);	/* Refresh Timer Register */
+ 
+ #endif /* CFG_SDRAM */
++
++#ifdef	CFG_FLASH
++	flash_hw_init();
++#endif
+ }
+ #endif /* CFG_HW_INIT */
+ 
+@@ -221,7 +227,24 @@
+ }
+ #endif /* CFG_DATAFLASH */
+ 
++#ifdef CFG_FLASH
++
++/*------------------------------------------------------------------------------*/
++/* \fn    flash_hw_init								*/
++/* \brief This function performs Flash HW initialization			*/
++/*------------------------------------------------------------------------------*/
++void flash_hw_init(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc flash_pio[] = {
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	pio_setup(flash_pio);
++}
+ 
++#endif /* CFG_FLASH */
+ 
+ #ifdef CFG_NANDFLASH
+ /*------------------------------------------------------------------------------*/
+diff -urN at91bootstrap-2.3/board/at91sam9260ek/flash/at91sam9260ek.h at91bootstrap-2.3.2/board/at91sam9260ek/flash/at91sam9260ek.h
+--- at91bootstrap-2.3/board/at91sam9260ek/flash/at91sam9260ek.h	1970-01-01 01:00:00.000000000 +0100
++++ at91bootstrap-2.3.2/board/at91sam9260ek/flash/at91sam9260ek.h	2007-08-14 22:53:58.000000000 +0200
+@@ -0,0 +1,88 @@
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
++ * - Redistributions in binary form must reproduce the above copyright notice,
++ * this list of conditions and the disclaimer below in the documentation and/or
++ * other materials provided with the distribution.
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
++ * File Name           : at91sam9260ek.h
++ * Object              :
++ * Creation            : NLe Jul 13th 2006
++ *-----------------------------------------------------------------------------
++ */
++#ifndef _AT91SAM9260EK_H
++#define _AT91SAM9260EK_H
++/* ******************************************************************* */
++/* PMC Settings                                                        */
++/*                                                                     */
++/* The main oscillator is enabled as soon as possible in the c_startup */
++/* and MCK is switched on the main oscillator.                         */
++/* PLL initialization is done later in the hw_init() function          */
++/* ******************************************************************* */
++#define MASTER_CLOCK		(198656000/2)
++
++#define PLL_LOCK_TIMEOUT	1000000
++
++#define PLLA_SETTINGS	0x2060BF09
++#define PLLB_SETTINGS	0x10483F0E
++
++/* Switch MCK on PLLA output PCK = PLLA = 2 * MCK */
++#define MCKR_SETTINGS	(AT91C_PMC_CSS_PLLA_CLK | AT91C_PMC_PRES_CLK | AT91C_PMC_MDIV_2)
++
++/* Flash settings - Use a default, which hopefully works for all AT91 chips */
++#include	"smc0_setup.h"
++
++
++/* ******************************************************************* */
++/* BootStrap Settings                                                  */
++/*                                                                     */
++/* ******************************************************************* */
++#define MACH_TYPE       	0x44B		/* AT91SAM9260-EK */
++
++#define IMG_ADDRESS 		0x8000		/* Image Address in Flash */
++
++#if	defined(IMG_SIZE)
++#warning			"IMG_SIZE redefined"
++#else
++#define	IMG_SIZE		0x38000		/* Image Size in Flash    */
++#endif
++
++#if	defined(JUMP_ADDR)
++#warning			"JUMP_ADDR redefined"
++#else
++#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#endif
++
++/* ******************************************************************* */
++/* Application Settings                                                */
++/* ******************************************************************* */
++#define CFG_DEBUG
++#define CFG_FLASH
++#define	CFG_SDRAM
++#define	CFG_HW_INIT
++
++#endif	/* _AT91SAM9260EK_H */
+diff -urN at91bootstrap-2.3/crt0_gnu.S at91bootstrap-2.3.2/crt0_gnu.S
+--- at91bootstrap-2.3/crt0_gnu.S	2006-12-05 11:27:24.000000000 +0100
++++ at91bootstrap-2.3.2/crt0_gnu.S	2007-08-14 23:23:49.000000000 +0200
+@@ -84,6 +84,13 @@
+ _init_stack:
+ 	ldr     sp,=TOP_OF_MEM
+ 
++/* Initialize the SMC BEFORE we change the clock */
++#ifdef	CFG_FLASH
++	ldr     r4, = smc0_hw_init
++	mov     lr, pc
++	bx      r4
++#endif
++
+ /* Test if main oscillator is enabled */
+ 	ldr 	r0,=AT91C_PMC_SR
+ 	ldr 	r1, [r0]
+diff -urN at91bootstrap-2.3/driver/driver.mk at91bootstrap-2.3.2/driver/driver.mk
+--- at91bootstrap-2.3/driver/driver.mk	2007-03-25 16:24:08.000000000 +0200
++++ at91bootstrap-2.3.2/driver/driver.mk	2007-08-14 21:17:53.000000000 +0200
+@@ -1,10 +1,11 @@
+ # Makefile for AT91-Bootstrap drivers directory
+ 
+-COBJS-y								+=	driver/debug.o
+-COBJS-y								+=	driver/gpio.o
+-COBJS-y								+=	driver/pmc.o
+-COBJS-y								+=	driver/sdramc.o
+-COBJS-y								+=	driver/string.o
+-COBJS-y								+=	driver/udiv.o
+-COBJS-$(CONFIG_NANDFLASH)		+=	driver/nandflash.o
+-COBJS-$(CONFIG_DATAFLASH)			+=	driver/dataflash.o
++COBJS-y				+=	driver/debug.o
++COBJS-y				+=	driver/gpio.o
++COBJS-y				+=	driver/pmc.o
++COBJS-y				+=	driver/sdramc.o
++COBJS-y				+=	driver/string.o
++COBJS-y				+=	driver/udiv.o
++COBJS-$(CONFIG_NANDFLASH)	+=	driver/nandflash.o
++COBJS-$(CONFIG_DATAFLASH)	+=	driver/dataflash.o
++COBJS-$(CONFIG_FLASH)		+=	driver/flash.o
+diff -urN at91bootstrap-2.3/driver/flash.c at91bootstrap-2.3.2/driver/flash.c
+--- at91bootstrap-2.3/driver/flash.c	1970-01-01 01:00:00.000000000 +0100
++++ at91bootstrap-2.3.2/driver/flash.c	2007-08-14 23:20:29.000000000 +0200
+@@ -0,0 +1,132 @@
++/* ----------------------------------------------------------------------------
++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
++ * ----------------------------------------------------------------------------
++ * Copyright (c) 2007, Atmel Corporation
++
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *
++ * - Redistributions of source code must retain the above copyright notice,
++ * this list of conditions and the disclaiimer below.
++ *
++ * - Redistributions in binary form must reproduce the above copyright notice,
++ * this list of conditions and the disclaimer below in the documentation and/or
++ * other materials provided with the distribution.
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
++ * File Name           : flash.c
++ * Object              : Flash High level functions
++ * Creation            : USa Aug 14th 2007
++ *---------------------------------------------------------------------------
++*/
++
++#include "../include/part.h"
++#include "../include/main.h"
++#include "../include/flash.h"
++#include "../include/smc.h"
++#include <stdlib.h>
++
++#ifdef CFG_FLASH
++
++/*------------------------------------------------------------------------------*/
++/* \fn    smc0_hw_init								*/
++/* \brief This function performs Static Memory Controller HW initialization	*/
++/* It should be executed BEFORE the slow clock is changed			*/
++/* WARNING: The C_Startup has done VERY LITTLE at this point			*/
++/*------------------------------------------------------------------------------*/
++void smc0_hw_init(void)
++{
++	/* The SMC is either clocked by the Slow clock or by MCLK
++	 * MCLK is typically 100 MHz
++	 */
++
++unsigned int	setup0,pulse0,cycle0,mode0;
++
++	writel(readl(AT91C_BASE_CCFG + CCFG_EBICSA) |DATABUS_PULLUP_ON|MEMORY_VOLTAGE_3_3V , AT91C_BASE_CCFG + CCFG_EBICSA);
++
++	/* Check : SETUP + PULSE <= CYCLE ! */
++
++	setup0	=	
++		((NCS_READ_SETUP & 0x3F)	<< 24)	|	// (128 * bit[5]) + bit[4:0]
++		((NRD_SETUP	 & 0x3F)	<< 16)	|	// (128 * bit[5]) + bit[4:0]
++		((NCS_WR_SETUP	 & 0x3F)	<<  8)	|	// (128 * bit[5]) + bit[4:0]
++		((NWE_SETUP	 & 0x3F)	<<  0);		// (128 * bit[5]) + bit[4:0]
++	writel(setup0, AT91C_BASE_SMC + SMC_SETUP0);
++	
++	pulse0	= 
++		((NCS_READ_PULSE & 0x3F)	<< 24)	|	// (128 * bit[5]) + bit[4:0]
++		((NRD_PULSE	 & 0x3F)	<< 16)	|	// (128 * bit[5]) + bit[4:0]
++		((NCS_WR_PULSE	 & 0x3F)	<<  8)	|	// (128 * bit[5]) + bit[4:0]
++		((NWE_PULSE	 & 0x3F)	<<  0);		// (128 * bit[5]) + bit[4:0]
++	writel(pulse0, AT91C_BASE_SMC + SMC_PULSE0);
++
++	cycle0	= 
++		((NRD_CYCLE	 & 0x1FF)	<< 16)	|	// (256 * bit[8:7]) + bit[6:0]
++		((NWE_CYCLE	 & 0x1FF)	<<  0);		// (256 * bit[8:7]) + bit[6:0]
++	writel(cycle0, AT91C_BASE_SMC + SMC_CYCLE0);
++
++	mode0	= (PS|PMEN|TDF_MODE|TDF_CYCLES|DBW|BAT|EXNW_MODE|WRITE_MODE|READ_MODE);
++	writel(mode0, AT91C_BASE_SMC + SMC_CTRL0);
++}
++
++/*------------------------------------------------------------------------------*/
++/* \fn    flash_is_boot_valid							*/
++/* \brief Check that the first bytes of the buffer are valid ARM vectors	*/
++/*------------------------------------------------------------------------------*/
++static unsigned int flash_is_boot_valid(unsigned char *buffer)
++{
++	int i = 3;
++
++ 	/* Verify if the 28 first bytes of the sram correspond to ARM vectors
++	   The sixth ARM vector contain the size of the code */
++    	while(i < 28)
++    	{
++		if (i != 23)
++		{
++			if ((buffer[i] != 0xEA) && (buffer[i] != 0xE5) )
++				return -1;
++		}
++		i+=4;
++    	}
++
++    	return 0;
++}
++
++/*------------------------------------------------------------------------------*/
++/* \fn    load_flash								*/
++/* \brief This function loads flash content to specified address		*/
++/*------------------------------------------------------------------------------*/	
++int load_flash(unsigned int img_addr, unsigned int img_size, unsigned int img_dest)
++{
++	unsigned char *src, *dst;
++	src = (unsigned char *) img_addr;
++	dst = (unsigned char *) img_dest;
++
++	flash_hw_init();
++
++	if (flash_is_boot_valid((unsigned char*)img_addr))
++		return -1;
++
++	while (img_size > 0) {
++		*dst++ = *src++;
++		img_size--;
++	}
++   	return 0;
++}
++
++#endif /* CFG_FLASH */
+diff -urN at91bootstrap-2.3/include/AT91SAM9260_inc.h at91bootstrap-2.3.2/include/AT91SAM9260_inc.h
+--- at91bootstrap-2.3/include/AT91SAM9260_inc.h	2006-12-05 11:27:20.000000000 +0100
++++ at91bootstrap-2.3.2/include/AT91SAM9260_inc.h	2007-08-14 23:05:19.000000000 +0200
+@@ -463,7 +463,7 @@
+ #define 	AT91C_EBI_CS5A_SMC                  (0x0 <<  5) // (CCFG) Chip Select 5 is only assigned to the Static Memory Controller and NCS5 behaves as defined by the SMC
+ #define 	AT91C_EBI_CS5A_CF                   (0x1 <<  5) // (CCFG) Chip Select 5 is assigned to the Static Memory Controller and the CompactFlash Logic (second slot) is activated.
+ #define AT91C_EBI_DBPUC           (0x1 <<  8) // (CCFG) Data Bus Pull-up Configuration
+-
++#define	AT91C_EBI_VDDIOMSEL	  (0x1 << 16)
+ // *****************************************************************************
+ //              SOFTWARE API DEFINITION  FOR Peripheral DMA Controller
+ // *****************************************************************************
+diff -urN at91bootstrap-2.3/include/flash.h at91bootstrap-2.3.2/include/flash.h
+--- at91bootstrap-2.3/include/flash.h	1970-01-01 01:00:00.000000000 +0100
++++ at91bootstrap-2.3.2/include/flash.h	2007-08-14 23:20:11.000000000 +0200
+@@ -0,0 +1,41 @@
++/* ----------------------------------------------------------------------------
++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
++ * ----------------------------------------------------------------------------
++ * Copyright (c) 2007, Atmel Corporation
++
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *
++ * - Redistributions of source code must retain the above copyright notice,
++ * this list of conditions and the disclaiimer below.
++ *
++ * - Redistributions in binary form must reproduce the above copyright notice,
++ * this list of conditions and the disclaimer below in the documentation and/or
++ * other materials provided with the distribution.
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
++ * File Name           : flash.h
++ * Object              : ATMEL Flash Header File
++ * Creation            : USa Aug 14th 2007
++ *---------------------------------------------------------------------------
++*/
++#ifndef _FLASH_H
++#define _FLASH_H
++extern void flash_hw_init(void);
++extern int load_flash(unsigned int img_addr, unsigned int img_size, unsigned int img_dest);
++#endif
+diff -urN at91bootstrap-2.3/include/smc0_setup.h at91bootstrap-2.3.2/include/smc0_setup.h
+--- at91bootstrap-2.3/include/smc0_setup.h	1970-01-01 01:00:00.000000000 +0100
++++ at91bootstrap-2.3.2/include/smc0_setup.h	2007-08-14 22:54:21.000000000 +0200
+@@ -0,0 +1,32 @@
++/* ******************************************************************* */
++/* SMC0 Settings                                                       */
++/* We use this as a default for all				       */
++/* ******************************************************************* */
++
++#ifndef _SMC0_SETUP_H
++#define _SMC0_SETUP_H
++
++#define	NCS_READ_SETUP	_ns(10)
++#define	NRD_SETUP	_ns(20)
++#define	NCS_WR_SETUP	_ns(10)
++#define	NWE_SETUP	_ns(20)
++
++#define	NCS_READ_PULSE	_ns(100)
++#define	NRD_PULSE	_ns(100)
++#define	NCS_WR_PULSE	_ns(100)
++#define	NWE_PULSE	_ns(100)
++
++#define	NRD_CYCLE	_ns(140)
++#define	NWE_CYCLE	_ns(140)
++
++#define PS		AT91C_SMC_PS_SIZE_SIXTEEN_BYTES
++#define PMEN		PAGE_MODE_OFF
++#define TDF_MODE	TDF_OPTIMIZATION_OFF
++#define TDF_CYCLES	_ns(60)
++#define DBW		AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS
++#define BAT		AT91C_SMC_BAT_BYTE_SELECT
++#define EXNW_MODE	AT91C_SMC_NWAITM_NWAIT_DISABLE
++#define WRITE_MODE	CONTROLLED_BY_NWE
++#define READ_MODE	CONTROLLED_BY_NRD
++
++#endif
+diff -urN at91bootstrap-2.3/include/smc.h at91bootstrap-2.3.2/include/smc.h
+--- at91bootstrap-2.3/include/smc.h	1970-01-01 01:00:00.000000000 +0100
++++ at91bootstrap-2.3.2/include/smc.h	2007-08-14 23:05:30.000000000 +0200
+@@ -0,0 +1,19 @@
++#define	MASTER_CLOCK_CYCLE	(1000000000/MASTER_CLOCK)
++#define	_ns(x)	((x)/MASTER_CLOCK_CYCLE)
++
++#define CONTROLLED_BY_NRD	AT91C_SMC_READMODE
++#define CONTROLLED_BY_NCS_RD	0
++#define CONTROLLED_BY_NWE	AT91C_SMC_WRITEMODE
++#define CONTROLLED_BY_NCS_WR	0
++
++#define TDF_OPTIMIZATION_ON	AT91C_SMC_TDFEN
++#define TDF_OPTIMIZATION_OFF	0
++
++#define PAGE_MODE_ON		AT91C_SMC_PMEN
++#define PAGE_MODE_OFF		0
++
++#define	DATABUS_PULLUP_ON	0
++#define	DATABUS_PULLUP_OFF	AT91C_EBI_DBPUC
++
++#define	MEMORY_VOLTAGE_1_8V	0
++#define	MEMORY_VOLTAGE_3_3V	AT91C_EBI_VDDIOMSEL
+diff -urN at91bootstrap-2.3/main.c at91bootstrap-2.3.2/main.c
+--- at91bootstrap-2.3/main.c	2006-12-05 11:27:24.000000000 +0100
++++ at91bootstrap-2.3.2/main.c	2007-08-14 21:15:38.000000000 +0200
+@@ -38,6 +38,7 @@
+ #include "include/main.h"
+ #include "include/debug.h"
+ #include "include/dataflash.h"
++#include "include/flash.h"
+ #include "include/nandflash.h"
+ 
+ /*------------------------------------------------------------------------------*/
+@@ -60,6 +61,10 @@
+ 	load_df(AT91C_SPI_PCS_DATAFLASH, IMG_ADDRESS, IMG_SIZE, JUMP_ADDR);
+ #endif
+ 
++#ifdef CFG_FLASH
++	load_flash(IMG_ADDRESS, IMG_SIZE, JUMP_ADDR);
++#endif
++
+ 	/* Load from Nandflash in RAM */
+ #ifdef CFG_NANDFLASH
+ 	load_nandflash(IMG_ADDRESS, IMG_SIZE, JUMP_ADDR);
+diff -urN at91bootstrap-2.3/MAKEALL at91bootstrap-2.3.2/MAKEALL
+--- at91bootstrap-2.3/MAKEALL	2007-04-09 19:47:20.000000000 +0200
++++ at91bootstrap-2.3.2/MAKEALL	2007-08-14 22:43:19.000000000 +0200
+@@ -1,7 +1,7 @@
+ #!/bin/bash
+ 
+-make	toolchain
+-source	gcc-3.4.6-uclibc.sh
++#make	toolchain
++source	gcc-4.1.2-uclibc-external.sh
+ make	distrib
+ make	MEMORY=dataflashcard	at91sam9260dfc_defconfig
+ make
+@@ -9,6 +9,8 @@
+ make
+ make	MEMORY=nandflash	at91sam9260ek_defconfig
+ make
++make	MEMORY=flash		at91sam9260pf_defconfig
++make
+ make	MEMORY=dataflash	at91sam9261ek_defconfig
+ make
+ make	MEMORY=nandflash	at91sam9261ek_defconfig
+diff -urN at91bootstrap-2.3/Makefile at91bootstrap-2.3.2/Makefile
+--- at91bootstrap-2.3/Makefile	2007-08-14 23:53:42.000000000 +0200
++++ at91bootstrap-2.3.2/Makefile	2007-08-14 22:36:24.000000000 +0200
+@@ -8,7 +8,7 @@
+ 
+ TOPDIR	:=	$(CURDIR)
+ 
+-VERSION:=2.3.1
++VERSION:=2.3.2
+ 
+ include	.config
+ 
+@@ -114,6 +114,15 @@
+ 	echo	SPI_BOOT=SPI_BOOT_CS1		>>	.config
+ 	echo	SPI_CLK=$(CONFIG_SPI_CLK)	>>	.config
+ 
++at91sam9260pf_defconfig:	clean
++	echo	BOARDNAME=at91sam9260pf		>	.config
++	echo	BOARD=at91sam9260ek		>>	.config
++	echo	PROJECT=$(MEMORY)		>>	.config
++	echo	CONFIG_$(CFG_MEMORY)=y		>>	.config
++	echo	SPI_MODE=$(CONFIG_SPI_MODE)	>>	.config
++	echo	SPI_BOOT=SPI_BOOT_CS0		>>	.config
++	echo	SPI_CLK=$(CONFIG_SPI_CLK)	>>	.config
++
+ at91sam9261ek_defconfig:	clean
+ 	echo	BOARDNAME=at91sam9261ek		>	.config
+ 	echo	BOARD=at91sam9261ek		>>	.config

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-08-15 09:40:59 UTC (rev 19511)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-08-15 09:42:33 UTC (rev 19512)
@@ -4,6 +4,8 @@
 #
 #############################################################
 AT91BOOTSTRAP_VERSION:=2.3
+AT91BOOTSTRAP_PATCH_LEVEL:=2
+AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION).$(AT91BOOTSTRAP_PATCH_LEVEL)
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
 #"))
@@ -17,18 +19,32 @@
 AT91BOOTSTRAP_MEMORY:=$(strip  $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY)))
 #"))
 
-AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_VERSION).bin
+AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_PATCHED_VERSION).bin
 
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
 
+AT91BOOTSTRAP_JUMP_ADDR:=$(strip  $(subst ",, $(BR2_AT91BOOTSTRAP_JUMP_ADDR)))
+AT91BOOTSTRAP_IMG_SIZE:=$(strip  $(subst ",, $(BR2_AT91BOOTSTRAP_IMG_SIZE)))
+
+AT91_CUSTOM_FLAGS:=
+ifneq	($(AT91BOOTSTRAP_JUMP_ADDR),)
+AT91_CUSTOM_FLAGS+=-DJUMP_ADDR=$(AT91BOOTSTRAP_JUMP_ADDR) 
+endif
+ifneq	($(AT91BOOTSTRAP_IMG_SIZE),)
+AT91_CUSTOM_FLAGS+=-DIMG_SIZE=$(AT91BOOTSTRAP_IMG_SIZE) 
+endif
+
 $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AT91BOOTSTRAP_SITE)/$(AT91BOOTSTRAP_SOURCE)
 
 $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mkdir -p $(PROJECT_BUILD_DIR)
 	$(AT91BOOTSTRAP_ZCAT) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap\*.patch
 	touch $(AT91BOOTSTRAP_DIR)/.unpacked
 
+atbu:	$(AT91BOOTSTRAP_DIR)/.unpacked
+
 $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
 	$(MAKE)					\
 		MEMORY=$(AT91BOOTSTRAP_MEMORY)	\
@@ -41,24 +57,28 @@
 	$(MAKE)					\
 		MEMORY=$(AT91BOOTSTRAP_MEMORY)	\
 		CROSS_COMPILE=$(TARGET_CROSS)	\
+		AT91_CUSTOM_FLAGS="$(AT91_CUSTOM_FLAGS)" \
 		-C $(AT91BOOTSTRAP_DIR)
 
+$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY):	$(AT91BOOTSTRAP_TARGET)
+	mkdir -p $(BINARIES_DIR)
+	cp $(AT91BOOTSTRAP_TARGET)	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+	cp $(AT91BOOTSTRAP_TARGET)	/tftpboot/$(AT91BOOTSTRAP_BINARY)
+
+.PHONY:        at91bootstrap at91bootstrap-source
+
+at91bootstrap:	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+
 at91bootstrap-source: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 
+.PHONY:        at91bootstrap-clean at91bootstrap-dirclean
+
 at91bootstrap-clean:
 	make -C $(AT91BOOTSTRAP_DIR) clean
 
 at91bootstrap-dirclean:
 	rm -rf $(AT91BOOTSTRAP_DIR)
 
-at91bootstrap:	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-
-$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY):	$(AT91BOOTSTRAP_TARGET)
-	mkdir -p $(BINARIES_DIR)
-	cp $(AT91BOOTSTRAP_TARGET)	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-	cp $(AT91BOOTSTRAP_TARGET)	/tftpboot/$(AT91BOOTSTRAP_BINARY)
-
-.PHONY:	at91bootstrap
 #############################################################
 #
 # Toplevel Makefile options

From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Fri, 31 May 2013 18:31:08 +0200
Subject: [Buildroot] [PATCH] Add support for the Calao-systems TNY-A9G20-LPW
Message-ID: <1370017868-30944-1-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 .../at91bootstrap-1.16-tny-a9g20-lpw.patch         |  551 ++++++++++++++++++++
 board/calao/tny-a9g20-lpw/linux-3.9.config         |  187 +++++++
 configs/calao_tny_a9g20_lpw_defconfig              |   15 +
 3 files changed, 753 insertions(+)
 create mode 100644 board/calao/tny-a9g20-lpw/at91bootstrap-1.16-tny-a9g20-lpw.patch
 create mode 100644 board/calao/tny-a9g20-lpw/linux-3.9.config
 create mode 100644 configs/calao_tny_a9g20_lpw_defconfig

diff --git a/board/calao/tny-a9g20-lpw/at91bootstrap-1.16-tny-a9g20-lpw.patch b/board/calao/tny-a9g20-lpw/at91bootstrap-1.16-tny-a9g20-lpw.patch
new file mode 100644
index 0000000..71746ce
--- /dev/null
+++ b/board/calao/tny-a9g20-lpw/at91bootstrap-1.16-tny-a9g20-lpw.patch
@@ -0,0 +1,551 @@
+From 53bd82b122f4530a98cba45795832820bb1d0b45 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Mon, 13 Aug 2012 11:26:10 +0200
+Subject: [PATCH] Add support for the Calao-systems TNY-A9G20-LPW
+
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ board/tny_a9g20_lpw/nandflash/Makefile        |  121 ++++++++++++
+ board/tny_a9g20_lpw/nandflash/tny-a9g20-lpw.h |  114 ++++++++++++
+ board/tny_a9g20_lpw/tny_a9g20_lpw.c           |  243 +++++++++++++++++++++++++
+ crt0_gnu.S                                    |    6 +
+ include/part.h                                |    6 +-
+ 5 files changed, 489 insertions(+), 1 deletion(-)
+ create mode 100644 board/tny_a9g20_lpw/nandflash/Makefile
+ create mode 100644 board/tny_a9g20_lpw/nandflash/tny-a9g20-lpw.h
+ create mode 100644 board/tny_a9g20_lpw/tny_a9g20_lpw.c
+
+diff --git a/board/tny_a9g20_lpw/nandflash/Makefile b/board/tny_a9g20_lpw/nandflash/Makefile
+new file mode 100644
+index 0000000..7efbea7
+--- /dev/null
++++ b/board/tny_a9g20_lpw/nandflash/Makefile
+@@ -0,0 +1,121 @@
++# TODO: set this appropriately for your local toolchain
++ifndef ERASE_FCT
++ERASE_FCT=rm -f
++endif
++ifndef CROSS_COMPILE
++CROSS_COMPILE=arm-elf-
++endif
++
++TOOLCHAIN=gcc
++
++BOOTSTRAP_PATH=../../..
++
++# NandFlashBoot Configuration for AT91SAM9260EK
++
++# Target name (case sensitive!!!)
++TARGET=AT91SAM9G20
++# Board name (case sensitive!!!)
++BOARD=tny_a9g20_lpw
++# Link Address and Top_of_Memory
++LINK_ADDR=0x200000
++TOP_OF_MEMORY=0x301000
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
++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
++ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
++
++# Linker flags.
++#  -Wl,...:     tell GCC to pass this to linker.
++#    -Map:      create map file
++#    --cref:    add cross reference to map file
++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
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
++	$(ERASE_FCT) *.o *.bin *.elf *.map
+diff --git a/board/tny_a9g20_lpw/nandflash/tny-a9g20-lpw.h b/board/tny_a9g20_lpw/nandflash/tny-a9g20-lpw.h
+new file mode 100644
+index 0000000..b1f8a1d
+--- /dev/null
++++ b/board/tny_a9g20_lpw/nandflash/tny-a9g20-lpw.h
+@@ -0,0 +1,114 @@
++/* ----------------------------------------------------------------------------
++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
++ * ----------------------------------------------------------------------------
++ * Copyright (c) 2008, Atmel Corporation
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
++ * File Name           : tny-a9g20-lpw.h
++ * Object              :
++ * Creation            : GH August 13th 2012
++ *-----------------------------------------------------------------------------
++ */
++#ifndef _TNY_A9G20_LPW_H
++#define _TNY_A9G20_LPW_H
++
++/* ******************************************************************* */
++/* PMC Settings                                                        */
++/*                                                                     */
++/* The main oscillator is enabled as soon as possible in the c_startup */
++/* and MCK is switched on the main oscillator.                         */
++/* PLL initialization is done later in the hw_init() function          */
++/* ******************************************************************* */
++#define MASTER_CLOCK		(100000000)
++#define PLL_LOCK_TIMEOUT	1000000
++
++/* set PLLA to 800Mhz from MAINCK= 12Mhz MULA=199 (0xC7+1= 200), DIVA=0x03 (Fplla=12Mhz x [(199+1)/3]=800Mhz) */
++#define PLLA_SETTINGS   0x20C73F03
++#define PLLB_SETTINGS   0x100F3F02
++
++/* Switch MCK on PLLA output PCK = PLLA/2 = 3 * MCK */
++/* LP-SDRAM (fmax=100Mhz) PDIV=0 => PRESCALER CLK=PCLK; */
++/* MDIV = 2 => PRESCALER CLK / 4 = MCLK=100Mhz */
++/* PRESCALER CLK = PLLA (800Mhz) / 2 (PRES=1) = 400Mhz */
++#define MCKR_SETTINGS           0x0204 
++#define MCKR_CSS_SETTINGS       (AT91C_PMC_CSS_PLLA_CLK | MCKR_SETTINGS)
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
++#define NAND_DISABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_SODR = AT91C_PIO_PC14;} while(0)
++#define NAND_ENABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_CODR = AT91C_PIO_PC14;} while(0)
++
++#define NAND_WAIT_READY() while (!(*(volatile unsigned int *)AT91C_PIOC_PDSR & AT91C_PIO_PC13))
++
++
++/* ******************************************************************** */
++/* SMC Chip Select 3 Timings for NandFlash for MASTER_CLOCK = 100000000.*/
++/* Please refer to SMC section in AT91SAM9 datasheet to learn how 	*/
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
++#define IMG_ADDRESS 		0x20000			/* Image Address in NandFlash */
++#define	IMG_SIZE		0x40000			/* Image Size in NandFlash */
++
++#define MACH_TYPE		0x80B			/* TNY-A9G20 */
++#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
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
++#define	CFG_SDRAM
++#define	CFG_HW_INIT
++
++#endif	/* _TNY_A9G20_LPW_H */
+diff --git a/board/tny_a9g20_lpw/tny_a9g20_lpw.c b/board/tny_a9g20_lpw/tny_a9g20_lpw.c
+new file mode 100644
+index 0000000..cef9055
+--- /dev/null
++++ b/board/tny_a9g20_lpw/tny_a9g20_lpw.c
+@@ -0,0 +1,243 @@
++/* ----------------------------------------------------------------------------
++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
++ * ----------------------------------------------------------------------------
++ * Copyright (c) 2008, Atmel Corporation
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
++ * File Name           : tny_a9g20_lpw.c
++ * Object              :
++ * Creation            : GH August 13th 2012
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
++#ifdef CFG_HW_INIT
++/*----------------------------------------------------------------------------*/
++/* \fn    hw_init							      */
++/* \brief This function performs very low level HW initialization	      */
++/* This function is invoked as soon as possible during the c_startup	      */
++/* The bss segment must be initialized					      */
++/*----------------------------------------------------------------------------*/
++void hw_init(void)
++{
++	unsigned int cp15;
++	
++	/* Configure PIOs */
++	const struct pio_desc hw_pio[] = {
++#ifdef CFG_DEBUG
++		{"RXD", AT91C_PIN_PB(14), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"TXD", AT91C_PIN_PB(15), 0, PIO_DEFAULT, PIO_PERIPH_A},
++#endif
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Disable watchdog */
++	writel(AT91C_WDTC_WDDIS, AT91C_BASE_WDTC + WDTC_WDMR);
++
++	/* At this stage the main oscillator is supposed to be enabled
++	 * PCK = MCK = MOSC */
++	writel(0x00, AT91C_BASE_PMC + PMC_PLLICPR);
++
++	/* Configure PLLA = MOSC * (PLL_MULA + 1) / PLL_DIVA */
++	pmc_cfg_plla(PLLA_SETTINGS, PLL_LOCK_TIMEOUT);
++
++	/* PCK = PLLA/2 = 3 * MCK */
++	pmc_cfg_mck(MCKR_SETTINGS, PLL_LOCK_TIMEOUT);
++	/* Switch MCK on PLLA output */
++	pmc_cfg_mck(MCKR_CSS_SETTINGS, PLL_LOCK_TIMEOUT);
++
++	/* Configure PLLB */
++	pmc_cfg_pllb(PLLB_SETTINGS, PLL_LOCK_TIMEOUT);
++
++	/* Configure CP15 */
++	cp15 = get_cp15();
++	cp15 |= I_CACHE;
++	set_cp15(cp15);
++
++	/* Configure the PIO controller */
++	pio_setup(hw_pio);
++
++	/* Configure the EBI Slave Slot Cycle to 64 */
++	writel((readl((AT91C_BASE_MATRIX + MATRIX_SCFG3)) & ~0xFF) | 0x40, (AT91C_BASE_MATRIX + MATRIX_SCFG3));
++
++#ifdef CFG_DEBUG
++	/* Enable Debug messages on the DBGU */
++	dbg_init(BAUDRATE(MASTER_CLOCK, 115200));
++
++	dbg_print("Start AT91Bootstrap...\n\r");
++#endif /* CFG_DEBUG */
++
++#ifdef CFG_SDRAM
++	/* Initialize the matrix (slow slew rate enabled and LPSDRAM memory voltage = 1.8V) */
++	writel(((readl(AT91C_BASE_CCFG + CCFG_EBICSA)) | AT91C_EBI_CS1A_SDRAMC | (1<<17)) & ~0x00010000, AT91C_BASE_CCFG + CCFG_EBICSA);
++
++	/* Configure SDRAM Controller */
++	sdram_init(	AT91C_SDRAMC_NC_9  |
++				AT91C_SDRAMC_NR_13 |
++				AT91C_SDRAMC_CAS_3 |
++				AT91C_SDRAMC_NB_4_BANKS |
++				AT91C_SDRAMC_DBW_32_BITS |
++				AT91C_SDRAMC_TWR_2 |
++				AT91C_SDRAMC_TRC_7 |
++				AT91C_SDRAMC_TRP_2 |
++				AT91C_SDRAMC_TRCD_2 |
++				AT91C_SDRAMC_TRAS_5 |
++				AT91C_SDRAMC_TXSR_8,		/* Control Register */
++				(MASTER_CLOCK * 7)/1000000,	/* Refresh Timer Register */
++                                AT91C_SDRAMC_MD_LOW_POWER_SDRAM); /* SDRAM (low power)   */
++
++#endif /* CFG_SDRAM */
++}
++#endif /* CFG_HW_INIT */
++
++#ifdef CFG_SDRAM
++/*------------------------------------------------------------------------------*/
++/* \fn    sdramc_hw_init							*/
++/* \brief This function performs SDRAMC HW initialization			*/
++/*------------------------------------------------------------------------------*/
++void sdramc_hw_init(void)
++{
++	/* Configure PIOs */
++/*	const struct pio_desc sdramc_pio[] = {
++		{"D16", AT91C_PIN_PC(16), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D17", AT91C_PIN_PC(17), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D18", AT91C_PIN_PC(18), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D19", AT91C_PIN_PC(19), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D20", AT91C_PIN_PC(20), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D21", AT91C_PIN_PC(21), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D22", AT91C_PIN_PC(22), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D23", AT91C_PIN_PC(23), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D24", AT91C_PIN_PC(24), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D25", AT91C_PIN_PC(25), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D26", AT91C_PIN_PC(26), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D27", AT91C_PIN_PC(27), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D28", AT91C_PIN_PC(28), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D29", AT91C_PIN_PC(29), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D30", AT91C_PIN_PC(30), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"D31", AT91C_PIN_PC(31), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++*/
++	/* Configure the SDRAMC PIO controller to output PCK0 */
++/*	pio_setup(sdramc_pio); */
++
++	writel(0xFFFF0000, AT91C_BASE_PIOC + PIO_ASR(0));
++	writel(0xFFFF0000, AT91C_BASE_PIOC + PIO_PDR(0));
++
++}
++#endif /* CFG_SDRAM */
++
++#ifdef CFG_NANDFLASH
++/*------------------------------------------------------------------------------*/
++/* \fn    nand_recovery						*/
++/* \brief This function erases NandFlash Block 0 if BP4 is pressed 		*/
++/*        during boot sequence							*/
++/*------------------------------------------------------------------------------*/
++static void nand_recovery(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc bp4_pio[] = {
++		{"BP4", AT91C_PIN_PA(31), 0, PIO_PULLUP, PIO_INPUT},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	writel((1 << AT91C_ID_PIOA), PMC_PCER + AT91C_BASE_PMC);
++	pio_setup(bp4_pio);
++	
++	/* If BP4 is pressed during Boot sequence */
++	/* Erase NandFlash block 0*/
++	if (!pio_get_value(AT91C_PIN_PA(31)) )
++		AT91F_NandEraseBlock0();
++}
++
++/*------------------------------------------------------------------------------*/
++/* \fn    nandflash_hw_init							*/
++/* \brief NandFlash HW init							*/
++/*------------------------------------------------------------------------------*/
++void nandflash_hw_init(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc nand_pio[] = {
++		{"RDY_BSY", AT91C_PIN_PC(13), 0, PIO_PULLUP, PIO_INPUT},
++		{"NANDCS",  AT91C_PIN_PC(14), 0, PIO_PULLUP, PIO_OUTPUT},
++		{(char *) 0, 0, 0,  PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Setup Smart Media, first enable the address range of CS3 in HMATRIX user interface */
++	writel(readl(AT91C_BASE_CCFG + CCFG_EBICSA) | AT91C_EBI_CS3A_SM, AT91C_BASE_CCFG + CCFG_EBICSA);
++		    
++	/* Configure SMC CS3 */
++ 	writel((AT91C_SM_NWE_SETUP | AT91C_SM_NCS_WR_SETUP | AT91C_SM_NRD_SETUP | AT91C_SM_NCS_RD_SETUP), AT91C_BASE_SMC + SMC_SETUP3);
++  	writel((AT91C_SM_NWE_PULSE | AT91C_SM_NCS_WR_PULSE | AT91C_SM_NRD_PULSE | AT91C_SM_NCS_RD_PULSE), AT91C_BASE_SMC + SMC_PULSE3);
++	writel((AT91C_SM_NWE_CYCLE | AT91C_SM_NRD_CYCLE)						, AT91C_BASE_SMC + SMC_CYCLE3);
++	writel((AT91C_SMC_READMODE | AT91C_SMC_WRITEMODE | AT91C_SMC_NWAITM_NWAIT_DISABLE | 
++  		AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS | AT91C_SM_TDF)						, AT91C_BASE_SMC + SMC_CTRL3);
++
++	/* Configure the PIO controller */
++	writel((1 << AT91C_ID_PIOC), PMC_PCER + AT91C_BASE_PMC);
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
++	writel(readl(AT91C_BASE_SMC + SMC_CTRL3) | AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS, AT91C_BASE_SMC + SMC_CTRL3);
++}
++
++/*------------------------------------------------------------------------------*/
++/* \fn    nandflash_cfg_8bits_dbw_init						*/
++/* \brief Configure SMC in 8 bits mode						*/
++/*------------------------------------------------------------------------------*/
++void nandflash_cfg_8bits_dbw_init(void)
++{
++	writel((readl(AT91C_BASE_SMC + SMC_CTRL3) & ~(AT91C_SMC_DBW)) | AT91C_SMC_DBW_WIDTH_EIGTH_BITS, AT91C_BASE_SMC + SMC_CTRL3);
++}
++
++#endif /* #ifdef CFG_NANDFLASH */
+diff --git a/crt0_gnu.S b/crt0_gnu.S
+index 042b617..c6cd49d 100644
+--- a/crt0_gnu.S
++++ b/crt0_gnu.S
+@@ -106,6 +106,12 @@ _relocate_to_sram:
+ #endif /* CFG_NORFLASH */
+ 
+ _setup_clocks:
++/* Test if main osc is bypassed */
++	ldr 	r0,=AT91C_PMC_MOR
++	ldr 	r1, [r0]
++	ldr 	r2,=AT91C_CKGR_OSCBYPASS 
++	ands 	r1, r1, r2
++	bne	_init_data	/* branch if OSCBYPASS=1 */
+ /* Test if main oscillator is enabled */
+ 	ldr 	r0,=AT91C_PMC_SR
+ 	ldr 	r1, [r0]
+diff --git a/include/part.h b/include/part.h
+index ba5985a..ab79af1 100644
+--- a/include/part.h
++++ b/include/part.h
+@@ -46,7 +46,11 @@
+ 
+ #ifdef AT91SAM9G20
+ #include "AT91SAM9260_inc.h"
+-#include "at91sam9g20ek.h"
++	#ifdef at91sam9g20ek
++	#include "at91sam9g20ek.h"
++	#elif tny_a9g20_lpw
++	#include "tny-a9g20-lpw.h"
++	#endif
+ #endif
+ 
+ #ifdef AT91SAM9261
+-- 
+1.7.9.5
+
diff --git a/board/calao/tny-a9g20-lpw/linux-3.9.config b/board/calao/tny-a9g20-lpw/linux-3.9.config
new file mode 100644
index 0000000..797c15a
--- /dev/null
+++ b/board/calao/tny-a9g20-lpw/linux-3.9.config
@@ -0,0 +1,187 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_AT91=y
+CONFIG_SOC_AT91SAM9260=y
+CONFIG_SOC_AT91SAM9263=y
+CONFIG_SOC_AT91SAM9G45=y
+CONFIG_SOC_AT91SAM9X5=y
+CONFIG_SOC_AT91SAM9N12=y
+CONFIG_MACH_AT91SAM_DT=y
+CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+CONFIG_AT91_TIMER_HZ=128
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_UACCESS_WITH_MEMCPY=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_CMDLINE="console=ttyS0,115200 initrd=0x21100000,25165824 root=/dev/ram0 rw"
+CONFIG_KEXEC=y
+CONFIG_AUTO_ZRELADDR=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_DIAG is not set
+CONFIG_IPV6=y
+# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET6_XFRM_MODE_BEET is not set
+CONFIG_IPV6_SIT_6RD=y
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_ATMEL=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_GLUEBI=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_ATMEL_PWM=y
+CONFIG_ATMEL_TCLIB=y
+CONFIG_EEPROM_93CX6=m
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_NETDEVICES=y
+CONFIG_MII=y
+CONFIG_MACB=y
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+CONFIG_DAVICOM_PHY=y
+CONFIG_MICREL_PHY=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_POLLDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_SERIO is not set
+CONFIG_LEGACY_PTY_COUNT=4
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_GPIO=y
+CONFIG_SPI=y
+CONFIG_SPI_ATMEL=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_AT91SAM9X_WATCHDOG=y
+CONFIG_SSB=m
+CONFIG_FB=y
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_ATMEL=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_ATMEL_LCDC=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+CONFIG_FONT_ACORN_8x8=y
+CONFIG_FONT_MINI_4x6=y
+CONFIG_LOGO=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_ACM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_GENERIC=y
+CONFIG_USB_SERIAL_FTDI_SIO=y
+CONFIG_USB_SERIAL_PL2303=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_AT91=m
+CONFIG_USB_ETH=m
+CONFIG_USB_GADGETFS=m
+CONFIG_USB_CDC_COMPOSITE=m
+CONFIG_USB_G_ACM_MS=m
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_CDC=y
+CONFIG_MMC=y
+CONFIG_MMC_ATMELMCI=y
+CONFIG_MMC_SPI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_AT91RM9200=y
+CONFIG_RTC_DRV_AT91SAM9=y
+CONFIG_DMADEVICES=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT2_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_FTRACE is not set
+CONFIG_DEBUG_USER=y
+CONFIG_CRYPTO_ECB=y
+CONFIG_CRYPTO_ARC4=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC_CCITT=m
+CONFIG_AVERAGE=y
diff --git a/configs/calao_tny_a9g20_lpw_defconfig b/configs/calao_tny_a9g20_lpw_defconfig
new file mode 100644
index 0000000..b1b2705
--- /dev/null
+++ b/configs/calao_tny_a9g20_lpw_defconfig
@@ -0,0 +1,15 @@
+BR2_arm=y
+BR2_PACKAGE_HOST_SAM_BA=y
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_AT91BOOTSTRAP=y
+BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/tny-a9g20-lpw/"
+BR2_TARGET_AT91BOOTSTRAP_BOARD="tny_a9g20_lpw"
+BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="tny_a9g20"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/tny-a9g20-lpw/linux-3.9.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="tny_a9g20"
-- 
1.7.9.5

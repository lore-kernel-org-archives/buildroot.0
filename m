From: gregory hermant <gregory.hermant@calao-systems.com>
Date: Mon, 27 Aug 2012 17:53:16 +0200
Subject: [Buildroot] [PATCH] Add support for the HABA-KNX-LITE
Message-ID: <503B97EC.1000705@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 .../at91bootstrap-1.16-habaknxlite.patch           |  604 +++++++++++++++
 .../barebox-2012.07.0-haba-knx-lite.patch          |  624 +++++++++++++++
 board/calao/haba-knx-lite/linux-3.4.patch          |  819 ++++++++++++++++++++
 configs/calao_haba_knx_lite_defconfig              |   30 +
 4 files changed, 2077 insertions(+), 0 deletions(-)
 create mode 100644 board/calao/haba-knx-lite/at91bootstrap-1.16-habaknxlite.patch
 create mode 100644 board/calao/haba-knx-lite/barebox-2012.07.0-haba-knx-lite.patch
 create mode 100644 board/calao/haba-knx-lite/linux-3.4.patch
 create mode 100644 configs/calao_haba_knx_lite_defconfig

diff --git a/board/calao/haba-knx-lite/at91bootstrap-1.16-habaknxlite.patch b/board/calao/haba-knx-lite/at91bootstrap-1.16-habaknxlite.patch
new file mode 100644
index 0000000..22a99ed
--- /dev/null
+++ b/board/calao/haba-knx-lite/at91bootstrap-1.16-habaknxlite.patch
@@ -0,0 +1,604 @@
+From d6a62d3ef0cd3e35d91639601c68cd445acfa947 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Tue, 21 Aug 2012 08:32:20 +0200
+Subject: [PATCH] Add support for the Calao-systems HABA-KNX-LITE
+
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ board/haba_knx_lite/haba_knx_lite.c           |  300 +++++++++++++++++++++++++
+ board/haba_knx_lite/nandflash/Makefile        |  121 ++++++++++
+ board/haba_knx_lite/nandflash/haba-knx-lite.h |  110 +++++++++
+ crt0_gnu.S                                    |    6 +
+ include/part.h                                |    6 +-
+ 5 files changed, 542 insertions(+), 1 deletions(-)
+ create mode 100644 board/haba_knx_lite/haba_knx_lite.c
+ create mode 100644 board/haba_knx_lite/nandflash/Makefile
+ create mode 100644 board/haba_knx_lite/nandflash/haba-knx-lite.h
+
+diff --git a/board/haba_knx_lite/haba_knx_lite.c b/board/haba_knx_lite/haba_knx_lite.c
+new file mode 100644
+index 0000000..01a3faa
+--- /dev/null
++++ b/board/haba_knx_lite/haba_knx_lite.c
+@@ -0,0 +1,300 @@
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
++ * File Name           : haba_knx_lite.c
++ * Object              :
++ * Creation            : GH August 14th 2012
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
++	/* Initialize the matrix (memory voltage = 1.8V) */
++	writel(((readl(AT91C_BASE_CCFG + CCFG_EBICSA)) | AT91C_EBI_CS1A_SDRAMC ) & ~0x00010000, AT91C_BASE_CCFG + CCFG_EBICSA);
++
++	/* Configure SDRAM Controller */
++	sdram_init(	AT91C_SDRAMC_NC_10  |			/* SDRAM size = 128MB */
++				AT91C_SDRAMC_NR_13 |
++				AT91C_SDRAMC_CAS_3 |
++				AT91C_SDRAMC_NB_4_BANKS |
++				AT91C_SDRAMC_DBW_32_BITS |
++				AT91C_SDRAMC_TWR_3 |
++				AT91C_SDRAMC_TRC_9 |
++				AT91C_SDRAMC_TRP_3 |
++				AT91C_SDRAMC_TRCD_3 |
++				AT91C_SDRAMC_TRAS_6 |
++				AT91C_SDRAMC_TXSR_10,		/* Control Register */
++				(MASTER_CLOCK * 7)/1000000,	/* Refresh Timer Register */
++                                AT91C_SDRAMC_MD_LOW_POWER_SDRAM);         /* SDRAM (low power)   */
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
++#ifdef CFG_DATAFLASH
++
++/*------------------------------------------------------------------------------*/
++/* \fn    df_recovery								*/
++/* \brief This function erases DataFlash Page 0 if USER PB is pressed 		*/
++/*        during boot sequence							*/
++/*------------------------------------------------------------------------------*/
++void df_recovery(AT91PS_DF pDf)
++{
++#if (AT91C_SPI_PCS_DATAFLASH == AT91C_SPI_PCS1_DATAFLASH)
++	/* Configure PIOs */
++	const struct pio_desc usrpb[] = {
++		{"USRPB", AT91C_PIN_PC(3), 0, PIO_PULLUP, PIO_INPUT},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	writel((1 << AT91C_ID_PIOC), PMC_PCER + AT91C_BASE_PMC);
++	pio_setup(usrpb);
++	
++	/* If USER PB is pressed during Boot sequence */
++	/* Erase NandFlash block 0*/
++	if ( !pio_get_value(AT91C_PIN_PC(3)) )
++		df_page_erase(pDf, 0);
++#endif
++}
++
++/*------------------------------------------------------------------------------*/
++/* \fn    df_hw_init								*/
++/* \brief This function performs DataFlash HW initialization			*/
++/*------------------------------------------------------------------------------*/
++void df_hw_init(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc df_pio[] = {
++		{"MISO",  AT91C_PIN_PA(0), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"MOSI",  AT91C_PIN_PA(1), 0, PIO_DEFAULT, PIO_PERIPH_A},
++		{"SPCK",  AT91C_PIN_PA(2), 0, PIO_DEFAULT, PIO_PERIPH_A},
++#if (AT91C_SPI_PCS_DATAFLASH == AT91C_SPI_PCS0_DATAFLASH)
++		{"NPCS0", AT91C_PIN_PA(3), 0, PIO_DEFAULT, PIO_PERIPH_A},
++#endif
++#if (AT91C_SPI_PCS_DATAFLASH == AT91C_SPI_PCS1_DATAFLASH)
++		{"NPCS1", AT91C_PIN_PC(11), 0, PIO_DEFAULT, PIO_PERIPH_B},
++#endif
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	pio_setup(df_pio);
++}
++#endif /* CFG_DATAFLASH */
++
++
++
++#ifdef CFG_NANDFLASH
++/*------------------------------------------------------------------------------*/
++/* \fn    nand_recovery						*/
++/* \brief This function erases NandFlash Block 0 if USER PB is pressed 		*/
++/*        during boot sequence							*/
++/*------------------------------------------------------------------------------*/
++static void nand_recovery(void)
++{
++	/* Configure PIOs */
++	const struct pio_desc usrpb[] = {
++		{"USRPB", AT91C_PIN_PC(3), 0, PIO_PULLUP, PIO_INPUT},
++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
++	};
++
++	/* Configure the PIO controller */
++	writel((1 << AT91C_ID_PIOC), PMC_PCER + AT91C_BASE_PMC);
++	pio_setup(usrpb);
++	
++	/* If USER PB is pressed during Boot sequence */
++	/* Erase NandFlash block 0*/
++	if (!pio_get_value(AT91C_PIN_PC(3)) )
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
+diff --git a/board/haba_knx_lite/nandflash/Makefile b/board/haba_knx_lite/nandflash/Makefile
+new file mode 100644
+index 0000000..79ced0f
+--- /dev/null
++++ b/board/haba_knx_lite/nandflash/Makefile
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
++# NandFlashBoot Configuration for HABA-KNX-LITE
++
++# Target name (case sensitive!!!)
++TARGET=AT91SAM9G20
++# Board name (case sensitive!!!)
++BOARD=haba_knx_lite
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
+diff --git a/board/haba_knx_lite/nandflash/haba-knx-lite.h b/board/haba_knx_lite/nandflash/haba-knx-lite.h
+new file mode 100644
+index 0000000..4170846
+--- /dev/null
++++ b/board/haba_knx_lite/nandflash/haba-knx-lite.h
+@@ -0,0 +1,110 @@
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
++ * File Name           : haba-knx-lite.h
++ * Object              :
++ * Creation            : GH August 14th 2012
++ *-----------------------------------------------------------------------------
++ */
++#ifndef _HABA_KNX_LITE_H
++#define _HABA_KNX_LITE_H
++
++/* ******************************************************************* */
++/* PMC Settings                                                        */
++/*                                                                     */
++/* The main oscillator is enabled as soon as possible in the c_startup */
++/* and MCK is switched on the main oscillator.                         */
++/* PLL initialization is done later in the hw_init() function          */
++/* ******************************************************************* */
++#define MASTER_CLOCK		(133000000)
++#define PLL_LOCK_TIMEOUT	1000000
++
++#define PLLA_SETTINGS	0x20843F02
++#define PLLB_SETTINGS	0x100F3F02
++
++/* Switch MCK on PLLA output PCK = PLLA/2 = 3 * MCK */
++#define MCKR_SETTINGS		0x1300
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
++#define NAND_DISABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_SODR = AT91C_PIO_PC14;} while(0)
++#define NAND_ENABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_CODR = AT91C_PIO_PC14;} while(0)
++
++#define NAND_WAIT_READY() while (!(*(volatile unsigned int *)AT91C_PIOC_PDSR & AT91C_PIO_PC13))
++
++
++/* ******************************************************************** */
++/* SMC Chip Select 3 Timings for NandFlash for MASTER_CLOCK = 133000000.*/
++/* Please refer to SMC section in AT91SAM9 datasheet to learn how 	*/
++/* to generate these values. 						*/
++/* ******************************************************************** */
++#define AT91C_SM_NWE_SETUP	(2 << 0)
++#define AT91C_SM_NCS_WR_SETUP	(0 << 8)
++#define AT91C_SM_NRD_SETUP	(2 << 16)
++#define AT91C_SM_NCS_RD_SETUP	(0 << 24)
++  
++#define AT91C_SM_NWE_PULSE 	(4 << 0)
++#define AT91C_SM_NCS_WR_PULSE	(4 << 8)
++#define AT91C_SM_NRD_PULSE	(4 << 16)
++#define AT91C_SM_NCS_RD_PULSE	(4 << 24)
++  
++#define AT91C_SM_NWE_CYCLE 	(7 << 0)
++#define AT91C_SM_NRD_CYCLE	(7 << 16)
++
++#define AT91C_SM_TDF	        (3 << 16)
++
++/* ******************************************************************* */
++/* BootStrap Settings                                                  */
++/*                                                                     */
++/* ******************************************************************* */
++#define IMG_ADDRESS 		0x20000			/* Image Address in NandFlash */
++#define	IMG_SIZE		0x40000			/* Image Size in NandFlash */
++
++#define MACH_TYPE		0x10D6			/* HABA-KNX-LITE */
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
++#endif	/* _HABA_KNX_LITE_H */
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
+index ba5985a..fbcd42c 100644
+--- a/include/part.h
++++ b/include/part.h
+@@ -46,7 +46,11 @@
+ 
+ #ifdef AT91SAM9G20
+ #include "AT91SAM9260_inc.h"
+-#include "at91sam9g20ek.h"
++	#ifdef at91sam9g20ek
++	#include "at91sam9g20ek.h"
++	#else
++	#include "haba-knx-lite.h"
++	#endif
+ #endif
+ 
+ #ifdef AT91SAM9261
+-- 
+1.5.6.3
+
diff --git a/board/calao/haba-knx-lite/barebox-2012.07.0-haba-knx-lite.patch b/board/calao/haba-knx-lite/barebox-2012.07.0-haba-knx-lite.patch
new file mode 100644
index 0000000..fa602e2
--- /dev/null
+++ b/board/calao/haba-knx-lite/barebox-2012.07.0-haba-knx-lite.patch
@@ -0,0 +1,624 @@
+From cf52dfd5f252a1bc4894f7907a1753a3a82fca01 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Thu, 16 Aug 2012 11:04:46 +0200
+Subject: [PATCH] Add support for the Calao-systems HABA-KNX-LITE & EXPLORER
+
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ arch/arm/Makefile                            |    2 +
+ arch/arm/boards/haba-knx/Makefile            |    1 +
+ arch/arm/boards/haba-knx/config.h            |    6 +
+ arch/arm/boards/haba-knx/env/bin/init_board  |   49 +++++
+ arch/arm/boards/haba-knx/env/config          |   40 ++++
+ arch/arm/boards/haba-knx/init.c              |  249 ++++++++++++++++++++++++++
+ arch/arm/configs/haba_knx_explorer_defconfig |   76 ++++++++
+ arch/arm/configs/haba_knx_lite_defconfig     |   76 ++++++++
+ arch/arm/mach-at91/Kconfig                   |   14 ++
+ arch/arm/tools/mach-types                    |    2 +
+ 10 files changed, 515 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/boards/haba-knx/Makefile
+ create mode 100644 arch/arm/boards/haba-knx/config.h
+ create mode 100644 arch/arm/boards/haba-knx/env/bin/init_board
+ create mode 100644 arch/arm/boards/haba-knx/env/config
+ create mode 100644 arch/arm/boards/haba-knx/init.c
+ create mode 100644 arch/arm/configs/haba_knx_explorer_defconfig
+ create mode 100644 arch/arm/configs/haba_knx_lite_defconfig
+
+diff --git a/arch/arm/Makefile b/arch/arm/Makefile
+index 1b60261..395ad87 100644
+--- a/arch/arm/Makefile
++++ b/arch/arm/Makefile
+@@ -90,6 +90,8 @@ board-$(CONFIG_MACH_EUKREA_CPUIMX35)		:= eukrea_cpuimx35
+ board-$(CONFIG_MACH_EUKREA_CPUIMX51SD)		:= eukrea_cpuimx51
+ board-$(CONFIG_MACH_FREESCALE_MX25_3STACK)	:= freescale-mx25-3-stack
+ board-$(CONFIG_MACH_FREESCALE_MX35_3STACK)	:= freescale-mx35-3-stack
++board-$(CONFIG_MACH_HABA_KNX_EXPLORER)		:= haba-knx
++board-$(CONFIG_MACH_HABA_KNX_LITE)		:= haba-knx
+ board-$(CONFIG_MACH_IMX21ADS)			:= imx21ads
+ board-$(CONFIG_MACH_IMX27ADS)			:= imx27ads
+ board-$(CONFIG_MACH_MIOA701)			:= mioa701
+diff --git a/arch/arm/boards/haba-knx/Makefile b/arch/arm/boards/haba-knx/Makefile
+new file mode 100644
+index 0000000..eb072c0
+--- /dev/null
++++ b/arch/arm/boards/haba-knx/Makefile
+@@ -0,0 +1 @@
++obj-y += init.o
+diff --git a/arch/arm/boards/haba-knx/config.h b/arch/arm/boards/haba-knx/config.h
+new file mode 100644
+index 0000000..b91d9f5
+--- /dev/null
++++ b/arch/arm/boards/haba-knx/config.h
+@@ -0,0 +1,6 @@
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++#define AT91_MAIN_CLOCK		12000000	/* 12 MHz oscillator */
++
++#endif	/* __CONFIG_H */
+diff --git a/arch/arm/boards/haba-knx/env/bin/init_board b/arch/arm/boards/haba-knx/env/bin/init_board
+new file mode 100644
+index 0000000..0a6baf7
+--- /dev/null
++++ b/arch/arm/boards/haba-knx/env/bin/init_board
+@@ -0,0 +1,49 @@
++#!/bin/sh
++
++button_name="dfu_bp"
++button_wait=5
++
++product_id=0x1234
++vendor_id=0x4321
++
++dfu_config="/dev/nand0.barebox.bb(barebox)sr,/dev/nand0.kernel.bb(kernel)r,/dev/nand0.rootfs.bb(rootfs)r"
++
++if [ $at91_udc0.vbus != 1 ]
++then
++	echo "No USB Device cable plugged, normal boot"
++	exit
++fi
++
++gpio_get_value ${dfu_button}
++if [ $? != 0 ]
++then
++	autoboot_timeout=16
++	echo "enable tty over USB Device, increase the boot delay to ${autoboot_timeout}s"
++	usbserial
++	exit
++fi
++
++echo "${button_name} pressed detected wait ${button_wait}s"
++timeout -s -a ${button_wait}
++
++if [ $at91_udc0.vbus != 1 ]
++then
++	echo "No USB Device cable plugged, normal boot"
++	exit
++fi
++
++gpio_get_value ${dfu_button}
++if [ $? != 0 ]
++then
++	echo "${button_name} released, normal boot"
++	autoboot_timeout=16
++	echo "enable tty over USB Device, increase the boot delay to ${autoboot_timeout}s"
++	usbserial
++	exit
++fi
++
++echo ""
++echo "Start DFU Mode"
++echo ""
++
++dfu ${dfu_config} -P ${product_id} -V ${vendor_id}
+diff --git a/arch/arm/boards/haba-knx/env/config b/arch/arm/boards/haba-knx/env/config
+new file mode 100644
+index 0000000..1451842
+--- /dev/null
++++ b/arch/arm/boards/haba-knx/env/config
+@@ -0,0 +1,40 @@
++#!/bin/sh
++
++# use 'dhcp' to do dhcp in barebox and in kernel
++# use 'none' if you want to skip kernel ip autoconfiguration
++ip=dhcp-barebox
++[ x$armlinux_architecture = x3141 ] && dhcp_vendor_id=barebox-haba-knx-explorer
++[ x$armlinux_architecture = x4310 ] && dhcp_vendor_id=barebox-haba-knx-lite
++
++# or set your networking parameters here
++#eth0.ipaddr=a.b.c.d
++#eth0.netmask=a.b.c.d
++#eth0.gateway=a.b.c.d
++#eth0.serverip=a.b.c.d
++
++# can be either 'nfs', 'tftp', 'nor' or 'nand'
++kernel_loc=nfs
++# can be either 'net', 'nor', 'nand' or 'initrd'
++rootfs_loc=net
++# can be either 'nfs', 'tftp', 'nor', 'nand' or empty
++oftree_loc=none
++
++# can be either 'jffs2' or 'ubifs'
++rootfs_type=ubifs
++rootfsimage=root.$rootfs_type
++
++kernelimage=zImage
++#kernelimage=uImage
++#kernelimage=Image
++#kernelimage=Image.lzo
++
++nand_device=atmel_nand
++nand_parts="128k(at91bootstrap),256k(barebox)ro,128k(bareboxenv),128k(bareboxenv2),128k(oftree),4M(kernel),120M(rootfs),-(data)"
++rootfs_mtdblock_nand=6
++
++autoboot_timeout=3
++
++bootargs="console=ttyS0,115200"
++
++# set a fancy prompt (if support is compiled in)
++PS1="\e[1;32mbarebox@\e[1;31m\h:\w\e[0m\n# "
+diff --git a/arch/arm/boards/haba-knx/init.c b/arch/arm/boards/haba-knx/init.c
+new file mode 100644
+index 0000000..8918792
+--- /dev/null
++++ b/arch/arm/boards/haba-knx/init.c
+@@ -0,0 +1,249 @@
++/*
++ * Copyright (C) 2011-2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
++ * Copyright (C) 2012 Gregory Hermant <gregory.hermant@calao-systems.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ *
++ */
++
++#include <common.h>
++#include <net.h>
++#include <init.h>
++#include <environment.h>
++#include <asm/armlinux.h>
++#include <generated/mach-types.h>
++#include <partition.h>
++#include <fs.h>
++#include <fcntl.h>
++#include <io.h>
++#include <asm/hardware.h>
++#include <nand.h>
++#include <sizes.h>
++#include <linux/mtd/nand.h>
++#include <linux/clk.h>
++#include <mach/board.h>
++#include <mach/at91sam9_smc.h>
++#include <mach/sam9_smc.h>
++#include <gpio.h>
++#include <led.h>
++#include <mach/io.h>
++#include <mach/at91_pmc.h>
++#include <mach/at91_rstc.h>
++#include <gpio_keys.h>
++#include <readkey.h>
++
++static void haba_knx_set_board_type(void)
++{
++	if (machine_is_haba_knx_lite())
++		armlinux_set_architecture(MACH_TYPE_HABA_KNX_LITE);
++	else
++		armlinux_set_architecture(MACH_TYPE_HABA_KNX_EXPLORER);
++}
++
++static struct atmel_nand_data nand_pdata = {
++	.ale		= 21,
++	.cle		= 22,
++/*	.det_pin	= ... not connected */
++	.rdy_pin	= AT91_PIN_PC13,
++	.enable_pin	= AT91_PIN_PC14,
++	.on_flash_bbt	= 1,
++};
++
++static struct sam9_smc_config haba_knx_nand_smc_config = {
++	.ncs_read_setup		= 0,
++	.nrd_setup		= 2,
++	.ncs_write_setup	= 0,
++	.nwe_setup		= 2,
++
++	.ncs_read_pulse		= 4,
++	.nrd_pulse		= 4,
++	.ncs_write_pulse	= 4,
++	.nwe_pulse		= 4,
++
++	.read_cycle		= 7,
++	.write_cycle		= 7,
++
++	.mode			= AT91_SMC_READMODE | AT91_SMC_WRITEMODE | AT91_SMC_EXNWMODE_DISABLE | AT91_SMC_DBW_8,
++	.tdf_cycles		= 3,
++};
++
++static void haba_knx_add_device_nand(void)
++{
++	/* configure chip-select 3 (NAND) */
++	sam9_smc_configure(3, &haba_knx_nand_smc_config);
++	at91_add_device_nand(&nand_pdata);
++}
++
++static struct at91_ether_platform_data macb_pdata = {
++	.flags		= AT91SAM_ETHER_MII,
++	.phy_addr	= 0,
++};
++
++static void haba_knx_phy_reset(void)
++{
++	unsigned long rstc;
++	struct clk *clk = clk_get(NULL, "macb_clk");
++
++	clk_enable(clk);
++
++	at91_set_gpio_input(AT91_PIN_PA14, 0);
++	at91_set_gpio_input(AT91_PIN_PA15, 0);
++
++	if (machine_is_haba_knx_lite()) {
++		at91_set_gpio_input(AT91_PIN_PA17, 0);
++		at91_set_gpio_input(AT91_PIN_PA18, 0);
++	} else {
++		at91_set_gpio_input(AT91_PIN_PA25, 0);
++		at91_set_gpio_input(AT91_PIN_PA26, 0);
++	}
++
++	rstc = at91_sys_read(AT91_RSTC_MR) & AT91_RSTC_ERSTL;
++
++	/* Need to reset PHY -> 500ms reset */
++	at91_sys_write(AT91_RSTC_MR, AT91_RSTC_KEY |
++				     (AT91_RSTC_ERSTL & (0x0d << 8)) |
++				     AT91_RSTC_URSTEN);
++
++	at91_sys_write(AT91_RSTC_CR, AT91_RSTC_KEY | AT91_RSTC_EXTRST);
++
++	/* Wait for end hardware reset */
++	while (!(at91_sys_read(AT91_RSTC_SR) & AT91_RSTC_NRSTL));
++
++	/* Restore NRST value */
++	at91_sys_write(AT91_RSTC_MR, AT91_RSTC_KEY |
++				     (rstc) |
++				     AT91_RSTC_URSTEN);
++}
++
++static void haba_knx_add_device_eth(void)
++{
++	if (machine_is_haba_knx_explorer()) {
++		macb_pdata.phy_addr = 1;
++		macb_pdata.flags |= AT91SAM_ETX2_ETX3_ALTERNATIVE;
++	} else
++		macb_pdata.flags = AT91SAM_ETHER_RMII;
++
++	at91_add_device_eth(0, &macb_pdata);
++}
++
++#if defined(CONFIG_MCI_ATMEL)
++static struct atmel_mci_platform_data __initdata haba_knx_mci_data = {
++	.bus_width	= 1,
++	.detect_pin	= AT91_PIN_PC11,
++};
++
++static void haba_knx_add_device_mci(void)
++{
++	if (machine_is_haba_knx_explorer())
++		at91_add_device_mci(0, &haba_knx_mci_data);
++}
++#else
++static void haba_knx_add_device_mci(void) {}
++#endif
++
++static struct at91_usbh_data ek_usbh_data = {
++	.ports		= 2,
++};
++
++/*
++ * USB Device port
++ */
++static struct at91_udc_data __initdata ek_udc_data = {
++	.vbus_pin	= AT91_PIN_PB2,
++	.pullup_pin	= 0,		/* pull-up driven by UDC */
++};
++
++static void __init ek_add_device_udc(void)
++{
++	if (machine_is_haba_knx_explorer())
++		ek_udc_data.vbus_pin = AT91_PIN_PC5;
++	at91_add_device_udc(&ek_udc_data);
++}
++
++struct gpio_led led = {
++	.gpio = AT91_PIN_PA28,
++	.led = {
++		.name = "user_led",
++	},
++};
++
++static void __init ek_add_led(void)
++{
++	if (!machine_is_haba_knx_lite())
++		return;
++	at91_set_gpio_output(led.gpio, led.active_low);
++	led_gpio_register(&led);
++}
++
++static int haba_knx_mem_init(void)
++{
++	at91_add_device_sdram(128 * 1024 * 1024);
++	return 0;
++}
++mem_initcall(haba_knx_mem_init);
++
++static void __init ek_add_device_button(void)
++{
++	if (machine_is_haba_knx_lite()) {
++		at91_set_GPIO_periph(AT91_PIN_PC3, 1);	/* user push button, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PC3, 1);
++		export_env_ull("dfu_button", AT91_PIN_PC3);
++	} else {
++		at91_set_GPIO_periph(AT91_PIN_PB16, 1);	/* dry contact 1, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PB16, 1);
++		at91_set_GPIO_periph(AT91_PIN_PB17, 1);	/* dry contact 2, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PB17, 1);
++		at91_set_GPIO_periph(AT91_PIN_PC6, 1);	/* dry contact 3, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PC6, 1);
++		at91_set_GPIO_periph(AT91_PIN_PC7, 1);	/* dry contact 4, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PC7, 1);
++	}
++}
++
++static int haba_knx_devices_init(void)
++{
++	haba_knx_add_device_nand();
++	haba_knx_phy_reset();
++	haba_knx_add_device_eth();
++	haba_knx_add_device_mci();
++	at91_add_device_usbh_ohci(&ek_usbh_data);
++	ek_add_device_udc();
++	ek_add_led();
++	ek_add_device_button();
++
++	armlinux_set_bootparams((void *)(AT91_CHIPSELECT_1 + 0x100));
++	haba_knx_set_board_type();
++
++	devfs_add_partition("nand0", 0x00000, SZ_128K, DEVFS_PARTITION_FIXED, "at91bootstrap_raw");
++	dev_add_bb_dev("at91bootstrap_raw", "at91bootstrap");
++	devfs_add_partition("nand0", SZ_128K, SZ_256K, DEVFS_PARTITION_FIXED, "self_raw");
++	dev_add_bb_dev("self_raw", "self0");
++	devfs_add_partition("nand0", SZ_256K + SZ_128K, SZ_128K, DEVFS_PARTITION_FIXED, "env_raw");
++	dev_add_bb_dev("env_raw", "env0");
++	devfs_add_partition("nand0", SZ_512K, SZ_128K, DEVFS_PARTITION_FIXED, "env_raw1");
++	dev_add_bb_dev("env_raw1", "env1");
++
++	return 0;
++}
++device_initcall(haba_knx_devices_init);
++
++static int haba_knx_console_init(void)
++{
++	at91_register_uart(0, 0);
++
++	return 0;
++}
++console_initcall(haba_knx_console_init);
+diff --git a/arch/arm/configs/haba_knx_explorer_defconfig b/arch/arm/configs/haba_knx_explorer_defconfig
+new file mode 100644
+index 0000000..8093369
+--- /dev/null
++++ b/arch/arm/configs/haba_knx_explorer_defconfig
+@@ -0,0 +1,76 @@
++CONFIG_ARCH_AT91SAM9G20=y
++CONFIG_MACH_HABA_KNX_EXPLORER=y
++CONFIG_AEABI=y
++# CONFIG_CMD_ARM_CPUINFO is not set
++CONFIG_ARM_OPTIMZED_STRING_FUNCTIONS=y
++CONFIG_MMU=y
++CONFIG_BAREBOX_MAX_IMAGE_SIZE=0x40000
++CONFIG_EXPERIMENTAL=y
++CONFIG_MALLOC_TLSF=y
++CONFIG_PROMPT="HABA-EXPLORER:"
++CONFIG_LONGHELP=y
++CONFIG_GLOB=y
++CONFIG_PROMPT_HUSH_PS2="y"
++CONFIG_HUSH_FANCY_PROMPT=y
++CONFIG_CMDLINE_EDITING=y
++CONFIG_AUTO_COMPLETE=y
++CONFIG_MENU=y
++# CONFIG_CONSOLE_ACTIVATE_FIRST is not set
++CONFIG_CONSOLE_ACTIVATE_ALL=y
++CONFIG_PARTITION=y
++CONFIG_DEFAULT_ENVIRONMENT_GENERIC=y
++CONFIG_DEFAULT_ENVIRONMENT_PATH="arch/arm/boards/haba-knx/env"
++CONFIG_CMD_EDIT=y
++CONFIG_CMD_SLEEP=y
++CONFIG_CMD_SAVEENV=y
++CONFIG_CMD_EXPORT=y
++CONFIG_CMD_PRINTENV=y
++CONFIG_CMD_READLINE=y
++CONFIG_CMD_MENU=y
++CONFIG_CMD_MENU_MANAGEMENT=y
++CONFIG_CMD_PASSWD=y
++CONFIG_CMD_ECHO_E=y
++CONFIG_CMD_LOADB=y
++CONFIG_CMD_MEMINFO=y
++CONFIG_CMD_MD5SUM=y
++CONFIG_CMD_SHA1SUM=y
++CONFIG_CMD_MTEST=y
++CONFIG_CMD_MTEST_ALTERNATIVE=y
++CONFIG_CMD_FLASH=y
++CONFIG_CMD_BOOTM_SHOW_TYPE=y
++CONFIG_CMD_BOOTM_VERBOSE=y
++CONFIG_CMD_BOOTM_INITRD=y
++CONFIG_CMD_BOOTM_OFTREE=y
++CONFIG_CMD_BOOTM_OFTREE_UIMAGE=y
++CONFIG_CMD_UIMAGE=y
++# CONFIG_CMD_BOOTZ is not set
++# CONFIG_CMD_BOOTU is not set
++CONFIG_CMD_RESET=y
++CONFIG_CMD_GO=y
++CONFIG_CMD_OFTREE=y
++CONFIG_CMD_TIMEOUT=y
++CONFIG_CMD_PARTITION=y
++CONFIG_CMD_GPIO=y
++CONFIG_CMD_LED=y
++CONFIG_CMD_LED_TRIGGER=y
++CONFIG_NET=y
++CONFIG_NET_DHCP=y
++CONFIG_NET_NFS=y
++CONFIG_NET_PING=y
++CONFIG_NET_TFTP=y
++CONFIG_NET_TFTP_PUSH=y
++CONFIG_DRIVER_NET_MACB=y
++# CONFIG_SPI is not set
++CONFIG_MTD=y
++# CONFIG_MTD_OOB_DEVICE is not set
++CONFIG_NAND=y
++# CONFIG_NAND_ECC_HW is not set
++# CONFIG_NAND_ECC_HW_SYNDROME is not set
++# CONFIG_NAND_ECC_HW_NONE is not set
++CONFIG_NAND_ATMEL=y
++CONFIG_UBI=y
++CONFIG_USB_GADGET=y
++CONFIG_USB_GADGET_SERIAL=y
++CONFIG_LED=y
++CONFIG_LED_GPIO=y
++CONFIG_LED_TRIGGERS=y
+diff --git a/arch/arm/configs/haba_knx_lite_defconfig b/arch/arm/configs/haba_knx_lite_defconfig
+new file mode 100644
+index 0000000..6834101
+--- /dev/null
++++ b/arch/arm/configs/haba_knx_lite_defconfig
+@@ -0,0 +1,76 @@
++CONFIG_ARCH_AT91SAM9G20=y
++CONFIG_MACH_HABA_KNX_LITE=y
++CONFIG_AEABI=y
++# CONFIG_CMD_ARM_CPUINFO is not set
++CONFIG_ARM_OPTIMZED_STRING_FUNCTIONS=y
++CONFIG_MMU=y
++CONFIG_BAREBOX_MAX_IMAGE_SIZE=0x40000
++CONFIG_EXPERIMENTAL=y
++CONFIG_MALLOC_TLSF=y
++CONFIG_PROMPT="HABA-LITE:"
++CONFIG_LONGHELP=y
++CONFIG_GLOB=y
++CONFIG_PROMPT_HUSH_PS2="y"
++CONFIG_HUSH_FANCY_PROMPT=y
++CONFIG_CMDLINE_EDITING=y
++CONFIG_AUTO_COMPLETE=y
++CONFIG_MENU=y
++# CONFIG_CONSOLE_ACTIVATE_FIRST is not set
++CONFIG_CONSOLE_ACTIVATE_ALL=y
++CONFIG_PARTITION=y
++CONFIG_DEFAULT_ENVIRONMENT_GENERIC=y
++CONFIG_DEFAULT_ENVIRONMENT_PATH="arch/arm/boards/haba-knx/env"
++CONFIG_CMD_EDIT=y
++CONFIG_CMD_SLEEP=y
++CONFIG_CMD_SAVEENV=y
++CONFIG_CMD_EXPORT=y
++CONFIG_CMD_PRINTENV=y
++CONFIG_CMD_READLINE=y
++CONFIG_CMD_MENU=y
++CONFIG_CMD_MENU_MANAGEMENT=y
++CONFIG_CMD_PASSWD=y
++CONFIG_CMD_ECHO_E=y
++CONFIG_CMD_LOADB=y
++CONFIG_CMD_MEMINFO=y
++CONFIG_CMD_MD5SUM=y
++CONFIG_CMD_SHA1SUM=y
++CONFIG_CMD_MTEST=y
++CONFIG_CMD_MTEST_ALTERNATIVE=y
++CONFIG_CMD_FLASH=y
++CONFIG_CMD_BOOTM_SHOW_TYPE=y
++CONFIG_CMD_BOOTM_VERBOSE=y
++CONFIG_CMD_BOOTM_INITRD=y
++CONFIG_CMD_BOOTM_OFTREE=y
++CONFIG_CMD_BOOTM_OFTREE_UIMAGE=y
++CONFIG_CMD_UIMAGE=y
++# CONFIG_CMD_BOOTZ is not set
++# CONFIG_CMD_BOOTU is not set
++CONFIG_CMD_RESET=y
++CONFIG_CMD_GO=y
++CONFIG_CMD_OFTREE=y
++CONFIG_CMD_TIMEOUT=y
++CONFIG_CMD_PARTITION=y
++CONFIG_CMD_GPIO=y
++CONFIG_CMD_LED=y
++CONFIG_CMD_LED_TRIGGER=y
++CONFIG_NET=y
++CONFIG_NET_DHCP=y
++CONFIG_NET_NFS=y
++CONFIG_NET_PING=y
++CONFIG_NET_TFTP=y
++CONFIG_NET_TFTP_PUSH=y
++CONFIG_DRIVER_NET_MACB=y
++# CONFIG_SPI is not set
++CONFIG_MTD=y
++# CONFIG_MTD_OOB_DEVICE is not set
++CONFIG_NAND=y
++# CONFIG_NAND_ECC_HW is not set
++# CONFIG_NAND_ECC_HW_SYNDROME is not set
++# CONFIG_NAND_ECC_HW_NONE is not set
++CONFIG_NAND_ATMEL=y
++CONFIG_UBI=y
++CONFIG_USB_GADGET=y
++CONFIG_USB_GADGET_SERIAL=y
++CONFIG_LED=y
++CONFIG_LED_GPIO=y
++CONFIG_LED_TRIGGERS=y
+diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
+index 30225fa..4df6096 100644
+--- a/arch/arm/mach-at91/Kconfig
++++ b/arch/arm/mach-at91/Kconfig
+@@ -26,6 +26,8 @@ config BOARDINFO
+ 	default "Calao TNY-A9263" if MACH_TNY_A9263
+ 	default "Calao TNY-A9G20" if MACH_TNY_A9G20
+ 	default "Calao QIL-A9260" if MACH_QIL_A9260
++	default "Calao HABA-KNX-LITE" if MACH_HABA_KNX_LITE
++	default "Calao HABA-KNX-EXPLORER" if MACH_HABA_KNX_EXPLORER
+ 
+ config HAVE_NAND_ATMEL_BUSWIDTH_16
+ 	bool
+@@ -244,6 +246,18 @@ config MACH_DSS11
+ 	  Select this if you are using aizo dSS11
+ 	  that embeds only one SD/MMC slot.
+ 
++config MACH_HABA_KNX_LITE
++	bool "CALAO HABA-KNX-LITE"
++	help
++	  Select this if you are using a Calao Systems HABA-KNX-LITE.
++	  <http://www.calao-systems.com>
++
++config MACH_HABA_KNX_EXPLORER
++	bool "CALAO HABA-KNX-EXPLORER"
++	help
++	  Select this if you are using a Calao Systems HABA-KNX-EXPLORER.
++	  <http://www.calao-systems.com>
++
+ endchoice
+ 
+ endif
+diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
+index 325513f..b4c9169 100644
+--- a/arch/arm/tools/mach-types
++++ b/arch/arm/tools/mach-types
+@@ -4148,3 +4148,5 @@ msm8625_evt		MACH_MSM8625_EVT	MSM8625_EVT		4193
+ mx53_sellwood		MACH_MX53_SELLWOOD	MX53_SELLWOOD		4194
+ somiq_am35		MACH_SOMIQ_AM35		SOMIQ_AM35		4195
+ somiq_am37		MACH_SOMIQ_AM37		SOMIQ_AM37		4196
++haba_knx_lite		MACH_HABA_KNX_LITE	HABA_KNX_LITE		4310
++
+-- 
+1.5.6.3
+
diff --git a/board/calao/haba-knx-lite/linux-3.4.patch b/board/calao/haba-knx-lite/linux-3.4.patch
new file mode 100644
index 0000000..289f805
--- /dev/null
+++ b/board/calao/haba-knx-lite/linux-3.4.patch
@@ -0,0 +1,819 @@
+From 80718068d66ff8935b9b95ea21cf6f4ac644d154 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Tue, 21 Aug 2012 15:34:17 +0200
+Subject: [PATCH] Add support for the Calao-systems HABA-KNX-LITE & EXPLORER
+
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ arch/arm/configs/haba-knx-explorer_defconfig |  123 +++++++
+ arch/arm/configs/haba-knx-lite_defconfig     |  128 +++++++
+ arch/arm/mach-at91/Kconfig                   |   14 +
+ arch/arm/mach-at91/Makefile                  |    2 +
+ arch/arm/mach-at91/board-haba-knx.c          |  472 ++++++++++++++++++++++++++
+ arch/arm/tools/mach-types                    |    3 +
+ 6 files changed, 742 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/configs/haba-knx-explorer_defconfig
+ create mode 100644 arch/arm/configs/haba-knx-lite_defconfig
+ create mode 100644 arch/arm/mach-at91/board-haba-knx.c
+
+diff --git a/arch/arm/configs/haba-knx-explorer_defconfig b/arch/arm/configs/haba-knx-explorer_defconfig
+new file mode 100644
+index 0000000..53992ad
+--- /dev/null
++++ b/arch/arm/configs/haba-knx-explorer_defconfig
+@@ -0,0 +1,123 @@
++CONFIG_EXPERIMENTAL=y
++# CONFIG_LOCALVERSION_AUTO is not set
++# CONFIG_SWAP is not set
++CONFIG_SYSVIPC=y
++CONFIG_LOG_BUF_SHIFT=14
++CONFIG_SLAB=y
++CONFIG_MODULES=y
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_BLK_DEV_BSG is not set
++# CONFIG_IOSCHED_DEADLINE is not set
++# CONFIG_IOSCHED_CFQ is not set
++CONFIG_ARCH_AT91=y
++CONFIG_ARCH_AT91SAM9G20=y
++CONFIG_MACH_HABA_KNX_EXPLORER=y
++CONFIG_AT91_SLOW_CLOCK=y
++# CONFIG_ARM_THUMB is not set
++CONFIG_AEABI=y
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_CMDLINE="mem=64M console=ttyS0,115200"
++CONFIG_FPE_NWFPE=y
++CONFIG_NET=y
++CONFIG_PACKET=y
++CONFIG_UNIX=y
++CONFIG_INET=y
++CONFIG_IP_MULTICAST=y
++CONFIG_IP_ADVANCED_ROUTER=y
++CONFIG_IP_ROUTE_VERBOSE=y
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_BOOTP=y
++CONFIG_IP_PNP_RARP=y
++CONFIG_IP_MROUTE=y
++CONFIG_IP_PIMSM_V1=y
++CONFIG_IP_PIMSM_V2=y
++# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_BEET is not set
++# CONFIG_INET_LRO is not set
++# CONFIG_INET_DIAG is not set
++# CONFIG_IPV6 is not set
++CONFIG_BT=y
++CONFIG_BT_RFCOMM=y
++CONFIG_BT_RFCOMM_TTY=y
++CONFIG_BT_HCIUART=y
++CONFIG_BT_HCIUART_H4=y
++CONFIG_BT_HCIUART_BCSP=y
++CONFIG_CFG80211=y
++# CONFIG_CFG80211_DEFAULT_PS is not set
++CONFIG_WIRELESS_EXT_SYSFS=y
++CONFIG_LIB80211=y
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++# CONFIG_FIRMWARE_IN_KERNEL is not set
++CONFIG_MTD=y
++CONFIG_MTD_CMDLINE_PARTS=y
++CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLOCK=y
++CONFIG_MTD_NAND=y
++CONFIG_MTD_NAND_ATMEL=y
++CONFIG_MTD_UBI=y
++CONFIG_BLK_DEV_LOOP=y
++CONFIG_SCSI=y
++CONFIG_BLK_DEV_SD=y
++CONFIG_SCSI_MULTI_LUN=y
++CONFIG_NETDEVICES=y
++CONFIG_MII=y
++CONFIG_MACB=y
++CONFIG_LIBERTAS=m
++CONFIG_LIBERTAS_SDIO=m
++# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
++CONFIG_INPUT_EVDEV=y
++CONFIG_INPUT_EVBUG=y
++# CONFIG_KEYBOARD_ATKBD is not set
++CONFIG_KEYBOARD_GPIO=y
++# CONFIG_INPUT_MOUSE is not set
++# CONFIG_SERIO is not set
++CONFIG_SERIAL_ATMEL=y
++CONFIG_SERIAL_ATMEL_CONSOLE=y
++CONFIG_HW_RANDOM=y
++CONFIG_I2C=y
++CONFIG_I2C_GPIO=y
++CONFIG_SPI=y
++CONFIG_SPI_ATMEL=y
++CONFIG_GPIO_SYSFS=y
++# CONFIG_HWMON is not set
++# CONFIG_USB_HID is not set
++CONFIG_USB=y
++CONFIG_USB_DEVICEFS=y
++CONFIG_USB_MON=y
++CONFIG_USB_OHCI_HCD=y
++CONFIG_USB_STORAGE=y
++CONFIG_USB_GADGET=y
++CONFIG_USB_AT91=y
++CONFIG_USB_G_SERIAL=y
++CONFIG_MMC=y
++CONFIG_MMC_AT91=y
++CONFIG_NEW_LEDS=y
++CONFIG_LEDS_CLASS=y
++CONFIG_LEDS_GPIO=y
++CONFIG_LEDS_TRIGGERS=y
++CONFIG_LEDS_TRIGGER_HEARTBEAT=y
++CONFIG_RTC_CLASS=y
++CONFIG_RTC_DRV_RV3029C2=y
++CONFIG_EXT2_FS=y
++CONFIG_FUSE_FS=m
++CONFIG_VFAT_FS=y
++CONFIG_TMPFS=y
++CONFIG_JFFS2_FS=y
++CONFIG_UBIFS_FS=y
++CONFIG_UBIFS_FS_XATTR=y
++CONFIG_UBIFS_FS_ADVANCED_COMPR=y
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3=y
++CONFIG_NFS_V3_ACL=y
++CONFIG_NFS_V4=y
++CONFIG_ROOT_NFS=y
++CONFIG_NLS_CODEPAGE_437=y
++CONFIG_NLS_CODEPAGE_850=y
++CONFIG_NLS_ISO8859_1=y
++CONFIG_DEBUG_KERNEL=y
++CONFIG_DEBUG_USER=y
++CONFIG_DEBUG_LL=y
++CONFIG_CRYPTO_ARC4=y
++CONFIG_AVERAGE=y
+diff --git a/arch/arm/configs/haba-knx-lite_defconfig b/arch/arm/configs/haba-knx-lite_defconfig
+new file mode 100644
+index 0000000..5389513
+--- /dev/null
++++ b/arch/arm/configs/haba-knx-lite_defconfig
+@@ -0,0 +1,128 @@
++CONFIG_EXPERIMENTAL=y
++# CONFIG_LOCALVERSION_AUTO is not set
++# CONFIG_SWAP is not set
++CONFIG_SYSVIPC=y
++CONFIG_LOG_BUF_SHIFT=14
++CONFIG_SLAB=y
++CONFIG_MODULES=y
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_BLK_DEV_BSG is not set
++# CONFIG_IOSCHED_DEADLINE is not set
++# CONFIG_IOSCHED_CFQ is not set
++CONFIG_ARCH_AT91=y
++CONFIG_ARCH_AT91SAM9G20=y
++CONFIG_MACH_HABA_KNX_LITE=y
++CONFIG_AT91_SLOW_CLOCK=y
++# CONFIG_ARM_THUMB is not set
++CONFIG_AEABI=y
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_CMDLINE="mem=64M console=ttyS0,115200"
++CONFIG_FPE_NWFPE=y
++CONFIG_NET=y
++CONFIG_PACKET=y
++CONFIG_UNIX=y
++CONFIG_INET=y
++CONFIG_IP_MULTICAST=y
++CONFIG_IP_ADVANCED_ROUTER=y
++CONFIG_IP_ROUTE_VERBOSE=y
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_BOOTP=y
++CONFIG_IP_PNP_RARP=y
++CONFIG_IP_MROUTE=y
++CONFIG_IP_PIMSM_V1=y
++CONFIG_IP_PIMSM_V2=y
++# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_BEET is not set
++# CONFIG_INET_LRO is not set
++# CONFIG_INET_DIAG is not set
++# CONFIG_IPV6 is not set
++CONFIG_BT=y
++CONFIG_BT_RFCOMM=y
++CONFIG_BT_RFCOMM_TTY=y
++CONFIG_BT_HCIUART=y
++CONFIG_BT_HCIUART_H4=y
++CONFIG_BT_HCIUART_BCSP=y
++CONFIG_CFG80211=y
++# CONFIG_CFG80211_DEFAULT_PS is not set
++CONFIG_WIRELESS_EXT_SYSFS=y
++CONFIG_LIB80211=y
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++# CONFIG_FIRMWARE_IN_KERNEL is not set
++CONFIG_MTD=y
++CONFIG_MTD_CMDLINE_PARTS=y
++CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLOCK=y
++CONFIG_MTD_DATAFLASH=y
++CONFIG_MTD_M25P80=y
++# CONFIG_M25PXX_USE_FAST_READ is not set
++CONFIG_MTD_NAND=y
++CONFIG_MTD_NAND_ATMEL=y
++CONFIG_MTD_UBI=y
++CONFIG_BLK_DEV_LOOP=y
++CONFIG_EEPROM_AT24=y
++CONFIG_SCSI=y
++CONFIG_BLK_DEV_SD=y
++CONFIG_SCSI_MULTI_LUN=y
++CONFIG_NETDEVICES=y
++CONFIG_MII=y
++CONFIG_MACB=y
++CONFIG_LIBERTAS=m
++CONFIG_LIBERTAS_SDIO=m
++# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
++CONFIG_INPUT_EVDEV=y
++CONFIG_INPUT_EVBUG=y
++# CONFIG_KEYBOARD_ATKBD is not set
++CONFIG_KEYBOARD_GPIO=y
++# CONFIG_INPUT_MOUSE is not set
++# CONFIG_SERIO is not set
++CONFIG_SERIAL_ATMEL=y
++CONFIG_SERIAL_ATMEL_CONSOLE=y
++CONFIG_HW_RANDOM=y
++CONFIG_I2C=y
++CONFIG_I2C_GPIO=y
++CONFIG_SPI=y
++CONFIG_SPI_ATMEL=y
++CONFIG_GPIO_SYSFS=y
++# CONFIG_HWMON is not set
++# CONFIG_USB_HID is not set
++CONFIG_USB=y
++CONFIG_USB_DEVICEFS=y
++CONFIG_USB_MON=y
++CONFIG_USB_OHCI_HCD=y
++CONFIG_USB_STORAGE=y
++CONFIG_USB_GADGET=y
++CONFIG_USB_AT91=y
++CONFIG_USB_G_SERIAL=y
++CONFIG_MMC=y
++CONFIG_MMC_AT91=y
++CONFIG_MMC_SPI=y
++CONFIG_NEW_LEDS=y
++CONFIG_LEDS_CLASS=y
++CONFIG_LEDS_GPIO=y
++CONFIG_LEDS_TRIGGERS=y
++CONFIG_LEDS_TRIGGER_HEARTBEAT=y
++CONFIG_RTC_CLASS=y
++CONFIG_RTC_DRV_RV3029C2=y
++CONFIG_EXT2_FS=y
++CONFIG_FUSE_FS=m
++CONFIG_VFAT_FS=y
++CONFIG_TMPFS=y
++CONFIG_JFFS2_FS=y
++CONFIG_UBIFS_FS=y
++CONFIG_UBIFS_FS_XATTR=y
++CONFIG_UBIFS_FS_ADVANCED_COMPR=y
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3=y
++CONFIG_NFS_V3_ACL=y
++CONFIG_NFS_V4=y
++CONFIG_ROOT_NFS=y
++CONFIG_NLS_CODEPAGE_437=y
++CONFIG_NLS_CODEPAGE_850=y
++CONFIG_NLS_ISO8859_1=y
++CONFIG_DEBUG_KERNEL=y
++CONFIG_DEBUG_USER=y
++CONFIG_DEBUG_LL=y
++CONFIG_CRYPTO_ARC4=y
++CONFIG_AVERAGE=y
+diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
+index 45db05d..f19acb8 100644
+--- a/arch/arm/mach-at91/Kconfig
++++ b/arch/arm/mach-at91/Kconfig
+@@ -424,6 +424,20 @@ config MACH_SNAPPER_9260
+           <http://www.bluewatersys.com/>
+ endif
+ 
++config MACH_HABA_KNX_EXPLORER
++	bool "CALAO MACH_HABA_KNX_EXPLORER"
++	depends on ARCH_AT91SAM9G20
++	help
++	  Select this if you are using a Calao Systems HABA-KNX-EXPLORER.
++	  <http://www.calao-systems.com>
++
++config MACH_HABA_KNX_LITE
++	bool "CALAO MACH_HABA_KNX_LITE"
++	depends on ARCH_AT91SAM9G20
++	help
++	  Select this if you are using a Calao Systems HABA-KNX-LITE.
++	  <http://www.calao-systems.com>
++
+ # ----------------------------------------------------------
+ 
+ if ARCH_AT91SAM9G45
+diff --git a/arch/arm/mach-at91/Makefile b/arch/arm/mach-at91/Makefile
+index 8512e53..e1bac66 100644
+--- a/arch/arm/mach-at91/Makefile
++++ b/arch/arm/mach-at91/Makefile
+@@ -71,6 +71,8 @@ obj-$(CONFIG_MACH_PORTUXG20)	+= board-stamp9g20.o
+ obj-$(CONFIG_MACH_PCONTROL_G20)	+= board-pcontrol-g20.o board-stamp9g20.o
+ obj-$(CONFIG_MACH_GSIA18S)	+= board-gsia18s.o board-stamp9g20.o
+ obj-$(CONFIG_MACH_USB_A9G20)	+= board-usb-a926x.o
++obj-$(CONFIG_MACH_HABA_KNX_EXPLORER)	+= board-haba-knx.o
++obj-$(CONFIG_MACH_HABA_KNX_LITE)	+= board-haba-knx.o
+ 
+ # AT91SAM9260/AT91SAM9G20 board-specific support
+ obj-$(CONFIG_MACH_SNAPPER_9260)	+= board-snapper9260.o
+diff --git a/arch/arm/mach-at91/board-haba-knx.c b/arch/arm/mach-at91/board-haba-knx.c
+new file mode 100644
+index 0000000..d0c41fc
+--- /dev/null
++++ b/arch/arm/mach-at91/board-haba-knx.c
+@@ -0,0 +1,472 @@
++/*
++ * linux/arch/arm/mach-at91/board-haba-knx.c
++ *
++ *  Copyright (C) 2005 SAN People
++ *  Copyright (C) 2007 Atmel Corporation.
++ *  Copyright (C) 2007 Calao-systems
++ *  Copyright (C) 2012 Gr??gory Hermant gregory.hermant at calao-systems.com
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
++ */
++
++#include <linux/types.h>
++#include <linux/init.h>
++#include <linux/mm.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/spi/spi.h>
++#include <linux/gpio_keys.h>
++#include <linux/gpio.h>
++#include <linux/input.h>
++#include <linux/spi/mmc_spi.h>
++#include <linux/spi/flash.h>
++#include <linux/i2c/at24.h>
++
++#include <asm/setup.h>
++#include <asm/mach-types.h>
++#include <asm/irq.h>
++
++#include <asm/mach/arch.h>
++#include <asm/mach/map.h>
++#include <asm/mach/irq.h>
++
++#include <mach/hardware.h>
++#include <mach/board.h>
++#include <mach/at91sam9_smc.h>
++#include <mach/at91_shdwc.h>
++
++#include "sam9_smc.h"
++#include "generic.h"
++
++
++static void __init ek_init_early(void)
++{
++	/* Initialize processor: 12.00 MHz oscillator */
++	at91_initialize(12000000);
++
++	/* DBGU on ttyS0. (Rx & Tx only) */
++	at91_register_uart(0, 0, 0);
++
++	/* EXPANSION CON: USART0 on ttyS1. (Rx, Tx, CTS, RTS) */
++	at91_register_uart(AT91SAM9260_ID_US0, 1, ATMEL_UART_CTS | ATMEL_UART_RTS);
++
++	/* EXPANSION CON: USART1 on ttyS2. (Rx, Tx, CTS, RTS) */
++	at91_register_uart(AT91SAM9260_ID_US1, 2, ATMEL_UART_CTS | ATMEL_UART_RTS);
++
++	/* KNX: USART4 on ttyS5. (Rx, Tx, CTS, RTS) */
++	at91_register_uart(AT91SAM9260_ID_US4, 5, ATMEL_UART_CTS | ATMEL_UART_RTS);
++
++	if (machine_is_haba_knx_explorer()) {
++		/* RS485: USART2 on ttyS3. (Rx, Tx, RTS) */
++		at91_register_uart(AT91SAM9260_ID_US2, 3, ATMEL_UART_RTS);
++
++		/* RS485: USART3 on ttyS4. (Rx, Tx, RTS) */
++		at91_register_uart(AT91SAM9260_ID_US3, 4, ATMEL_UART_RTS);
++
++		/* RS232: USART5 on ttyS6. (Rx, Tx) */
++		at91_register_uart(AT91SAM9260_ID_US5, 6, 0);
++	}
++
++	/* set serial console to ttyS0 (ie, DBGU) */
++	at91_set_serial_console(0);
++}
++
++/*
++ * USB Host port
++ */
++static struct at91_usbh_data __initdata ek_usbh_data = {
++	.ports		= 2,
++	.vbus_pin	= {-EINVAL, -EINVAL},
++	.overcurrent_pin= {-EINVAL, -EINVAL},
++};
++
++/*
++ * USB Device port
++ */
++static struct at91_udc_data __initdata ek_udc_data = {
++	.vbus_pin	= AT91_PIN_PB2,
++	.pullup_pin	= -EINVAL,		/* pull-up driven by UDC */
++};
++
++static void __init ek_add_device_udc(void)
++{	
++	if (machine_is_haba_knx_explorer())
++		ek_udc_data.vbus_pin = AT91_PIN_PC5;
++
++	at91_add_device_udc(&ek_udc_data);
++}
++
++#if defined(CONFIG_MMC_SPI) || defined(CONFIG_MMC_SPI_MODULE)
++#define MMC_SPI_CARD_DETECT_INT	AT91_PIN_PB0
++static int at91_mmc_spi_init(struct device *dev,
++	irqreturn_t (*detect_int)(int, void *), void *data)
++{
++	/* Configure Interrupt pin as input, pull-up enabled */
++		at91_set_gpio_input(MMC_SPI_CARD_DETECT_INT, 1);
++		return request_irq(gpio_to_irq(MMC_SPI_CARD_DETECT_INT), detect_int,
++			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
++			"mmc-spi-detect", data);
++}
++
++static void at91_mmc_spi_exit(struct device *dev, void *data)
++{
++	free_irq(gpio_to_irq(MMC_SPI_CARD_DETECT_INT), data);
++}
++
++static struct mmc_spi_platform_data at91_mmc_spi_pdata = {
++	.init = at91_mmc_spi_init,
++	.exit = at91_mmc_spi_exit,
++	.detect_delay = 100, /* msecs */
++};
++#endif
++
++/*
++ * SPI devices.
++ */
++#if defined(CONFIG_MTD_M25P80) || defined(CONFIG_MTD_M25P80_MODULE)
++static struct mtd_partition at91_spi_flash_partitions[] = {
++	{
++		.name = "spi_flash_space",
++		.size = MTDPART_SIZ_FULL,
++		.offset = 0,
++	}
++};
++
++static struct flash_platform_data at91_spi_flash_data = {
++	.name = "m25p80",
++	.parts = at91_spi_flash_partitions,
++	.nr_parts = ARRAY_SIZE(at91_spi_flash_partitions),
++	.type = "m25p16",
++};
++#endif
++static struct spi_board_info haba_knx_spi_devices[] = {
++#if defined(CONFIG_MTD_M25P80) || defined(CONFIG_MTD_M25P80_MODULE)
++	{
++		/* the modalias must be the same as spi device driver name */
++		.modalias = "m25p80", 
++		.max_speed_hz = 20 * 1000 * 1000,     /* max spi clock (SCK) speed in HZ */
++		.bus_num = 0, 
++		.chip_select = 0, 
++		.platform_data = &at91_spi_flash_data,
++		.mode = SPI_MODE_3,
++	},
++#endif
++#if defined(CONFIG_MMC_SPI) || defined(CONFIG_MMC_SPI_MODULE)
++	{
++		.modalias = "mmc_spi",
++		.max_speed_hz = 20 * 1000 * 1000,	/* max spi clock (SCK) speed in HZ */
++		.bus_num = 0,
++		.chip_select = 1,
++		.controller_data = (void *) AT91_PIN_PA27,	/* default for CS1 is PC11, but it must be PA27 */
++		.platform_data = &at91_mmc_spi_pdata,
++		.mode = SPI_MODE_3,
++	},
++#endif
++};
++
++static void __init ek_add_device_spi(void)
++{
++	at91_add_device_spi(haba_knx_spi_devices, ARRAY_SIZE(haba_knx_spi_devices));
++}
++
++/*
++ * MACB Ethernet device
++ */
++static struct macb_platform_data __initdata ek_macb_data = {
++	.phy_irq_pin	= AT91_PIN_PB1,
++	.is_rmii	= 1,
++};
++
++static void __init ek_add_device_eth(void)
++{
++	if (machine_is_haba_knx_explorer()) {
++		ek_macb_data.phy_irq_pin = AT91_PIN_PB18 ;
++		ek_macb_data.is_rmii = 0 ;
++	}
++	
++	at91_add_device_eth(&ek_macb_data);
++}
++
++/*
++ * NAND flash
++ */
++static struct mtd_partition __initdata ek_nand_partition[] = {
++	{
++		.name	= "barebox",
++		.offset	= 0,
++		.size	= 3 * SZ_128K,
++	}, {
++		.name	= "bareboxenv",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= SZ_128K,
++	}, {
++		.name	= "bareboxenv2",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= SZ_128K,
++	}, {
++		.name	= "kernel",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= 4 * SZ_1M,
++	}, {
++		.name	= "rootfs",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= 120 * SZ_1M,
++	}, {
++		.name	= "data",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= MTDPART_SIZ_FULL,
++	}
++};
++
++static struct atmel_nand_data __initdata ek_nand_data = {
++	.ale		= 21,
++	.cle		= 22,
++	.det_pin	= -EINVAL,
++	.rdy_pin	= AT91_PIN_PC13,
++	.enable_pin	= AT91_PIN_PC14,
++	.ecc_mode	= NAND_ECC_SOFT,
++	.on_flash_bbt	= 1,
++	.parts		= ek_nand_partition,
++	.num_parts	= ARRAY_SIZE(ek_nand_partition),
++};
++
++static struct sam9_smc_config __initdata haba_knx_nand_smc_config = {
++	.ncs_read_setup		= 0,
++	.nrd_setup		= 2,
++	.ncs_write_setup	= 0,
++	.nwe_setup		= 2,
++
++	.ncs_read_pulse		= 4,
++	.nrd_pulse		= 4,
++	.ncs_write_pulse	= 4,
++	.nwe_pulse		= 4,
++
++	.read_cycle		= 7,
++	.write_cycle		= 7,
++
++	.mode			= AT91_SMC_READMODE | AT91_SMC_WRITEMODE | AT91_SMC_EXNWMODE_DISABLE | AT91_SMC_DBW_8,
++	.tdf_cycles		= 3,
++};
++
++static void __init ek_add_device_nand(void)
++{
++	/* configure chip-select 3 (NAND) */
++	sam9_smc_configure(0, 3, &haba_knx_nand_smc_config);
++	at91_add_device_nand(&ek_nand_data);
++}
++
++
++/*
++ * MCI (SD/MMC)
++ * wp_pin and vcc_pin are not connected
++ */
++static struct at91_mmc_data __initdata ek_mmc_data = {
++	.slot_b		= 0,	
++	.wire4		= 1,
++	.det_pin	= -EINVAL,
++	.wp_pin		= -EINVAL,
++	.vcc_pin	= -EINVAL,
++};
++
++static void __init ek_add_device_mmc(void)
++{
++	if (machine_is_haba_knx_explorer()) {
++		ek_mmc_data.wire4 = 0;
++		ek_mmc_data.det_pin = AT91_PIN_PC11;
++	}
++
++	at91_add_device_mmc(0, &ek_mmc_data);
++}
++/*
++ * GPIO Buttons
++ */
++#if defined(CONFIG_KEYBOARD_GPIO) || defined(CONFIG_KEYBOARD_GPIO_MODULE)
++static struct gpio_keys_button haba_lite_buttons[] = {
++	{	/* USER PUSH BUTTON */
++		.code		= KEY_ENTER,
++		.gpio		= AT91_PIN_PC3,
++		.active_low	= 1,
++		.desc		= "user_pb",
++		.wakeup		= 1,
++	}
++};
++
++static struct gpio_keys_platform_data haba_lite_button_data = {
++	.buttons	= haba_lite_buttons,
++	.nbuttons	= ARRAY_SIZE(haba_lite_buttons),
++};
++
++static struct platform_device haba_lite_button_device = {
++	.name		= "gpio-keys",
++	.id		= -1,
++	.num_resources	= 0,
++	.dev		= {
++		.platform_data	= &haba_lite_button_data,
++	}
++};
++
++
++static struct gpio_keys_button haba_explorer_buttons[] = {
++	{	/* DC1 */
++		.code		= BTN_1,
++		.gpio		= AT91_PIN_PB16,
++		.active_low	= 1,
++		.desc		= "dc1",
++		.wakeup		= 1,
++	},
++	{	/* DC2 */
++		.code		= BTN_2,
++		.gpio		= AT91_PIN_PB17,
++		.active_low	= 1,
++		.desc		= "dc2",
++		.wakeup		= 1,
++	},
++	{	/* DC3 */
++		.code		= BTN_3,
++		.gpio		= AT91_PIN_PC6,
++		.active_low	= 1,
++		.desc		= "dc3",
++		.wakeup		= 1,
++	},
++	{	/* DC4 */
++		.code		= BTN_4,
++		.gpio		= AT91_PIN_PC7,
++		.active_low	= 1,
++		.desc		= "dc4",
++		.wakeup		= 1,
++	}
++};
++
++static struct gpio_keys_platform_data haba_explorer_button_data = {
++	.buttons	= haba_explorer_buttons,
++	.nbuttons	= ARRAY_SIZE(haba_explorer_buttons),
++};
++
++static struct platform_device haba_explorer_button_device = {
++	.name		= "gpio-keys",
++	.id		= -1,
++	.num_resources	= 0,
++	.dev		= {
++		.platform_data	= &haba_explorer_button_data,
++	}
++};
++static void __init ek_add_device_buttons(void)
++{
++	
++	if (machine_is_haba_knx_explorer()) {
++		at91_set_GPIO_periph(AT91_PIN_PC6, 1);	/* dry contact 3, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PC6, 1);
++
++		at91_set_GPIO_periph(AT91_PIN_PC7, 1);	/* dry contact 4, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PC7, 1);
++		
++		at91_set_GPIO_periph(AT91_PIN_PB16, 1);	/* dry contact 1, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PB16, 1);
++
++		at91_set_GPIO_periph(AT91_PIN_PB17, 1);	/* dry contact 2, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PB17, 1);
++
++		platform_device_register(&haba_explorer_button_device);
++
++	} else {
++		at91_set_GPIO_periph(AT91_PIN_PC3, 1);	/* user push button, pull up enabled */
++		at91_set_deglitch(AT91_PIN_PC3, 1);
++		platform_device_register(&haba_lite_button_device);
++		
++	}
++	;
++}
++#else
++static void __init ek_add_device_buttons(void) {}
++#endif
++
++/*
++ * LEDs
++ */
++static struct gpio_led ek_leds[] = {
++	{	/* user_led (green) */
++		.name			= "user_led",
++		.gpio			= AT91_PIN_PA28,
++		.active_low		= 1,
++		.default_trigger	= "heartbeat",
++	}
++};
++
++static struct i2c_board_info __initdata ek_i2c_devices[] = {
++	{
++		I2C_BOARD_INFO("rv3029c2", 0x56),
++	},
++#if defined(CONFIG_EEPROM_AT24) || defined(CONFIG_EEPROM_AT24_MODULE)
++	{
++		I2C_BOARD_INFO("24c02", 0x50),
++	},
++#endif
++};
++
++static void __init ek_add_device_leds(void)
++{
++	if (machine_is_haba_knx_explorer())
++		return;
++
++	at91_gpio_leds(ek_leds, ARRAY_SIZE(ek_leds));
++	
++}
++
++static void __init ek_board_init(void)
++{
++	/* Serial */
++	at91_add_device_serial();
++	/* USB Host */
++	at91_add_device_usbh(&ek_usbh_data);
++	/* USB Device */
++	ek_add_device_udc();
++	/* SPI */
++	ek_add_device_spi();
++	/* Ethernet */
++	ek_add_device_eth();
++	/* NAND */
++	ek_add_device_nand();
++	/* Push Buttons */
++	ek_add_device_buttons();
++	/* LEDs */
++	ek_add_device_leds();
++	/* MMC */
++	ek_add_device_mmc();
++	/* I2C */
++	at91_add_device_i2c(ek_i2c_devices, ARRAY_SIZE(ek_i2c_devices));
++	/* shutdown controller, wakeup button (5 msec low) */
++	at91_shdwc_write(AT91_SHDW_MR, AT91_SHDW_CPTWK0_(10)
++			| AT91_SHDW_WKMODE0_LOW
++			| AT91_SHDW_RTTWKEN);
++}
++
++MACHINE_START(HABA_KNX_EXPLORER, "CALAO HABA_KNX_EXPLORER")
++	/* Maintainer: calao-systems */
++	.timer		= &at91sam926x_timer,
++	.map_io		= at91_map_io,
++	.init_early	= ek_init_early,
++	.init_irq	= at91_init_irq_default,
++	.init_machine	= ek_board_init,
++MACHINE_END
++
++MACHINE_START(HABA_KNX_LITE, "CALAO HABA_KNX_LITE")
++	/* Maintainer: calao-systems */
++	.timer		= &at91sam926x_timer,
++	.map_io		= at91_map_io,
++	.init_early	= ek_init_early,
++	.init_irq	= at91_init_irq_default,
++	.init_machine	= ek_board_init,
++MACHINE_END
++
+diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
+index f9c9f33..9a927d3 100644
+--- a/arch/arm/tools/mach-types
++++ b/arch/arm/tools/mach-types
+@@ -529,6 +529,7 @@ torbreck		MACH_TORBRECK		TORBRECK		3090
+ prima2_evb		MACH_PRIMA2_EVB		PRIMA2_EVB		3103
+ paz00			MACH_PAZ00		PAZ00			3128
+ acmenetusfoxg20		MACH_ACMENETUSFOXG20	ACMENETUSFOXG20		3129
++haba_knx_explorer	MACH_HABA_KNX_EXPLORER	HABA_KNX_EXPLORER	3141
+ ag5evm			MACH_AG5EVM		AG5EVM			3189
+ tsunagi			MACH_TSUNAGI		TSUNAGI			3197
+ ics_if_voip		MACH_ICS_IF_VOIP	ICS_IF_VOIP		3206
+@@ -1169,3 +1170,5 @@ elite_ulk		MACH_ELITE_ULK		ELITE_ULK		3888
+ pov2			MACH_POV2		POV2			3889
+ ipod_touch_2g		MACH_IPOD_TOUCH_2G	IPOD_TOUCH_2G		3890
+ da850_pqab		MACH_DA850_PQAB		DA850_PQAB		3891
++haba_knx_lite		MACH_HABA_KNX_LITE	HABA_KNX_LITE		4310
++
+-- 
+1.5.6.3
+
diff --git a/configs/calao_haba_knx_lite_defconfig b/configs/calao_haba_knx_lite_defconfig
new file mode 100644
index 0000000..9835af3
--- /dev/null
+++ b/configs/calao_haba_knx_lite_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_NANOCOM=y
+BR2_PACKAGE_ARGP_STANDALONE=y
+BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ_UTILS_COMPAT=y
+BR2_PACKAGE_BLUEZ_UTILS_AUDIO=y
+BR2_PACKAGE_BLUEZ_UTILS_USB=y
+BR2_PACKAGE_CAN_UTILS=y
+BR2_PACKAGE_PPPD=y
+BR2_PACKAGE_PPPD_FILTER=y
+BR2_PACKAGE_PPPD_RADIUS=y
+BR2_PACKAGE_SOCAT=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_TARGET_ROOTFS_UBIFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AT91BOOTSTRAP=y
+BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="./board/calao/haba-knx-lite/"
+BR2_TARGET_AT91BOOTSTRAP_BOARD="haba_knx_lite"
+BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="./board/calao/haba-knx-lite/"
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="haba_knx_lite"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/calao/haba-knx-lite/"
+BR2_LINUX_KERNEL_DEFCONFIG="haba-knx-lite"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.5.6.3

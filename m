From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Fri, 25 Jan 2013 12:55:10 +0100
Subject: [Buildroot] [PATCH] Add support for the Calao-systems USB-A9260
In-Reply-To: <506ADAFF.1050603@calao-systems.com>
References: <506ADAFF.1050603@calao-systems.com>
Message-ID: <20130125115509.GD11142@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,

	can we have this one merged

Best Regards,
J.
On 14:15 Tue 02 Oct     , Gr?gory Hermant wrote:
> 
> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ---
>  .../usb-a9260/at91bootstrap-1.16-usb-a9260.patch   |  603 ++++++++++++++++++++
>  .../usb-a9260/barebox-2012.09.0-usb-a9260.patch    |   20 +
>  board/calao/usb-a9260/linux-3.5.4.config           |   98 ++++
>  configs/calao_usb_a9260_defconfig                  |   16 +
>  4 files changed, 737 insertions(+)
>  create mode 100644 board/calao/usb-a9260/at91bootstrap-1.16-usb-a9260.patch
>  create mode 100644 board/calao/usb-a9260/barebox-2012.09.0-usb-a9260.patch
>  create mode 100644 board/calao/usb-a9260/linux-3.5.4.config
>  create mode 100644 configs/calao_usb_a9260_defconfig
> 
> diff --git a/board/calao/usb-a9260/at91bootstrap-1.16-usb-a9260.patch b/board/calao/usb-a9260/at91bootstrap-1.16-usb-a9260.patch
> new file mode 100644
> index 0000000..1393677
> --- /dev/null
> +++ b/board/calao/usb-a9260/at91bootstrap-1.16-usb-a9260.patch
> @@ -0,0 +1,603 @@
> +From 43e8c90f13806405bde8eaaf3a956d0ddc806f64 Mon Sep 17 00:00:00 2001
> +From: Gregory Hermant <gregory.hermant@calao-systems.com>
> +Date: Tue, 2 Oct 2012 09:19:15 +0200
> +Subject: [PATCH] Add support for the USB-A9260
> +
> +
> +Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> +---
> + board/usb_a9260/nandflash/Makefile    |  122 ++++++++++++++
> + board/usb_a9260/nandflash/usb-a9260.h |  109 ++++++++++++
> + board/usb_a9260/usb_a9260.c           |  298 +++++++++++++++++++++++++++++++++
> + crt0_gnu.S                            |    7 +
> + include/part.h                        |    6 +-
> + 5 files changed, 541 insertions(+), 1 deletion(-)
> + create mode 100644 board/usb_a9260/nandflash/Makefile
> + create mode 100644 board/usb_a9260/nandflash/usb-a9260.h
> + create mode 100644 board/usb_a9260/usb_a9260.c
> +
> +diff --git a/board/usb_a9260/nandflash/Makefile b/board/usb_a9260/nandflash/Makefile
> +new file mode 100644
> +index 0000000..02f4b50
> +--- /dev/null
> ++++ b/board/usb_a9260/nandflash/Makefile
> +@@ -0,0 +1,122 @@
> ++# TODO: set this appropriately for your local toolchain
> ++ifndef ERASE_FCT
> ++ERASE_FCT=rm -f
> ++endif
> ++ifndef CROSS_COMPILE
> ++CROSS_COMPILE=arm-elf-
> ++endif
> ++
> ++TOOLCHAIN=gcc
> ++
> ++BOOTSTRAP_PATH=../../..
> ++
> ++# NandFlashBoot Configuration for USB-A9260
> ++
> ++# Target name (case sensitive!!!)
> ++TARGET=AT91SAM9260
> ++# Board name (case sensitive!!!)
> ++BOARD=usb_a9260
> ++# Link Address and Top_of_Memory
> ++LINK_ADDR=0x200000
> ++TOP_OF_MEMORY=0x301000
> ++# Name of current directory
> ++PROJECT=nandflash
> ++
> ++ifndef BOOT_NAME
> ++BOOT_NAME=$(PROJECT)_$(BOARD)
> ++endif
> ++
> ++INCL=./$(BOOTSTRAP_PATH)/board/$(BOARD)/$(PROJECT)
> ++
> ++ifeq ($(TOOLCHAIN), gcc)
> ++
> ++AS=$(CROSS_COMPILE)gcc
> ++CC=$(CROSS_COMPILE)gcc
> ++LD=$(CROSS_COMPILE)gcc
> ++NM= $(CROSS_COMPILE)nm
> ++SIZE=$(CROSS_COMPILE)size
> ++OBJCOPY=$(CROSS_COMPILE)objcopy
> ++OBJDUMP=$(CROSS_COMPILE)objdump
> ++CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
> ++ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> ++
> ++# Linker flags.
> ++#  -Wl,...:     tell GCC to pass this to linker.
> ++#    -Map:      create map file
> ++#    --cref:    add cross reference to map file
> ++LDFLAGS+=-nostartfiles -nostdlib -Wl,-Map=$(BOOT_NAME).map,--cref
> ++LDFLAGS+=-T $(BOOTSTRAP_PATH)/elf32-littlearm.lds -Ttext $(LINK_ADDR)
> ++OBJS=crt0_gnu.o
> ++
> ++endif
> ++
> ++OBJS+=\
> ++	$(BOARD).o \
> ++	main.o \
> ++	gpio.o \
> ++	pmc.o \
> ++	debug.o \
> ++	sdramc.o \
> ++	nandflash.o \
> ++	_udivsi3.o \
> ++	_umodsi3.o \
> ++	div0.o \
> ++	udiv.o \
> ++	string.o
> ++
> ++
> ++rebuild: clean all
> ++
> ++all: 	$(BOOT_NAME)
> ++
> ++ifeq ($(TOOLCHAIN), gcc)
> ++$(BOOT_NAME): $(OBJS)
> ++	$(LD) $(LDFLAGS) -n -o $(BOOT_NAME).elf $(OBJS)
> ++	$(OBJCOPY) --strip-debug --strip-unneeded $(BOOT_NAME).elf -O binary $(BOOT_NAME).bin
> ++endif
> ++
> ++
> ++$(BOARD).o: $(BOOTSTRAP_PATH)/board/$(BOARD)/$(BOARD).c
> ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/board/$(BOARD)/$(BOARD).c -o $(BOARD).o
> ++
> ++main.o: $(BOOTSTRAP_PATH)/main.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/main.c -o main.o
> ++
> ++gpio.o: $(BOOTSTRAP_PATH)/driver/gpio.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/gpio.c -o gpio.o
> ++
> ++pmc.o:  $(BOOTSTRAP_PATH)/driver/pmc.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/pmc.c -o pmc.o
> ++
> ++debug.o: $(BOOTSTRAP_PATH)/driver/debug.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/debug.c -o debug.o
> ++
> ++sdramc.o:  $(BOOTSTRAP_PATH)/driver/sdramc.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/sdramc.c -o sdramc.o
> ++
> ++dataflash.o:  $(BOOTSTRAP_PATH)/driver/dataflash.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/dataflash.c -o dataflash.o
> ++
> ++nandflash.o:  $(BOOTSTRAP_PATH)/driver/nandflash.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/driver/nandflash.c -o nandflash.o
> ++
> ++crt0_gnu.o:  $(BOOTSTRAP_PATH)/crt0_gnu.S
> ++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/crt0_gnu.S -o crt0_gnu.o
> ++
> ++div0.o:  $(BOOTSTRAP_PATH)/lib/div0.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/div0.c -o div0.o
> ++
> ++string.o:  $(BOOTSTRAP_PATH)/lib/string.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/string.c -o string.o
> ++
> ++udiv.o:  $(BOOTSTRAP_PATH)/lib/udiv.c ++	$(CC) -c $(CCFLAGS) $(BOOTSTRAP_PATH)/lib/udiv.c -o udiv.o
> ++
> ++_udivsi3.o:  $(BOOTSTRAP_PATH)/lib/_udivsi3.S
> ++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/lib/_udivsi3.S -o _udivsi3.o
> ++
> ++_umodsi3.o:  $(BOOTSTRAP_PATH)/lib/_umodsi3.S
> ++	$(AS) $(ASFLAGS) $(BOOTSTRAP_PATH)/lib/_umodsi3.S -o _umodsi3.o
> ++
> ++clean:
> ++	$(ERASE_FCT) *.o *.bin *.elf *.map
> +diff --git a/board/usb_a9260/nandflash/usb-a9260.h b/board/usb_a9260/nandflash/usb-a9260.h
> +new file mode 100644
> +index 0000000..2aaf759
> +--- /dev/null
> ++++ b/board/usb_a9260/nandflash/usb-a9260.h
> +@@ -0,0 +1,109 @@
> ++/* ----------------------------------------------------------------------------
> ++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
> ++ * ----------------------------------------------------------------------------
> ++ * Copyright (c) 2006, Atmel Corporation
> ++
> ++ * All rights reserved.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions are met:
> ++ *
> ++ * - Redistributions of source code must retain the above copyright notice,
> ++ * this list of conditions and the disclaimer below.
> ++ *
> ++ * Atmel's name may not be used to endorse or promote products derived from
> ++ * this software without specific prior written permission.
> ++ *
> ++ * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
> ++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
> ++ * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
> ++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> ++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
> ++ * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> ++ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> ++ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> ++ * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> ++ * ----------------------------------------------------------------------------
> ++ * File Name           : usb-a9260.h
> ++ * Object              :
> ++ * Creation            : GH Oct 1th 2012
> ++ *-----------------------------------------------------------------------------
> ++ */
> ++#ifndef _USB_A9260_H
> ++#define _USB_A9260_H
> ++
> ++/* ******************************************************************* */
> ++/* PMC Settings                                                        */
> ++/*                                                                     */
> ++/* The main oscillator is enabled as soon as possible in the c_startup */
> ++/* and MCK is switched on the main oscillator.                         */
> ++/* PLL initialization is done later in the hw_init() function          */
> ++/* ******************************************************************* */
> ++#define MASTER_CLOCK		(180000000/2)
> ++#define PLL_LOCK_TIMEOUT	1000000
> ++
> ++#define PLLA_SETTINGS	0x20593F06
> ++#define PLLB_SETTINGS	0x10483F0E
> ++
> ++/* Switch MCK on PLLA output PCK = PLLA = 2 * MCK */
> ++#define MCKR_SETTINGS		(AT91C_PMC_PRES_CLK | AT91C_PMC_MDIV_2)
> ++#define MCKR_CSS_SETTINGS	(AT91C_PMC_CSS_PLLA_CLK | MCKR_SETTINGS)
> ++
> ++/* ******************************************************************* */
> ++/* NandFlash Settings                                                  */
> ++/*                                                                     */
> ++/* ******************************************************************* */
> ++#define AT91C_SMARTMEDIA_BASE	0x40000000
> ++
> ++#define AT91_SMART_MEDIA_ALE    (1 << 21)	/* our ALE is AD21 */
> ++#define AT91_SMART_MEDIA_CLE    (1 << 22)	/* our CLE is AD22 */
> ++
> ++#define NAND_DISABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_SODR = AT91C_PIO_PC14;} while(0)
> ++#define NAND_ENABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_CODR = AT91C_PIO_PC14;} while(0)
> ++
> ++#define NAND_WAIT_READY() while (!(*(volatile unsigned int *)AT91C_PIOC_PDSR & AT91C_PIO_PC13))
> ++
> ++
> ++/* ******************************************************************** */
> ++/* SMC Chip Select 3 Timings for NandFlash for MASTER_CLOCK = 90000000.*/
> ++/* Please refer to SMC section in AT91SAM datasheet to learn how 	*/
> ++/* to generate these values. 						*/
> ++/* ******************************************************************** */
> ++#define AT91C_SM_NWE_SETUP	(1 << 0)
> ++#define AT91C_SM_NCS_WR_SETUP	(0 << 8)
> ++#define AT91C_SM_NRD_SETUP	(1 << 16)
> ++#define AT91C_SM_NCS_RD_SETUP	(0 << 24)
> ++  ++#define AT91C_SM_NWE_PULSE 	(3 << 0)
> ++#define AT91C_SM_NCS_WR_PULSE	(3 << 8)
> ++#define AT91C_SM_NRD_PULSE	(3 << 16)
> ++#define AT91C_SM_NCS_RD_PULSE	(3 << 24)
> ++  ++#define AT91C_SM_NWE_CYCLE 	(5 << 0)
> ++#define AT91C_SM_NRD_CYCLE	(5 << 16)
> ++#define AT91C_SM_TDF	        (2 << 16)
> ++
> ++/* ******************************************************************* */
> ++/* BootStrap Settings                                                  */
> ++/*                                                                     */
> ++/* ******************************************************************* */
> ++#define IMG_ADDRESS 		0x20000		/* Image Address in NandFlash */
> ++#define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
> ++
> ++#define MACH_TYPE       	0x6AD		/* USB-A9260 */
> ++#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
> ++
> ++/* ******************************************************************* */
> ++/* Application Settings                                                */
> ++/* ******************************************************************* */
> ++#undef CFG_DEBUG
> ++#undef CFG_DATAFLASH
> ++
> ++#define CFG_NANDFLASH
> ++#undef	NANDFLASH_SMALL_BLOCKS	/* NANDFLASH_LARGE_BLOCKS used instead */
> ++
> ++#define CFG_HW_INIT
> ++#define CFG_SDRAM
> ++
> ++#endif	/* _USB_A9260_H */
> +diff --git a/board/usb_a9260/usb_a9260.c b/board/usb_a9260/usb_a9260.c
> +new file mode 100644
> +index 0000000..de30f0b
> +--- /dev/null
> ++++ b/board/usb_a9260/usb_a9260.c
> +@@ -0,0 +1,298 @@
> ++/* ----------------------------------------------------------------------------
> ++ *         ATMEL Microcontroller Software Support  -  ROUSSET  -
> ++ * ----------------------------------------------------------------------------
> ++ * Copyright (c) 2006, Atmel Corporation
> ++
> ++ * All rights reserved.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions are met:
> ++ *
> ++ * - Redistributions of source code must retain the above copyright notice,
> ++ * this list of conditions and the disclaiimer below.
> ++ *
> ++ * Atmel's name may not be used to endorse or promote products derived from
> ++ * this software without specific prior written permission.
> ++ *
> ++ * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
> ++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
> ++ * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
> ++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> ++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
> ++ * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> ++ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> ++ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> ++ * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> ++ * ----------------------------------------------------------------------------
> ++ * File Name           : usb_a9260.c
> ++ * Object              :
> ++ * Creation            : GH Oct 1th 2012
> ++ *-----------------------------------------------------------------------------
> ++ */
> ++#include "../../include/part.h"
> ++#include "../../include/gpio.h"
> ++#include "../../include/pmc.h"
> ++#include "../../include/debug.h"
> ++#include "../../include/sdramc.h"
> ++#include "../../include/main.h"
> ++#ifdef CFG_NANDFLASH
> ++#include "../../include/nandflash.h"
> ++#endif
> ++#ifdef CFG_DATAFLASH
> ++#include "../../include/dataflash.h"
> ++#endif
> ++
> ++static inline unsigned int get_cp15(void)
> ++{
> ++	unsigned int value;
> ++	__asm__("mrc p15, 0, %0, c1, c0, 0" : "=r" (value));
> ++	return value;
> ++}
> ++
> ++static inline void set_cp15(unsigned int value)
> ++{
> ++	__asm__("mcr p15, 0, %0, c1, c0, 0" : : "r" (value));
> ++}
> ++
> ++#ifdef CFG_HW_INIT
> ++/*----------------------------------------------------------------------------*/
> ++/* \fn    hw_init							      */
> ++/* \brief This function performs very low level HW initialization	      */
> ++/* This function is invoked as soon as possible during the c_startup	      */
> ++/* The bss segment must be initialized					      */
> ++/*----------------------------------------------------------------------------*/
> ++void hw_init(void)
> ++{
> ++	unsigned int cp15;
> ++	
> ++	/* Configure PIOs */
> ++	const struct pio_desc hw_pio[] = {
> ++#ifdef CFG_DEBUG
> ++		{"RXD", AT91C_PIN_PB(14), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"TXD", AT91C_PIN_PB(15), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++#endif
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Disable watchdog */
> ++	writel(AT91C_WDTC_WDDIS, AT91C_BASE_WDTC + WDTC_WDMR);
> ++
> ++	/* At this stage the main oscillator is supposed to be enabled
> ++	 * PCK = MCK = MOSC */
> ++
> ++	/* Configure PLLA = MOSC * (PLL_MULA + 1) / PLL_DIVA */
> ++	pmc_cfg_plla(PLLA_SETTINGS, PLL_LOCK_TIMEOUT);
> ++
> ++	/* PCK = PLLA = 2 * MCK */
> ++	pmc_cfg_mck(MCKR_SETTINGS, PLL_LOCK_TIMEOUT);
> ++	/* Switch MCK on PLLA output */
> ++	pmc_cfg_mck(MCKR_CSS_SETTINGS, PLL_LOCK_TIMEOUT);
> ++
> ++	/* Configure PLLB */
> ++	pmc_cfg_pllb(PLLB_SETTINGS, PLL_LOCK_TIMEOUT);
> ++
> ++	/* Configure CP15 */
> ++	cp15 = get_cp15();
> ++	cp15 |= I_CACHE;
> ++	set_cp15(cp15);
> ++
> ++	/* Configure the PIO controller */
> ++	pio_setup(hw_pio);
> ++
> ++	/* Configure the EBI Slave Slot Cycle to 64 */
> ++	writel( (readl((AT91C_BASE_MATRIX + MATRIX_SCFG3)) & ~0xFF) | 0x40, (AT91C_BASE_MATRIX + MATRIX_SCFG3));
> ++
> ++#ifdef CFG_DEBUG
> ++	/* Enable Debug messages on the DBGU */
> ++	dbg_init(BAUDRATE(MASTER_CLOCK, 115200));
> ++
> ++	dbg_print("Start AT91Bootstrap...\n\r");
> ++#endif /* CFG_DEBUG */
> ++
> ++#ifdef CFG_SDRAM
> ++	/* Initialize the matrix */
> ++	writel(readl(AT91C_BASE_CCFG + CCFG_EBICSA) | AT91C_EBI_CS1A_SDRAMC, AT91C_BASE_CCFG + CCFG_EBICSA);
> ++
> ++	/* Configure SDRAM Controller */
> ++	sdram_init(	AT91C_SDRAMC_NC_9  |
> ++				AT91C_SDRAMC_NR_13 |
> ++				AT91C_SDRAMC_CAS_2 |
> ++				AT91C_SDRAMC_NB_4_BANKS |
> ++				AT91C_SDRAMC_DBW_32_BITS |
> ++				AT91C_SDRAMC_TWR_2 |
> ++				AT91C_SDRAMC_TRC_7 |
> ++				AT91C_SDRAMC_TRP_2 |
> ++				AT91C_SDRAMC_TRCD_2 |
> ++				AT91C_SDRAMC_TRAS_5 |
> ++				AT91C_SDRAMC_TXSR_8,		/* Control Register */
> ++				(MASTER_CLOCK * 7)/1000000,	/* Refresh Timer Register */
> ++				AT91C_SDRAMC_MD_SDRAM);		/* SDRAM (no low power)   */ ++
> ++
> ++#endif /* CFG_SDRAM */
> ++}
> ++#endif /* CFG_HW_INIT */
> ++
> ++#ifdef CFG_SDRAM
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    sdramc_hw_init							*/
> ++/* \brief This function performs SDRAMC HW initialization			*/
> ++/*------------------------------------------------------------------------------*/
> ++void sdramc_hw_init(void)
> ++{
> ++	/* Configure PIOs */
> ++/*	const struct pio_desc sdramc_pio[] = {
> ++		{"D16", AT91C_PIN_PC(16), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D17", AT91C_PIN_PC(17), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D18", AT91C_PIN_PC(18), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D19", AT91C_PIN_PC(19), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D20", AT91C_PIN_PC(20), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D21", AT91C_PIN_PC(21), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D22", AT91C_PIN_PC(22), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D23", AT91C_PIN_PC(23), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D24", AT91C_PIN_PC(24), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D25", AT91C_PIN_PC(25), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D26", AT91C_PIN_PC(26), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D27", AT91C_PIN_PC(27), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D28", AT91C_PIN_PC(28), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D29", AT91C_PIN_PC(29), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D30", AT91C_PIN_PC(30), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"D31", AT91C_PIN_PC(31), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++*/
> ++	/* Configure the SDRAMC PIO controller to output PCK0 */
> ++/*	pio_setup(sdramc_pio); */
> ++
> ++	writel(0xFFFF0000, AT91C_BASE_PIOC + PIO_ASR(0));
> ++	writel(0xFFFF0000, AT91C_BASE_PIOC + PIO_PDR(0));
> ++
> ++}
> ++#endif /* CFG_SDRAM */
> ++
> ++#ifdef CFG_DATAFLASH
> ++
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    df_recovery								*/
> ++/* \brief This function erases DataFlash Page 0 if USR PB is pressed 		*/
> ++/*        during boot sequence							*/
> ++/*------------------------------------------------------------------------------*/
> ++void df_recovery(AT91PS_DF pDf)
> ++{
> ++#if (AT91C_SPI_PCS_DATAFLASH == AT91C_SPI_PCS0_DATAFLASH)
> ++	/* Configure PIOs */
> ++	const struct pio_desc usrpb_pio[] = {
> ++		{"USRPB", AT91C_PIN_PB(10), 0, PIO_PULLUP, PIO_INPUT},
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Configure the PIO controller */
> ++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
> ++	pio_setup(usrpb_pio);
> ++	
> ++	/* If USR PB is pressed during Boot sequence */
> ++	/* Erase DataFlash Page 0*/
> ++	if ( !pio_get_value(AT91C_PIN_PB(10)) )
> ++		df_page_erase(pDf, 0);
> ++#endif
> ++}
> ++
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    df_hw_init								*/
> ++/* \brief This function performs DataFlash HW initialization			*/
> ++/*------------------------------------------------------------------------------*/
> ++void df_hw_init(void)
> ++{
> ++	/* Configure PIOs */
> ++	const struct pio_desc df_pio[] = {
> ++		{"MISO",  AT91C_PIN_PA(0), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"MOSI",  AT91C_PIN_PA(1), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++		{"SPCK",  AT91C_PIN_PA(2), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++#if (AT91C_SPI_PCS_DATAFLASH == AT91C_SPI_PCS0_DATAFLASH)
> ++		{"NPCS0", AT91C_PIN_PA(3), 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++#endif
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Configure the PIO controller */
> ++	pio_setup(df_pio);
> ++}
> ++#endif /* CFG_DATAFLASH */
> ++
> ++
> ++
> ++#ifdef CFG_NANDFLASH
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    nand_recovery						*/
> ++/* \brief This function erases NandFlash Block 0 if USR PB is pressed 		*/
> ++/*        during boot sequence							*/
> ++/*------------------------------------------------------------------------------*/
> ++static void nand_recovery(void)
> ++{
> ++	/* Configure PIOs */
> ++	const struct pio_desc usrpb_pio[] = {
> ++		{"USRPB", AT91C_PIN_PB(10), 0, PIO_PULLUP, PIO_INPUT},
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Configure the PIO controller */
> ++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
> ++	pio_setup(usrpb_pio);
> ++	
> ++	/* If USR PB is pressed during Boot sequence */
> ++	/* Erase NandFlash block 0*/
> ++	if (!pio_get_value(AT91C_PIN_PB(10)) )
> ++		AT91F_NandEraseBlock0();
> ++}
> ++
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    nandflash_hw_init							*/
> ++/* \brief NandFlash HW init							*/
> ++/*------------------------------------------------------------------------------*/
> ++void nandflash_hw_init(void)
> ++{
> ++	/* Configure PIOs */
> ++	const struct pio_desc nand_pio[] = {
> ++		{"RDY_BSY", AT91C_PIN_PC(13), 0, PIO_PULLUP, PIO_INPUT},
> ++		{"NANDCS",  AT91C_PIN_PC(14), 0, PIO_PULLUP, PIO_OUTPUT},
> ++		{(char *) 0, 0, 0,  PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Setup Smart Media, first enable the address range of CS3 in HMATRIX user interface */
> ++	writel(readl(AT91C_BASE_CCFG + CCFG_EBICSA) | AT91C_EBI_CS3A_SM, AT91C_BASE_CCFG + CCFG_EBICSA);
> ++		    ++	/* Configure SMC CS3 */
> ++ 	writel((AT91C_SM_NWE_SETUP | AT91C_SM_NCS_WR_SETUP | AT91C_SM_NRD_SETUP | AT91C_SM_NCS_RD_SETUP), AT91C_BASE_SMC + SMC_SETUP3);
> ++  	writel((AT91C_SM_NWE_PULSE | AT91C_SM_NCS_WR_PULSE | AT91C_SM_NRD_PULSE | AT91C_SM_NCS_RD_PULSE), AT91C_BASE_SMC + SMC_PULSE3);
> ++	writel((AT91C_SM_NWE_CYCLE | AT91C_SM_NRD_CYCLE)						, AT91C_BASE_SMC + SMC_CYCLE3);
> ++	writel((AT91C_SMC_READMODE | AT91C_SMC_WRITEMODE | AT91C_SMC_NWAITM_NWAIT_DISABLE | ++  		AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS | AT91C_SM_TDF)						, AT91C_BASE_SMC + SMC_CTRL3);
> ++
> ++	/* Configure the PIO controller */
> ++	writel((1 << AT91C_ID_PIOC), PMC_PCER + AT91C_BASE_PMC);
> ++	pio_setup(nand_pio);
> ++	
> ++	nand_recovery();
> ++}
> ++
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    nandflash_cfg_16bits_dbw_init						*/
> ++/* \brief Configure SMC in 16 bits mode						*/
> ++/*------------------------------------------------------------------------------*/
> ++void nandflash_cfg_16bits_dbw_init(void)
> ++{
> ++	writel(readl(AT91C_BASE_SMC + SMC_CTRL3) | AT91C_SMC_DBW_WIDTH_SIXTEEN_BITS, AT91C_BASE_SMC + SMC_CTRL3);
> ++}
> ++
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    nandflash_cfg_8bits_dbw_init						*/
> ++/* \brief Configure SMC in 8 bits mode						*/
> ++/*------------------------------------------------------------------------------*/
> ++void nandflash_cfg_8bits_dbw_init(void)
> ++{
> ++	writel((readl(AT91C_BASE_SMC + SMC_CTRL3) & ~(AT91C_SMC_DBW)) | AT91C_SMC_DBW_WIDTH_EIGTH_BITS, AT91C_BASE_SMC + SMC_CTRL3);
> ++}
> ++
> ++
> ++#endif /* #ifdef CFG_NANDFLASH */
> +diff --git a/crt0_gnu.S b/crt0_gnu.S
> +index 042b617..002feef 100644
> +--- a/crt0_gnu.S
> ++++ b/crt0_gnu.S
> +@@ -106,6 +106,13 @@ _relocate_to_sram:
> + #endif /* CFG_NORFLASH */
> + + _setup_clocks:
> ++/* Test if main osc is bypassed */
> ++	ldr 	r0,=AT91C_PMC_MOR
> ++	ldr 	r1, [r0]
> ++	ldr 	r2,=AT91C_CKGR_OSCBYPASS ++	ands 	r1, r1, r2
> ++	bne	_init_data	/* branch if OSCBYPASS=1 */
> ++
> + /* Test if main oscillator is enabled */
> + 	ldr 	r0,=AT91C_PMC_SR
> + 	ldr 	r1, [r0]
> +diff --git a/include/part.h b/include/part.h
> +index ba5985a..212789f 100644
> +--- a/include/part.h
> ++++ b/include/part.h
> +@@ -35,7 +35,11 @@
> + + #ifdef AT91SAM9260
> + #include "AT91SAM9260_inc.h"
> +-#include "at91sam9260ek.h"
> ++	#ifdef at91sam9260ek
> ++	#include "at91sam9260ek.h"
> ++	#elif usb_a9260
> ++	#include "usb-a9260.h"
> ++	#endif
> + #endif
> + + #ifdef AT91SAM9XE
> +-- +1.7.9.5
> +
> diff --git a/board/calao/usb-a9260/barebox-2012.09.0-usb-a9260.patch b/board/calao/usb-a9260/barebox-2012.09.0-usb-a9260.patch
> new file mode 100644
> index 0000000..49a189d
> --- /dev/null
> +++ b/board/calao/usb-a9260/barebox-2012.09.0-usb-a9260.patch
> @@ -0,0 +1,20 @@
> +diff --git a/arch/arm/configs/usb_a9260_defconfig b/arch/arm/configs/usb_a9260_defconfig
> +index 8fd2a18..161a6c2 100644
> +--- a/arch/arm/configs/usb_a9260_defconfig
> ++++ b/arch/arm/configs/usb_a9260_defconfig
> +@@ -44,7 +44,6 @@ CONFIG_CMD_BOOTM_INITRD=y
> + CONFIG_CMD_BOOTM_OFTREE=y
> + CONFIG_CMD_BOOTM_OFTREE_UIMAGE=y
> + CONFIG_CMD_UIMAGE=y
> +-# CONFIG_CMD_BOOTZ is not set
> + # CONFIG_CMD_BOOTU is not set
> + CONFIG_CMD_RESET=y
> + CONFIG_CMD_GO=y
> +@@ -74,7 +73,6 @@ CONFIG_NAND_ATMEL=y
> + CONFIG_UBI=y
> + CONFIG_USB_GADGET=y
> + CONFIG_USB_GADGET_DFU=y
> +-CONFIG_USB_GADGET_SERIAL=y
> + CONFIG_LED=y
> + CONFIG_LED_GPIO=y
> + CONFIG_LED_TRIGGERS=y
> diff --git a/board/calao/usb-a9260/linux-3.5.4.config b/board/calao/usb-a9260/linux-3.5.4.config
> new file mode 100644
> index 0000000..53dbe36
> --- /dev/null
> +++ b/board/calao/usb-a9260/linux-3.5.4.config
> @@ -0,0 +1,98 @@
> +CONFIG_EXPERIMENTAL=y
> +# CONFIG_LOCALVERSION_AUTO is not set
> +# CONFIG_SWAP is not set
> +CONFIG_SYSVIPC=y
> +CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_SLAB=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
> +# CONFIG_IOSCHED_DEADLINE is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_ARCH_AT91=y
> +CONFIG_ARCH_AT91SAM9260=y
> +CONFIG_MACH_USB_A9260=y
> +CONFIG_AT91_SLOW_CLOCK=y
> +# CONFIG_ARM_THUMB is not set
> +CONFIG_AEABI=y
> +CONFIG_ZBOOT_ROM_TEXT=0x0
> +CONFIG_ZBOOT_ROM_BSS=0x0
> +CONFIG_CMDLINE="mem=64M console=ttyS0,115200"
> +CONFIG_FPE_NWFPE=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_IP_ADVANCED_ROUTER=y
> +CONFIG_IP_ROUTE_VERBOSE=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_BOOTP=y
> +CONFIG_IP_PNP_RARP=y
> +CONFIG_IP_MROUTE=y
> +CONFIG_IP_PIMSM_V1=y
> +CONFIG_IP_PIMSM_V2=y
> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +# CONFIG_INET_LRO is not set
> +# CONFIG_INET_DIAG is not set
> +# CONFIG_IPV6 is not set
> +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> +CONFIG_MTD=y
> +CONFIG_MTD_CMDLINE_PARTS=y
> +CONFIG_MTD_CHAR=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_DATAFLASH=y
> +CONFIG_MTD_NAND=y
> +CONFIG_MTD_NAND_ATMEL=y
> +CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
> +CONFIG_MTD_UBI=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_SCSI_MULTI_LUN=y
> +CONFIG_NETDEVICES=y
> +CONFIG_MII=y
> +CONFIG_MACB=y
> +# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_INPUT_EVBUG=y
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=y
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +CONFIG_SERIAL_ATMEL=y
> +CONFIG_SERIAL_ATMEL_CONSOLE=y
> +CONFIG_HW_RANDOM=y
> +CONFIG_SPI=y
> +CONFIG_SPI_ATMEL=y
> +# CONFIG_HWMON is not set
> +# CONFIG_USB_HID is not set
> +CONFIG_USB=y
> +CONFIG_USB_MON=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_ETH=m
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> +CONFIG_EXT2_FS=y
> +CONFIG_FUSE_FS=m
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_JFFS2_FS=y
> +CONFIG_UBIFS_FS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V3_ACL=y
> +CONFIG_NFS_V4=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_CODEPAGE_850=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_USER=y
> +CONFIG_DEBUG_LL=y
> diff --git a/configs/calao_usb_a9260_defconfig b/configs/calao_usb_a9260_defconfig
> new file mode 100644
> index 0000000..fb852f3
> --- /dev/null
> +++ b/configs/calao_usb_a9260_defconfig
> @@ -0,0 +1,16 @@
> +BR2_arm=y
> +BR2_arm926t=y
> +BR2_PACKAGE_MTD=y
> +BR2_PACKAGE_HOST_SAM_BA=y
> +BR2_TARGET_ROOTFS_UBIFS=y
> +BR2_TARGET_AT91BOOTSTRAP=y
> +BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/usb-a9260"
> +BR2_TARGET_AT91BOOTSTRAP_BOARD="usb_a9260"
> +BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
> +BR2_TARGET_BAREBOX=y
> +BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/calao/usb-a9260"
> +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9260"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9260/linux-3.5.4.config"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> -- 
> 1.7.9.5
> 
> 


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

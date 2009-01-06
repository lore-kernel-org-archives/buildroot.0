From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 16:09:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot/2009.01-rc1
Message-ID: <20090106160954.EBFDF76BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 16:09:53 +0000 (Tue, 06 Jan 2009)
New Revision: 24699

Log:
Use the correct sam9g20 patch for 2009.01-rc1

Modified:
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-005-at91sam9g20ek.patch


Changeset:
Modified: trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-005-at91sam9g20ek.patch
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-005-at91sam9g20ek.patch	2009-01-06 14:40:24 UTC (rev 24698)
+++ trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-005-at91sam9g20ek.patch	2009-01-06 16:09:53 UTC (rev 24699)
@@ -10,13 +10,13 @@
 +at91sam9g20ek_dataflash_cs1_config \
 +at91sam9g20ek_config	:	unconfig
 +	@if [ "$(findstring _nandflash,$@)" ] ; then \
-+		echo "#define CFG_USE_NANDFLASH 1"	>>$(obj)include/config.h ; \
++		echo "#define CONFIG_USE_NANDFLASH 1"	>>$(obj)include/config.h ; \
 +		$(XECHO) "... with environment variable in NAND FLASH" ; \
 +	elif [ "$(findstring dataflash_cs0,$@)" ] ; then \
-+		echo "#define CFG_USE_DATAFLASH_CS0 1"	>>$(obj)include/config.h ; \
++		echo "#define CONFIG_USE_DATAFLASH_CS0 1"	>>$(obj)include/config.h ; \
 +		$(XECHO) "... with environment variable in SPI DATAFLASH CS0" ; \
 +	else \
-+		echo "#define CFG_USE_DATAFLASH_CS1 1"	>>$(obj)include/config.h ; \
++		echo "#define CONFIG_USE_DATAFLASH_CS1 1"	>>$(obj)include/config.h ; \
 +		$(XECHO) "... with environment variable in SPI DATAFLASH CS1" ; \
 +	fi;
 +	@$(MKCONFIG) -a at91sam9g20ek arm arm926ejs at91sam9g20ek atmel at91
@@ -61,7 +61,7 @@
 +/* ARM asynchronous clock */
 +#define AT91_MAIN_CLOCK		396288000	/* from 18.432 MHz crystal */
 +#define AT91_MASTER_CLOCK	132096000	/* peripheral = main / 3 */
-+#define CFG_HZ			1000000		/* 1us resolution */
++#define CONFIG_SYS_HZ			1000000		/* 1us resolution */
 +
 +#define AT91_SLOW_CLOCK		32768	/* slow clock */
 +
@@ -109,7 +109,7 @@
 +
 +#define CONFIG_CMD_PING		1
 +#define CONFIG_CMD_DHCP		1
-+#define CONFIG_CMD_NAND		1
++#define CONFIG_CMD_NAND
 +#define CONFIG_CMD_USB		1
 +
 +/* SDRAM */
@@ -119,22 +119,22 @@
 +
 +/* DataFlash */
 +#define CONFIG_HAS_DATAFLASH		1
-+#define CFG_SPI_WRITE_TOUT		(5*CFG_HZ)
-+#define CFG_MAX_DATAFLASH_BANKS		2
-+#define CFG_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* CS0 */
-+#define CFG_DATAFLASH_LOGIC_ADDR_CS1	0xD0000000	/* CS1 */
++#define CONFIG_SYS_SPI_WRITE_TOUT		(5*CONFIG_SYS_HZ)
++#define CONFIG_SYS_MAX_DATAFLASH_BANKS		2
++#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* CS0 */
++#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1	0xD0000000	/* CS1 */
 +#define AT91_SPI_CLK			15000000
 +#define DATAFLASH_TCSS			(0x22 << 16)
 +#define DATAFLASH_TCHS			(0x1 << 24)
-+
++#define AT91SAM9260_BASE_SPI0		0xfffc8000
 +/* NAND flash */
 +#define NAND_MAX_CHIPS			1
-+#define CFG_MAX_NAND_DEVICE		1
-+#define CFG_NAND_BASE			0x40000000
-+#define CFG_NAND_DBW_8			1
++#define CONFIG_SYS_MAX_NAND_DEVICE		1
++#define CONFIG_SYS_NAND_BASE			0x40000000
++#define CONFIG_SYS_NAND_DBW_8			1
 +
 +/* NOR flash - no real flash on this board */
-+#define CFG_NO_FLASH			1
++#define CONFIG_SYS_NO_FLASH			1
 +
 +/* Ethernet */
 +#define CONFIG_MACB			1
@@ -142,57 +142,57 @@
 +#define CONFIG_NET_MULTI		1
 +#define CONFIG_NET_RETRY_COUNT		20
 +#define CONFIG_RESET_PHY_R		1
-+
++#define AT91SAM9260_BASE_EMAC		0xfffc4000
 +/* USB */
 +#define CONFIG_USB_OHCI_NEW		1
 +#define LITTLEENDIAN			1
 +#define CONFIG_DOS_PARTITION		1
-+#define CFG_USB_OHCI_CPU_INIT		1
-+#define CFG_USB_OHCI_REGS_BASE		0x00500000	/* AT91SAM9G20_UHP_BASE */
-+#define CFG_USB_OHCI_SLOT_NAME		"at91sam9g20"
-+#define CFG_USB_OHCI_MAX_ROOT_PORTS	2
++#define CONFIG_SYS_USB_OHCI_CPU_INIT		1
++#define CONFIG_SYS_USB_OHCI_REGS_BASE		0x00500000	/* AT91SAM9G20_UHP_BASE */
++#define CONFIG_SYS_USB_OHCI_SLOT_NAME		"at91sam9g20"
++#define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
 +#define CONFIG_USB_STORAGE		1
 +
-+#define CFG_LOAD_ADDR			0x22000000	/* load address */
++#define CONFIG_SYS_LOAD_ADDR			0x22000000	/* load address */
 +
-+#define CFG_MEMTEST_START		PHYS_SDRAM
-+#define CFG_MEMTEST_END			0x23e00000
++#define CONFIG_SYS_MEMTEST_START		PHYS_SDRAM
++#define CONFIG_SYS_MEMTEST_END			0x23e00000
 +
-+#ifdef CFG_USE_DATAFLASH_CS0
++#ifdef CONFIG_USE_DATAFLASH_CS0
 +
 +/* bootstrap + u-boot + env + linux in dataflash on CS0 */
-+#define CFG_ENV_IS_IN_DATAFLASH	1
-+#define CFG_MONITOR_BASE	(CFG_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
-+#define CFG_ENV_OFFSET		0x4200
-+#define CFG_ENV_ADDR		(CFG_DATAFLASH_LOGIC_ADDR_CS0 + CFG_ENV_OFFSET)
-+#define CFG_ENV_SIZE		0x4200
++#define CONFIG_ENV_IS_IN_DATAFLASH	1
++#define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
++#define CONFIG_ENV_OFFSET		0x4200
++#define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
++#define CONFIG_ENV_SIZE		0x4200
 +#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
 +#define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
 +				"root=/dev/mtdblock0 "			\
 +				"mtdparts=at91_nand:-(root) "		\
 +				"rw rootfstype=jffs2"
 +
-+#elif CFG_USE_DATAFLASH_CS1
++#elif CONFIG_USE_DATAFLASH_CS1
 +
 +/* bootstrap + u-boot + env + linux in dataflash on CS1 */
-+#define CFG_ENV_IS_IN_DATAFLASH	1
-+#define CFG_MONITOR_BASE	(CFG_DATAFLASH_LOGIC_ADDR_CS1 + 0x8400)
-+#define CFG_ENV_OFFSET		0x4200
-+#define CFG_ENV_ADDR		(CFG_DATAFLASH_LOGIC_ADDR_CS1 + CFG_ENV_OFFSET)
-+#define CFG_ENV_SIZE		0x4200
++#define CONFIG_ENV_IS_IN_DATAFLASH	1
++#define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + 0x8400)
++#define CONFIG_ENV_OFFSET		0x4200
++#define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + CONFIG_ENV_OFFSET)
++#define CONFIG_ENV_SIZE		0x4200
 +#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
 +#define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
 +				"root=/dev/mtdblock0 "			\
 +				"mtdparts=at91_nand:-(root) "		\
 +				"rw rootfstype=jffs2"
 +
-+#else /* CFG_USE_NANDFLASH */
++#else /* CONFIG_USE_NANDFLASH */
 +
 +/* bootstrap + u-boot + env + linux in nandflash */
-+#define CFG_ENV_IS_IN_NAND	1
-+#define CFG_ENV_OFFSET		0x60000
-+#define CFG_ENV_OFFSET_REDUND	0x80000
-+#define CFG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
++#define CONFIG_ENV_IS_IN_NAND	1
++#define CONFIG_ENV_OFFSET		0x60000
++#define CONFIG_ENV_OFFSET_REDUND	0x80000
++#define CONFIG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
 +#define CONFIG_BOOTCOMMAND	"nand read 0x22000000 0xA0000 0x200000; bootm"
 +#define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
 +				"root=/dev/mtdblock5 "			\
@@ -204,21 +204,21 @@
 +#endif
 +
 +#define CONFIG_BAUDRATE		115200
-+#define CFG_BAUDRATE_TABLE	{115200 , 19200, 38400, 57600, 9600 }
++#define CONFIG_SYS_BAUDRATE_TABLE	{115200 , 19200, 38400, 57600, 9600 }
 +
-+#define CFG_PROMPT		"U-Boot> "
-+#define CFG_CBSIZE		256
-+#define CFG_MAXARGS		16
-+#define CFG_PBSIZE		(CFG_CBSIZE + sizeof(CFG_PROMPT) + 16)
-+#define CFG_LONGHELP		1
++#define CONFIG_SYS_PROMPT		"U-Boot> "
++#define CONFIG_SYS_CBSIZE		256
++#define CONFIG_SYS_MAXARGS		16
++#define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
++#define CONFIG_SYS_LONGHELP		1
 +#define CONFIG_CMDLINE_EDITING	1
 +
 +#define ROUND(A, B)		(((A) + (B)) & ~((B) - 1))
 +/*
 + * Size of malloc() pool
 + */
-+#define CFG_MALLOC_LEN		ROUND(3 * CFG_ENV_SIZE + 128*1024, 0x1000)
-+#define CFG_GBL_DATA_SIZE	128	/* 128 bytes for initial data */
++#define CONFIG_SYS_MALLOC_LEN		ROUND(3 * CONFIG_ENV_SIZE + 128*1024, 0x1000)
++#define CONFIG_SYS_GBL_DATA_SIZE	128	/* 128 bytes for initial data */
 +
 +#define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
 +
@@ -231,7 +231,7 @@
 ===================================================================
 --- a/board/atmel/at91sam9g20ek/nand.c	(.../u-boot-1.3.4)	(revision 0)
 +++ b/board/atmel/at91sam9g20ek/nand.c	(.../u-boot-1.3.4-exp)	(revision 8417)
-@@ -0,0 +1,79 @@
+@@ -0,0 +1,78 @@
 +/*
 + * (C) Copyright 2007-2008
 + * Stelian Pop <stelian.pop@leadtechdesign.com>
@@ -271,27 +271,26 @@
 +#define	MASK_ALE	(1 << 21)	/* our ALE is AD21 */
 +#define	MASK_CLE	(1 << 22)	/* our CLE is AD22 */
 +
-+static void at91sam9g20ek_nand_hwcontrol(struct mtd_info *mtd, int cmd)
++static void at91sam9g20ek_nand_hwcontrol(struct mtd_info *mtd,
++					 int cmd, unsigned int ctrl)
 +{
 +	struct nand_chip *this = mtd->priv;
-+	ulong IO_ADDR_W = (ulong) this->IO_ADDR_W;
 +
-+	IO_ADDR_W &= ~(MASK_ALE|MASK_CLE);
-+	switch (cmd) {
-+	case NAND_CTL_SETCLE:
-+		IO_ADDR_W |= MASK_CLE;
-+		break;
-+	case NAND_CTL_SETALE:
-+		IO_ADDR_W |= MASK_ALE;
-+		break;
-+	case NAND_CTL_CLRNCE:
-+		at91_set_gpio_value(AT91_PIN_PC14, 1);
-+		break;
-+	case NAND_CTL_SETNCE:
-+		at91_set_gpio_value(AT91_PIN_PC14, 0);
-+		break;
++	if (ctrl & NAND_CTRL_CHANGE) {
++		ulong IO_ADDR_W = (ulong) this->IO_ADDR_W;
++		IO_ADDR_W &= ~(MASK_ALE | MASK_CLE);
++
++		if (ctrl & NAND_CLE)
++			IO_ADDR_W |= MASK_CLE;
++		if (ctrl & NAND_ALE)
++			IO_ADDR_W |= MASK_ALE;
++
++		at91_set_gpio_value(AT91_PIN_PC14, !(ctrl & NAND_NCE));
++		this->IO_ADDR_W = (void *) IO_ADDR_W;
 +	}
-+	this->IO_ADDR_W = (void *) IO_ADDR_W;
++
++	if (cmd != NAND_CMD_NONE)
++		writeb(cmd, this->IO_ADDR_W);
 +}
 +
 +static int at91sam9g20ek_nand_ready(struct mtd_info *mtd)
@@ -301,11 +300,11 @@
 +
 +int board_nand_init(struct nand_chip *nand)
 +{
-+	nand->eccmode = NAND_ECC_SOFT;
-+#ifdef CFG_NAND_DBW_16
++	nand->ecc.mode = NAND_ECC_SOFT;
++#ifdef CONFIG_SYS_NAND_DBW_16
 +	nand->options = NAND_BUSWIDTH_16;
 +#endif
-+	nand->hwcontrol = at91sam9g20ek_nand_hwcontrol;
++	nand->cmd_ctrl = at91sam9g20ek_nand_hwcontrol;
 +	nand->dev_ready = at91sam9g20ek_nand_ready;
 +	nand->chip_delay = 20;
 +
@@ -351,7 +350,7 @@
 +#if defined(CONFIG_RESET_PHY_R) && defined(CONFIG_MACB)
 +#include <net.h>
 +#endif
-+
++#include <netdev.h>
 +DECLARE_GLOBAL_DATA_PTR;
 +
 +/* ------------------------------------------------------------------------- */
@@ -408,9 +407,9 @@
 +	at91_sys_write(AT91_SMC_MODE(3),
 +		       AT91_SMC_READMODE | AT91_SMC_WRITEMODE |
 +		       AT91_SMC_EXNWMODE_DISABLE |
-+#ifdef CFG_NAND_DBW_16
++#ifdef CONFIG_SYS_NAND_DBW_16
 +		       AT91_SMC_DBW_16 |
-+#else /* CFG_NAND_DBW_8 */
++#else /* CONFIG_SYS_NAND_DBW_8 */
 +		       AT91_SMC_DBW_8 |
 +#endif
 +		       AT91_SMC_TDF_(3));
@@ -665,11 +664,11 @@
 +#include <asm/hardware.h>
 +#include <dataflash.h>
 +
-+AT91S_DATAFLASH_INFO dataflash_info[CFG_MAX_DATAFLASH_BANKS];
++AT91S_DATAFLASH_INFO dataflash_info[CONFIG_SYS_MAX_DATAFLASH_BANKS];
 +
-+struct dataflash_addr cs[CFG_MAX_DATAFLASH_BANKS] = {
-+	{CFG_DATAFLASH_LOGIC_ADDR_CS0, 0},	/* Logical adress, CS */
-+	{CFG_DATAFLASH_LOGIC_ADDR_CS1, 1}
++struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
++	{CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0, 0},	/* Logical adress, CS */
++	{CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1, 1}
 +};
 +
 +/*define the area offsets*/
@@ -795,7 +794,7 @@
 +{
 +	int rc = 0;
 +#ifdef CONFIG_MACB
-+	rc = macb_eth_initialize(0, (void *)AT91_BASE_EMAC, 0x00);
++	rc = macb_eth_initialize(0, (void *)AT91SAM9260_BASE_EMAC, 0x00);
 +#endif
 +	return rc;
 +}

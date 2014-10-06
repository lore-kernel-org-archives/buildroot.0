From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon,  6 Oct 2014 17:24:24 -0400
Subject: [Buildroot] [PATCH] ts5x00: bump to Linux 3.17
Message-ID: <1412630664-9527-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The support for the TS-5400 platform is mainlined since Linux 3.17.

This commit removes the outdated support patch and bumps the kernel
headers (and thus Linux) to 3.17.x.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 .../{linux-3.14.config => linux-3.17.config}       |   0
 .../linux/linux-001-add-support-for-ts5400.patch   | 117 ---------------------
 configs/ts5x00_defconfig                           |   5 +-
 3 files changed, 2 insertions(+), 120 deletions(-)
 rename board/ts/ts5x00/{linux-3.14.config => linux-3.17.config} (100%)
 delete mode 100644 board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch

diff --git a/board/ts/ts5x00/linux-3.14.config b/board/ts/ts5x00/linux-3.17.config
similarity index 100%
rename from board/ts/ts5x00/linux-3.14.config
rename to board/ts/ts5x00/linux-3.17.config
diff --git a/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch b/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
deleted file mode 100644
index 0e5c37b..0000000
--- a/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 510acd057785ff52bfdfed6360a44a42f44e078f Mon Sep 17 00:00:00 2001
-From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
-Date: Mon, 7 Jul 2014 15:56:11 -0400
-Subject: [PATCH] x86: (ts5500) add board support for TS-5400
-
-This patch extends the TS-5500 board support to identify the compatible
-TS-5400 Single Board Computer (ID 0x40).
-
-It also adds a new "name" sysfs attribute for more human readable
-identification, actually printing "TS-5500" or "TS-5400".
-
-Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
----
- arch/x86/platform/ts5500/ts5500.c | 34 +++++++++++++++++++++++++++-------
- 1 file changed, 27 insertions(+), 7 deletions(-)
-
-diff --git a/arch/x86/platform/ts5500/ts5500.c b/arch/x86/platform/ts5500/ts5500.c
-index 9471b94..127fce2 100644
---- a/arch/x86/platform/ts5500/ts5500.c
-+++ b/arch/x86/platform/ts5500/ts5500.c
-@@ -31,7 +31,6 @@
- 
- /* Product code register */
- #define TS5500_PRODUCT_CODE_ADDR	0x74
--#define TS5500_PRODUCT_CODE		0x60	/* TS-5500 product code */
- 
- /* SRAM/RS-485/ADC options, and RS-485 RTS/Automatic RS-485 flags register */
- #define TS5500_SRAM_RS485_ADC_ADDR	0x75
-@@ -64,9 +63,17 @@
- #define TS5500_ADC_CONV_MSB_ADDR	0x197	/* MSB register */
- #define TS5500_ADC_CONV_DELAY		12	/* usec */
- 
-+static const struct ts5x00_info {
-+	const int id;
-+	const char * const name;
-+} ts5x00_info[] = {
-+	{ 0x40, "TS-5400" },
-+	{ 0x60, "TS-5500" },
-+};
-+
- /**
-  * struct ts5500_sbc - TS-5500 board description
-- * @id:		Board product ID.
-+ * @info:	Board identification.
-  * @sram:	Flag for SRAM option.
-  * @rs485:	Flag for RS-485 option.
-  * @adc:	Flag for Analog/Digital converter option.
-@@ -75,7 +82,7 @@
-  * @jumpers:	Bitfield for jumpers' state.
-  */
- struct ts5500_sbc {
--	int	id;
-+	const struct ts5x00_info *info;
- 	bool	sram;
- 	bool	rs485;
- 	bool	adc;
-@@ -117,18 +124,21 @@ static int __init ts5500_check_signature(void)
- static int __init ts5500_detect_config(struct ts5500_sbc *sbc)
- {
- 	u8 tmp;
-+	int i;
- 	int ret = 0;
- 
- 	if (!request_region(TS5500_PRODUCT_CODE_ADDR, 4, "ts5500"))
- 		return -EBUSY;
- 
- 	tmp = inb(TS5500_PRODUCT_CODE_ADDR);
--	if (tmp != TS5500_PRODUCT_CODE) {
--		pr_err("This platform is not a TS-5500 (found ID 0x%x)\n", tmp);
-+	for (i = 0; i < ARRAY_SIZE(ts5x00_info) && !sbc->info; ++i)
-+		if (tmp == ts5x00_info[i].id)
-+			sbc->info = &ts5x00_info[i];
-+	if (!sbc->info) {
-+		pr_err("Not a known TS-5x00 platform (found ID 0x%x)\n", tmp);
- 		ret = -ENODEV;
- 		goto cleanup;
- 	}
--	sbc->id = tmp;
- 
- 	tmp = inb(TS5500_SRAM_RS485_ADC_ADDR);
- 	sbc->sram = tmp & TS5500_SRAM;
-@@ -152,7 +162,15 @@ static ssize_t ts5500_show_id(struct device *dev,
- {
- 	struct ts5500_sbc *sbc = dev_get_drvdata(dev);
- 
--	return sprintf(buf, "0x%.2x\n", sbc->id);
-+	return sprintf(buf, "0x%.2x\n", sbc->info->id);
-+}
-+
-+static ssize_t ts5500_show_name(struct device *dev,
-+			        struct device_attribute *attr, char *buf)
-+{
-+	struct ts5500_sbc *sbc = dev_get_drvdata(dev);
-+
-+	return sprintf(buf, "%s\n", sbc->info->name);
- }
- 
- static ssize_t ts5500_show_jumpers(struct device *dev,
-@@ -180,6 +198,7 @@ TS5500_SHOW(ereset)
- TS5500_SHOW(itr)
- 
- static DEVICE_ATTR(id, S_IRUGO, ts5500_show_id, NULL);
-+static DEVICE_ATTR(name, S_IRUGO, ts5500_show_name, NULL);
- static DEVICE_ATTR(jumpers, S_IRUGO, ts5500_show_jumpers, NULL);
- static DEVICE_ATTR(sram, S_IRUGO, ts5500_show_sram, NULL);
- static DEVICE_ATTR(rs485, S_IRUGO, ts5500_show_rs485, NULL);
-@@ -189,6 +208,7 @@ static DEVICE_ATTR(itr, S_IRUGO, ts5500_show_itr, NULL);
- 
- static struct attribute *ts5500_attributes[] = {
- 	&dev_attr_id.attr,
-+	&dev_attr_name.attr,
- 	&dev_attr_jumpers.attr,
- 	&dev_attr_sram.attr,
- 	&dev_attr_rs485.attr,
--- 
-1.9.1
-
diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
index 0bb26ad..336f6d9 100644
--- a/configs/ts5x00_defconfig
+++ b/configs/ts5x00_defconfig
@@ -1,13 +1,12 @@
 BR2_i386=y
 BR2_x86_i586=y
-BR2_KERNEL_HEADERS_3_14=y
+BR2_KERNEL_HEADERS_3_17=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_ROOTFS_OVERLAY="board/ts/ts5x00/fs-overlay"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
-BR2_LINUX_KERNEL_PATCH="board/ts/ts5x00/patches/linux/"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ts/ts5x00/linux-3.14.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ts/ts5x00/linux-3.17.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.1.2

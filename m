From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:47 +0200
Subject: [Buildroot] [PATCH 3/5] force 1 bit communication with SD card
In-Reply-To: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
References: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468312009-22124-4-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Early AM335x-evm boards can only use 1 bit communication to the SD card, on
newer board revisions this might be fixed.
Forcing 1 bit communication slows down the communication but will work
regardless if the SD card is attached via 1 or 4 bits.
If the board has a working 4 bit SD card interface, this patch can be removed,
this will speed up the access.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 .../uboot/0001-mmc-force-1bit-bus-width.patch      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch

diff --git a/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch b/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch
new file mode 100644
index 0000000..ecaabaa
--- /dev/null
+++ b/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch
@@ -0,0 +1,29 @@
+diff -Naur a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
+--- a/drivers/mmc/mmc.c	2016-05-16 16:40:32.000000000 +0200
++++ b/drivers/mmc/mmc.c	2016-07-11 13:23:13.235880737 +0200
+@@ -1351,25 +1351,6 @@
+ 	mmc->card_caps &= mmc->cfg->host_caps;
+ 
+ 	if (IS_SD(mmc)) {
+-		if (mmc->card_caps & MMC_MODE_4BIT) {
+-			cmd.cmdidx = MMC_CMD_APP_CMD;
+-			cmd.resp_type = MMC_RSP_R1;
+-			cmd.cmdarg = mmc->rca << 16;
+-
+-			err = mmc_send_cmd(mmc, &cmd, NULL);
+-			if (err)
+-				return err;
+-
+-			cmd.cmdidx = SD_CMD_APP_SET_BUS_WIDTH;
+-			cmd.resp_type = MMC_RSP_R1;
+-			cmd.cmdarg = 2;
+-			err = mmc_send_cmd(mmc, &cmd, NULL);
+-			if (err)
+-				return err;
+-
+-			mmc_set_bus_width(mmc, 4);
+-		}
+-
+ 		if (mmc->card_caps & MMC_MODE_HS)
+ 			mmc->tran_speed = 50000000;
+ 		else
-- 
1.9.1

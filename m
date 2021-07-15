From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:59:15 +0200
Subject: [Buildroot] [git commit]
 board/stmicroelectronics/common/stm32mp157: fix U-Boot corruption on the
 first boot
Message-ID: <20210715192625.58A0790F48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=3e70251d3615c8b76e80cd29afef852b721070e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The stm32mp157 images successfully boot only once. Subsequent boot
attempts fail to reach U-Boot. The root cause turns out to be in U-Boot
corruption during the first boot. The stm32mp1 U-Boot stores its
environment at the end of GPT partition named 'ssbl' since v2020.10-rc2.
However Buildroot genimage template for stm32mp157 boards creates 'ssbl'
partition w/o extra space for U-Boot primary and redundant environments.
This patch explicitly specifies 'ssbl' partition size that should be
enough for both u-boot.stm32 image (~1M) and both environments (16K).

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Tested-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/stmicroelectronics/common/stm32mp157/genimage.cfg.template | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index f341c19f2f..03fba8daf0 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -13,6 +13,7 @@ image sdcard.img {
 
 	partition ssbl {
 		image = "u-boot.stm32"
+		size = 2M
 	}
 
 	partition rootfs {

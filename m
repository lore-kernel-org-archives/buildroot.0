Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D0CC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540358175C;
	Tue, 23 Aug 2022 21:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 540358175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0e2yfWOkf3j; Tue, 23 Aug 2022 21:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BDEA8138F;
	Tue, 23 Aug 2022 21:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BDEA8138F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6984D1BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 448CF60804
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 448CF60804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdtN_CGT1T6S for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:29:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72A14607C1
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A14607C1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1C49787C14; Tue, 23 Aug 2022 21:15:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:29:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 701e6f34e0c54c3041cfd9e154ed4da6902c4823
X-Git-Newrev: 81aa9e7b8b1650462719889717caa67c99bef0f8
X-Patchwork-Hint: ignore
Message-Id: <20220823211501.1C49787C14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/common/imx: align
 u-boot-spl to 4 bytes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=81aa9e7b8b1650462719889717caa67c99bef0f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When enable DM for SPL binary, the DTB part of SPL may not 4 bytes aligned.
If u-boot-spl is not aligned, the offset of the DDR firmware is not 4
byte aligned when u-boot-spl-ddr.bin is created. This causes the ddr
firmware to not be loaded correctly at boot.

See imx-mkimage commit
https://source.codeaurora.org/external/imx/imx-mkimage/commit/?id=bba038d893046b44683182dba540f104dab80fe7
for the imx-mkimage details.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 9025fb132d..ace0f6d610 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -9,7 +9,8 @@ main ()
 	fi
 
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
-		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		dd if=${BINARIES_DIR}/u-boot-spl.bin of=${BINARIES_DIR}/u-boot-spl-padded.bin bs=4 conv=sync
+		cat ${BINARIES_DIR}/u-boot-spl-padded.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
 		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
 			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0xfe000000 ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		else
@@ -20,7 +21,8 @@ main ()
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
-		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		dd if=${BINARIES_DIR}/u-boot-spl.bin of=${BINARIES_DIR}/u-boot-spl-padded.bin bs=4 conv=sync
+		cat ${BINARIES_DIR}/u-boot-spl-padded.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
 		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
 			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0xbe000000 ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		else
@@ -31,7 +33,8 @@ main ()
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" ${BR2_CONFIG}; then
-		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		dd if=${BINARIES_DIR}/u-boot-spl.bin of=${BINARIES_DIR}/u-boot-spl-padded.bin bs=4 conv=sync
+		cat ${BINARIES_DIR}/u-boot-spl-padded.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
 		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
 			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0x56000000 ATF_LOAD_ADDR=0x00960000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		else
@@ -42,7 +45,8 @@ main ()
 
 		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x912000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y$" ${BR2_CONFIG}; then
-		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		dd if=${BINARIES_DIR}/u-boot-spl.bin of=${BINARIES_DIR}/u-boot-spl-padded.bin bs=4 conv=sync
+		cat ${BINARIES_DIR}/u-boot-spl-padded.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
 		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
 			BL31=${BINARIES_DIR}/bl31.bin BL32=${BINARIES_DIR}/tee.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin TEE_LOAD_ADDR=0x56000000 ATF_LOAD_ADDR=0x00970000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

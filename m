Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC28C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 12:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9543060FD7;
	Tue, 16 Aug 2022 12:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9543060FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BojJLlBz1CLb; Tue, 16 Aug 2022 12:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D4260FAE;
	Tue, 16 Aug 2022 12:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D4260FAE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE2471BF82D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 12:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A44464160D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 12:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44464160D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnOHBpn82AAA for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 12:07:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE9F404F1
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BE9F404F1
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 12:07:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z2so13204414edc.1
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 05:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=yxPCcwgn5a/pOeEL2hayfcLmkpgkoafC7JyDU8THllg=;
 b=cEUgVbPoASjG+GS/keiSxJo220tLydXydJV/RVMOKMUjMMieP/vb8E1+pvKrCsgHPU
 ST+GAEriQTRxzvcDaeg+S0NhKao4XMIElRt+ngFHHvfFrx2e9MrtdD30OxgQaSENX7O6
 avnI0ZsLZXyLFUbqoC5p3vnLCGiDlhpqwaOeazqvA6fIjIhMB9TAppkNvKY31HPcIhjL
 cNPl1UBpyHxxc4azb+lTFpn9MTIR5FyNdYsNkfkWre2OCz8dgqN+d7UNa/cmj7MVCFFy
 PJncyM2+oifna7xipkBBLv9RO4sxEIKoI+GEm+q8YJrx/LW6DCD/nPF0zxa46SbkBjwi
 R3BA==
X-Gm-Message-State: ACgBeo0HjMNSaV95KlGDS/XkbDymTqtKF5BKqnE61n/96GsWK9+wlyHW
 3HeCZwkLaRH5Sy13JNwthBG9GvuRxXNHeQ==
X-Google-Smtp-Source: AA6agR7o26F5WGXivtR13P8F2eRxG8tYHbsvLTyID9NIRkYG09L9ppjzdGcAR0rh4GQDwAAXz1fbhg==
X-Received: by 2002:a50:fb10:0:b0:43d:561a:c990 with SMTP id
 d16-20020a50fb10000000b0043d561ac990mr18565279edq.115.1660651640210; 
 Tue, 16 Aug 2022 05:07:20 -0700 (PDT)
Received: from nitrogen.local (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 d6-20020a50fe86000000b0043c0fbdcd8esm8408421edt.70.2022.08.16.05.07.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 05:07:19 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 14:07:17 +0200
Message-Id: <20220816120718.3021545-1-bram.vlerick@openpixelsystems.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=yxPCcwgn5a/pOeEL2hayfcLmkpgkoafC7JyDU8THllg=;
 b=7eE1h/0mxJBN8irS0vjyOXWk4mjacwhO2VNRK1Lj0KuAv9ApsIS0r1FeLhGQ+9rqxA
 E/GBVr3jQBcZUh+UHMBPKHh9d62SGr9ggHP4Mt0ULPssMZVvLLIBubwUzaI1VEyBv/B8
 4z0lzg6D07iBqZGqTS1oYzg8HlQyFFc8N6JAY557ez1VR4ninVzIU6YQwoo2PKIRUE0N
 6kwZhd8P3UfoPP+lNHpqwHmnlPTR60uI42ER6yuTRgNM3bJgrk58p200c1QVT7CN9XXs
 egN9pXTKZXqyIyBEAHx3/dm2GJWmwKAdLxPgSigMn6RZ2Z3LZful61UKBUQqIIAoi1Np
 +pIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7eE1h/0m
Subject: [Buildroot] [PATCH 1/2] board/freescale/common/imx: align
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When enable DM for SPL binary, the DTB part of SPL may not 4 bytes aligned.
If u-boot-spl is not aligned, the offset of the DDR firmware is not 4
byte aligned when u-boot-spl-ddr.bin is created. This causes the ddr
firmware to not be loaded correctly at boot.

See imx-mkimage commit bba038d893046b44683182dba540f104dab80fe7 for
implementation in imx-mkimage.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 .../freescale/common/imx/imx8-bootloader-prepare.sh  | 12 ++++++++----
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

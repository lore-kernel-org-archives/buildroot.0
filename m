Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867D9E8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F8C40D8D;
	Tue,  3 Feb 2026 15:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhxTx9JGGq83; Tue,  3 Feb 2026 15:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488B74115F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133013;
	bh=DM6fYo7rpAwAp2duTlUDRLFr6pGn8D31Y4PVGxPgE8s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R3PI3a2Pv9fR6wgBoF5il52q3VHfJUyLGWZkgneilL0Ux8RIvB0i/gAsDxan8i9Mz
	 itnE0Vobk8ejFRC7i9A1aeKpzEbmuh8bZmSt8iDvesGJT8ov/LU8SY/6viuukdH5ii
	 GIH5FCzqLWd1SjKWdwzbzz/nKAY9QaV4g2WB+pRoSScbSl3PXIIpgJlR6/+xglKuUL
	 mL/drewOcJ8knxeuqWXjbyCEk8abIEFZq4B5zTMXnxSaTIdnd7ErfLb3sCIEhHadQQ
	 x2zHKmH2SIG1ILaYgeY+MEKXAvqCAUQ7jalPOy+ke7UhdxXHIe1mV9n70PMgOsShtY
	 4Qs4T/PWLCmCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488B74115F;
	Tue,  3 Feb 2026 15:36:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DCBE13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B0CC40D28
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWD6T7psRSu6 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E361740DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E361740DC6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E361740DC6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so55415295e9.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133009; x=1770737809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mYEM2cFKSxanZJHz022/CJETAv+eK2nLHyj9I206Gr4=;
 b=KliSeNi8xdg3lB/5gJeLkQ0ujNaWP210MuvhAEdb02PhtP6UQIUEarc7+rZTvh0HIL
 0dCzpM7ZIV3reSgNufYN0hEYe44ITaK31U7OvEivoOZokM90kGcw4hV86S4ha5pdKSH0
 HAgxSixIAmzU4vI3iQmfOqtTITEkL8oE/KWjruC7dmh9vb+FQcu8VDCScIYaV+1P47lf
 dz3k9qvabLzlZQ6Hnc8/RXMPl7tgfz1f5To/9Q5fBVaGE8ovXzZeqx3Fq9NprpdSkIOn
 uYtKXU+hDqP5+Bn42dDFL/Fd63TV9f+BCyFVwYxbny4hPfnoyS9mtnz9qpKwl7SDjWLR
 zNBA==
X-Gm-Message-State: AOJu0YxZKviwmjy8eGqjeDEE2udPZR+92gqTtjpKnJaDJRnu1yrJSTmZ
 N2Eq60+J4otK7kiirRC2YNYaqEN3HBlpIzUpDIqTBg7zrY9BSAGcDASXJZOhSlQW
X-Gm-Gg: AZuq6aJMXG0CIlYDwKyuifrLUQJCrtb2mTAAbH1OqUxkHgSkrT3IuIJAv23mhwXapGL
 Ro9rT3dPZcx2Lefd/pG+Jp6pZmp1sn+sFfJnt5Yd/kaO7nbOGmUzMvdsHNzj//OQIX1N9MzIOhv
 NdcMk8Tja1TaxPot58uNKWT/5/W+YqSAsSuN4xDsRGCK04gDhOxa/nse/lqE5GaaJIUEJJseWqd
 3TMqOQioFNnmfsgoLsx/eQNyI2yAoxtVGl0RhK7ecZfriDj8dsEwqhgpr/Ubn5nXSaWuQYz4eGU
 IVMFZfvJ//RRsypQ89SLc4vupjTjHwI0lEqd2zX/xhE55dB/UflWmXcOmU3+bOlpeBUq/Yf5Pc9
 3B+xHAfj+NvSKrPDh5nUIYYfzwsx+GFLZzQ9kFJSNE/mOW23dk6YRFqzNKcolyTa/WU5gcOBXqE
 09AjwHlqaguZLr1X3pNHbY/vOJT2bqCQIDnhxrmg==
X-Received: by 2002:a05:600c:3baa:b0:480:1c69:9d36 with SMTP id
 5b1f17b1804b1-4830e968e57mr427665e9.17.1770133008466; 
 Tue, 03 Feb 2026 07:36:48 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:48 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:16 -0800
Message-ID: <20260203153617.80012-10-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770133009; x=1770737809; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYEM2cFKSxanZJHz022/CJETAv+eK2nLHyj9I206Gr4=;
 b=LLdumlqmHyqgtCVt5muQ7N+ujUGU5F1hHn/9rcPtq+eA8Yad4zNbcu9JYvglmHVS8G
 FvjTa8fUNFwJp/uCH4Ykqu9gosME1nNpg+vdrvgxlIdhIoWdY/ao/z1zyWz51CwBXL4N
 uiSZSCnwMq8exx4EfVoDHVXpooHqTktR1rK1hOoQDLmTyIj9ltugrXE4vUARQE6WA0gW
 PTwml5rnhLeNMLXd1Twu4ekeB5xBagcKZuYXPardV1/QhyB16WZXCTC8ZpsxUgPASvMu
 0tart9dWVJ/+7CdV7j+ZTk5+NhGg1SEbYufa3IiFzwS/RgsX8lSzGUquawcbiuzNF3O2
 CubQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LLdumlqm
Subject: [Buildroot] [PATCH 09/10] board/freescale: add i.MX95 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for i.MX95-based boards. The boot container build process
differs a bit from i.MX93, thus the addition of a new script. Most
notably, there's at least 2 new images to be included (i.e. SM and
DDR/TCM OEI).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../common/imx/imx95-bootloader-prepare.sh    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100755 board/freescale/common/imx/imx95-bootloader-prepare.sh

diff --git a/board/freescale/common/imx/imx95-bootloader-prepare.sh b/board/freescale/common/imx/imx95-bootloader-prepare.sh
new file mode 100755
index 0000000000..addd4bdea9
--- /dev/null
+++ b/board/freescale/common/imx/imx95-bootloader-prepare.sh
@@ -0,0 +1,60 @@
+#!/usr/bin/env bash
+
+# VERY IMPORTANT: a lot of this code here is hardcoded such that
+# it's able to generate a flash.bin equivalent to the one generated
+# by imx-mkimage by running:
+#
+#  make SOC=iMX95 OEI=YES LPDDR_TYPE=lpddr4x flash_a55
+#
+# As such, please be mindful of the fact that this script may not work
+# if you wish to change the make target or one of its parameters.
+#
+# TODO: improve this script such that it can handle multiple targets
+
+main ()
+{
+	CNTR_VERSION=2
+	ATF_LOAD_ADDR=0x8A200000
+	UBOOT_LOAD_ADDR=0x90200000
+	OEI_M33_ENTR_ADDR=0x1ffc0001
+	OEI_M33_LOAD_ADDR=0x1ffc0000
+	MCU_TCM_ADDR=0x1FFC0000
+	SPL_LOAD_ADDR_M33_VIEW=0x20480000
+	V2X_DDR=0x8b000000
+
+	# generate u-boot-hash.bin
+	"${HOST_DIR}/bin/mkimage_imx8" -commit > "${BINARIES_DIR}/mkimg.commit"
+	cat "${BINARIES_DIR}/u-boot.bin" "${BINARIES_DIR}/mkimg.commit" > "${BINARIES_DIR}/u-boot-hash.bin"
+	rm -f "${BINARIES_DIR}/mkimg.commit"
+
+	# generate u-boot-atf-container.img (TODO: no TEE support for now)
+	"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -cntr_version ${CNTR_VERSION} -c \
+		-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
+		-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 ${UBOOT_LOAD_ADDR} \
+		-out "${BINARIES_DIR}/u-boot-atf-container.img"
+
+	# generate m33-oei-ddrfw.bin
+	dd if="${BINARIES_DIR}/oei-m33-ddr.bin" of="${BINARIES_DIR}/oei-m33-ddr.bin-pad" bs=4 conv=sync
+	cat "${BINARIES_DIR}/oei-m33-ddr.bin-pad" "${BINARIES_DIR}/ddr_fw.bin" > "${BINARIES_DIR}/m33-oei-ddrfw.bin.unaligned"
+	dd if="${BINARIES_DIR}/m33-oei-ddrfw.bin.unaligned" of="${BINARIES_DIR}/m33-oei-ddrfw.bin" bs=8 conv=sync
+	rm -f "${BINARIES_DIR}/m33-oei-ddrfw.bin.unaligned" "${BINARIES_DIR}/oei-m33-ddr.bin-pad"
+
+	# generate flash.bin
+	"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -cntr_version ${CNTR_VERSION} \
+		-append "${BINARIES_DIR}/ahab-container.img" -c -ddr_dummy \
+		-oei "${BINARIES_DIR}/m33-oei-ddrfw.bin" m33 ${OEI_M33_ENTR_ADDR} ${OEI_M33_LOAD_ADDR} -hold 65536 \
+		-msel 0 \
+		-m33 "${BINARIES_DIR}/m33_image.bin" 0 ${MCU_TCM_ADDR} \
+		-ap "${BINARIES_DIR}/u-boot-spl.bin" a55 ${SPL_LOAD_ADDR_M33_VIEW} \
+		-dummy ${V2X_DDR} \
+		-out "${BINARIES_DIR}/imx9-boot-sd.bin"
+
+	# append u-boot-atf-container.img to flash.bin
+	flashbin_size="$(wc -c "${BINARIES_DIR}/imx9-boot-sd.bin" | awk '{print $1}')"
+	pad_cnt=$(($((flashbin_size + 0x400 - 1)) / 0x400))
+	dd if="${BINARIES_DIR}/u-boot-atf-container.img" of="${BINARIES_DIR}/imx9-boot-sd.bin" bs=1K seek=${pad_cnt}
+
+	exit $?
+}
+
+main "$@"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

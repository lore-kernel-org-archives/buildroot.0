Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A524C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5B8060B77;
	Tue, 11 Jun 2024 18:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5r0DBa6NA5r; Tue, 11 Jun 2024 18:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 802C660B8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 802C660B8A;
	Tue, 11 Jun 2024 18:01:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 616D51BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F7D281F8E
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96x2v8pBvHPV for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A15A781F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A15A781F79
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A15A781F79
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:54 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7041082a80aso3723678b3a.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128854; x=1718733654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7emYzCnnIK1fTQFSi6xud0xYIfRcxWOge2z9whGxcU=;
 b=v1yZDKTG7m9Cq5VUew0beQ2ewqqcsd9CRD1DmAzgYD7J+9OJDG6rnlafAaRRiZjj/Q
 lBQea5Tl2qaZelDtg/7rpqcww60NHLIqmrAaWiEYFG6lnJkaGlWh9SGqs9sB6/+bPujT
 1uAEcoRnIUsmAEtyILer4PErKNJJUUIwmgnOErI0bSGSPFAwBb47fvYrAtTWYS3MIDQ1
 9obDbsGceAoP0dhsywmjNwVEJaZXY0zCpzsy3E9gsRTPBVMvBLupzcdtK1/5a45MO7TJ
 gY16FkVVVmtmu0Z4rKyVVbkWKcHxOuaDJ5y8LDf2bPhiwBKoCy4wAEKbDfW/22ibGuK9
 PEXw==
X-Gm-Message-State: AOJu0YyF6fm67Sel0mLqMB2x2F4T0snvAWzS+4m5V3vdywqwTEj2Vig4
 dsHkvzk56eTKMbaCni4Jk+0G1ITEr7ApQfz91Mc7yr7AKvYjEL2B0oM00Hy2
X-Google-Smtp-Source: AGHT+IF0mXghVF2guwnRS/pU/Sa1SjKx22sJO0Z5Ux+R7IOav+dyMYa+5x3Mu81IJvAg47bJkufhgA==
X-Received: by 2002:a05:6a00:10c5:b0:705:ab2f:b954 with SMTP id
 d2e1a72fcca58-705ab2fc65cmr3066927b3a.15.1718128853589; 
 Tue, 11 Jun 2024 11:00:53 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:53 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:07 -0700
Message-ID: <20240611180007.2127244-13-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128854; x=1718733654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7emYzCnnIK1fTQFSi6xud0xYIfRcxWOge2z9whGxcU=;
 b=miolaXqBUtrwVFazjmaHETMpqEq7NsGoLMfA8YU1+zEJm4niRKVfLiOq72jYpQ042+
 xwVwj5sfkDy+HH9+026LalRBMOywUM4ajcmoQe3biXqL5OQYfHUorzCQBbFZBe0iTqDr
 NsjpmqZb2QWWnEO+Y7n2bNaOX+iU+9WvNnS7brluP9zfFMvt5sQ5Opcuwt+IaonT4RWW
 t8OytZFds/fhOay1uHxmrS2Kq+qunlRW+va/keg+AgqwPQN3TueND9b0IcTxw8UERkzF
 Lfc7DycfWM6MSrVvaLAN3KFtTkszi7Yo9mRv0XF1PDmlbZ+KDMcxyoWacfpv4amSFvu9
 ciwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=miolaXqB
Subject: [Buildroot] [PATCH 12/12] board/freescale/common/imx: add support
 for i.MX 8ULP
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 .../common/imx/imx8-bootloader-prepare.sh     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index b353d506fe..807e56d35d 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -58,6 +58,25 @@ main ()
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x920000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP=y$" ${BR2_CONFIG}; then
+		SPL_LOAD_ADDR=0x22020000
+		ATF_LOAD_ADDR=0x20040000
+		"${HOST_DIR}/bin/mkimage_imx8" -commit > "${BINARIES_DIR}/mkimg.commit"
+		cat "${BINARIES_DIR}/u-boot.bin" "${BINARIES_DIR}/mkimg.commit" > "${BINARIES_DIR}/u-boot-hash.bin"
+		rm -f "${BINARIES_DIR}/mkimg.commit"
+		if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" ${BR2_CONFIG}; then
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -c -ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} -ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 -ap "${BINARIES_DIR}/tee.bin" a35 0xa6000000 -out "${BINARIES_DIR}/u-boot-atf-container.img"
+		else
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -c -ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} -ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 -out "${BINARIES_DIR}/u-boot-atf-container.img"
+		fi
+		if [ -e "${BINARIES_DIR}/m33_image.bin" ]; then
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -append "${BINARIES_DIR}/ahab-container.img" -c -upower "${BINARIES_DIR}/upower.bin" -m4 "${BINARIES_DIR}/m33_image.bin" 0 0x1ffc2000 -ap "${BINARIES_DIR}/u-boot-spl.bin" a35 ${SPL_LOAD_ADDR} -out "${BINARIES_DIR}/imx8-boot-sd.bin"
+		else
+			"${HOST_DIR}/bin/mkimage_imx8" -soc ULP -append "${BINARIES_DIR}/ahab-container.img" -c -upower "${BINARIES_DIR}/upower.bin" 0 0x1ffc2000 -ap "${BINARIES_DIR}/u-boot-spl.bin" a35 ${SPL_LOAD_ADDR} -out "${BINARIES_DIR}/imx8-boot-sd.bin"
+		fi
+		flashbin_size="$(wc -c "${BINARIES_DIR}/imx8-boot-sd.bin" | awk '{print $1}')"
+		pad_cnt=$(($((flashbin_size + 0x400 - 1)) / 0x400))
+		dd if="${BINARIES_DIR}/u-boot-atf-container.img" of="${BINARIES_DIR}/imx8-boot-sd.bin" bs=1K seek=${pad_cnt}
 	else
 		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
 		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

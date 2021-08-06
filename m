Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9F1C432BE
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 00:30:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297D560EBB
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 00:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 297D560EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD5D46084E;
	Fri,  6 Aug 2021 00:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RV7UNC1jkTPx; Fri,  6 Aug 2021 00:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 343E06084B;
	Fri,  6 Aug 2021 00:30:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 404BF1BF2C9
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 00:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 397DF4018D
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 00:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRxUFAXR-KYc for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 00:30:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7078E400C9
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 00:30:27 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so19057947pjb.3
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uTkKU+QWXw+mAXxp7M13hNTja5OcQpebOwJ1yvvrKnA=;
 b=s1sG8s2FezGGLoOBHcfSOS5DstDnET5Jn4pUJUzS4/ER7WTKqjluz7Ge8RnPeSjPsc
 qVe8I9yUBPDbPer13hroc89swkvOcY4C+xjfe8LFSU5zzHYRqYalLL2Hl9cFllv5+sZ8
 INEahIJGJuBbRiwWd2Xk9owOq5hBWu4drEwLY41df0Xe8HR1WmX2Whp5+o2HF3o/q/GE
 ubjrPx4vYcf2X0IdvBfF1p+4D1Yj8ibC2VJoAm0iXzsGlPKOHffYMjlaKAeCKuaMpM6Y
 u0XVCQR6nRvMti5uPvJNpiFfpFQjwbNSagGifsLolFhpP90UeJRHPrVUBNHUNZUGky0p
 ChiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uTkKU+QWXw+mAXxp7M13hNTja5OcQpebOwJ1yvvrKnA=;
 b=ZiLFbOFyEmYuKev673WHbgghGNO1Lz329yaW2t/rnkZmgkpZVT+sh+p/xE1yD1vdll
 Mnk3/1hFk2uOePYoydP9buGF38Vv5eNqbUzNoi/tOqxpbS4GobnA5gIsg/nmZSo2EKnn
 1aaD938jeIedgLPahV4j56GjMJd2A99yLBpniA4O6UzaUW8YyqsMunDpTOpN0IJd2ffJ
 +CGB3c8RbExjf/qP/D7WC5mVrkD5RKabyIcrp94OQovTfKvAQUOaKKoQtoYH23KrysE7
 CjMDFdl+i7FWbzEkDIvDUaUsyYekVuY2bV1kiKJ57lhrm1fZAbWam55GWx9K1djj33Zh
 ltvQ==
X-Gm-Message-State: AOAM533bPK5nJ5YJJnSAGYBcBc16FsPz2M51hFeFE0+0TRr18H9zq4Be
 17t3ikD+duKGbNY4NL1Au3zyS7J/i1pK7w==
X-Google-Smtp-Source: ABdhPJxt9WFYw/1bzw4p162vbnP9YTHyejtw26uTrf2m1mZhGeWkOyvW95nSfbMCBfna8FLo/vxS8w==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr102740pgv.442.1628209826536;
 Thu, 05 Aug 2021 17:30:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:8fb5:284:54f9:6df])
 by smtp.gmail.com with ESMTPSA id a35sm8865346pgm.66.2021.08.05.17.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 17:30:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 21:30:13 -0300
Message-Id: <20210806003013.3806734-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6sx-sdb: Bump U-Boot and kernel
 versions
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Bump U-Boot to version 2021.07 and kernel to 5.10.55.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6sx-sdb_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6sx-sdb_defconfig b/configs/imx6sx-sdb_defconfig
index a87bdf84f661..7ad662aa2ce1 100644
--- a/configs/imx6sx-sdb_defconfig
+++ b/configs/imx6sx-sdb_defconfig
@@ -3,19 +3,19 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.55"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb imx6sx-sdb-reva"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73146C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 18:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B9B61027
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 18:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1B9B61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41900403E4;
	Thu, 11 Nov 2021 18:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCGEfGq1MRO2; Thu, 11 Nov 2021 18:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE70401FE;
	Thu, 11 Nov 2021 18:38:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CE471BF45A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 18:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B7E9401FE
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 18:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgG54jlp9ljt for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 18:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A75040153
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 18:38:45 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id l24so9516032uak.2
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bo4KswP7CaNzucfniLBfddwOrOnUqukrQ2MxLIrSSw8=;
 b=NTCOyRyTPBjk15sG8mJm2Iyis+ON5W02UyZurjCZDLY6t2HL6MJ3O+B21hyC/jepy0
 YVcLqBDteP6wq7sRQn6Vj42hHDQsyqKczOYn3LdUWNzLxdhEJ0AfTUsBsw5jOqBz9FPf
 dd7P7bhLE7YWv0Cvwpc6EWZ9iMT0TIXPlwKMmi2qFNtg7ikgj10opJmtSdG7KH9zawnv
 3jM6HJX4vTRkxTPVOGDvyuOec6XbfCfZDgqSHLwo/O2vaqIIhr5ZCQx5hQ54mVrf3qQP
 c12y+fLcKWlAaTRjzeHCoBWVDb0O7lTf8GGUbd9PHQiKcDiuOsmoPYEW9Q8NCZk7Ecz2
 x9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bo4KswP7CaNzucfniLBfddwOrOnUqukrQ2MxLIrSSw8=;
 b=DwjpDWh7SSdNhpD2chfPiWsHaM6PR9q8PRl5eYpAWZ96nhlkKw2jBnkcE7w8xwGrNX
 J4X4/+3VVVy57CJ5eF+mp2h5gN+Zs9Ft93G89bSE9PotEPcw3KXeVHSUCvHYgdBEPXuh
 qWTRV8wwQZa6mI4mFnQKdq0XHq719i0cKzUvCw1lSHP0EVmmxgTGDirkP7MSIbzp0GOx
 IvrcdIl+1yLqX9uQdsiuXptuLPYs/Wn6LAU+yiQYEpC8kQ7BNkijM7GMnvg9fGMHuh9d
 BsVpKBhbL08l0xfRwzFz43Ri+EgrKJrArL9ayoG0vwBEnn6hKQOgDPFYwm0QMYNmgKW/
 fRLQ==
X-Gm-Message-State: AOAM531srkpgyOSlcyBSXqUxyeJhKaTliUB9iz5ogv6VFFczbpIMMG60
 PaF1rw8jrPdPIz/IbktrOH88jSzmXEI=
X-Google-Smtp-Source: ABdhPJydEqA9/mxU2aeW1vyUC330g2twn8uP4vDmb37qBPq3krFVLmvBlrYhh+JWTYa5NN6DOnsRZQ==
X-Received: by 2002:ab0:780c:: with SMTP id x12mr13097330uaq.45.1636655923991; 
 Thu, 11 Nov 2021 10:38:43 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:fdc:3673:dae0:41])
 by smtp.gmail.com with ESMTPSA id m67sm2511159vsc.0.2021.11.11.10.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 10:38:43 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 15:38:34 -0300
Message-Id: <20211111183834.1272146-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Bump U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to 2021.10 and kernel to 5.15.1 version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabreauto_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index a77b57e4f936..7df774988a75 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabreauto"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_NEEDS_LZOP=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto imx6dl-sabreauto imx6qp-sabreauto"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

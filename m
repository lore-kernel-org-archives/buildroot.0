Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B4C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 21:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400C24099E;
	Fri, 24 May 2024 21:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DEEQmqB_m1p; Fri, 24 May 2024 21:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5C0B409A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C0B409A7;
	Fri, 24 May 2024 21:14:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0834F1CFE15
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8A9860629
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KdB1YGL-QCB for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 21:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A058660625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A058660625
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A058660625
 for <buildroot@buildroot.org>; Fri, 24 May 2024 21:14:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 024F2B00573;
 Fri, 24 May 2024 23:14:04 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 23:13:59 +0200
Message-ID: <20240524211359.560684-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716585247;
 bh=XNSAA3BsWSG++H2s3xC+ebHUlrBmO3DhPnv8TA3ydIo=;
 h=From:To:Cc:Subject:Date:From;
 b=HnM42AxKE19ReoJcYpq3cZtbIT2se8jaCg3vDif/F1ty6lG7lDUnjYwJh8GFo2mmB
 sK3IeKr3yXgy+59C4ISffqFR2qWX0Q8phdHjYFxEL9yxLfR65JKfp98EH1TrfU6d+L
 HPOM0l/B+ggTrAMqdEvhlPbj0f9dlAXvdNhMKZsIdsHT4QQQXelod8LaBdIWbcF18/
 gMhPtah1/Q7jgGYIJqZ91USszuIV/Nd5WEzAGWbjzwJAoav1lROnB1GjrUq9Z/KzSe
 +SJGJXTt2fthWMx5z1ElEIuXAunkBnPYwEoC/lU6zYxexh27TUZl7FyzOcRw28vyri
 ZhtAeJw4xrFbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HnM42AxK
Subject: [Buildroot] [PATCH 1/1] configs/visionfive2: uboot needs openssl
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
Cc: Julien Olivain <ju.o@free.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfig fails in uboot build, with output:

    scripts/sign-file.c:25:10: fatal error: openssl/opensslv.h: No such file or directory
       25 | #include <openssl/opensslv.h>
          |          ^~~~~~~~~~~~~~~~~~~~

This commit fixes the issue by adding
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the defconfig.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6929002318

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/visionfive2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index bb8ab082af6..dae9608eeb1 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

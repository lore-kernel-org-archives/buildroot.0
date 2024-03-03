Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD20C5475B
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 14:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E8A8605C7;
	Sun,  3 Mar 2024 14:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ProCnkzXDx7f; Sun,  3 Mar 2024 14:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25BBB606B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BBB606B0;
	Sun,  3 Mar 2024 14:10:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9105A1BF30F
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 14:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ED4C606B0
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 14:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5_9D191nPzJ for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 14:10:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 482A8605C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 482A8605C7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482A8605C7
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 14:10:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D20E4E0003;
 Sun,  3 Mar 2024 14:10:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 15:10:02 +0100
Message-ID: <20240303141003.173987-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709475005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qNa/xitY/xesT9CtIkZPz3VLMQKaolKbFu8/IvumtcI=;
 b=GAVdq+D0Pk51ELICtXz4RXS4CVT+Xg5v6LMwduM1uJafgufeOgVJNWKmTwbBaYLP/kLanD
 GD+h+ZgJ6Obcij56Z6W+Eb2cbK5sWv3qECXXf5n2yC/WKlXve3YuUxMrC3Vfzf6wxlqtRa
 BgQDVgulFqiTV6SxCAKpQR976uvHjG8VLOxLvIwuUQz5OlvpG4k2CTmxhMmSeK+iObn0sg
 D46LtIgH3fEk3kRS7jwlWxh55lDw72uUThjDVm+UCGPbQXk/5Ynp/zCappbYPhkaC/3691
 qA1wITl6WRk97+a0ka1uBfLMynpecGc8QJ9Il/Rn8ODizzkvhbsP5zh7WMSdCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GAVdq+D0
Subject: [Buildroot] [PATCH] package/gcc: fix BR2_GCC_VERSION_ARC definition
 for gcc 13.x
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the ARC-special GCC version was bumped from gcc 10.x to gcc 13.x
in commit 045ab73702b8bc09f94ca1f3b8e5bf3acb0b0843 ("toolchain: bump
ARC toolchain components to arc-2023.09-release"), the
BR2_GCC_VERSION_ARC option definition is not entirely correct: it
selects BR2_TOOLCHAIN_GCC_AT_LEAST_10, while it should select
BR2_TOOLCHAIN_GCC_AT_LEAST_13. This commit fixes this.

Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fabc6173f5..d294e8da30 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -13,7 +13,7 @@ config BR2_GCC_VERSION_ARC
 	bool "gcc arc (13.1)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

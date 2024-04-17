Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE24AC4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39664404DC;
	Wed, 17 Apr 2024 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYRo5NdiBtty; Wed, 17 Apr 2024 21:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1853C4052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1853C4052D;
	Wed, 17 Apr 2024 21:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC28D1BF267
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B746F81EE0
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe-97HJmcc8R for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 21:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC61381EDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC61381EDE
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC61381EDE
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 21:17:04 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id DE944240101
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 23:17:01 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VKYd91Gh5z6tvy;
 Wed, 17 Apr 2024 23:17:01 +0200 (CEST)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 21:16:30 +0000
Message-ID: <20240417211654.959611-1-gero.schwaericke@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1713388621; bh=y8G1gFrkpacmQ0/hvoUgYKMk5r3PZH+1b0SCplbz1t4=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=YGq7Q4S2oJP9GXRjJE9TlISoJKkuExSc2argmQGoRESPCVHk6QuCVKGywcnxoBYMu
 uF3Fw+8ZrLlBm+qUXd3GIDGEuFg9/ShHszAPkJJuZFKkv6PLNF8H48b4yrrjH/pd9+
 ObFsEtbNTCzG2oL0R2kXMcde8omB9wDImaZgjR09vMsrCYvPHqfFpj2xFXM3Vluny9
 G8F+PgXDsRrBqZjP2cW9R0LVJleET+1dgo6/RuX2Lp57kqODxH6xb9IO2aTmBPsLrr
 e+IbTm3F8q7cmM0VdKc8qjhXikUWAvFSXFrjzrMT0minSsw3/ApbZz6scvij0I/Na/
 6AK0PuSobo0Og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=YGq7Q4S2
Subject: [Buildroot] [PATCH] package/linux-firmware: RTL_88XX_BT: remove
 listing of specific module names
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace description of specific module names with generic help string
because the implementation switched to globbing to collect all rtl88*
blobs.
---
 package/linux-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 920c0a2ef1..59cafc14ce 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -107,7 +107,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT
 	bool "Realtek 88xx Bluetooth"
 	help
-	  Realtek 8821a/8821c/8822b/8822cs/8822cu/8852au
+	  Firmware files for Realtek Bluetooth modules 88xx.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
 	bool "TI CC2560"
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

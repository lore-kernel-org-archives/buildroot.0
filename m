Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC8C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 23:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1A88405EF;
	Wed, 31 Jul 2024 23:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2j8Zw5O_c3A; Wed, 31 Jul 2024 23:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D76405F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9D76405F6;
	Wed, 31 Jul 2024 23:58:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEB6E1BF592
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 23:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9A3D6061D
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 23:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3tSMMft6pUU for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 23:58:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::162; helo=mail-il1-x162.google.com;
 envelope-from=kris@embeddedts.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACC6D60615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC6D60615
Received: from mail-il1-x162.google.com (mail-il1-x162.google.com
 [IPv6:2607:f8b0:4864:20::162])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACC6D60615
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 23:58:39 +0000 (UTC)
Received: by mail-il1-x162.google.com with SMTP id
 e9e14a558f8ab-396db51d140so31778185ab.0
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722470318; x=1723075118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1AwlGTBLKFXrgM6+UTTp7U6J0/xSfp2TOkci7uZwbE=;
 b=YIE/LtGCEbCeps782aORAXkqfhfbSxwpACe7YPskXE3q9S6mAuT4X8yC4iIBEsPzbx
 hU7u857j8Tw5vi/1cM+Sf8ZSlSTrWkFXR0CeBBVUTulAZrpIlxhB3DGatm4jxtz5Li+9
 JB9witW8dBJrUiuktOHp3Ad/i5p4inpqO8SERo1ENKnuwbF7lcT3uDD1cLYGQpZZwZpP
 8Q9svnHpfUjqDSQkDRTaUiAVTG38xiv4UW7uYh1gCZSo1r9dWm5Kri4WpntgycxWxwxc
 UtJvu6HQkPr5PpF5r2MYpQ1PADJmCxh2J/sw9jMOMQ8TdEbv0LuBVmwzhgMayrVRUXAS
 ZTpw==
X-Gm-Message-State: AOJu0YzQ0AYIu5ZUWINCtkJ6Aj7bJTjAANPW9rl3fzr09qp3kNfEPw4R
 Jebc/2H0MuDIUPEL7S7boDTCXJCg5FRCh59bvCOnXmaQFUmSOVaZkzM4MQMRncQWFsGOIrRJXFw
 SBAxL0Z2/I/l98k9XYfqOgrBxpM9klH9wB0wpOp+X
X-Google-Smtp-Source: AGHT+IFG4QHw8eLn5UNB+ZlxAbdJ6dhQiwycEaLjCaibbsdULE/cN0FeyHxLayLkh/movQ/1IxNtnOie9Lrg
X-Received: by 2002:a05:6e02:1a6e:b0:39a:ea4c:8c12 with SMTP id
 e9e14a558f8ab-39b18376aefmr11384135ab.14.1722470318340; 
 Wed, 31 Jul 2024 16:58:38 -0700 (PDT)
Received: from tornado.. (wsip-98-191-220-15.ph.ph.cox.net. [98.191.220.15])
 by smtp-relay.gmail.com with ESMTPS id
 e9e14a558f8ab-39b0af64acbsm1845815ab.14.2024.07.31.16.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 16:58:38 -0700 (PDT)
X-Relaying-Domain: embeddedts.com
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 23:58:28 +0000
Message-Id: <20240731235828.1793055-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1722470318; x=1723075118; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1AwlGTBLKFXrgM6+UTTp7U6J0/xSfp2TOkci7uZwbE=;
 b=kZmcbL0G+7pi+Fsk3lvmbEj7BuoammMxFT5/pqSMcqyKDdxRrXrEqDDL5xilERAXai
 Ch7MGNnrXFs+TKgjwO8XlA5WOEQ/aLMe5IKiFBVfA+Ppkvmz3bm10yhVcKJ8D8Wxdc98
 DAtuRcPWaod/g12uZZAAFT49FrZesdzy/ZDIU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=embeddedTS.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=kZmcbL0G
Subject: [Buildroot] [PATCH 1/1] package/wilc-firmware: bump to 16.3
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wraps up firmware 16.2 and 16.3

Changelog from https://github.com/linux4wilc/firmware/releases:
- Fixed the transmission issue for the large data blocks
- Unified driver codebase for the ATWILC & nextGen products.
- Fix for Powersave state issue when network interface is down
  (using 'ifconfig wlan0 down') and 'up' again.
- Migrated the ATWILC driver codebase to Kernel 6.6

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/wilc-firmware/wilc-firmware.hash | 2 +-
 package/wilc-firmware/wilc-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
index 8a7957a1d2..543aaa0f1e 100644
--- a/package/wilc-firmware/wilc-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6cd5fc52150520bedb736f58124063041b4d9849ea33481a8b075f51aec64f8e  wilc-firmware-wilc_linux_16_1_2.tar.gz
+sha256  b9305e1ed5a43eaffed880ba0486431c13cdf93b2e449aed650e7a605a291c83  wilc-firmware-wilc_linux_16_3.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
index 3381162bbd..ac0f33440e 100644
--- a/package/wilc-firmware/wilc-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_FIRMWARE_VERSION = wilc_linux_16_1_2
+WILC_FIRMWARE_VERSION = wilc_linux_16_3
 WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
 WILC_FIRMWARE_LICENSE = PROPRIETARY
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

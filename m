Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC3D597B4
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 23:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 900A8607C1;
	Tue, 12 Nov 2024 23:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gdkdjd4B3bU3; Tue, 12 Nov 2024 23:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97CD4607C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CD4607C2;
	Tue, 12 Nov 2024 23:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4773F725
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 23:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F2D840930
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 23:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULnl9CFvxhL2 for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 23:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFA9F4064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFA9F4064A
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFA9F4064A
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 23:05:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Azx3t8mftDhSBAzx3ts4QR; Wed, 13 Nov 2024 00:05:37 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 13 Nov 2024 00:05:36 +0100
Message-Id: <20241112230536.1211360-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPk0elz7/t1wFsutHucy900WJfSla/vRx0IZA4PJzy5sEQp/W9Cn66RfN+lv1fioBKgP5XSr0zZa4h83fQw76nFTlYrqHtloHuNfmZHTg4fgH21tkR0M
 1p6GMXJK/rIUIaS+8n7VdFgBifOQNH5AlBKtDZTRW9lDF0Kc1KR3AZbjV+AjovUG7yCSgszT8WqvgGOhcQbN9uXdKJUZEfgM2npwIj89K5q4QdZ/9Eq1xJSG
 49bw/rU4yS7DQOL7I8k61dFh7XC4reOQ0HZ0SaedIcU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1731452737; bh=LBID5ZOuVpNVrWDaXvMQQAWI4lDxLks9DPnWEmFptwo=;
 h=From:To:Subject:Date:MIME-Version;
 b=Nh54Als72EFAn/WV2/4g5oV+36Ee2Hx0ztooIXcuaQgkgaPMBWCaC1Y9pObQDpeTQ
 dzeudm+M1uwxyKe9DO4WbK7aNlXc1n9DU7XsAopVxSebiYfPBr6Msu/kJ9Boi9WDAu
 zIqQSOQ88RYeqgv+ASRGCAafy4YMNQq3SqC2octUvk5u7/xZB9rJmnWuJeJssmG9e0
 49K1V1Q/gRSnisvPI3o2Y6Ky0m5ExkDB+nBRbq/67y6cTrjqehhcQVf5Jx6rBSqd9D
 KMo/JWn6uIu6/ppRSflBeX/IbZYTVHwyUY+dsaBP8MOITuOVXMBHnBLnjn+/gdqg1d
 c6J16Ax70wDKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Nh54Als7
Subject: [Buildroot] [PATCH] package/libblockdev: bump to version 3.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 9cc3817870..1466c88451 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f2918de9ce1b54ac1aee5e5757e555947896a74674cdca9d05940a53d19e32a8  libblockdev-3.2.0.tar.gz
+sha256  318b9e2cedfdfe88161f28079fcb63239aeb5592223f4485b861cfc6ef11189a  libblockdev-3.2.1.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 6232f243b1..4cac905666 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.2.0
+LIBBLOCKDEV_VERSION = 3.2.1
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

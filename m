Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7885DC021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 17:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 248EE40748;
	Sat, 14 Sep 2024 17:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBtmkb2VpelS; Sat, 14 Sep 2024 17:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0E7E40789
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0E7E40789;
	Sat, 14 Sep 2024 17:04:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5A81BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A31640789
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcsxZtogz8sn for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 17:04:09 +0000 (UTC)
X-Greylist: delayed 456 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 14 Sep 2024 17:04:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BAAC40748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BAAC40748
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.74;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BAAC40748
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 17:04:08 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from uxmal.fritz.box ([151.51.184.1]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.17.173]) with ESMTPSA (Nemesis) id
 1M42fG-1spVzZ1RJ2-000MME; Sat, 14 Sep 2024 18:51:25 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 18:51:01 +0200
Message-Id: <20240914165101.258406-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:lYYVPuP3UpeNIb+h/dEq6Yhv4jQ0amKzs8YOso90XIORqvYBAIf
 QOq+cSM69AdQ6bwJhWvSguB69F++Gxy0TmYNqtaVaKqjc3aTLGTu9QR0lzq7d7cO4jU5sVJ
 TgH0Ekd1dRifFCATFAmbBQPVoHhFC3Qoy5rOpZK3K87iayl8PZuKAr1gJnfrHFaNvHq2iFA
 AyE72B5BZr/u5Gyr1k/CA==
UI-OutboundReport: notjunk:1;M01:P0:RSClpjJyqHc=;p70ashhqodSQTXlPFd+HVjVXJfF
 sIyYcU0Jf/3PFq9/mlplsKKjgeWQW2DG7Vj78jwq2EsZo3/E+Km41n+uOPIv67H+flGRpYsEp
 pLqmZBdQPfaXGSdGmydKab/7Qcu289Y56P9vGpnhNxB+IaBmSKmU8lT2iTYSrTyxvJoQyIH6s
 ROgCyPMkqPVPBTqF7yui8u5s1q5njTdRrm1h9ylCZIO3ZcRvopkYXlyntk1M29vMb3v1Nxtc4
 tkROpwRh/c8MbSbRIM1P3IR3i/Cv6kBpO8JlkI1MhCgHOFY02yLFwt1AqyuaXHB60gC+NFTal
 0ZJjZRr+sdIpI0bfKAgyl+3aagQPMm1TA7qsLDVFmkzZ2GXDwc4fT5GPDecFwlFOZlnpVPKSx
 swLvv4wZtisrVfxyyPHPMGT+G3L+XHN/T24dBKHZmwZzIorFFzUx9Vdc8cjeuVe0b4Bdee7U2
 uKSUd4qeVa5sZhv4i02DHB7bDh2AgHRSAh2yVr/EtpMdbbGa+bo1b26QJqZnXPuU5eq7sSrUc
 Kf2jxO1m43LG/n3sOEx6yZdztsPV20XTVsVB8ar4wLdxRxBuPR9RJgB08LyrqkWpVDfWMkVQb
 xPwTKqzosaSKU5y+tF3dV67frt+YJZ9nQmEOBc40RdwsyhJAP0+lU0oqfBNtvwSi6qPt4sfzh
 2vj4PkBKVegJUPCCAdcboeYttfErLhZj0aFH1C7+XWVWqujGizam22/L3XW9HNnKSa6+LJXvD
 tzuOGF52vv0yPGnFLsISLex13hn7oy9tg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1726333446; x=1726938246; i=paguilar@paguilar.org;
 bh=j+AW3BC/BOX+UkTs/qaa32tG76HD9gTayxHRpZpMY6g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pEFLXRboj73oumHA12K4IYb2EwWaT86ZJkca4AIIXScxelkgCrZiDISi9m1zlI6i
 RcstBSIbqYUqcnRkG+6KzR59C6IL824dVij4k0nUi7cX9O9A0yFVb7QUSP6TDpHW9
 YhBtrPo986UNlFUH08M95duDCVHTyMpc+SQ2wY5MqMw3xPDXtYcgjtuEbLWmPjvmn
 N8OhL7rFC+3rqM4fK5x2p9Y9Lv0y6ZDUEoeDttC2pT3We+5QPKDdjN7kTzIxVztk9
 08DMiIZGw95sRMnV1vtXiqPIFq6HHrDdPICfAL+WCHQ0COFPBzgIQinHG6KfHjL03
 j26XSCRkihR8jqt4Vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=pEFLXRbo
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.8
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/ivmai/bdwgc/releases/tag/v8.2.8

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/bdwgc/bdwgc.hash | 2 +-
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 8fa49b4585..8705c0f87b 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3d0d3cdbe077403d3106bb40f0cbb563413d6efdbb2a7e1cd6886595dec48fc2  gc-8.2.4.tar.gz
+sha256  7649020621cb26325e1fb5c8742590d92fb48ce5c259b502faf7d9fb5dabb160  gc-8.2.8.tar.gz
 sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 0e9c9d849c..ca2fbdb1d4 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-BDWGC_VERSION = 8.2.4
+BDWGC_VERSION = 8.2.8
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

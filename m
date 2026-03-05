Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C8BEFCE56
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 00:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE897815AB;
	Thu,  5 Mar 2026 00:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCcJ2c84wWuO; Thu,  5 Mar 2026 00:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F219815AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772670622;
	bh=WyNODKRzCIBBEcMXZ/J5w+O9TFgCnlqUn5QnuDVL1vE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PNvclw9A6e7zC/F8I/RHFZU21NpSG92j349GL/D7rWRTHMfc4U+EtxRwt5r3b6YJn
	 M25GNcOT1LN1qfHKyH/UqpIKVwMH+CcOLLR6sHfGuzzyMjK8wcATQutJWhPvQxBtOo
	 Ilq+yV01H6b3btR/m3dagVOD+krLFH6HecxJplGgfpbHw3oWXuCTkKdxOad+TwleiX
	 cyWo9xkDUXaiDMams/Gvs6r0nmEb4U53SUBDJIHZYBn8qb9L2xTQGvH6GS+XfgpxPo
	 SEOkDSqdj307m6Mtsb7jNKP09CjpX3dzEKxtU6Fy9PKxj7mApMZk87Bnny8if+PHR8
	 CkNUrWLx1slNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F219815AD;
	Thu,  5 Mar 2026 00:30:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF7B223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 00:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A1F1815AD
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 00:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 974Ycn0Hk1uP for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 00:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17531815AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17531815AB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17531815AB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 00:30:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McY8d-1vNlu302AP-00j1Tc; Thu, 05
 Mar 2026 01:30:02 +0100
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  5 Mar 2026 01:29:51 +0100
Message-ID: <20260305002951.3614234-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:CC6Q6K0IC3IQUwX1/gB1XBQ1CwuSxxindVKjSRJZrOSgfnUo4jP
 WoPU0yeqaKPL6fIssbiv46iRKUAfvuzf7ngTB3pdV6K4iQ9hi225QAwCi4fgUjKVGVptLNG
 EjSngQIKlnem22b30HaNY3ZsT/WMPJsLFZ+OaiiODwm9xe19Y8dnA9WrLNE9hWizCV4SsPb
 7Wb8vstkfy5q9pTg9oJWg==
UI-OutboundReport: notjunk:1;M01:P0:N8CqNGARYOI=;bsFUHHa1BqcUUr27JzUnNE7t9ky
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772670602; x=1773275402; i=fiona.klute@gmx.de;
 bh=oHApomvUnHqVMCKtWZd+YZneMtiXRGGndzyu/vjE3u0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iurTELzoHJSBIiNkzapi6iI4NMQSu241olZu5/zmAkBTfEWb+YjxcsFM6+PFn6Hq
 a3GQR6T+FDoWRw5GAKWzlWfvr07BLXpPosUwlwZT86WWBpvCO2OzeVJka3zKu2/Kr
 Ddrfj2m6J7poyNoFMAnsFNEmJqzoX7zMckqaxMMn2i82OUFsaETfGYURQZe5q/zQL
 QIvgU0VJcGSMN4FPbpJmJ2uU2dKw3kSP7nouJ9gzP/Bm/V2Grf1ynv50qSdVkL3HJ
 D629m3jtaKC4H0NQc2GtDw6kuVUEynwhWDNrRHv2kjJGGF1fcuOLK4RcOmwmyQeMd
 tya3FcsnMMDLCC+sJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=iurTELzo
Subject: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.5
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog:
https://github.com/plougher/squashfs-tools/blob/4.7.5/CHANGES.md

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
The issues in 4.7.4 should be fixed, hopefully we can get 4.7.x into
Buildroot now. :-)

 package/squashfs/squashfs.hash | 4 ++--
 package/squashfs/squashfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index c921d638bb..e24a4805a1 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
+# From https://github.com/plougher/squashfs-tools/releases/tag/4.7.5
+sha256  547b7b7f4d2e44bf91b6fc554664850c69563701deab9fd9cd7e21f694c88ea6  squashfs-tools-4.7.5.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index f2cb0ab25e..da22fad155 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.6.1
+SQUASHFS_VERSION = 4.7.5
 SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
 SQUASHFS_LICENSE = GPL-2.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

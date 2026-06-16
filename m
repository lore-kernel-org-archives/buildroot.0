Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82DECD98E3
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB0742B2F;
	Tue, 16 Jun 2026 16:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfsbIhXKwqpI; Tue, 16 Jun 2026 16:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B150E42BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781625982;
	bh=qmLyb5yrofW/oENsMgYKuxoGG+ZDpe2ifSuahku1OsA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OQlUcCDjafbOi/fdvvFykhihdIBdUlPjPpKqZ9XSObNZpTyFSR5CoFuGRg8NrQjuJ
	 dAAHZAfBkmJOOSAObpPmoVCfmb+O0qQ/eMI+BfrXOBJ2Q34pGMtC586gGPUUa8wlf2
	 d3bBs1Gd+xKEraD6d8Fh+3jVoRoaH30QT6e7N9DLOZB4yAAw044y2BSvlvVdMt2ZnM
	 iwq+eeluyTm9JfRLv/RDIgil68WxpEzuIQ9f1m7O2G7d0IHAr7aFV3bjmhC68uBprH
	 oi4KItdPe2TVdh+T6Ygkly8/wnnq70DF9hnq6n2zYfbz8pWPtR8HUfNfQrA6ayr7Ss
	 a+rPp6kVkfLzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B150E42BAD;
	Tue, 16 Jun 2026 16:06:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BA322B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BB98401F0
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QkEDGPPJE3Q for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CADB8401EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CADB8401EA
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CADB8401EA
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:06:17 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZWIpw8RPTP2aDZWIpwmygC; Tue, 16 Jun 2026 18:06:15 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 16 Jun 2026 18:06:14 +0200
Message-ID: <20260616160614.2665216-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBjEBo0GoMP9TPMMEuAa25W4fp5sSlBXV1ln2KtHLYz4s1XrBB81L08QNxjioRiGYwi4bsgQJRbGzSPbyoZqeD+KUnHRDHm6zbk7YwEjd9r0SKVqLq62
 zNQFjY+zvg8cM8h+SvTNAdVDvJLOlWL3bzWMMvdCcKx3ML3tx7WEzvhyDN02IdOQlnIkkmjyOnpctdFCdI6FL/5FiIwBMmQNhdvlnGYCeIGj26mrGZgsO/Vi
 yjb2q7XiDnEu+TTdxoRgQKHF4R0qlHzumArp/LsdANs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781625975; bh=lh9uRecLIUlDJZW7/jse4+rscyyjVThJF4Oy6CRWpqI=;
 h=From:To:Subject:Date:MIME-Version;
 b=H/+zKp11ctjmtyHu93Gut1IKq03q0Xb5gC/euoDZilhAXioTC5XZi8ogcrvQ8TNjQ
 Tbdxi6z6c/UlRiGL1TgrUMxBmCNofsiRrhRTRGQjpwbscvh5P4oVKC8dks4qrxTxhK
 1xUHq/7oq4gv8mz6YN7ngsbWbmz0HGDAzoNZqDJrH3EDVjGK+rJ/HakX2bFlsV07De
 a1bGfDSmZsoXAGhuFV3/VrsFS6Nc8dw5cdNFYRlhZn2SYlg7Yx/0d43U5+GzYGArvr
 ejrayRB/lurx2d+AEMbRq3VchYfPRe8seU2UZ028bqtEHHmL823NM5W2TT12KqrjjG
 XrQJJKS3pTlIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=H/+zKp11
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure due to warnings treated as errors
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

A the moment build fails because all warnings are treated as errors
except only 3 specific ones, but the problem is that there are many
warnings that arise with gcc version increasing, so let's simply pass
-Werror to ignore every warning in place of the previous 3 specific
ignored warnings.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 1308508e00..de45db3d67 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -13,9 +13,7 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
-	-Wno-error=address \
-	-Wno-error=array-bounds \
-	-Wno-error=cast-function-type
+	-Wno-error
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_PLATFORM_I386_PC=n \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

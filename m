Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75BBCD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7419B40728;
	Wed, 27 May 2026 19:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNnBhxpCYHLn; Wed, 27 May 2026 19:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A21C406ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779910882;
	bh=ZvQnqKHMMv4gVz9HBV6KJaeyig1fbgS3igbjcDQAvhA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L4JITA3F0CjOJ+Jzx1FZJk6uSlKB1mZIIfyfBsWnxNn5usehZQD52s5WXfSLVeRGN
	 tvSrJDKXVKabxY0Gbng4aCCDi4+6RSZmWj+CUts3oB5DFf5Azie4hSmglnvwW8VOsY
	 TJXtwP0qE5CC714RmzlBgdiwHcC0g8qFGNfcgFav8DZDZQhf6+vRTlQFkpO3/SR3jv
	 KAFYNl4XHCN6+Z2hQIGoE5a9LtGkUgPTzI8igfi5qx3acCZsfrUKMZKQi6/7v+OrBN
	 yyckDGE4NVrAiWO4WAr0eYzvmUOMqwL3rfD6BSHRC1ivihP7Ry1Zf+EDKq34NFZ6kt
	 GKSa40ZEK4C5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A21C406ED;
	Wed, 27 May 2026 19:41:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8EFA288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B76BB843DF
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2izjW3qzycTu for <buildroot@buildroot.org>;
 Wed, 27 May 2026 19:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D559843DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D559843DE
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D559843DE
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:41:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SK7uwLWyAtpTfSK7uw1YZb; Wed, 27 May 2026 21:41:14 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 May 2026 21:40:41 +0200
Message-ID: <20260527194041.2109092-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAd1Ale/+xrILp7fF97YAwL/kko8X715DhgZH+R8qHRcStu4IMQdrc6zRvlzBRgieA7Nh08dKuC8QFr7d//vCiAaI0wsd9QbMmwJmnTVmh/WCM+ivHlA
 RpWj+/AvZ7hkoYEwidkhld2tDz8lV6r1taIj3RycCMgVTJGsFv78YDjowAe5bCtVUtcQZFsHbc9COSMTk8c5FN2nXScxvEDlMvxLBPvvwkiIix78bW+dcs6h
 OwmhH9VaohhqHmztopwgpz9LEo6s4oG9I0v/PvSyeHp5noIzNBQLH1zW28Rbl4wok6ydn2TPtfIWd7tTizqSm40kuEYIi8UhccHbUz2hFr1rRcm4hBo0bZgE
 EuprkcKV
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1779910874; bh=SrXP5NC6jwRaEIeZ3/oHcdrhJuz4rskMdj9WR1GSepg=;
 h=From:To:Subject:Date:MIME-Version;
 b=DjP6BuerW0XBAryMC1JQvq1qT2Zrwm+oO4PFQKHSy30bNWEuMd5PrO61dnDuDV/3h
 LDWMsAb0CimHpw6HnyQblOuHHw9q1OblYbMR8QY/XOCI6a3fBfboiDRJgsNB37nhyO
 DhM1kkmEkpIUinU5rSX2ruhFfh7rcvsoj7pdf3CS68BdYy64qdSf1HnkLEzfXScnLl
 Dy6gaMikU1QzZVXKUUFTWp4HeFgqvR7V19owzCvv1Tm1iKKrsnusW5HaZpegdKUie1
 NLFNj1n1C1NYq4WvAVbbuIV/YV6ctlIJWVl0aQG63ku/iy2dv7py5ZWaU2BErqa3Ks
 XCiW6aU8lNTag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DjP6Buer
Subject: [Buildroot] [PATCH] package/rpcbind: bump version to 1.2.9
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

Changelog:
https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/1.2.9-ChangeLog/download

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rpcbind/rpcbind.hash | 6 +++---
 package/rpcbind/rpcbind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index e268a0733a..3059751050 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.8/
-sha1  2f733aba26075ca91fda3787890232da3d07c06e  rpcbind-1.2.8.tar.bz2
+# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/
+sha1  111058e312e0634f8bd23a783ea4f99912ced085  rpcbind-1.2.9.tar.bz2
 
 # Locally computed:
-sha256  964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5  rpcbind-1.2.8.tar.bz2
+sha256  ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b  rpcbind-1.2.9.tar.bz2
 sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 3b496ee2c6..96025624ff 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.2.8
+RPCBIND_VERSION = 1.2.9
 RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

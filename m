Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9163C5321D
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 21:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF6F404FF;
	Fri, 23 Aug 2024 21:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FN-3sfADgFN; Fri, 23 Aug 2024 21:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64798405D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64798405D1;
	Fri, 23 Aug 2024 21:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55CF41BF408
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 21:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 452BD840D3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 21:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkRC1mFkn83G for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 21:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.128;
 helo=smtpcmd11128.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06C1B840D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C1B840D2
Received: from smtpcmd11128.aruba.it (smtpcmd11128.aruba.it [62.149.156.128])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06C1B840D2
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 21:06:59 +0000 (UTC)
Received: from localhost.localdomain ([93.141.126.51])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hbUWsLzxg7AmWhbUlsQHX4; Fri, 23 Aug 2024 23:06:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 23:06:37 +0200
Message-Id: <20240823210637.117412-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIDxkqmldPzPUvyjTPyovH0swzDOOve365JH1gXu+ZrcK1no5NeZCIKCTxzQal7yDZcLjsMrWt9BcFwrFzsxdEdS4/aSEFgHcp9gW9i9BF+BOG+wc7AD
 Eb1vL3znBSIObgOWvfuhch+4SNRrQmEPTMOry4f3ltmdLVijzDGb5piDhK3/tut8CQ0ji6LkYRp14N486u1xYzmc8Z9FQeOvNEuOoL7cSTDhHT7K7Ykp/rI3
 yz+1VULuA/RLjic0qHQbKazK8AikfnqgvoJtS7vWxaTHXSKtDsgdjCXgsA9O7Q/CShyltkp4bLQp96mJ8EHw8g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1724447217; bh=XpF/TbW1WD38Z6hExq75YUy3erII6CdGYY5q2BLaVfs=;
 h=From:To:Subject:Date:MIME-Version;
 b=bPYfkNl+h9qn4zV5OsQTG4vrulYMqxqS61g6ti8U1xJQTSnm93uh4+Y1xrDQpxXkG
 OBg28pClOWh0iZXOONfNm7WKZm6hckNZg7mzIxMKHb9xM4bz1dS5PfafI9qoGKhoHt
 uaknJpn4F54wGgELbQGacADMErKJvywR1j7KKT0iToPMhFLp7JKs7sHYV73UaYbE8l
 +62wi1HyNDf6NSDPyKdn6MY5xBrOj3aNCHLzmIm4bigZSkgh+iEDNaFCZaOLe+25yL
 MN4zh48MADeqvoPMnnxaE3Cn//uJXaa0f6lrLBu1fPFjTgziLkKMoWJu5MKQKc/Nnw
 6uBg8/Y7R14DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bPYfkNl+
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cesanta/mongoose/releases/tag/7.15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 8874ba4171..6e8d1e3804 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7c4aecf92f7f27f1cbb2cbda3c185c385f2b7af84f6bd7c0ce31b84742b15691  mongoose-7.14.tar.gz
+sha256  efcb5aa89b85d40373dcff3241316ddc0f2f130ad7f05c9c964f8cc1e2078a0b  mongoose-7.15.tar.gz
 sha256  7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index d2cd45451e..e3c57c8e8a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.14
+MONGOOSE_VERSION = 7.15
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ACDE64017
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 13:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F0C4081A;
	Sun,  5 Apr 2026 13:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5Qqx-OokOoJ; Sun,  5 Apr 2026 13:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F94040822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775396201;
	bh=gtKjH/vlD9P+tuzr4R1jiXFvc+UReNBpk9DGJrQUOe0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o19oJ0tsoofcKHoxw6kOvIU7Du11QZ74yvGRi9ws0xvzEnjBE2cWOCj0nx70GJfjz
	 xmtS2fNuD3D9Lk0QmyIA7VBqOnUFr6ZJhVSkPdzP5s9wASSAtcEXSjf+BtNGwT0NlP
	 1gX05frask/+nPpOzbwZluTlM4m7psFKdAio3ZN7b62Ouk8hDM3XtXRFB3V5Dt0ghp
	 gzkamK3VLGfxm4iRYU2UW6wjYdFkmbj/8W85HzCKkMxgbHF3SIKAFkbLZAINHiSbPU
	 gZux6uIJ7g2w/Ou6ka144e9PdeqYKtAQSLEOu3WIiv143DC2HLx39aHNfOKoeNM4C3
	 iphzrxfZyI35w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F94040822;
	Sun,  5 Apr 2026 13:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1E31EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 13:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08B9440822
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 13:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Qmo1aafHs92 for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 13:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 308954081A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 308954081A
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 308954081A
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 13:36:33 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 9NeNwsxLcwf0D9NeOwAcu8; Sun, 05 Apr 2026 15:36:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  5 Apr 2026 15:33:12 +0200
Message-ID: <20260405133312.1205102-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP2p2e/SeXrExSQ5gDrMi/uYsoJcAkpZKwzG2S9KNy1Y9vvwZHYvW+NMHzyLE/eBRfR8Ub3oazkC4Gqh/Odc4T7KDpC2qUTrPC6Egs+lms9ayhYYXs/n
 mMkXul6ful4O8UcxtLsrSLAPqHwuHOU0ony/SFEM7nXNbmiMv32y3PhljqplU8JQ84R0NmUwrjUmCZXLwGfARBz14WHXPkgZPUDA8Xjx8GvEOAz7tjHwbIK6
 6Rfq/wBeL2hVZGOQP6d7jEDiBz0GLE8wrFQQLCvZfOE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775396188; bh=2urD+aUa1zqFuEW7bnwPxVeOvNJ+QwOwr7vpwv4iDdQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=KZSdtNm8j309IXks1McGz3W+MQ1RgnyimPxsaEE2wztrQ+mcBm8Wx7ZuOUh9/mQMZ
 07PnZ1Y4zF3t9OroLrdkMS1R8G8bTeqmc4aHHyE1gEizBOs2VO7YHkXoZzKjr+F/9L
 ghsypEMkGwl4OYVQcBd4msp39LIZLpp0v8ePWCb/nOyR17zzaI1I9plycrE7xuRjA9
 wqAkqErRPJS8zcXZsfBw2KZ5E0cNZRFflvuXLJbH7K/HP9ZzO7sJopYXnu7GzKqVEs
 ihOHCazP3sZJY2PK4XyEEGPqoj14wz1P+zAQET6xgnXROCH1Mdq7LdR6x5HNWay5aC
 ZW1QB0aorv4Kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KZSdtNm8
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.1.0
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

https://github.com/harfbuzz/harfbuzz/blob/14.1.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 626ed7b7d4..1a366edd68 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.0.0
-sha256  d4aa312728136e3dc7c3cda47b871614ce0d12bbb19f9dcac2ea70de836dc307  harfbuzz-14.0.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.1.0
+sha256  ee0eb3a1da2c5a28147f12dff55f6c7d60aeeeb29ac7ef334eabe84c8476c105  harfbuzz-14.1.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index aef8681a13..eae671758a 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.0.0
+HARFBUZZ_VERSION = 14.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

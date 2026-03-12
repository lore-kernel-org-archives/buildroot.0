Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E3FED2FF
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 10:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A39A884A0B;
	Thu, 12 Mar 2026 10:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRnpoZOUIT07; Thu, 12 Mar 2026 10:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3EAE849DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773311146;
	bh=OV5XVBvFceWlH9FKiDIj46rsYqxeW4pedN8dfwrI/04=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kbPIkf/ap1N7N8E6WkCtgvYiinc1is8AKOZUsMPn1xTs+EPz7oDNB6OSLAdkOKJ/x
	 xYnk9/Q/u9nAy+rm0YTNNdFy1OXDkn90xdFGbg9wrsO2k5Gkd/uv1F7Zul5C6xM8hB
	 clvfjqChG4qVzUKG7EhAm+7WyVbD4BiiOAElDervgLecO4+G7gfqBd4RzBEqus08F+
	 Ee9xoBCAZ7Zlb6vSm0b9x626exLUDsT7Yf1MlgjlVnmztHdTwoRy1a0xj7/D1v908P
	 kHsdv8s0UQc6Eg7mmHMES5qOeYO5E0sDD0KdmkM06Q8bG2/vBxUjTsrZvBqYlwNYy+
	 CHV6xJLvrnDew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3EAE849DF;
	Thu, 12 Mar 2026 10:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A47282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E429441C72
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6pc5VAQNK3E for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 10:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EBC641C36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBC641C36
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EBC641C36
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:25:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 0dEXwzTqfdarQ0dEXw3Maf; Thu, 12 Mar 2026 11:25:38 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 12 Mar 2026 10:58:19 +0100
Message-ID: <20260312095819.2437101-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNVN/x1OEh/0Xs9mD7rmrcNMS188imqGW58BbUM9XUdw3JeY8oDSxGH0Md7gnGMp432i1o2b5p9u9VHZlkpCty5ZY8j1hWd6R/tCmMn3EKxg0UzcvYy2
 plg+HX/tzZjzSFVGs7tZXfKZQLVJUjZheQBP2EtCdrI1cdNOx141xEZ7D4tksyCSOET8+EMzmVhZ42Xu+sPClCM2q0JFn5DFp2aVK9bzza+UxGYcciu+JANz
 a8Q8XAem6Fo0NOkuyscbkItb6qcpShJzcPoebakYDBA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773311138; bh=z6QD3aDULxv0joBpi6hZgQ94xwwjCZYfHRHd2tavaQk=;
 h=From:To:Subject:Date:MIME-Version;
 b=RNJV5WZVf+7uE2upAidzsinzTOMKgURbzQ96A0HsiogAC4hlbkxCll5oINOtC9dQg
 OHf3yrKDYwB6E/YaKTSg5wv4c0z8KlHtBt4xHQG+Xx7lwjwIhLplyzaVh0cI9l8oId
 gOARGcxRxQ1AOVkSU4Oc5rkh1RX4p7RHWz0WsgjojpTz7xS6DgXOep9SI5upGT2GDU
 /O8vH33EdXkovhAvsErCQ7iG1rUN7Z/HKCdHJ4DB8V0N/WEsF7Jyf0PTCEGgkXCrpF
 6VbUBkrbjoEZXqfXIQilT9pMKvcqU8A2Az1r1AMgWlZuIcJIGROpaS+FJopDkTR9Xj
 VjDegEpPHA1eQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RNJV5WZV
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 13.1.0
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

https://github.com/harfbuzz/harfbuzz/blob/13.1.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index a6247282a8..3090b08904 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.0.1
-sha256  3553d943401c34ab9b8c75f35cdb8452ca660233b0e9d4a22395ce5245484bd7  harfbuzz-13.0.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.1.0
+sha256  a9959a0db77554d266803e1e524249ed4504695fef63524aebca749ac6260a7f  harfbuzz-13.1.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 51bef1a68a..60ddc8aadf 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 13.0.1
+HARFBUZZ_VERSION = 13.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

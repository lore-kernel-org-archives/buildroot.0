Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AA3F55137
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 10:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E60EF41B82;
	Sun,  8 Mar 2026 10:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkBVzc1mHFAU; Sun,  8 Mar 2026 10:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D631840CF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772965162;
	bh=/m3T9EDaDzKWu69tYD47cSLb5DE5t+INHC7RXP5aEts=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GHdGvOrUIRbTgtNsxsdizsasxuM8AYbotof1q7m8G8fiCN7Kz+aHMzRM2Tlb+bmL6
	 P2QCrA8ypJtwfcHLzVh6JWORQXG5nq7hKEk7ykRZHFzydbNZNdeHdV/ZoB51dTzuP6
	 wK8TqJ6FHCuilwktuFdwEtTL+0i4PfGcKsgyJW4s1ABg4bWPuZwXyk68llufqSvnL3
	 FK19z8ktHIj6NqMlY0gIeMEF4qAejmFuPPEWHbGAgY1aQG7VzHsxX9kdDuvovQvQ6w
	 6Z2HlF/HRaTPm8F5L+r9e0YELeMFvWovrkJAmFrT5IKge6dQdIFVlEQ+BvE9swPHiO
	 8lsU9Q73k8CoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D631840CF6;
	Sun,  8 Mar 2026 10:19:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61FD4398
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4834183E38
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjN-AxNKuL0H for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 10:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE66E826C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE66E826C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE66E826C1
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:19:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20054A4C0734;
 Sun,  8 Mar 2026 11:19:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35570)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzBEB-000000000BK-1BR4;
 Sun, 08 Mar 2026 10:19:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  8 Mar 2026 11:19:15 +0100
Message-ID: <20260308101915.1697719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772965156;
 bh=YLP6yF0jk7nTtK+pXJZQCOYd7t6yBxyyEYCnW6mObjE=;
 h=From:To:Cc:Subject:Date:From;
 b=ni9Af6IbN1jbWC20bKpnD5yIc6blXKZ0N9+1fupdaa4wOP9gBh1jFprOJhSffl0gH
 FVwBdXE5qZfBaJlbScHT+I4ywxmdcXK9krSM8DHXiyZCScc/uNa/LsDBF79wiVrlpG
 N8TOKEmLxGYC3sUSLKjbmDGGNFzjO8qLm/ghHDYS8Q1yPkSKzZ2HqH3ZBRBrBUMv/f
 jk2gx16b2VoPLq6iACBTiR5SyeNOBBL+gU0YqvXNP03n/TsS94+WosxcNPrB19R80k
 U0BiURb5Mqjp9TyNxxVTRuWDbBvktmUzgU3U6KnQUiJ+Cqz0wxuHB6fSjpnQUvuhop
 4lhxEJYLisGsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ni9Af6Ib
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 13.0.1
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

https://github.com/harfbuzz/harfbuzz/blob/13.0.1/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 57643c8318..a6247282a8 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.2
-sha256  6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8  harfbuzz-12.3.2.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.0.1
+sha256  3553d943401c34ab9b8c75f35cdb8452ca660233b0e9d4a22395ce5245484bd7  harfbuzz-13.0.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 787f42d820..51bef1a68a 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.3.2
+HARFBUZZ_VERSION = 13.0.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

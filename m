Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF18D6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57EC941181;
	Thu,  2 Apr 2026 18:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e20T9qj7upvP; Thu,  2 Apr 2026 18:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5DB14113A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775153063;
	bh=RC1wNGEtpo4p31GE/5jYjpquxXDeXmiXyxLETZRbAgY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LOti4yC9LAcQz6gIt36CN9JvDKzYr2qCHv5Y/jXwko6TDLxkRIbUl8KU1qSD0VStQ
	 0rdqwV401g6kkj160JnMJOyx4QXl72LNh5N5mNFkYYbAyzuk5ZA6t1V+ovKM/2iBdo
	 9VH3gkUZoY7s1dSyYaAgZsaB08LcpwPKGCtHPKvgKMAY7idx09/P8YR+dS8ITiftev
	 6Xci8j1c34sjBsmCzMLpxjimAO7nM/0nS7XLd7W52eslmF24aAMjx3AjDasAXaTqRb
	 PaJxv8mv7rPqv1cUwRXomWFij/EJDLa1HPS0Rtu7U2GQSJ9/yRf4A+dvRubUyLHyND
	 5BxXJ5q+Shzsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5DB14113A;
	Thu,  2 Apr 2026 18:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 625372CC
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 484A1401D4
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNNhf3DLye7C for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:04:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43AC6401BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43AC6401BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43AC6401BE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 746B3A4C32CE;
 Thu,  2 Apr 2026 20:04:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36364)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MOw-00000000083-3fBx;
 Thu, 02 Apr 2026 18:04:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  2 Apr 2026 20:04:19 +0200
Message-ID: <20260402180419.2780025-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775153059;
 bh=8aALoRsd73Gn69OdkB/wWEmMhG8JWNmdUl8uqzS2MFM=;
 h=From:To:Cc:Subject:Date:From;
 b=KqE0ZiL7miPZ1VO7iwiwd0d0oQcEy43ZBKz7RBNsn6GOBQbdD8kP4rLwu5jA2LnzR
 fPLVQBOlKwuSYABrRriFbMWdevwVwwqhR4Fu6y38Ah1s6Vnl3xiihx23rWWPK6156i
 tNL/1Zc49X/B9lKIG4c2lSgS3K2flnrIwXHItRnzb6cDbXf/8mMj1ncE8h3e3a75sZ
 LXEFv/t674XwwW++gbdwNL3Lpm9EGBbn3HZ1AI/J6t/gktbfCoEvMDGTrn6WD23/uH
 98Zs+CkS9bBplbMvjbKlJIEqtl2Vo3CX2BasjZD5rEhsRoGoaxPTVQfRbfKEl2ilAk
 S6DcP1xPE3mSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KqE0ZiL7
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 14.0.0
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

https://github.com/harfbuzz/harfbuzz/blob/14.0.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 8642387392..626ed7b7d4 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.2.1
-sha256  6695da3eb7e1be0aa3092fe4d81433a33b47f4519259c759d729e3a9a55c1429  harfbuzz-13.2.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.0.0
+sha256  d4aa312728136e3dc7c3cda47b871614ce0d12bbb19f9dcac2ea70de836dc307  harfbuzz-14.0.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index df05596b1d..aef8681a13 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 13.2.1
+HARFBUZZ_VERSION = 14.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

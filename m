Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CB1D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 18:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61948821CD;
	Sun,  7 Dec 2025 18:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xN9T4-gZJZjk; Sun,  7 Dec 2025 18:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A956181F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765133122;
	bh=lpm1Xba6CHxNIS2givW5u0yytcMdC4fb7vuX0NqTd1U=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NjjqoKnAk6OYFnhh6LEXobeyWmBdsTkJaEtIzt+caFzrdSe61atwddQfqAAGA9or4
	 SUSKrdutnD2ARdwZOYIQoNaAKg32qBUDfm76bJ4nRBSQ2L8mHSOf32yiartyZbT7m0
	 on7frHS6SeSBoChAWuAij4mvfsjFlHHqav7flCme90VCJJLiWEKOpgejGbuY2pCamA
	 Z3pXipSll0RLoe8qNLEborEqhxoCyeGcSC85NUAGPON5cAPBpooHaz4WhKWZ0RIbYq
	 e4J/e53lE3FbGn9sMCZkm+ALD3DxoRurNCaC0x4P3+p/Oq/XUDf8EeM4xrK4liC4QD
	 aCj9JUNIrxZ6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A956181F06;
	Sun,  7 Dec 2025 18:45:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A2BE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE977406A0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9FJ8LS49yjS for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 18:45:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F01E04069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F01E04069B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F01E04069B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:45:19 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 46767B0054E;
 Sun,  7 Dec 2025 19:45:16 +0100 (CET)
To: buildroot@buildroot.org
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Sun,  7 Dec 2025 19:45:12 +0100
Message-ID: <20251207184512.4000426-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765133117;
 bh=rfxXj1e9rthN01q+Bnk212WmQl9lVjWY7hw8LvYzW5U=;
 h=From:To:Cc:Subject:Date:From;
 b=S1RjR1NX1nBv/myfELnBHgSHVTSZmn7puXOm6e1lLIXgPHpyR+Iolnq0cwpdOVMVx
 6GcoWpOY0x8QUdv2wqyWe1186PhUJuPXUmVtfUW9XICyrWgrm09srrzkGJeannbXLz
 wGXScJJkpxTugqCgPlB4zqVUkvNibCqPCb412b43SXA839pKESFh0Vbo3XZZShhngw
 q21ox0qI2PYWLdEulBANOpeC3nOen3KH92jjVNG4EYIxFxTGXMtjnW/F3hERpEMlzf
 PTyQwX2Qnw/Q0KWSU3DYK89FqNUugwLYOOO4ZQ17Kj07yvLAlltCAoMiLMrPJ0nV8H
 wOpsqaOa8Tt5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S1RjR1NX
Subject: [Buildroot] [PATCH 1/1] package/nano: bump to version 8.7
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://www.nano-editor.org/dist/v8/ChangeLog

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 714046414ac7..c8bdb0913f94 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.6.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.7.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619  nano-8.6.tar.xz
+sha256  afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9  nano-8.7.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 183dc07e7e7a..ee82225a7235 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).6
+NANO_VERSION = $(NANO_VERSION_MAJOR).7
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

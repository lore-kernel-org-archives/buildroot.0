Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B01D715D1
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 07:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D99D483D13;
	Sat, 24 Jan 2026 07:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9zMow_XwscQ; Sat, 24 Jan 2026 07:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D6B83D08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769240812;
	bh=MElPH5ewCvCDN3ZXf0upu3suU73HBk2OhQG/1m0/7uA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L8WoAtqERaPwCRuueIACbyRDO+ZG4BxEk5lXJdslpVDs37bjiY063fsp84BQMTKp6
	 9bJWfXK47OLsK3arGarPzQnA1SUHkWWx5MYefADnWucAHe2ZvA/W1aRLMJqFp6BM/M
	 UjXMuHG0lPa4/ls/tg8rdPkAtfcPIT2IInShMfwJRyIEYJdx4meABtv9Z7ZRmUtTUS
	 IUA9tAi4cdul5k5t1D6wsSA668C7Q+qsIdegpLfaZ8k5PpMj8r37P3kscR0UumMplN
	 ISLRR4cXLS9q+LMYv5BfuiDrY0MzfNHlWC5dhb8a5roRM006ky3W+89eJrCwozPCcN
	 wtp1FxVMAWorA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D6B83D08;
	Sat, 24 Jan 2026 07:46:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3607F122
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23C1540AD4
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbFXaGgBM48f for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 07:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF40C40AAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF40C40AAC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF40C40AAC
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:46:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b95e.dip0.t-ipconnect.de [84.161.185.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FF09A4C1915
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 08:46:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42332)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjYM0-0000000021T-3RMx
 for buildroot@buildroot.org; Sat, 24 Jan 2026 07:46:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 08:46:44 +0100
Message-ID: <20260124074644.5639-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769240805;
 bh=o28mga8dkfNNEMAltFXSdw0FheGghFt5dwFOrwvrxno=;
 h=From:To:Subject:Date:From;
 b=ncKzE4s0Elts0gZaxBNhCpHrHJiWlxnYmF7dV1ChEiMNNwfmx4UN6RXvc3ayC6Z8m
 yd4v+yqCjRlVqTR6hM7xoFqC0Ui3so3jxepfqSbm2NNzrD/IkZcFN06LkV2RsBh6A3
 pRefBJ9s7pCC3BCw+JXlclxcshybaBu7yCBVjWeZrD86YVlhMngQEeZbMel1vX4SMl
 tZ9x5S/tdjvghhZSUdXqW3kkzJZJOX9RqeLcwJuimtdSe5jV2b8zTdej6wjrLFVWyd
 5Jawgzho4B/Ab9uUeBOJaAuNARZ6wGWBEuPFEQj98gsm+SRTZVpjEaChYjYTIu2Wka
 OpP4PENLWtohA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ncKzE4s0
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 9dc5dd8b6a..0ec391b8b9 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ad851b39afaa1bab121c00a1fcaff641e3640d2c4743a1ca7800d2f403fcf52  tvheadend-0b23983f5dafff006ee83908915193c49deacca5.tar.gz
+sha256  f3c311c2bed4de5b0312286f5b1a0307edf502fa0ed360855eedb044d4247674  tvheadend-5abbcda4d8c82d2d4889452a7056a7bfcd728fc6.tar.gz
 sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index e108a6d23a..76fa7d8cc0 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 0b23983f5dafff006ee83908915193c49deacca5
+TVHEADEND_VERSION = 5abbcda4d8c82d2d4889452a7056a7bfcd728fc6
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

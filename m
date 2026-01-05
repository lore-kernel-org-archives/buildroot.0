Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62729C79FA7
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 16:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29C9811DE;
	Mon,  5 Jan 2026 16:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UV_IJTNfz7_X; Mon,  5 Jan 2026 16:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C5181342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767632356;
	bh=XMtiKVuIe8WuiRJ5RZC7cyZ8pXqo9IWyrpxBLuo5CaI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FC+5P1bWCHnodqsHNMxg8WVnGbIWpypkU9a47cGQbeTUwTB4+/WBy/c9VlQu2d1wQ
	 W32+IelOZkXX8E0vB9iYFxEiEtDbcvy4IeVaPPu+U3BimLItax/wCwCNceKijZ8mRY
	 kwliRMJwEnNuL6sMFxg2IsJGaHC96NjwRNE/vNaevG6b4yEabQqtorcTgPkyrSrPnh
	 gMLCpyz8c9WLE6eBVJThxMo+bDyWwgsduH/qP63gcIMdnD3CGVQehmbj34Ez99Phm5
	 Ys5Hs8RXNqjEftssTngPydF9EyvjMGXwvQTT4SMcan9S1qfl0bshbCJlVOiiOTckOm
	 a4uGPekWHs2Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C5181342;
	Mon,  5 Jan 2026 16:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C9B1E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 16:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 226A381342
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 16:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hc8Y7c7zpf08 for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 16:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D4E8811DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4E8811DE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D4E8811DE
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 16:59:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -249459738; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Jan 2026 16:59:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vcnvA-00000003FdV-3ZnZ;
 Mon, 05 Jan 2026 17:59:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 17:59:06 +0100
Message-ID: <20260105165907.775076-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QLob9x1QrS5rtCuCp+eoPnF7wVqZKIvdyWQdD12bvtHieAOiKawTyhg8pilc7EhZkG9iRomLd6NT2Q1hBsce3l73J/VCD4fl/wpc4vjVwNVa+FqE0NR6cbtUfGjmKwg9GuYKzlltqBqalD1ei02sFGKwPPkwcdqPykNW/bHZCw02UnQErcQZ8KVmMQcSS1sAm0ru7+n18ZF5cPLpY6ocqfKjKp6WPoFt4l5n99NefQj4dkIiC+QpTwxg/iLPoof6exhk6NLwWiXQJHtzVqhlQg7YBy3dsrXqMWxo6x/pVTQ/NElynxlWFI5O8O33nbYvmuvTtt3+GP0xmi0vLNmwaA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=lrkYrPMwxwv+YkNmpgi9uk/XQimci4q+1jmTAdbNFSQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QLob9x1Q
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/rauc: bump version to 15.1
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release fixing compatibility with Linux 6.19-rc1+.

https://github.com/rauc/rauc/releases/tag/v1.15.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index c0eee0d8d8..ea537c63b6 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  4ae0b5246c668acb544ce0230a3bada81c78e8afd4755e5afa2218cbd686fd70  rauc-1.15.tar.xz
+sha256  603dafa5085b6b964c74d5f57a154a1489af2b415dd20c6ff1447815d02c094f  rauc-1.15.1.tar.xz
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 10d4a2db95..ba30c70dad 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.15
+RAUC_VERSION = 1.15.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

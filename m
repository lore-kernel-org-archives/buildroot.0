Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F933FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 20:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D72A2409BE;
	Tue, 28 Apr 2026 20:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-4nSxMkN3OE; Tue, 28 Apr 2026 20:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A550409AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777409413;
	bh=CBtqa2N6UGC48jqSKHmZ3OUzQ+/McWFpIX59rYGveT4=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HmZ6XdVQ/wa9KM9gx5C+TQ56dwZ9e4i3B3FCAKdziKDxmOS0/pu4XDWgxaqwV7GiW
	 pz8fycETVycuk+08pcnIEzTNTaXL4HOuZLAs5yV1DKVHaaCT9/B9UeQSgfXWYRcrot
	 ySUsptV6UOuGroHiPEgkykYBltrwMfTYdu6rdHcvBj7IhwmTuNPnNLkdJ4qmMiXn13
	 BtdPPWCj1uL785IS09LGSpLfPZAhDtsakWt3IkN0zWHTMXgEpexMuLemnu3bWHtbCZ
	 E9C2qFPAZGwmt0GixL4WkBDlQuawkkvAIlaF2bnxoA+0bLk3UajLyTFlY/ZhFdM9HU
	 Ykyk+WjHLtPRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A550409AB;
	Tue, 28 Apr 2026 20:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53B9923D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45A5880EBA
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc7Ovo4zUJrT for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 20:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org;
 envelope-from=ehristev@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BCFA80EA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BCFA80EA9
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BCFA80EA9
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C5AC61119
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDB4C2BCAF;
 Tue, 28 Apr 2026 20:50:09 +0000 (UTC)
Date: Tue, 28 Apr 2026 23:50:05 +0300
MIME-Version: 1.0
Message-Id: <20260428-maintainers-v1-1-9aa4552ce96a@kernel.org>
To: buildroot@buildroot.org
Cc: Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=776; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=iZEQ1nUWKxT4kOZpEqq6sgx0Btd1vC785Nsvga9L+5E=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGDI/yjbkr6lpb8prLf18bU/g1E1yrj/jTHsF2gQ/ftv8q
 3in+lyljlIWBjEuBlkxRZZqk3+1wv073E+6WqrAzGFlAhnCwMUpABP5fIbhrzhjlKDXVl2Gw4fn
 3pvkaVvwcfrcfwEPzcVMRMVc3Up89Rn+h83p3a64zbnvIH/VokjX/1sXK5bYeh111/WLeuI96Wk
 SIwA=
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1777409409;
 bh=iZEQ1nUWKxT4kOZpEqq6sgx0Btd1vC785Nsvga9L+5E=;
 h=From:Date:Subject:To:Cc:From;
 b=atNtdRZkpypKpc9ec4JipcBUNj+ScGuZD5k855bQV0zj/QC5OREqe4MeCKL6u1h0+
 98Cqe68LGHm+gQSve9lKP7ybItFX7NPhxP3+V6vR2pIjp9dBczgJxN4XkhoXISxdb6
 DvEWDbBvttiEad+1dNdk+DhjeUq09Tzy6xw2e0T0olRQg72zPj50iQe3wsTiBKCgEO
 j5X0lWXg/bOG555NxsfpRHjC6mPPqTI0HQ0HtMV7XWJADXHUvmKAwA8MrxoGskrsg5
 +vsNJpKzAsVxTE57q30cOWw5I8TpTWJJ7gW89oGL0IUmSHcBmEOczCY6FJONZRo0ka
 pygTq6CWGLZJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=atNtdRZk
Subject: [Buildroot] [PATCH RESEND] DEVELOPERS: Update email for Eugen
 Hristev
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
From: Eugen Hristev via buildroot <buildroot@buildroot.org>
Reply-To: Eugen Hristev <ehristev@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace old bouncing email address.

Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c6c228ae91c9..1270365ef0e1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -968,7 +968,7 @@ F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
 
-N:	Eugen Hristev <eugen.hristev@microchip.com>
+N:	Eugen Hristev <ehristev@kernel.org>
 F:	board/atmel/readme.txt
 F:	board/microchip/sama7g5ek/
 F:	configs/microchip_sama7g5ek*

---
base-commit: 3a488674b52f2515b3cc54526253682749553d11
change-id: 20260428-maintainers-d796e332862a

Best regards,
--
Eugen Hristev <ehristev@kernel.org>
-- 
Eugen Hristev <ehristev@kernel.org>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5367EC5DF7D
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 22:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECCB94054E;
	Tue, 18 Aug 2026 22:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qs5HAYfEjWQH; Tue, 18 Aug 2026 22:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787091253;
	bh=yVRavZ1Z2+u8epYS+aYehkMRCr0jVOC9nfTVW3MIVJc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WRWKpAoQ2FCD6JZTLW86/uWuIWwWMNQy4xCchlraIFyYzvdM8mLYk2LWUc5VI/P8e
	 Epo1t8uHcrmrbh9w5Ywf9SjKY8m7mOuGgraYMuD0IZmw2cLLYSDLcNpUJndypVIVt7
	 CTvf7iqjnsjxH9midisqg3ILG1tsr3/HAEYFMh5wxwAiVOVOa7u5toypc7isf32pY4
	 I69Yic59ZWEMf8nIVebAEkv+RzyPcxs+Iw/T5jH79tnDgufX7p9ACpIMCjFFi4tQLs
	 bMNoBGGEv+QiAOsNCr9cQ0BGebU0PnPMV80Ld+NTVY9kbsPdvX+V7jtBtMps6ZOX4G
	 Odne5Ixr82htQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 313AA4055E;
	Tue, 18 Aug 2026 22:14:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5304125B
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 22:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50AE8400BB
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 22:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Nn5r5Uh80JY for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 22:14:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.158;
 helo=smtpweb158.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=boSBewAS
Received: from smtpweb158.aruba.it (smtpweb158.aruba.it [62.149.158.158])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 895B9400AF
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 22:14:08 +0000 (UTC)
Received: from localhost.localdomain ([93.136.29.121])
 by Aruba SMTP with ESMTPSA
 id wS4Jwrjm0rbJKwS4KwTn2Z; Wed, 19 Aug 2026 00:14:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1787091246; bh=7KwxbX+KbIZJ5spJqe4AJ4uiY+gx9NICSIiz+PKx+Y4=;
 h=From:To:Subject:Date:MIME-Version;
 b=boSBewASeGPOz2pqPnETsYSWsm+jcQhH7+i+SlNZfDAhTBwE3mpO74eXObwxpbZQG
 Xuw1F7Lnzr3v20TaKi3IECYWOx3ngjlXOanXRTE6Koo+Ju2TCHaTJg89QPeernxWVm
 Ja7PiyYMnnLRDafw31QN65Hdq3/V+Y3YA+XDIFMtKkgmgmQcCdi2oRS4e34/nGSN+p
 F6iVHua+PhePzixbKXpTa7/ddVnY4YcQmXeWDdKZ/yt9CkKUtLJujEoJ7xH+EW9L4L
 j+gCmHVzTfgHA5FRcJQPK7PmhyYSRuqnIl39k2rxfVVu79oyU+9YblHr4fLIV5OvdE
 GRBlGWwr724rw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Date: Wed, 19 Aug 2026 00:10:57 +0200
Message-ID: <20260818221058.2704747-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIRdzsYoSYPeBcDrF3kPXUVLRO/9C8mlEdmQ0GTzzVat6Momu75ZzkypXeoIFheG532S6QgxH8KZY2ZDgbwjjOQZwziw5ulG/TB4T6rEpvHHIH7699Vd
 QaCUs5+BAh3gvbiA4yhaB8rno0J4FuKPm8xc7yJfFg5SCVEmUD8WiMkQXm37AUaUZTDJb9D3Xkh45yY3V9HaemkWAflOtciJR81xk1fInpuJx3hmHcY2fet0
 BfNvetldw4rWrKId7Gs1lb4dErGclmp8DbK16ega3hR2a7p6+22vX+CSIfY9N0Qo/WJpcMnYNwSi+zjjRRtNaKceZY7vFlszd83Bu/tqIRU=
Subject: [Buildroot] [PATCH] package/udisks: security bump to version 2.11.2
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

This fixes this CVE:
CVE-2026-7867:
https://github.com/storaged-project/udisks/security/advisories/GHSA-j42g-v9jw-6ph3

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 8a70b90a67..f9ed24c823 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e88c52bae02fa13414604bbef42c6bb91c2e24177ee0057ed55c6bd7451bcb6d  udisks-2.11.1.tar.bz2
+sha256  18630a8aad806bea0bc626ce97e71e50ec82c742956ac1c834a4275f8f22207b  udisks-2.11.2.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 43d066c9e1..0203d037cf 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.11.1
+UDISKS_VERSION = 2.11.2
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

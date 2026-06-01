Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E78ECD6E5E
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 08:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B30EC41234;
	Mon,  1 Jun 2026 08:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYapv7Sec_bq; Mon,  1 Jun 2026 08:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4B742A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780301405;
	bh=AfyyDgi9avl6HHB35TW6SpoMWP2tEEVnV7HYppdHQR8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QkJKTeCVMUY1Or4/L2jjRBmP/dOLLQnKE9lydWZ2wM9aAuSHrxUtiKWgDpGhu5IL4
	 VWZQRxk/rEHG1yIYmnjH7cUzp+kRGQvQE3oNlEI4KAMlBHGut+J7nvq26sU+TRA3zU
	 Z/R8B80NrothiNnJ4d1Ap5jJnDsMu+8q38unVKncmXzxBXXkEieDlQGkFetWWECRIn
	 gVIDb8N1vUwvceTgYTrtil0UBvBIOOBoJ7+n8mfualZPK7bhZgTbaQv60Mpz8s6oM8
	 jmm1wn0cl6o3IrNDnHMHd4Eck6uB8twPsq17qa92K9golSrPP1f6tmdl7KVpYBVD94
	 jjxLvpQQsZgtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE4B742A79;
	Mon,  1 Jun 2026 08:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C7B0257
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 08:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E8A860A3E
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 08:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYc1b9cvyRkt for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 08:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E66C606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E66C606F0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E66C606F0
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 08:10:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso88533305e9.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 01:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780301400; x=1780906200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNXfB9EhP5j7BcWJ4lwZiAzQlr4v61eoKW89WBHss50=;
 b=py3z+zzgSX2sPFyVL37GpZGS6N424LsC9eVwXWXSDx+p+1vH5a7tCH0C8mQebVaPdq
 RUOS3s7tpUaip52M8jGgZGIUf/JUv1Hvwl4xnAIOvnZsIphR0s9OCkwgfh0yFIbl3QUv
 7TGr0ayapYtksAdV7cEze2UX23TkE0OyJP6IToGX+f5MPIYPH6j1N6KcfNRY/+h7HsHG
 AqOmNUi8AE+2pJtl4m8d+ckQNhLxBx6gdHMBVi3Lv1ZwFMlKHQU8OGnlRMwkSQA7rzrA
 +vpKzHthnxK6LnJ0rC9qEUKnIyHbQbNDyyPaHiWAazrZqk0w2jAIVBZducbfF2PKRlw3
 639w==
X-Gm-Message-State: AOJu0YxJ5ZJHroShLO0e1zRXJvLWPAFfPWqz6PEtmcZGkCdakmJjPmAk
 RIb1ocBI8zBvTbTwRpp/6B0bWagUbLqQRHIM85w+FbJ+QnYnyc/pqNQ6JlKygkvgniNczwJQt7B
 itCNKCMI=
X-Gm-Gg: Acq92OEJZtYVH2qJR2HFWsNWjxpQ/bZSfpFXcBI0o2rWhKAn/f707MH8Yz6IwFvimtS
 aQkZA4djdq45tgyqAurJ1CIUFaYD956dsJk+d+T/vyGqdXUDXJELiBQvNXyceUnMsMcrCMNZDfl
 bujlrvHPpmgr9kviDCuQLdFrpwJlTOTf6FAc5se0jQHcxvaP4b9y5KgfsgE8ivdW4UGwH1Z86mS
 xjIOu3DUyqVTlbg6Kp3rJJ7khIKN0i7uX5savUwkXWk5e0BVQY3Lu1hc/FZkDcfvDqxoth7A4cB
 kKT7Wbm6hfwx6eLIzsBaMH3a7zekOcGlkuEiwPWrwUbz/m8C5g6k9iQft9xskXhO21WFmYefWsJ
 +4bvPwxMGBYPDiUDZQpl1hrEsGtxyJoDYsS92HSbkztam9YG5FRbpE4R7nfLEeFkHCdGyUx6ibo
 0LvQ2G7R2Xa/GsFjKn+zp7BA9qAP0jQ5Lbi/uurNLRPQ2yNW5C/bW/atnJpCyu7KcTtJCtEwfry
 16Kb6Y=
X-Received: by 2002:a05:600c:450b:b0:490:6e11:c303 with SMTP id
 5b1f17b1804b1-490a29213bamr195288275e9.13.1780301400259; 
 Mon, 01 Jun 2026 01:10:00 -0700 (PDT)
Received: from dragon (ptr-94-109-45-241.dyn.orange.be. [94.109.45.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34bd320sm22251734f8f.13.2026.06.01.01.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 01:09:59 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	thomas.perale@mind.be
Date: Mon,  1 Jun 2026 10:09:26 +0200
Message-ID: <20260601080926.2488706-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780301400; x=1780906200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wNXfB9EhP5j7BcWJ4lwZiAzQlr4v61eoKW89WBHss50=;
 b=GTmev9zki3yWJI2KGUgf1z5ZqYoLed2qoyI3z9HPlGgo0y1pR3LXN2q3C3oLSbG30B
 VL78PNexybZULamKPCzB6sgRh3HKyhCVPxHwWv78JQFgRY2BRUjr+ac2BALoMzAQLnkc
 t1xeGBNNybjjpFc5SbATtzlg84wOMT5wPFHCnTH102Ofh8AZrwQx1/pLnAmDeDDaoD+C
 sFPS2sQvcj9AaAJBGrngFqy4j1bmWD+N/TkkcbfBjgkO4b//TjLzT8Zg5lqq7TBxeVQi
 yrR0XUK4KFmWAtQt9unMcNlYQ/oMgVYsFLyBRUkoQb9mmpAIHkDfU7/ajUpO6bx3AgfB
 GQ/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GTmev9zk
Subject: [Buildroot] [PATCH for 2026.02.x] package/samba4: security bump to
 v4.23.8
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
- https://www.samba.org/samba/history/samba-4.23.7.html
- https://www.samba.org/samba/history/samba-4.23.8.html

This fixes the following vulnerabilities:
- CVE-2026-1933
- CVE-2026-2340
- CVE-2026-3012
- CVE-2026-3238
- CVE-2026-4408
- CVE-2026-4480

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 84ada82bfd..7d88dc129b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.6.tar.asc
-sha256  e3dabd8b5e42dc97669fa0faef032510a94e496b58f7067082e5036d88f0e702  samba-4.23.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.8.tar.asc
+sha256  976129847456dc5b78c00f8ffb79dc605c49d6aaca8b2aa772fd22dbb69fae01  samba-4.23.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2631f2dcad..0e58a80386 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.6
+SAMBA4_VERSION = 4.23.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

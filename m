Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F27D1950F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 19:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95FE60E03;
	Mon, 26 Jan 2026 19:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoSVyPaTRYzX; Mon, 26 Jan 2026 19:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80EC860E00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769456858;
	bh=OWGXEN5twNnLMR2Z+TWK6DbHX5iGZ4ENrzpocuuTnzs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DdgX0Z85+X/9JubKTP2dRsjtKAPQ9R9LanU6X/8omsENsKlrMCfxXcosjieJHL6yW
	 Mr1EeaGRJXgD8GZsnlr1MWRqknar7r3ugDMEKAgnKVb00udsDBHOq2fZx5EdNHg4HW
	 JeUtKCmOa5eTYSzA7U7p19x1SOdhh97ZrXYgGiSl/lqZwPlhYEdTjK4nujS8mLYnWs
	 0nXuiEj9QC9dqZiBNZxxFC+FBssjq6g9lxq4WWhC+dOlw4VSTni/VZuLUFaoC3SMVG
	 2q1WWF7nQyGHdoJGMaOholL18rm/H/jnyZJovUdhpci5Gn6wFZ0sQYS0bgaTzYQhM/
	 tdmBMvE7+qxeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80EC860E00;
	Mon, 26 Jan 2026 19:47:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DE8A118
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 19:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AFEA40728
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 19:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WNfbjfjckbc for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 19:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 304C2406A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304C2406A6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 304C2406A6
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 19:47:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43590777e22so2964905f8f.3
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 11:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769456854; x=1770061654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZncU3sZKpjAl68nczpHu9CXR+icLXiDcpi3WFLvaaw=;
 b=ji02q8HkoxV77uRWoz1GCDl+BhKJJgOVfadFE8v5wyLT8z52yA+g1wbUz7Bz55Rpc0
 fkEZMQpix0IXo4dicZUmu9Z6/pKgOIxlwNyrdJMk1+ugvWnRWJpEB17TEC9YhUewroCg
 eL0SLU3etwITFvoqmTpZJrQpQ0J10iZjvXlKakQosn0hl8LLF4cc4Op6eCx7CIowNBBx
 UBBSt89ljFpcwUo+RMPwoHXuPwFsOr3BNTQEcgSyTRl4I7a1W3/+kG/e/jZpqozrOscO
 OuEDG8EZOwYiKKw4op72uB38Jkw1QvvyjJBZYwFjDcAVIzBWxZ2FAbhpky5kBo0jeb2B
 8Kuw==
X-Gm-Message-State: AOJu0YyXAaKLr3vX95eDvssLJLqahQ+pmTMlJhe5a2RuI6YHwTGiKCQy
 WW9UsINyOqwfParxFvxRD7Oq9gYhl2aPnh1tLoPeNMUUCzarIY8sof8alDXrmdLOZn8koFgL6qF
 HIcn9
X-Gm-Gg: AZuq6aJcZTfBJU2J2y16sculfgjs4/zLSFhhC8bFxsCFZbf9sDZAO0zE/iDZgrdRpJA
 KSlTPoAHcpHs/2JzPlRS0O6Uqn+17IP6WfCJDNza6XuZOxCW9r+Gy0t4BMZWNdRP8lZCZtqno4M
 A/ANl8gTijdDGOz0OIC3VUZa4GklfvX+JsxKoeTMa7DZOepUt9n0qW16Wtrv1y/lya0KdKCCj8A
 WYqv9nL8v6HDKstJB3W5Yl50NaJx8mVnVMSMubPL8gdCKUEkJmMOT0OfZwBl11ZVkPNMqifbwHn
 NFiI8wkI2zBUmP2MCTz1gm0uNIXGUwI/5qxxnqkr8RJC4EZuKjNJwd9DiQy1bnmfNcmHqac36IE
 UCVrd2nw8wKHt2yguUpL85lgbdt1WTOePiUz0v/AWFpi5FhC6lj5tnkqwaYI/eynPaplSIbBfoB
 yPWgMscapXILfsY1Zw7d66o4rhIiLALd7dRlN8ViZO7rRKzZqJmxlBeEICnjLzueB0tZ17EKNPG
 HsxXa+sINnoDX3KKKBcjptj0p03bSo+NBShEeJXwlmF
X-Received: by 2002:a05:6000:608:b0:435:a160:4480 with SMTP id
 ffacd0b85a97d-435ca18804dmr9276617f8f.29.1769456853450; 
 Mon, 26 Jan 2026 11:47:33 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02dd4sm32050415f8f.5.2026.01.26.11.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 11:47:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 26 Jan 2026 20:47:30 +0100
Message-ID: <20260126194730.2835281-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769456854; x=1770061654;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gZncU3sZKpjAl68nczpHu9CXR+icLXiDcpi3WFLvaaw=;
 b=KQ6BUWaqWhJ0q6uJ1hALQC1Cr3g+/7noL4CEbaT40GLZ7xswRVjoWJ56BMvkmFf2UT
 o01tFMEga71WTJN9E4r1wvWJiTUsLnzdMK5fbmgO7HLuV5slN8YmT9TqEIEXBRn9OvW/
 7yVPg+capstRABBidqG+8+V7GjIblhZN6YZ20=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KQ6BUWaq
Subject: [Buildroot] [PATCH 1/1] package/less: bump to version 691
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

For change log, see:
https://www.greenwoodsoftware.com/less/news.691.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 881849a42b39..49dcaf28efe4 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-685.sig
-sha256  2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc  less-685.tar.gz
+# https://www.greenwoodsoftware.com/less/less-691.sig
+sha256  88b480eda1bb4f92009f7968b23189eaf1329211f5a3515869e133d286154d25  less-691.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index afb6987e731d..6f78fb67c76e 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 685
+LESS_VERSION = 691
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

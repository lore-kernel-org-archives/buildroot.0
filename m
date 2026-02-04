Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E903E9D403
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F081F60D7E;
	Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNISHJaesyTi; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9231F60DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219848;
	bh=ExkHgAaiVbyLHxmjNihHbgDeg2yn84qga6LFnF/56fQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YJG3/OYDYqagj3zUPcrPz8NFE50/HPqZnRRsQCGS9ZLBvTEU97OYhXnkTurWEBKoD
	 ZwBoes9UXKyh5Z6jUDk6/19ONhYa8bCimAfv40nA7fB7yK6HZgilqwCO4USpzc1kxq
	 YZ2AYI1VcN0p21VkFl5WuyNFMEFPFpvHFGWfavnKXpDikUEdJr5IA4m41gi5/9Zuev
	 oDwSBfNp9PSoPOyDlZpFEJpBd3eVQN49W+jNPxS/Pxqy/k6ZMAj0O+ZBUBLrmvtebQ
	 WmVC4l3apLrQiKBFW9zPTurRUbaYDdd4Dg9vufMOZKpc/mMz0W7E5/xeVNhffsI1tY
	 nVjlnTC1jCzVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9231F60DBB;
	Wed,  4 Feb 2026 15:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E638F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48D6A40AD2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpZBuBItaFeY for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DF9440C2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF9440C2A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DF9440C2A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so56498265e9.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219842; x=1770824642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uyzHKYF71M6zPzYv9McERZMIewWsBcVBPW+gyTbOCM8=;
 b=Zr6ZLZ2zwpMCsP9UhaNp9ep4RHzjgiuV3lysVbG469VUoJrdf5lU1qg6uGYRfG8wqW
 j0MehWXiqouoHJsFb0M/zLwGf2YClE3a8uIggPOvTYLRnS7TzuRWb7Vumns+CO6sfaIA
 cH6yWgYtetrRDf+34JfGz0totQ0h/Lyr5y6wr7sRKvaLE0X7KOx72yRVXNUIcc9FKWsm
 Cy72COLNOy4nQ3txo3CvgUlrYP7TPKL+2JmXZI6zfQuC1t0lxtIPx1aVy2Jdz+u4+QGC
 kNPuUKDheqMTVw1EPbSGQRjKJ4R0HtF4PQ4kNaR6xQ3ZtnOCDyeFDh0497bEgp3C6rQh
 T6dQ==
X-Gm-Message-State: AOJu0YyzSLJw4+eUBZLf/bW5iJe+/7uWK5SytgfzvrjaZsDC4YZzYN2U
 qO0WoGEin4akhNd5VGMorpxpMu96Dyyn/+UQf+Ol+lT6QiAE5VAg9B4elsj22Ou2L5mqzTN318+
 B2UadJYw=
X-Gm-Gg: AZuq6aI9bb0azqljbfaTq1nkeC0j2Uw7AkmyfI7JSSTUEDugfQm/X5pKzNyLHBzNJrw
 BrTlh5lIpcnEdypIhA6cqXjNLvRsOExp76bnMVgQpvW8+RwZ+ZmlM4iWJxoOA2gJA8URmFb/e0p
 VUICTxGwvpu7/pdpTf29Wq7+14uk6bWtsCp7nxacGdcELaIHCz3hAIQDbqXspXTtNmGppY1xF20
 vGsinw8oDcqBmSoYZOmehuChM7Mdr6Y+83rIiKBJIcuUaoe3rOKkFM/5lkfyjnzx5LGYxZHqplA
 u7yHpvlaZHnze5D6SnBS6q78a9lx1JX40WSuzBSX2uK2sdkXIqu7gWL2hO2QDN7H9KhJVoU8Kq8
 4QRURn+cRAyul7dm8H3XtF6S9zInVsFgcsJgNDFhvZjlMtqCe8IUuqcQf97CVhK7J8bA1wLHBIh
 XDt1Y7NLKBeu05vNJP+Lj1hz3cAWhU7sR1afkr2gihNoEdxjU6
X-Received: by 2002:a05:600c:6994:b0:477:76c2:49c9 with SMTP id
 5b1f17b1804b1-4830e922999mr40345105e9.2.1770219842051; 
 Wed, 04 Feb 2026 07:44:02 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm55222545e9.3.2026.02.04.07.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 07:44:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:43:29 +0100
Message-ID: <20260204154340.766528-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204154340.766528-1-titouan.christophe@mind.be>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770219842; x=1770824642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyzHKYF71M6zPzYv9McERZMIewWsBcVBPW+gyTbOCM8=;
 b=CtWis7nb5JxJYsT+CitBdMGzo/tWFNQ620P2jn0UnmJa998iUycih+CMjvG8x5rlld
 lCMZgnvb/sTxn6AY3Wt2p1vmMr5f+C1/6loZa5CdWTklxRBg+qTrkycMnaOK1lE31Fzf
 82Pt7HWKYfzlhcIV3pS25R/8HLbTtpUTu5AaLg03OldMd8WnRLT/h5T278fTn7KUJht+
 yAYj0Vy9F9pzUAs+zk4LoeaTOwH2Fgs82N3Rj6QHc99AQd/jeos0IFB6C4/CeB1Y9SdU
 cusqfgEa5SLUHypoBLtRWabBpiRsX7VNI4gMYl+5XNc2xD6I2p3IiEVD/nL0FHbSft9E
 SvOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CtWis7nb
Subject: [Buildroot] [PATCH v3 2/7] Config.in: do not expand TOPDIR,
 BASE_DIR and CONFIG_DIR
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

- escape TOPDIR, BASE_DIR and CONFIG_DIR usage to force to not exapnd at
  configure time (but at make time), needed for upcoming kconfig update
  (see upstream commit [1])

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index d730f2034b..bb70964609 100644
--- a/Config.in
+++ b/Config.in
@@ -237,7 +237,7 @@ config BR2_DEFCONFIG
 
 config BR2_DL_DIR
 	string "Download dir"
-	default "$(TOPDIR)/dl"
+	default "\$(TOPDIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
 	  If the Linux shell environment has defined the BR2_DL_DIR
@@ -251,7 +251,7 @@ config BR2_DL_DIR
 
 config BR2_HOST_DIR
 	string "Host dir"
-	default "$(BASE_DIR)/host"
+	default "\$(BASE_DIR)/host"
 	help
 	  Directory to store all the binary files that are built for the
 	  host. This includes the cross compilation toolchain when
@@ -709,7 +709,7 @@ endchoice
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
-	default "$(CONFIG_DIR)/local.mk"
+	default "\$(CONFIG_DIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains
 	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR, which
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

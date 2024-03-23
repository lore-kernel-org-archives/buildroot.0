Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC343C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 16:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90AB482784;
	Sat, 23 Mar 2024 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDyILGz0FkhY; Sat, 23 Mar 2024 16:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE510827DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE510827DE;
	Sat, 23 Mar 2024 16:01:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9E731BF84C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 16:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7B2C827DE
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 16:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSztERXs6QbD for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 16:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CD8882784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD8882784
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CD8882784
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 16:01:38 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6ea9a60f7f5so319914b3a.3
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 09:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711209697; x=1711814497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccPTG5/ZzqzOC/uDBLeqXD1F8p6Yw5hmQPzL+1yAGys=;
 b=NKKxQ6m6aFonDrQvODT5wn9aRBU1ofqy2Yzb1Va3b1+Z7pf+hs0anQsAepPil1rquU
 67cvcsbtG7ojU7KDU2uTal9RfCN+WupiqoKxd/qOQ9O52ip35NfltivgnWbFUK9znNWf
 hbqQ0yZ1ecTDHTau8g3OvFFJhFe38GeYl22awjZGRovFkOcFgKai82i+pQupF3SEoVYf
 KCdgP3w1HJ5GwUDkNcgUKd0AVARG2/uomNz2KPXGvT+pRr8EcYqSjjCYPmBAXRL9iIzN
 SgARjHFos+hTrlNC6pCiAGrdAHbbjvreZLTt+y4pOhB54l01rVxc9HEBg6KQJ6lO9Hz9
 gCIw==
X-Gm-Message-State: AOJu0YydzBpMoVmzmkLfNShVquduwiO+Sl3q5C/cumoOFq41l/sg/3CG
 GRD1X4ah5hDJkDckxXA2N53lemfyhMsPxXdSno7uALV/l8kYl4CEiO1lDLES
X-Google-Smtp-Source: AGHT+IFT0n/wm7RdeWDbwoS3m22kgtToOH9l+1SnLrnEhBJvjzSuelM9R5G2pFpyrsuHsTaYxfyQcw==
X-Received: by 2002:a05:6a21:7884:b0:1a3:3064:9931 with SMTP id
 bf4-20020a056a21788400b001a330649931mr2886112pzc.3.1711209697350; 
 Sat, 23 Mar 2024 09:01:37 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 s7-20020a625e07000000b006e6854d45afsm1637159pfb.97.2024.03.23.09.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 09:01:36 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 00:01:18 +0800
Message-Id: <20240323160120.1276293-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711209697; x=1711814497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ccPTG5/ZzqzOC/uDBLeqXD1F8p6Yw5hmQPzL+1yAGys=;
 b=goxfQ/ZcH3kQUCbe4p4ls/pPuyu7mIZyz6cU3pSvoS6TK6jYdrq1Cx826+kh2EWxYX
 zKlCpkla4PtfUzep1lF2ljwHY1CdUi1zv/1Pko6Di+I+Sa8eH8lnedEM1E8jHTfVSGKD
 UnUGYMnpe8zRi3HcYAfL6Td5DwfCUXvrBOweTShgRyCyFatLAiziWzGflKirv2AGZY3J
 wO4gf2e6/id7lQLAJFCrutMS9lKPNkCIehveo+iEeQNWzeyBSsMHGny5EydL0Ef/77Qv
 wS7ZQ7a8MuwbuC3SiCxAYOpIzs5m2l70PwhTcgM589RMH/0dma+spSczAxt8L6TrmfOy
 uCdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=goxfQ/Zc
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic: remove trailing slash
 in the package-specific PKGDIR variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 577a148c1e..f9cb8722b8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -489,7 +489,7 @@ PACKAGES_ALL += $(1)
 $(2)_TYPE                       =  $(4)
 $(2)_NAME			=  $(1)
 $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
-$(2)_PKGDIR			=  $(pkgdir)
+$(2)_PKGDIR			=  $$(patsubst %/,%,$(pkgdir))
 
 # Keep the package version that may contain forward slashes in the _DL_VERSION
 # variable, then replace all forward slashes ('/') by underscores ('_') to
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

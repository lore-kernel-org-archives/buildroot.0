Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C41D41D56
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 05:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFB780FA8;
	Tue, 12 Nov 2024 05:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUrU_K-9X8rF; Tue, 12 Nov 2024 05:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4110880FDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4110880FDD;
	Tue, 12 Nov 2024 05:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF64D8F
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 05:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB80C80FDD
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 05:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3Cibl3536rJ for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 05:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B87C280FA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B87C280FA8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B87C280FA8
 for <buildroot@busybox.net>; Tue, 12 Nov 2024 05:47:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso66397505e9.0
 for <buildroot@busybox.net>; Mon, 11 Nov 2024 21:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731390429; x=1731995229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YbSW64X22qR2uOPkgBUi5gEu67H6YT8zem9kg2yDyFg=;
 b=d6l5nHRfys2dfTkMPqROFRJAbJ3Crfiw2vAmVPWaazFC7aLqrINTeuycifxdY37gWZ
 fLZUV/w1RfQ0KW59uO/uEdFojAio+5puwrUDpFb2Lxu55+6+0k891tymmLA6JbrPZqcB
 j/r+AtSpNci7NQyw3+8T4GwwIkaA3atGRIHw60d4Avswgzt05Q0wBG9LDhzv+Bu3YI1w
 +1DnJRCxc8NKhqLhxKoDh+uMmfJ4XuLZD7ei0861XvFzzcb9smZX2+PnJKRhDnjSVEij
 d6M2/vKidrizuZNpIZG/zCwTFRVis5CpmqULYaLQQqViE0936jDKWkC+kyBDYac392FG
 druA==
X-Gm-Message-State: AOJu0YxOVwZneqYfkgAvpdQUGvF6+6ssaSeMmicR3DQQseYUap4m3j5p
 XPOltr1FB+Js321qXQQm1Pl8/Y5nMoyknYOCPr1rLv5bY68wb+ZcMItLMhhvEYpGePYt3VnLxC2
 hAw==
X-Google-Smtp-Source: AGHT+IGCJ80LeP0CY95KC+jOl3M+zHBwEK5uoZszpFOCKySJ+xSgYkvNNFKnwFtuodx3BpthfKA+Dw==
X-Received: by 2002:a05:600c:3586:b0:42f:8229:a09e with SMTP id
 5b1f17b1804b1-432b751ef96mr159908825e9.29.1731390428637; 
 Mon, 11 Nov 2024 21:47:08 -0800 (PST)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6c037bsm228852605e9.22.2024.11.11.21.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 21:47:07 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Nov 2024 06:46:59 +0100
Message-ID: <20241112054700.1698687-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1731390429; x=1731995229; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YbSW64X22qR2uOPkgBUi5gEu67H6YT8zem9kg2yDyFg=;
 b=ZYnaOJT4ixZG5ruISBM9pp0P1jgYqeakE+aLvmLr4XXu5GFX9ylGP8KojNRlQbarXJ
 jUEtK93VnQmAut0KGe7u/mnlmQnVqZGAlNSW9BMiJfTj+jC2wImx7N2Iont5tfSb019q
 MrDfcFqKArCI2Pa+z0SesR4njiN14Sk+WYkW0G4uULLqa8BgvZbfXP0dNtpkKwgIptlT
 vDM2d+dQzOO813aHMXeP92gYkn0S6cu1TX3/4N5E9IgGJen6/SmGpg1vVLiiPsHUfwG9
 nl2B3/cNWyMcTp+aHOdpr/kIqUqm+m4miVb/KjphoIe/90VmSHMRXbeR4KNQGNMQgUkh
 Sh3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=ZYnaOJT4
Subject: [Buildroot] [PATCH] package/expat: security bump to version 2.6.4
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

fix CVE-2024-50602

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/expat/expat.hash | 2 +-
 package/expat/expat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index e40b250ba..b0273c73e 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  274db254a6979bde5aad404763a704956940e465843f2a9bd9ed7af22e2c0efc  expat-2.6.3.tar.xz
+sha256  a695629dae047055b37d50a0ff4776d1d45d0a4c842cf4ccee158441f55ff7ee  expat-2.6.4.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index f5c6175f2..24cfa0a9d 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.6.3
+EXPAT_VERSION = 2.6.4
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

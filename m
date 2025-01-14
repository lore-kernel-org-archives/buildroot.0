Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF36E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 09:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71DA460611;
	Tue, 14 Jan 2025 09:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLxSTz339eYi; Tue, 14 Jan 2025 09:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F001606E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F001606E2;
	Tue, 14 Jan 2025 09:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB12EB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 09:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D619D40AA0
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 09:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TokBI3lnIv0b for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 09:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A51440A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A51440A99
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A51440A99
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 09:15:26 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28a4fccso7610503a12.2
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 01:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736846124; x=1737450924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/IbMxMvXilwGZOOYiJmdXtT/OXH5mzbKRzTyiVGYTG4=;
 b=Q7Dn37WqZIW4HSjggvViMMc6flmg0McvkTU3cAEN11oTJa6YuazDI8bCyvCoCevC34
 u7/PCsrZ71OeRuGdz0M8xJHk9R/Dk1a9GJY4PdynxPukaoGHyCisYmSuWzd0KczIaMqE
 g09CJyTd10Q8RSaJpn0MyEKxyiVjHP+DV5QRpFxu+3SV3W+jB5NtNh1JfDf0nEAObWRL
 VbE0a0Gw9WqIGWh8SE5mJsgmausCxmm6ePfNaBF0y7CDXZu+dIlQ3hPhR0JsfhVeW7T8
 bdoIVt5RdD4NPbCN64uF9eg34fyri8EZQRKCzIW24GLNCcUScRBydkOxBdvSwQwBeSFX
 M9bA==
X-Gm-Message-State: AOJu0YwwofqWZD8LNXyiKdgQaUGzEwyFN4PBwQMPBgSMRYQYpPCs6+Rm
 1ia+eZ887YEgeUUT1voBuFsVPBG1FtAOgm6tEoMw1o1ExavGkoz1bCeHAU6tvRPpGfqbA84WadG
 I
X-Gm-Gg: ASbGncurVJUGrPi65C/XtxRwHnENJI/cakTTXQrxEn4HA7Z9Hevf2G0uCI2/5vUWIjd
 dB62QjmgV+4lqDpV5mAN91fp+Thl63BU/m4+oP4lZfDs+sO9ZDyjhj0FCJ9mr0uOiDcNEYEVpzL
 GB293Cc72Nk9GAKgh5ic19wmy42s+6QReM73ZJ23bLDmqbAGKuAg5GHq/DhGKuM+vHnOAl4LeA4
 JQFNPpE1mV1SwNcjmjSaSHPJJMh7ySWKfzmh6uXffTM5O8yV7SDb0vQuwXGF4Mc6KaMikmUfiI1
 5vARTFQQkMmcXygP2WTmfA==
X-Google-Smtp-Source: AGHT+IH6GmS761G6hotcJwopi/5ZSN+/oy5NFsOXcvzKzsasijH6eftGO7DoBQkpeL4TKa4h5RHFGg==
X-Received: by 2002:a17:907:1c2a:b0:ab3:3eea:1ccc with SMTP id
 a640c23a62f3a-ab33eea225cmr92140466b.27.1736846123842; 
 Tue, 14 Jan 2025 01:15:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90da2c8sm610691566b.62.2025.01.14.01.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 01:15:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 14 Jan 2025 10:15:20 +0100
Message-ID: <20250114091520.529839-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736846124; x=1737450924;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/IbMxMvXilwGZOOYiJmdXtT/OXH5mzbKRzTyiVGYTG4=;
 b=jcvMDb+BbrcufPKeUPFm5K2uZJUxUyQxp5HAvpcSEbvU7xbVx6qQjdjd6/rD3xWddn
 C/CWLNSOHifxhl3J/p8WXbDHdfN11p5IC4cIPg8ep/aq473JwjFpXV9yHaVRKo7MbIXl
 S48fFvqZUUuuqX5ZkTClsnQsQWp9W6Jj99IBE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jcvMDb+B
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.201
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

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.197
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.201

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 8460481e0ff0..9f978f55cc6b 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  28792a9776d1ee73f6f20f7c49a7b81dcab10311733c5becac8928145fc86170  uuu_source-uuu_1.5.191.tar.gz
+sha256  c763b87ffdf10ac5499a0c319463759caa336bc6567b56d6d0ef448590c1a76d  uuu_source-uuu_1.5.201.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 8faadc0201a1..4683cbeec183 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.191
+UUU_VERSION = 1.5.201
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3236CCD18C
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE4582253;
	Mon, 13 Oct 2025 03:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OACHe4ulczBL; Mon, 13 Oct 2025 03:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5022582242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5022582242;
	Mon, 13 Oct 2025 03:17:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A10C2A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BFEE61136
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86D0YofALSIW for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F26961135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F26961135
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F26961135
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:09 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3381f041d7fso5093376a91.0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325428; x=1760930228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJ0GMqU0RMZIMVu0CnIViNOoHiUT3CsXmHfVsx6qhfg=;
 b=klsLqdx7gr/85/2jOfvnTUVVqLM24J9Okiu8YOnsl4gry1bSeWImoYaPLjO8Lw5pUi
 ebQ99gKM3L5eEnEOAuGerao+gb4BTSX9SdTK4xv0IsaYozd0YrgDqoboF662JHh24Y8w
 mczmRqr9EMcs4QEsDteiWkUhjWXH+rmkzwWNFpluZEdfBctJUN3z1LJZponKwPdRP2ON
 /OH7+G9cstUjDUbfWHXfNnU99nAsOXQ4uNWbNfz0fJPMxToKFjZfwZHsYGd529MJK8WP
 QcbHKBJot1eXCUTt2azJGXD9tTl5i5oFwlupDBXBUNuzyjk28RGoIZo+U736ikttvpiK
 YRuw==
X-Gm-Message-State: AOJu0Yz3dHUXnR3dbBet1xBIPLvJ4GpfrZNWN0dAQXHIatozhmp4k0zu
 wLdhcLNaIsvQlF7nI8v/BsBv2Jmw1aKVaBW2ISK0JhvP5UGfIDfxf89KLgHMzcmx
X-Gm-Gg: ASbGnctVfNZn0FKttYQQx0/aCBR3uJjS/09yF5W1MvnBLioja3FTavqB5XNVf58fwk2
 SvbeJCM/ctPEz1th+o1vGDQnpl2CcslFOGpRw4NjwI60EXKzhMHJNOqrXBu+tZunrnIeqx+bfsO
 AvsoSPmTSDKRwSNWAx6lC5pPStafDe3LswPSSKndkpzuZDQc9VlY2/SYf/fv0OsLhhco2yPe3kA
 sor0dZ11rhNCENisOsS22T5Rpg7q0mHUjuar8/+hMpSfBi4fRhzdsbu8cYgqktODVXlUkD6edP3
 R+18aWzOlr4jbzyp0nfSoLwuxYUu7mNl13docCN5UsMt8Hm43CpglKSZJAswr2NdBVUMPhv9SKB
 sNqORP/0CesfYrNTegg1y7Xi/kqxxylTlB/3rZ3tetwrZV/p5zWDVmrZBWgjbHEClzMcSFLmOeL
 Z0U4PlqrJyn5C2VoDRTCa4jO6pb5OX1e8CHF0xW6kHKygb1jhYSqrKU07v
X-Google-Smtp-Source: AGHT+IGwNI4bFYRtQkWnGEm+xQpNDSVbEMPMjaF4S4AmWSSDGV6/Bydto5mxIZp9wGlSsmTTxDkxlA==
X-Received: by 2002:a17:90b:514e:b0:32d:a37c:4e31 with SMTP id
 98e67ed59e1d1-339edadd3bdmr32724965a91.17.1760325428274; 
 Sun, 12 Oct 2025 20:17:08 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:17:07 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:49 -0700
Message-Id: <20251013031453.566526-5-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325428; x=1760930228; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJ0GMqU0RMZIMVu0CnIViNOoHiUT3CsXmHfVsx6qhfg=;
 b=Gq4H2PRBmUsMPaxKZo2uLC52vPm+iNOyQ8vOc+OaDZ3jG/p7/eqAwyJrq0pzeHnVAZ
 1JEzmi50HI1CFnHzTUiXMUc3IQsWj9wIRTT97x38RH4Czfw9eNAOnBZyazdKfVBD9usr
 h27Bnst6jCbwHIVxl1KIKONOEirZNDbuwG7V8QCNtUuYswqj5E7drqOjtkYK/fsK/HmB
 EkUDeFY+CiYttBxNAi3Hik6BSKBx+DQjIKpq8WS2UyNz3dmu0SAmkmRnj/fctEWZSouq
 wje79lpVJXVbONG6wJUavgJRWpWCR9o4MUr0QMRf3sqnNtsiriEyU0gqKnTHfFELw0m1
 LpyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gq4H2PRB
Subject: [Buildroot] [PATCH 5/9] package/qoriq-rcw: bump to version
 lf-6.12.34-2.1.0
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
Cc: Vladimir Oltean <olteanv@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 1bdd38446d..99dd860e02 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cf1caf7f45989025f8564c5edd9c98650082ebb2d091239292d3db8d75522164  qoriq-rcw-lf-6.12.20-2.0.0.tar.gz
+sha256  5106d0e42a990b5474100cbc397d27f550bb226420664ac5a40b952706b680cd  qoriq-rcw-lf-6.12.34-2.1.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 35602e41e4..1394766b92 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.12.20-2.0.0
+QORIQ_RCW_VERSION = lf-6.12.34-2.1.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

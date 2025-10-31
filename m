Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2790BCCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 11:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2FF882C4D;
	Fri, 31 Oct 2025 11:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KO3CIsO-zCBy; Fri, 31 Oct 2025 11:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13BF1836AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BF1836AE;
	Fri, 31 Oct 2025 11:30:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58627CD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 11:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A0CA616FB
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 11:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQ8_ssOb0e-u for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 11:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63BB6616D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63BB6616D6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63BB6616D6
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 11:30:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7042e50899so310223166b.0
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 04:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761910210; x=1762515010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQcJ5pbrnu5FEZz3Mjoqh6SaNZy5z1ggtxkVGq/LN10=;
 b=CfPSMS7l9KxppmLpsnDKj1iUz69RcwhhEBZKR/4PoYNDReUvjq9dL3Sx2ticbs4UJX
 p5F+zK/7SR9x/0u6dG2KQ8m3h3vZhE51s8+0r9tp2fxSHNZ7+/U9be/P9yX/7Wlk4csq
 iK5v8NuxzDJiGFnrRYfSR8Y876K86QdcHm9d23DB7SGuqxX8g8PdkGXFhzRVjGYQ0PAm
 R0Vl7bSgwo/M4raqfGfKOrVMVM004LwJ1XpXRfYW+Bl31KycOyobzOkk2agYQfSWCrbq
 I6Ewe3n85gA3IKsLleqSlabnbb5lolQaAi04hlaFCW/ph1qksR1hP9iQQf98DcMAgann
 nMdQ==
X-Gm-Message-State: AOJu0Yyj0KrlZAOJIZQNm56gDER4npIzkygoAezDF7DkPnprE0K/CTgo
 A+DxX7Gx2Zb+WvpbLsCdLjZXLKE7dAzDehNBx3UsuS8kVSYP9pSlqQRlCE7mYtYYUlXZzmxN6Az
 4flWP
X-Gm-Gg: ASbGncuMjJBUgPAYw1NOkeJDkbZd8ay27VKUlau9SnnnoIiewZay4XchbdUfne+rn+A
 7T3P5PMBY0oirZxRDXxNopBgqlu5eqyvrhXNrbE0yUdP/PWvwZRZyu6OjEA+T57sQkpGwY8y+v+
 Hncit0mQA3mtDbxvLrj1AlXMGTtoW0MptNrkD03cXl7sqC+s7NfsmPSkStB6wcRfmNoaX7Nmgzm
 GBuz8HpbgLjvcKd0UIzlzBuPBs5KdvmS1BXOXwWXY083oiG0f/6B09Jp1H3DR+2xgOcUeZFJfPj
 DG4hMlns3j4lXmhwLsymU9gNWz2+3qcayrgmZLytqp3THCe1nxTn3qmytref1bK82K6a0tPxYsU
 TJLPzxxTT7+No2+s6sIM3jAQEqKPKLmppVE/7tMHWvTQz93f+u+6yLN6UsiJhl8RxTmPJaBzQVt
 i4YulsuXYNEzN4wtg/HXo7h+s9PEcIXjA2+yXdBiR6MV/K5s2ucAcaZJMUiH+7l4Wt
X-Google-Smtp-Source: AGHT+IGna18Do23AWFHeJ3vy21CboJ2cY1RtjVPhLbqiIwJw7R98Pj2BUdJxVGxGN44E/1mmq+fafw==
X-Received: by 2002:a17:906:7314:b0:b6d:6950:a7b7 with SMTP id
 a640c23a62f3a-b707061d8edmr310511366b.44.1761910209963; 
 Fri, 31 Oct 2025 04:30:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077c3dbeesm154608166b.44.2025.10.31.04.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 04:30:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Pedro Aguilar <paguilar@paguilar.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 31 Oct 2025 12:30:06 +0100
Message-ID: <20251031113006.2352183-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761910210; x=1762515010;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VQcJ5pbrnu5FEZz3Mjoqh6SaNZy5z1ggtxkVGq/LN10=;
 b=OYdcYMPcx0Y6txJNbBe6ltRz2BxAMRTtrUapBnSagH7Z0uMuuNC+4PRcn6RL6D5pO9
 hX7aJaL3J7KN5yE1czTxrItai5K8waIoZ16NpiCtpKdd5cA1bUdJIRMixdDG8L3HyTDe
 c+oak4Wot8692LJzYEQAtsFA3k0hF82uQjtss=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OYdcYMPc
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.10
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
https://github.com/ivmai/bdwgc/releases/tag/v8.2.10

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bdwgc/bdwgc.hash | 2 +-
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 8705c0f87be4..d38b2bb1b506 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7649020621cb26325e1fb5c8742590d92fb48ce5c259b502faf7d9fb5dabb160  gc-8.2.8.tar.gz
+sha256  832cf4f7cf676b59582ed3b1bbd90a8d0e0ddbc3b11cb3b2096c5177ce39cc47  gc-8.2.10.tar.gz
 sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index ca2fbdb1d432..0700ee7bf5cd 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.2.8
+BDWGC_VERSION = 8.2.10
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

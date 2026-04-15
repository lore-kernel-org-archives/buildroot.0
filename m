Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F27CF43832
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 15:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC3D80675;
	Wed, 15 Apr 2026 15:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIARafP2jM5A; Wed, 15 Apr 2026 15:25:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F9B806BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776266714;
	bh=kxNxfJGHueAxg44zTX8wrh+ERkULcF1w1BUqlySMxEQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ilwZdUC1bjgGKZ4DdvSCWpgR3yEDWYMNOrcCVZH1c3f2VSjxcNXYLRBTukCPIj5jU
	 z9bNc6IpYSMY2fhhu842OcODaXKLBK0m1BJoZfa6mGAwauWjVQXYow76QlqTVwKz5h
	 XEJofFJEA7lH+NJYdu8ii+oNIAnYRRprmvebY+cLsrUzF3Ew7hsALzIlG4cOVDuWcj
	 K6UooNiLDKJBGrD3NUYpCPC5KUN00diHKLTivSBSnPQUy+e0CO/gUYH+NPPCMYafzV
	 KYWZVqk6EcJe3MJFRrO+GBbfZqApNOea06RhLQ768YEiLVJFVWmJuRJgMS7yTj6tU+
	 g6/jHFw4Frctg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F9B806BD;
	Wed, 15 Apr 2026 15:25:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80351391
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 15:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71E2C60731
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 15:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcDSO2BAZFvm for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 15:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AA94606BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA94606BF
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AA94606BF
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 15:25:12 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-59dea72099eso6996464e87.0
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 08:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776266710; x=1776871510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+7lmFfvcz2l854Y6ekfJBYfOCp60aFKocelQSDwlG8=;
 b=g/jHzWm9pNfveYw691T2swqxUf9lxJqpHy4ip8vpT/MwtwPklaPf1yjaAf+FczBQnt
 ud/Z04HwMB5ify88iPkEOngM5+TfwTv43GGAQc06r/z5AOA2QzyKfz6XHOAHqRFeX3cg
 4nmC2GJe626QNEUImAlaOis3GtEnAyPNn8GJNHYzU+LIGUGlKzzItwTbV/LJwsQl2Idh
 8/QZJqwIr5sx0VAt3wvkKTz4oaKCvdEkLRiqjzAbJUBGG4UidVnjxOqhqxX/lJfwrzN5
 D5IuC/ti0da73WWA58Bd+pUd/MQTsN8BkmQ95vEzz5ixxMk8ITeF7ggPOWljl4YYhaPv
 /cTA==
X-Gm-Message-State: AOJu0Yxngy9U8tSiSkoP1mKWbrFPpyHUoM+E9k4q5AD5nqxmtFg9bL6G
 b7rwUX7oQXMMIH3cBra5IOOmKYyvqkf+3CD4pzq7gcD80uH4ML7l/9MfZwpE
X-Gm-Gg: AeBDieuCag5kulYnIk5lNmUaEnlF1ZUjdW9PQ4GB6L5f/jtLOv7gjsnjvYhQ7s6+Dtv
 TV3GdoreHRZDosfRd6+N4yesy9SVZFc5msh5xPyBqAZ0uPl13iHEehv0ev4Q2BRevMe/XgcaVHF
 1SuAW+8I+mVcluYbaNWKr64NONenL5OWfOZ/GEUUcZqLkBRhvCmKmQqRhVYzYW6+dO9JM1AHvMo
 xkypm2dLZWhe/hlY26muCeFE6YFDfkL+cmfHe3DB7762YJfw5OlQjMnEg4nRFswmMiYwb6PE6ZM
 W/6D2jNZ8RPIvtn6yMRJZBTGfet1JVABAL3QA7SouGo/V4tCD1pO8ZVRKBMlQRvt8ZGMG4VvySQ
 CGWrSALmZ1jsk+Qg5z4Vu639dbpol581JB+bftp+ascfbQyXsv/353aWHVEjRdv5/gNEfcyxcG4
 U6+6f43+KF1CCLZB0TLBJpIcde6FtSCEa/NmhDZQ==
X-Received: by 2002:a05:6512:6c7:b0:5a3:cc75:26e9 with SMTP id
 2adb3069b0e04-5a3efb38d38mr7307419e87.29.1776266709324; 
 Wed, 15 Apr 2026 08:25:09 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a40a2e7394sm551695e87.51.2026.04.15.08.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 08:25:08 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed, 15 Apr 2026 17:24:36 +0200
Message-ID: <20260415152504.484373-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776266710; x=1776871510; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o+7lmFfvcz2l854Y6ekfJBYfOCp60aFKocelQSDwlG8=;
 b=Og7Xd6GzebsvgyXjJWnYxczLgT+ite9RE/UCavZ8VrSHov7PPTq2TU51Y9e5oaQXDC
 V7ruC+OAkrbovwEaO3CMW5W+ne2irNSngQgwB+DgQzn0zjP6vmE8m9rgv8WFpqdVG86J
 qu2qXM4PhpUop+r0zkgyYbW1Kjm8N+FrlvZzJUiNwZoQgVQYfrip9tgzs+EbWVrEpWCA
 lruauwvBKt2Mq/EHq8hpSb1f0uMT6qnyFVDQodRF7yskVgBNtbgMGsNoWaPCv8CRQM92
 YvG8EICmrxU417j6XuGGX3WZN9EqNXyIsnsv8xsOXGtWsydRLxeJzUcFTMf/shKxAZ2X
 nc5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Og7Xd6Gz
Subject: [Buildroot] [PATCH 1/1] package/kibi: bump to version 0.3.3
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

Changelog: https://github.com/ilai-deutel/kibi/blob/v0.3.3/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/kibi/kibi.hash | 2 +-
 package/kibi/kibi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
index 3ab58428cd..b206b7742e 100644
--- a/package/kibi/kibi.hash
+++ b/package/kibi/kibi.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  c65ab03df3c2f1b83b41c2074032edc6c0bc7ff616ff9116cee49ee36c462521  kibi-0.3.1-cargo5.tar.gz
+sha256  1fb9203d4d45efd7e0645f5a1dbeb14604dc7817d9db35c6f2bd650053877e59  kibi-0.3.3-cargo5.tar.gz
 sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE-APACHE
diff --git a/package/kibi/kibi.mk b/package/kibi/kibi.mk
index 24f466ec30..99ac38f320 100644
--- a/package/kibi/kibi.mk
+++ b/package/kibi/kibi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KIBI_VERSION = 0.3.1
+KIBI_VERSION = 0.3.3
 KIBI_SITE = $(call github,ilai-deutel,kibi,v$(KIBI_VERSION))
 KIBI_LICENSE = MIT or Apache-2.0
 KIBI_LICENSE_FILES = LICENSE-MIT LICENSE-APACHE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

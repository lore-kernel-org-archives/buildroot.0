Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48728FD7F92
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 10:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA5B340A14;
	Fri, 27 Feb 2026 10:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWLS3JCjeGEF; Fri, 27 Feb 2026 10:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 230D040A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772189068;
	bh=5wlC51rWZT0d15oZDMEvxbz2+wBVZIdg8gLyqu8gwLM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ar8FzwiLpWBBJWcT0VJaWugMFI9/2wu8o9LYBUKILzLJmz6QpJmSPJ1gF1ariousz
	 aO+x+KVk9/fX1E8Xbw527WeTBLAdjP0uVkqw65nJGogz072gynl4mI3LUosHdxbw1Y
	 TrLcTr1WLOeOe8/CNDnzn04TS/NYDwqutOJ5B/H5mTcNXjXiFrAXDQIOabeSzppl/O
	 03n6Gqh1X+vzLM//ORfHGWfdPiZgt+2i8DWg7THgUMG6hXaROFo+LzxvOpBL3PdGQD
	 m8Yvjuqralq2yRhdYRGeH4GpvJTzG5ma+um28vVj291k+1JaPkbf/2/UJPbRPJDNAG
	 O6GDdre1LHnSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 230D040A18;
	Fri, 27 Feb 2026 10:44:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBA041F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 10:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD5AD608E2
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 10:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Igd_PuvXQbB9 for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 10:44:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA243608A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA243608A7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA243608A7
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 10:44:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so16458175e9.0
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 02:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772189063; x=1772793863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFm4BAG1h5EM/26ufQ2WPZJtxcEhIBNfbwF59aQXPrU=;
 b=qZbWKvrWObP41bGQ9Cp/RNGfSVnB5wQYc2hx028DOLn+J/Tn6KMT8gLy2QMDEw/uL9
 KRZ/XM0JQTn9bFezMSZ9pjX1R50spXPaHYk49E5apHSZ3up+NhDla5lrFEfkRJwBHuFi
 wsy888neR7CKC0ifU6bZdA0sXbwqzIVZ17Jdb1G9oBwcABlk1R5qojP3WgLfPNVVJooq
 93id4oy+NQiVNRwZBcBPkXWAXhr1Mz4RPl4lrpR18z97tdaXWOBXU1UGbmxMWA8CNg4l
 GXyJXIksO1m93YBOJMe12mzg/A0tEoLpol+6+VVaqH5Ger45Yv1mmJ20vqK7f1JECaYb
 4k4A==
X-Gm-Message-State: AOJu0YynCY+/p3cUJa+iN05XN3ps7WMPEEvEPgWQg2EbRdZ/OIbXkMdb
 1LQrQHJaE33JvA9rOvnazJ1U52ks5hQTmilFBPPsdp5gRdahpENFlkBUSXKZdPpEtk2rfRtcDEI
 0noXl
X-Gm-Gg: ATEYQzwsHSagzEtKpsbNuZ11gz/L9WJlAaOuUSALFq00W53CRHgD8SlULS6OL2GcloS
 I3VU6Yh8G0sbj/uLMIaeCi11S+DZMySkedEuRCSszy8IUUNZnFHQyTXLvvCtbp8QuCyJ1Juqf/s
 7mW5eL2PHKjCSVFDTruNEIHOdkVXGCoxz46mqwjEtRgTw2jnDIttH499k54L7xoVhREkoXW3gqK
 hGgfbnGYnHVQac8LmyJ1EkAPUsiv2ZeKIamITumEYNOoQuIGqqVFzSJJiIWy703iEGuCSySsIzj
 NrVQc6JHtTxe7cNgzVeeRXSgPlTrG42NEcOOjSLiW4/aOnRsNkeKbwQyfVHwIaD3n8NW2BPUE4C
 zuHcF0OUWjqrkNuAhso87sLwXgfdLLg26xIh5Jvwo18bTXjoyqX75ED4n4ibj4E6SFQ/b+PlU38
 iCVT4S0YzMk/A9CfFFT3wHuLUEylH5nrhleCKPC8zcfUWyKpQtVYsvYr1BnbsTTopXQ55mUjQFx
 aHjrmBTkPnZnDNSMN5/8+7WQ1n7bl1orgQvIAIJII5t++vwcC8TWSLzJosUZL3te8VgtSn5NgU+
 Bsuu39MKxxVTOVPcpUEeZvnaoIn45598
X-Received: by 2002:a05:600c:37cf:b0:477:6d96:b3c8 with SMTP id
 5b1f17b1804b1-483c9c23b6amr30435295e9.23.1772189063257; 
 Fri, 27 Feb 2026 02:44:23 -0800 (PST)
Received: from rcc-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb29715sm143978805e9.0.2026.02.27.02.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 02:44:22 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 27 Feb 2026 11:44:19 +0100
Message-ID: <20260227104419.42377-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772189063; x=1772793863;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UFm4BAG1h5EM/26ufQ2WPZJtxcEhIBNfbwF59aQXPrU=;
 b=elWTfBYOMG8iw00uMNB/ZOL84LmGoDKQOor/AevqdGKfqwpkcpd6zM5Bq0rf6cb9ma
 2lv53JVRdDq9LQXjmblHfKwlWMcqSUnyrRQFTq8bLVL6ZGOmftJtYncrdc3Htf+usz5N
 Yb+TDe25GfFPtdtKnklkKPHiSzJzO7V2WCKYE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=elWTfBYO
Subject: [Buildroot] [PATCH v1 1/1] package/cutekeyboard: bump version to
 1.6.0
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

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 5800865230..acd2017056 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0845  cutekeyboard-1.5.0.tar.gz
+sha256  5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7300  cutekeyboard-1.6.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 9a29f5df02..12a6573d52 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.5.0
+CUTEKEYBOARD_VERSION = 1.6.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

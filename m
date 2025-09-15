Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C9DCAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58E6408AF;
	Mon, 15 Sep 2025 19:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLZpBa_P8DRA; Mon, 15 Sep 2025 19:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05B5408A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F05B5408A6;
	Mon, 15 Sep 2025 19:57:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7489C22F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B00381194
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydprk4-zj7JH for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 19:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EE8F8119A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EE8F8119A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EE8F8119A
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:57:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3eb0a50a60aso1038376f8f.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 12:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757966267; x=1758571067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HyJRQZzQKTYlArxsbXikTpTjMwDwKtBNBBArS0neb74=;
 b=R+uO2o1dT/wXf7609izmvojevDYXf4W9d4zUnLY/eRVIT5xYNK5KyV3TJHBW33MRyI
 td4PtiHAviotxJ9YfU0CodbYajgfJy+jkk0oKEG+bmbq926KhnSpf+pI6H10uHYxvL3m
 ndp2+h6rFmPpY3Bi8Xab659eQMOLmDyUFMa/tfyU6ORZOe3IUkcmhjVkEhJo6O1jXgeq
 Nna+ZUcEeU3XMyywhuMNlOysHI35elqUTVtShpvXxs8TjcN/OJ5iiXhyAN3ZQUidzsJO
 BkBjFEaXx+vXmAAfvW6zDvskJs3a/nDlMZivkmGypA2bNrdUtotf0u00t3WM7buzQHoa
 XiKA==
X-Gm-Message-State: AOJu0YxAAkugCLuFX5h7UBzpm8loiIP8REgy6gpkj9FAKphFA2UwdyZk
 CP5C3FGP3yya8f/0RgLVL8Qn7EnnRc6pZWrk99lmUC9AXBFyBXtLuz7BW1FCrG45LzxEhHLzo2p
 VUgA4
X-Gm-Gg: ASbGncto8vXpJTaQW6Ecqwb5mQmz5/qxGWwU6ht61TSS/khCpESbjrctojT4Qp+O8pW
 15LCYaLqawXEkDDYcTvVGO4fygMa9OAcbwGPeOYqNekiIXmcVJ3m3Jr3w8bojNsWi7AdFU/WzQo
 FGV/OvvEK1KgDV0iMfWXqqwKBl0eYVvN6ueqUI3wxM6XbT0SQ99OEU7SYGX/K27ukokB6JE+MXw
 WCKC6DV2KVluFOa7uHy5XQ8jPyUhknuV8B7nsEZSL6cDv+2s+00BBK47i/PitV9yD8HNpPazkFn
 cB5LM2o+aPAjm+cmkRM8FfN/vF0D5MLWZIes+n7/3iVIq/dik79y37lTNzDL1vZ/JqzKXIwl9D0
 v5kNMxZ3eghEqKJF+tqdVwigZ2b9K+eeTHBb1gJhL+TSqRFhg+dtlu6AlobgISmM=
X-Google-Smtp-Source: AGHT+IHfBHoJEfd6InFRHZoLVLuBvl5bNv97C/QSv3gOwMBR0WMFA5P2fJojdY/zlbuGpUV4DceHGQ==
X-Received: by 2002:a05:6000:2313:b0:3ea:6680:8fa1 with SMTP id
 ffacd0b85a97d-3ea66809518mr5156962f8f.12.1757966266965; 
 Mon, 15 Sep 2025 12:57:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e91b2519d9sm9753289f8f.22.2025.09.15.12.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 12:57:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 15 Sep 2025 21:57:43 +0200
Message-ID: <20250915195743.1711370-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1757966267; x=1758571067;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HyJRQZzQKTYlArxsbXikTpTjMwDwKtBNBBArS0neb74=;
 b=T0y8LQxh+wO2mPdlQ7mkmLPvi64rWoJOQ22uDQ+khMGsynfTZjBANm7PvIAR9DhKJX
 /LXJzfcWaX2OVYoiDZeYO+q61Z8Vx2GSWaZAFWjw75m7dFsGgA6XlNHVqjlRfXkFPJrv
 f4+lrj3sZEndg9r5Wt48Bp1ZnQU0ZliEVvLF8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=T0y8LQxh
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.0.2
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
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 54082447598f..1da8c30d9930 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  f520a0d50bbafccd7b9e793321cd7ffed374695c2e38bbdfd428841745e04c37  armadillo-15.0.1.tar.xz
+sha256  990ab4ccb7eff1b6d70409e9aa7fa4119877ac5f5d10ba219e98460ab3e4d6eb  armadillo-15.0.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 5a125b99b34e..2efc33d52b2f 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.0.1
+ARMADILLO_VERSION = 15.0.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

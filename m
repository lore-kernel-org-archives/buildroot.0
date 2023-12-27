Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444C8C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 11:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E8960F89;
	Wed, 27 Dec 2023 11:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E8960F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id od7JqYApcCni; Wed, 27 Dec 2023 11:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC3560F95;
	Wed, 27 Dec 2023 11:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC3560F95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43EAE1BF267
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 11:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D278408F5
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 11:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D278408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3AHF0e-4Jh6c for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 11:30:51 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0881940300
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 11:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0881940300
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d2764c0f2so68322825e9.2
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 03:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703676648; x=1704281448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i8AhVDRgiHiwuu7wadEt6EZLBCYH3N6n+Jh8HIG1u/s=;
 b=IMF1QSccbDqxdavWmfltDpm+6BLUra7zxNe36cTmi1UTH5kJXRgdS/qMOFI1yO3OrN
 lVgkf9Jheyi3ztsEyGBHOpHhdckpGbm7LziZYo6vCQ5Z29+OI4cwzHp8ay/DxRd4wIxi
 ccqdjb3dLiO+RCrvrKxS2WF2WT0TK0LaoVQN4lVzNt1ePrmGUIeUty3lVU6ujAMvfP4d
 MkCDuNWtuSMVKzz3nW4CPGAWAIPbMtSekWMXsMpErY2EnJ1FS7RszOC/tUK8raoaDxn2
 msbTgUD8JMcs2qWo6kgozFVcayLdVE360/3qNHSLSIWACIBnddyvIxMSSIgaF4xE1p7m
 xJeg==
X-Gm-Message-State: AOJu0YxE1RQD7N1D0wiOpvGueWfeDpvkI9UUmrR25pTe2gmsMh+aQwww
 848nAmHR/5e8owlxSuQssfbFmDk1ptE=
X-Google-Smtp-Source: AGHT+IH1SZVSfiqcyCUfLwK0et61VdfcRWG9ALeL9PaB05S+XHyZfo7uJp5Aj+1+SNNIhvF5wGliSw==
X-Received: by 2002:a05:600c:4e8f:b0:40d:5f55:5e9 with SMTP id
 f15-20020a05600c4e8f00b0040d5f5505e9mr330211wmq.92.1703676647933; 
 Wed, 27 Dec 2023 03:30:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b0040d4329d3d9sm19807022wmq.24.2023.12.27.03.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 03:30:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 12:30:45 +0100
Message-ID: <20231227113045.1141473-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703676648; x=1704281448; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i8AhVDRgiHiwuu7wadEt6EZLBCYH3N6n+Jh8HIG1u/s=;
 b=gtXcE/v9qWLzHOK7RHgvFaJGdiHKyeZMKu6RE27Lziq3eOafKKapNiBj94ugvkGABy
 6qWoMJ4+2m+ZGiT+RAzZIkYFjfrdsnzdk71gzTpNgP0digZMpNZcw5b0Qae+RBpBHk/O
 GnnUKMSWsNKD6vV8yZCQbFY76/XwJUqe6s8WSpvmKruqyXROGDxiLsY+Yt3XO/fYciMF
 e5dQ+C4UoW7CJFNyA3uU5GptLjPqVNNrkhHCgTg24WBaC9kCJwErGUzIId/R9x42MabT
 42OS+zb3I/ix/fVvrbvb+1fN7pPC2SbymXhHuWZvlaNSmmV1y0rym6J4uYUYVKtA+s7r
 c1+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gtXcE/v9
Subject: [Buildroot] [PATCH 1/1] package/botan: add trousers optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

trousers is an optional dependency since version 1.11.26 and
https://github.com/randombit/botan/commit/1752f0d522eef9a4a703fccf702b4b026c1c1d01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 59fbc950b0..52019f36eb 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -67,6 +67,11 @@ BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_TROUSERS),y)
+BOTAN_DEPENDENCIES += trousers
+BOTAN_CONF_OPTS += --with-tpm
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 BOTAN_DEPENDENCIES += xz
 BOTAN_CONF_OPTS += --with-lzma
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

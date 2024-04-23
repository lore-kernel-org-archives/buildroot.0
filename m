Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD112C4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 06:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FCC581A65;
	Tue, 23 Apr 2024 06:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28h3vRH5RFJI; Tue, 23 Apr 2024 06:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DCA181A27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DCA181A27;
	Tue, 23 Apr 2024 06:21:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75D151BF3DC
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 06:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F8724042F
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 06:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBZzPQUzwago for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 06:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=zenichi.amano@gahojin.co.jp; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74A0540242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74A0540242
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74A0540242
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 06:21:33 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1e4c4fb6af3so35237595ad.0
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 23:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713853292; x=1714458092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkuybBXlx0Qr6btQhwCrt/6l4lDwJeZHKkbpU2sd7k0=;
 b=Wzyhiv8Mu8OguQsQT84pGgkoDiGOwJkvujqQOeCX28jtxYM7n2I4mKJ0aiN0wYG9QD
 RdUEgFZXwNEQ8m0bjwOtU3fuzVaKBKwyjnxQkqkz9FX611tQSkR1rTU8iXuDQ0sFcEEU
 Ad0zqAskK8WeVxpJnuBlH44X/CvnRdCnbp06yWxqJtu4vfnEoalfwfyCvVG8dujBZ7/M
 W+IIsDYofvCZMqqA4siilMdqsg9RPbalqa+89cPBoHOtRWQhXZil2qq0pXUC71QGjxo7
 /RCbylbeUwZfzCyHOuF8tmiKlnE7FAkPyO+WidHVgLr7KvJZ/Z8rrW1Ky09tmLCM/4EJ
 kHUA==
X-Gm-Message-State: AOJu0YyS+qvQw2cb0dfMyL8dNEB1gX3NppexDIiGRdhlmTUtE9OIzUIw
 9/jBv0x7SeoWfa45gBip4T/Ap2dvSWZsdZjdEZDOe2LBOgzVYghpGfD4u3pLndyTG3J1jhxI4VN
 J
X-Google-Smtp-Source: AGHT+IHFa1lC/p0AOMqJ98xhZ19wfNqBj9tB+fgXG59+Nfez188OJJXB9cmNRT5ydhludQ8dZIW/YQ==
X-Received: by 2002:a17:902:e54a:b0:1e4:3669:5b51 with SMTP id
 n10-20020a170902e54a00b001e436695b51mr2698564plf.7.1713853292378; 
 Mon, 22 Apr 2024 23:21:32 -0700 (PDT)
Received: from localhost.localdomain (122x221x233x223.ap122.ftth.ucom.ne.jp.
 [122.221.233.223]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170903209500b001e2086fddecsm9211811plc.139.2024.04.22.23.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 23:21:31 -0700 (PDT)
From: Zenichi Amano <zenichi.amano@gahojin.co.jp>
To: buildroot@buildroot.org
Date: Tue, 23 Apr 2024 15:20:20 +0900
Message-ID: <20240423062020.2543618-1-zenichi.amano@gahojin.co.jp>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gahojin.co.jp; s=google; t=1713853292; x=1714458092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tkuybBXlx0Qr6btQhwCrt/6l4lDwJeZHKkbpU2sd7k0=;
 b=bxUzH4HMkF5SLahr5Yy53qwEzodNPX+fDGybe1M34s+pCJ1b/TcKWACreyTofnpr/+
 KwpaYopPNyzGPvUwIt17tw/ImiFfy7jNvaKLkH8KrV2ujF/Pps9NaO9Mp/3hcTv/HCtH
 +ULIxkKPr2y1xXuHGUzEVKlot5xaIjzgYZdlPJoJZdHoMTXxPF4Zw/cBxZr58FJYO+o0
 X6gdhUcXVGBGnoZdFzABDHFvljizTtTWMir+416MNcACneAQOH09zdELsISxpWcAvQDW
 +/88C+farsPMOYzj0bYD+q9c+ZJu/zg96Wssv4tL/z1hbf8z5wU904k57QwbQT38sl0R
 vHYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gahojin.co.jp
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gahojin.co.jp header.i=@gahojin.co.jp
 header.a=rsa-sha256 header.s=google header.b=bxUzH4HM
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump version to 2.1.0
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
Cc: Zenichi Amano <zenichi.amano@gahojin.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add configuration to disable polkit if it is not available since polkit is enabled by default in 2.0.1.

https://github.com/LudovicRousseau/PCSC/releases/tag/2.1.0
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.3
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.2
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.1

Signed-off-by: Zenichi Amano <zenichi.amano@gahojin.co.jp>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index e0face9ddb..806792faee 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356  pcsc-lite-2.0.0.tar.bz2
+sha256  85cab61cc744c81e2bc432656863293b8428d0136f079e3b12a84b335b5b35aa  pcsc-lite-2.1.0.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 2b2114835e..e873c23bd0 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 2.0.0
+PCSC_LITE_VERSION = 2.1.0
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
@@ -45,6 +45,10 @@ ifeq ($(BR2_PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
+ifneq ($(BR2_PACKAGE_POLKIT),y)
+PCSC_LITE_CONF_OPTS += --disable-polkit
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PCSC_LITE_CONF_ENV += LIBS=-latomic
 endif
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

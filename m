Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DFAC46CD2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 22:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31E4440133;
	Mon, 22 Jan 2024 22:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31E4440133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqzU3YRvzXDE; Mon, 22 Jan 2024 22:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1A1740279;
	Mon, 22 Jan 2024 22:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1A1740279
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D87721BF853
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FEB4095B
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FEB4095B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkhYn72Ugbsj for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 22:19:39 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A5B940089
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 22:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5B940089
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e80046246so21895405e9.1
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 14:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705961977; x=1706566777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y8d+FHb9R1Hw2yehVeHTrB6wvGHOfLosIASBgr/vwRE=;
 b=MNYPG+LqAQFY26ZI0n5I/C3zGmjN3VTFfNaNBUsMRBK4Wdkswmp15mC2YGGAQMkNUD
 qhD9/SvvaAWFsZmi93JS1XSFB8vPm6CwMjjBcVP1chaGNbZo+4NKPmMmIMjmuqS0EnpN
 /7B0/cBjG6E7FBUCTWinj00V86fQudbqPg9fR74EERaffl0PoS+Lap+L0DQtEM7pbs9e
 IiD4eeVoMUV0CUU7NO9sJLdUSbsIesVLZfxS3coSG0GaSZtj5QrQ8I1fQJUpsxx/GNK+
 1oKSUU+0365gx47ETX1iZAbohtFgv5/Nb43kUojej3/DzNr6bINc2TdkwP5JiCkFyEqc
 3JAg==
X-Gm-Message-State: AOJu0Yze2ShY44mN1MffkJc00gohrMKhIJ2CAOU/HitvgdrRW3L4T6KS
 3eAS31qfSPIJUQaN0NRx7QYvcdG/9BaLCtErl8IC1iH/PExK6SbN86o25Z9c
X-Google-Smtp-Source: AGHT+IGVyhddbszcx6OSxEEnTBPk19jIB0mTjsIDnTQUumCxlI85mGREQSfqOA4Wf7qXi555u1KEWQ==
X-Received: by 2002:a05:600c:190a:b0:40d:8dc7:acbf with SMTP id
 j10-20020a05600c190a00b0040d8dc7acbfmr2298738wmq.43.1705961976888; 
 Mon, 22 Jan 2024 14:19:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t21-20020a05600c451500b0040e3ac9f4c8sm44154343wmo.28.2024.01.22.14.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:19:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 23:19:34 +0100
Message-ID: <20240122221934.475430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705961977; x=1706566777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y8d+FHb9R1Hw2yehVeHTrB6wvGHOfLosIASBgr/vwRE=;
 b=OX457sF35g5wd9KkcO5UYazkEjBDEx9uzduvnnULGl1dqaqZf5lKosBJEghC+lyA7g
 fSJp4PDIOwX3LOQfy1K0jx2kMZ1bPnwtZKlScitFwdK7XgsvJ0ykQ3Wj8p/v/u3WyqVW
 2/7jHDjgf5S77p/4K1PCSSCnY6SYREQXQk+LtVIOf+ABfqXV/hX0Y34jPVMqm2aJ7t0p
 680drPZgP4bkupT4A2tCDTFSXQW1Y4USNDOTHdNcKdtc+WFL7aVQdCSfRlKWOsR46Egc
 j61b+MbijP+vyb+fa8Ty8aLSQI6ylbXaunx8MLbP8x5egPXoeGDPPzKz0r3j8Ai/M7av
 xsYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OX457sF3
Subject: [Buildroot] [PATCH 1/1] package/xterm: bump to version 389
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

- Update hash of COPYING (update in year)
- This bump will fix the following musl build failure raised since bump
  to version 384 in commit 164d635f3782522c324c710b767ef21c598228c4:

./main.c:802:34: error: 'TAB3' undeclared here (not in a function); did you mean 'TAB0'?
  802 |     { -1,       XTTYMODE__tabs,  TAB3 },
      |                                  ^~~~
      |                                  TAB0

https://invisible-island.net/xterm/xterm.log.html#xterm_389

Fixes:
 - http://autobuild.buildroot.org/results/51f98577b851bdbb0a0ab93c9ef94977776c1b1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 1a2ad8fea0..e0fdcfe66e 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  31ef870740ceae020c3c4b4a9601c7f47bfd46672c1aaf2d213a565d64cbc373  xterm-384.tgz
+sha256  1cd5763d94d9370fed10d804e831a089b2ace0e7a74b6f56ef5a16a766bde7be  xterm-389.tgz
 # Locally calculated
-sha256  98d02d0b7f7b8aabb742b05e6960caaa9ae20e26d2f0d0dc57808362f2ac79bc  COPYING
+sha256  e38de4a0780954b5a7e69b5fa6c571daa8a1bfbacb4f2c5b2f07099e1a1d7c93  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 2fc2f734c8..c2c97dd318 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 384
+XTERM_VERSION = 389
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

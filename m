Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAA7C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 16:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950CA80E57;
	Sun,  3 Aug 2025 16:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-X4PL6jrT5C; Sun,  3 Aug 2025 16:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F95680E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F95680E4C;
	Sun,  3 Aug 2025 16:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BF4A233
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 16:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52DC580E4C
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 16:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TCWlSmRR9Jx for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 16:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32A0A80578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A0A80578
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32A0A80578
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 16:47:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45994a72356so5316105e9.0
 for <buildroot@buildroot.org>; Sun, 03 Aug 2025 09:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754239629; x=1754844429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wg52h3ahmLqYoC+62mhVstyRaUHtoW/QiOke6fe35PU=;
 b=q6joME2xEP9GT5Skqo7kcL1JC6UX86FGd8XcA58VMpKLcs7mmxCFkqZA6gZvYs8g/z
 wii80DqqEYDDgLznAa19a+0rh8z1Jsdvrd9m9juqYPKw8A//jfmJbIdOjGdXVaGiH2BS
 oKkFfry1pHt/6bxrQUiKEJmpwvrRCugUHfozvhv8nb+nNlVHokadrpE573z4yYpStApN
 VT21MYCtN8iwqV7W9ClrO3LxTJreMrt/2fD4ArYq/csHjLNJIEZ6zq5wosVtYuKX7PYR
 yLWIi0qoUPsisFD5Fj2PEp/ckgjK08eXVZE3da+uwJNUocAWCeuYS5Drr5YGrkQlm4js
 5OlA==
X-Gm-Message-State: AOJu0YyQ2lKi8Q18/3ZBSvUF+7Il0/K6yr2VH/3kU/3XxmMGRB21m1zi
 Ujp2OchAjPJKrRj9HGmCfAqdoPF/V/swZ50qEEsxtOrpuEbSh8QbGUtDjhm90A==
X-Gm-Gg: ASbGncubZzSq29gv69lyakY952zDDfpRrnh4FFfw9RXXFbRUMzjvfI+lYLiNHvXB3kF
 MP/3FAteNS+nw8vtz59/NgeOYLyANgMqrrPpjdEz/5zlp0COqCNoxjWfgYWPemHfdAPI4zZ9vjc
 Jj4sfseZbZVew50aZgbbqaqF5IH7JRyj0szfavM2TTT53m31q7unhE+hxAM21KOmE8mWHWVnn9F
 CtKqAjD2lB2cHOM9nZZZ83OFejpOXYvSXAgOwbcNsZ/zxAPvn8CuG45JXKnoBRU1M3g/Lo6kbYn
 1n8h8CpKzvjvMH4AeAZZTqFswPsCeB/T9i37nRHOIFDBRpU06hI1MDVgMUgTGFMSxjSwZkL93dg
 4+HX5gQJRa8Body0FBT3pcotcjE/No0/fjksoDG6Y7KPL6sxAu3Eiht1w7w==
X-Google-Smtp-Source: AGHT+IHLWIdpfdSF4+/YKFKmQRzIe7Z96zS2mnPvk24O6eWsLSITslKvfVuqm9F2oL3t8z84lUCntw==
X-Received: by 2002:a05:600c:6304:b0:456:2139:456a with SMTP id
 5b1f17b1804b1-458b5f25142mr57264115e9.15.1754239628511; 
 Sun, 03 Aug 2025 09:47:08 -0700 (PDT)
Received: from localhost.localdomain ([91.243.185.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edf5683sm139394295e9.7.2025.08.03.09.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 09:47:08 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  3 Aug 2025 18:47:01 +0200
Message-Id: <20250803164701.225241-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754239629; x=1754844429; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wg52h3ahmLqYoC+62mhVstyRaUHtoW/QiOke6fe35PU=;
 b=HgbMdhiQ2ojRrZsmhngVkJcw4nOQZ1ZM09JcyAEWfGztvusECbNEBiBHGjq3sE5x1M
 HB5zr/cuadh3tD285++57xYnWVbiLDQJ7R7G+g4/wcjz5lxFhuEqakjxW0Mo+oyNRFhr
 qDBM6iBIXobDXTyXyKEo2+P1djwV6DxJpo6jVT43EqJbOQY9Fp5aOWoVpdzslVsckENB
 G1LhtUlSXZintZn83kFO5CmKwChPpMRxfXwPUDzytasQ7/mPLTK2etcodhVLXo0oxwEC
 qOgeE35V4DLxxHP0+XtaBw6i4xIq6F2B/cuc9HzF3Psy2YC9d7OCA2VU2akLiG8STInI
 QnDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HgbMdhiQ
Subject: [Buildroot] [PATCH] package/sshguard: bump to version 2.5.1
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

Changelog:
https://bitbucket.org/sshguard/sshguard/src/master/CHANGELOG.rst

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index d018428d19..81d79e3034 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.3/sshguard-2.4.3.sha256
-sha256  64029deff6de90fdeefb1f497d414f0e4045076693a91da1a70eb7595e97efeb  sshguard-2.4.3.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.5.1/sshguard-2.5.1.sha256
+sha256  997a1e0ec2b2165b4757c42f8948162eb534183946af52efc406885d97cb89fc  sshguard-2.5.1.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 97cbbb2bdd..4aa152bbfc 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.4.3
+SSHGUARD_VERSION = 2.5.1
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

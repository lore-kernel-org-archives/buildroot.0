Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFAAC5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 07:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 872AC605F1;
	Thu,  5 Jun 2025 07:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lNWdwjfYi8b; Thu,  5 Jun 2025 07:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 248CF60842
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248CF60842;
	Thu,  5 Jun 2025 07:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FCE6DA
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03949400BE
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4XvJJEs67Mm for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 07:41:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 479F540073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 479F540073
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 479F540073
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:41:14 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-311d5fdf1f0so594096a91.1
 for <buildroot@buildroot.org>; Thu, 05 Jun 2025 00:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749109272; x=1749714072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EVgurt0WNzTlyRGjoACYjmx9V/wAFMXvm+b0IWfHukg=;
 b=futCyM6Rn2cqJYs5akMJORSL29QH2/AIM0BNLu96izVv+w8fZATjXxglX57PtQS/qV
 Rfl8m7PT4TSlDV3NdvUB0I2fOaGr/7UDOI+MuQXmlBYxXBe5SA9LXkqPtPY/v8iW2uR1
 Pr8NBbgvBgZKPS/uLjqOodaa/OcHY2hFMC4Lj6mG5ybAMyvZOQyTtsc/bEIPgPhHLlcz
 ShKtLXHGOiKauECywrOR7OlZ0M2Icau4O9Eod6/6toyWZsc0wstLq0eBhnQbT6lPcZQw
 tU3lCLXcfHuk4CTEJujQrHr1za15kEqAbPguxPc8fux7OujKEdXYW7tVfmNXq/BUPqXA
 TSKA==
X-Gm-Message-State: AOJu0YxUp7xQxugjr+LFiESE4JW5XeIDndxuTvahZCFyf7HSL8t3Z21q
 rPEjkVrBJGHr549FojJt1Kmsi51t/DQoBIGnmq5bQ9oq7nXR+mAJO30v2WQh0VuU
X-Gm-Gg: ASbGncunlEONL34OXXarnSgNcAbYD5OPyzqnNV+j6wPdNIxqiANTVzJQB6UBO1gNHDU
 mIP4aZ88HYtky1nA8+6ZNxkjFxrAWEl8pMMFrB67uY+Cm5EBTUnL3MXOBSgGWV7yYHhIQujzrtg
 jNViCKnf56w532PltidjQ4uslIkn0XD22fkdich1KRzb2BYPesDIuNsTMqbrW1O/c5XpkrpsfcG
 UjjqGgiPRANCzeVItA9Lq7/0V5cNE6ogdYoCwUEe63gZnJ81o0DJ+oS62IzzLVpSP6EEpUWg4wU
 H0FjQO02sEoMGQY6QuejD016iPLOtP3GnYtTivnWIJr1CI0tBzS+mMG3hUdFPLmuNyWoKEZljep
 t9wLOaliyDAOFCyjPwe12LsOEGSTUgav5BZ2sznGPHvW2O5lh
X-Google-Smtp-Source: AGHT+IGmOW8SYEWbvrpaC23euH8FMQXYVGkwn5OsTn/cZTe/Stwgx1kf65jzx1kITMSbPTd6Rm7Ncg==
X-Received: by 2002:a17:90b:3c91:b0:311:abba:53c9 with SMTP id
 98e67ed59e1d1-3130ccaf0afmr9344983a91.7.1749109272488; 
 Thu, 05 Jun 2025 00:41:12 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132c098606sm900654a91.30.2025.06.05.00.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 00:41:11 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jun 2025 00:41:08 -0700
Message-Id: <20250605074108.209337-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749109272; x=1749714072; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EVgurt0WNzTlyRGjoACYjmx9V/wAFMXvm+b0IWfHukg=;
 b=Qk+Z6SSiJAw4hSOctf/JsfbEWuusGd/LhMCK0TgbN/AonRWDup6SfdJwZAuRsjuxbE
 1KRZo4VkhgDsDu89dXqZTgx/BEJUQrlKhqhqoO6XuW5gMKkpRZ7vixSGApE4A8bucVIY
 3AGwV1ui+mDt0SDH5c4Dig+2Q1cR1iHo43gyGoAK9ckhEpUZdtvx0gi/p/6hxe4p2TcZ
 0d+XndUvn2cuOQODBsTMpq+8xvPaq+4VV43pQNUOTUX4Kk/3b18CspxMZuKMm55HwmAy
 lDLoPyiBNv8FJzMs5fX2JPEm65Dya8NWKE3m3Zll7AnS6bWw/YMCY5imrAbXNJf8wgHE
 b0vQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qk+Z6SSi
Subject: [Buildroot] [PATCH 1/1] package/jq: security bump to version 1.8.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/jqlang/jq/releases/tag/jq-1.8.0

Fixes the following security issues:
- CVE-2024-23337: Fix signed integer overflow in jvp_array_write and jvp_object_rehash.
- CVE-2024-53427: Reject NaN with payload while parsing JSON.
- CVE-2025-48060: Fix heap buffer overflow in jv_string_vfmt.
- Fix use of uninitialized value in check_literal.
- Fix segmentation fault on strftime/1, strflocaltime/1.
- Fix unhandled overflow in @base64d.

COPYING hash changed due to the following commit.
https://github.com/jqlang/jq/commit/9afc450930b19ca179e6ef4e744853a94a7b72cf

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/jq/jq.hash | 4 ++--
 package/jq/jq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index d4d8656ea0..344f73d463 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2  jq-1.7.1.tar.gz
-sha256  10e974638a41fadfd72357f2f3a4325e20b856c563365128f72feaa406f8c92d  COPYING
+sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
+sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index ba27e22f7f..f3f4704f37 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.7.1
+JQ_VERSION = 1.8.0
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

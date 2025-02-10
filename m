Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D833C0219B
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 02:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B5F811C5;
	Mon, 10 Feb 2025 02:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnEHw3WhKVhc; Mon, 10 Feb 2025 02:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F46181E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F46181E17;
	Mon, 10 Feb 2025 02:27:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABEF2C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 02:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AC52410DF
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 02:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSc8ko1HqxOF for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 02:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53314410DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53314410DE
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53314410DE
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 02:27:15 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e545c1e8a15so3322853276.1
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 18:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739154434; x=1739759234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EOXcK8eJB1mMFDSxSYMTDPH+pukbaOHlrEZysXn2huc=;
 b=o4/Rt7HwGxdnQw/FAvxNWJMm2dezrdmLn+4esHPJNVZWsY0DdMYAMiZyYC9+7fkukN
 qgiUts5UQrT06LZyyDN1baadmc47m28jneTKqgV2PA+osrrOaGgsh2Mp0bY/GCWTSg8H
 F3kZAYuVDwZupzuULowXBC0t3AN68PPKma7/v7Fn5wOOAHAi1uvT1usk51tUTVviI0OE
 +JENIpGtWjrlrZIjH0u38RYXB+PxSBLRmx+uSkqjGBxGP8xQgGNbnKnJ21CjgN/bwhWD
 hGydgzij2LdoSxSjsXMTbyfMIla7jn5hEeLCpSWrcFKGMhj3u/YkMVBI9IN6lrq1yOPt
 4uEw==
X-Gm-Message-State: AOJu0YxEu5je+UAlKrv6oEVvjlZn+v6rIzu9SVASsWfTUy3a5I1q5Dgp
 IAf77hiJp9jv6wLFqPOb1N+u0Ox/lown5p+cM3U8omfrX0HkUfkyk+lLXQ==
X-Gm-Gg: ASbGncu0Vdfox6X2VHY+Y4rtXigPNDPFMxtCYv0+1QTav6cQB/PzmeW13y5vxRU/MHl
 1hoOvRdlxwJC425CwM56PguJnAJVM6Ln71gjOP1bphCxADMvZxyG/b7lor+hjz8KOhDBnFdPSmt
 WIUYonEMUCWtaOSscidpCU+FOsK3nH1Tw1lnAe0tTrxBpsEJIaecgFOU4bPU4mLmNsG3cPMLMSl
 nABvnjbrqmnLSCwXa+P1uZyMYSju3HbkXD/CDxPExufrJ27DAVN+HhrD1PecsHrRy1nkPrC4kBg
 Et4L7NMzBJyG
X-Google-Smtp-Source: AGHT+IEElFh6ShS6XjHK6N+gMHAsw7v+5TDk0jO8LYrrTBJQps/OvWGzp4fTD27nEsRWKMhOA6Yb6w==
X-Received: by 2002:a05:6902:2513:b0:e5b:453f:390b with SMTP id
 3f1490d57ef6-e5b461c3443mr9849367276.21.1739154433741; 
 Sun, 09 Feb 2025 18:27:13 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e5b3a1f0294sm2234407276.1.2025.02.09.18.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 18:27:12 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 10 Feb 2025 10:26:38 +0800
Message-ID: <20250210022648.1634973-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739154434; x=1739759234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EOXcK8eJB1mMFDSxSYMTDPH+pukbaOHlrEZysXn2huc=;
 b=BmZTSv8j8qsM8DW+R3kT8e/XPNw1ITVqmD8ibBksRGl8IQMhDX+vaZTokxw9J5DZ1+
 JKvmLN4QqlYiMay48VQYdtsxaaMdco0R2ThAddb8I1YCN/71M57+HzKD71TZ3R3EFIm/
 LXSrHemNbq+P3+YBdRGciLR4a8RPEHIoyvmGgLFxFKIEimVgxAQKkVKlse0gFAw3BJKx
 a6saqWDfc2I1VU+ZgeRmp4L/VVXLjcxjBR4DDr59vxRYju5S1l04FpGlFwmMWxpBVie/
 WFPy7WCX+Qy2JlkAWMdPpR+VLJ/q0lw78HCqt59gpFjQULhTyX2MasBENL61PvglMraf
 Jq3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BmZTSv8j
Subject: [Buildroot] [PATCH] package/sqlite: bump version to 3.49.0
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

Release notes: https://www.sqlite.org/releaselog/3_49_0.html

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 5b933fba8f..ddec2637b8 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5  sqlite-autoconf-3480000.tar.gz
+sha256  4d8bfa0b55e36951f6e5a9fb8c99f3b58990ab785c57b4f84f37d163a0672759  sqlite-autoconf-3490000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c8f12a427a..a23f6e1d66 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.48.0
-SQLITE_TAR_VERSION = 3480000
+SQLITE_VERSION = 3.49.0
+SQLITE_TAR_VERSION = 3490000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

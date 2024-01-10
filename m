Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FD4C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A681540143;
	Wed, 10 Jan 2024 22:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A681540143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRkRUDY7WQTY; Wed, 10 Jan 2024 22:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B009843715;
	Wed, 10 Jan 2024 22:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B009843715
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 021271BF94D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAD1741570
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD1741570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J47pVpNX7Ceo for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:02:40 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A844C4138D
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A844C4138D
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so4944655e9.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 14:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704924158; x=1705528958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P642HRinvpJxTZy260xsHIfhubuBIyXhQVDTb1YvWlg=;
 b=e3lEV58dgMRYGj8NO23LZM74T8mmpHUQJ8l8H4MHUrTT6PHrOIZlsqvQTCNpi5s5MF
 3fqmq06WlnDu6iUaJOfmRy5kxeWIpnYVYoHzKnFDlRRMOSkg/HURshw3wxE8FyINQgCM
 e3JGwELhyMO1LB1w/IUeAe1MxNY69fesQEXmXcD8UI1ESgyGkLQMx+MsQP+5YyGtyGFr
 iT8MG/AjDvoqPt8yncA0UAJ1WVPxF8fo8Feok9UtXETqcgDdw91ty2KGO4YSHH+CDZ7Q
 odx50t3Y9lNTjNeEl14li1QOgRzmWm+cHzta3FDnVonOA+/DC90VHV6V5wC5hFZoZpwA
 RWlg==
X-Gm-Message-State: AOJu0YxvLAw26mxn2VirdLAmTBpsVTfWlQH9FVszeKqADmoMnOEZ5JdJ
 evHvAMqD2hiQbSkquD1DHdzbYOwCeeI=
X-Google-Smtp-Source: AGHT+IGTNzohNK4wmSHSUbrcTuQpsj7OgJrKPJFHcYUbHgsWORs2ZyFyJZUV+RakizlHS/gD6fZ2DQ==
X-Received: by 2002:a05:600c:6a82:b0:40e:577b:d744 with SMTP id
 jl2-20020a05600c6a8200b0040e577bd744mr47062wmb.146.1704924157661; 
 Wed, 10 Jan 2024 14:02:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 az10-20020a05600c600a00b0040d772030c2sm3548250wmb.44.2024.01.10.14.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 14:02:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:02:32 +0100
Message-ID: <20240110220232.1269657-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704924158; x=1705528958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P642HRinvpJxTZy260xsHIfhubuBIyXhQVDTb1YvWlg=;
 b=DRY2y9OUWOTHJc7xJhU3lt51Rdr7Ym8adoWgwe2GB7vxSZgN1HGczGMoPMH2NeHojP
 mEpLpEjMakaO27+VUalBvPh+FR3fJfHmknqffuI30h6gY4ewXIi8D60e+jKBscRMff5w
 iqnHwsC3ylYaKBe4UpY7ukr8RjYPJqmmTWWEZtYXecXePr9Q49FKb7CMoQC09SzBzsXU
 wa74/oVJ6RnQEm9/kftrDPiURvmsgBOwm6tIgYza5sn/kit88rHAbuuc1aLmJJETsy8v
 4i/C/U30VWW2ZUzWpRC8EUBcyxgkdt4RfxzMSHocoPEOZp7MRoR/lA6jrLbfmhzWsOph
 iFHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DRY2y9OU
Subject: [Buildroot] [PATCH 1/1] package/libuev: security bump to version
 2.4.1
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix #27: possible buffer overrun in uev_run()
- Update hash of LICENSE file (update in year with
  https://github.com/troglobit/libuev/commit/0f5909615439d2a3d6a9b44f5a7570e071b90448)

https://github.com/troglobit/libuev/blob/v2.4.1/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuev/libuev.hash | 6 +++---
 package/libuev/libuev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
index e5c9660a02..1b5a9fa721 100644
--- a/package/libuev/libuev.hash
+++ b/package/libuev/libuev.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/libuev/releases/download/v2.4.0/libuev-2.4.0.tar.xz.sha256
-sha256  31f1aa4f492ba4f6a5dd6b19968ae6a732968dc05cae6575930560b6cee1f5ef  libuev-2.4.0.tar.xz
+# From https://github.com/troglobit/libuev/releases/download/v2.4.1/libuev-2.4.1.tar.xz.sha256
+sha256  1d171c572ca48ddd6763f76c54e77d021d4ca7beb007610f7c1fec903511977b  libuev-2.4.1.tar.xz
 # License files
-sha256  694a734d9c1b46ae203314ed1c744a1acebd4fe5fc964b761703772546f0d3ab  LICENSE
+sha256  387d0d8e2aabf187751c8f1ebb9a4abaecaa7e0e05fead27f408193a0f0f17dd  LICENSE
diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
index a32381dcc5..432c362401 100644
--- a/package/libuev/libuev.mk
+++ b/package/libuev/libuev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUEV_VERSION = 2.4.0
+LIBUEV_VERSION = 2.4.1
 LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
 LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
 LIBUEV_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

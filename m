Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5882EC87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 02:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A2160DEA;
	Sat, 26 Jul 2025 02:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sroMqxIFP9N; Sat, 26 Jul 2025 02:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C8260ACB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C8260ACB;
	Sat, 26 Jul 2025 02:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 462ACDA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 02:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 381BF60ACB
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 02:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd2HtJ5_U047 for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 02:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7F916067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F916067E
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7F916067E
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 02:56:06 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-23649faf69fso24899375ad.0
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 19:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753498565; x=1754103365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GatHlkgBXh6U43gVfPSMDVzBDjPeFiXoD/BjMMnZv40=;
 b=rQuFbLILDkX2GdfMnfea3+g4oas1WG25TKXuaNpbtK8ZIJN4k2epRw2jT3hms6I5KQ
 KifDtQgBI1UVdFKWSW/pIobVPG9KjFCJzCts7rGPxmvq4eQJfWYIN7J6/BMz+FabJG3r
 1dFUCjaY78DkNpn6rdKcugLUw+aS9da4H5LLeukBlm/ts7vvQF6KyMSblUOm5L6MP19X
 HI8Fn2ppqu/cKBIofH8Qg+JVzxMeok/0WrrU0XKM2NlzqRkOmIkMOoqzvAPVaMWA2uk1
 XbTThKxRHhiedvoFkQEsJM7fTSj3I3vCyqVRAP6+GMFygnwK/J33aFL1sIsZnNz76WDO
 9ugg==
X-Gm-Message-State: AOJu0YwcBe/W5tDxoXH0ss/JcYwjc7dhl/fRQpah9i2VwISUmIgN5Tvj
 NAe2Q512g+qoxxGuZhSOqdX+fZyhBh3tViSGirb4zwo9CXiYQEggJAi/zumX7Q==
X-Gm-Gg: ASbGncvsxWOqBVr2/Comnes2amX2ESn0iScNMvxs0wQdR3f7F6MCFCvJneb9gqXnrQJ
 Y2gBHYMNgdbjVksO6SaxGdlvdZnD6WIBiMp+d4eOy1qDJShl3M/5h5PSAz1sDsESD7Kr/ltrMTd
 jDw1L3FLIHZ3IO6aZZNMLzLcwQ/N5fDHGVNvHgA5pm+TfmYg+ZYOw3CQN2/rNiAf1Y39iiJudaE
 Xm8wHoXh6tNF4e4YlbGN2KmA1oKnPro0OFYZk2/UbRmWp1suyerGTBHR5OjRF9DZdIl89YRuwnU
 VPESALeQtBo87ujDeIbeFyntadN3E9lgvEaly167vPRq7m/OxO3Is7NPPquRJsOb4nm+CQQmJS5
 upP5VUFQG6CaFhZ014Pd2qfOoyhpI4Q==
X-Google-Smtp-Source: AGHT+IFaJs4dBmVsrN2R2G735rLv1R6+257wwkwUo1zlYA5ZQ/Ql7luMd7EnNO0SdxTdrRnN1QItuA==
X-Received: by 2002:a17:902:e547:b0:23e:317a:abc6 with SMTP id
 d9443c01a7336-23fb3178d01mr61947835ad.47.1753498565198; 
 Fri, 25 Jul 2025 19:56:05 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe5373f9sm7227475ad.173.2025.07.25.19.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 19:56:04 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Will Newton <will.newton@gmail.com>
Date: Sat, 26 Jul 2025 10:55:55 +0800
Message-ID: <20250726025558.161102-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753498565; x=1754103365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GatHlkgBXh6U43gVfPSMDVzBDjPeFiXoD/BjMMnZv40=;
 b=N1cXBIqY4DlwYxPM+uBWmQt/k1vKNyYSnemZafUw433G/jzbMiDJHvac8ulUkxVb0z
 2KpdilNApaBeJqjysjeppa4a2tOUajJ9l1m51EyAYP3ivAwmc4zHA+HN1Blf7k/jI7+n
 j4MEkteJofAoSPWhJ4WZt3who9JDDG5SsXFhSqgZi/BjiMcI4Sj4N+OsWYVh1jCr5NMi
 UkvLNlyIv7nlPxfGXlxAV0FwbU6qpQZDxfz0iwbnDVELsdFd2OeINjMULMXkJSgI29P3
 V1QddHWtVG5wqXGWDdiyVBx0nBhuPtx6+CNg7PlMhPaJ/zWuXsRUSTw1ifEpjWPqksH2
 aPbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N1cXBIqY
Subject: [Buildroot] [PATCH] package/libmicrohttpd: bump version to 1.0.2
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

Fix double-close bugs on bind() errors reported by MC on the list.

Removed MHD2 draft code, now in libmicrohttpd2.git.

Changelog: https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index f1b3f8b7d8..59c87a738d 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94  libmicrohttpd-1.0.1.tar.gz
+sha256  df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7  libmicrohttpd-1.0.2.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 6998ffd1ae..335234c14b 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.1
+LIBMICROHTTPD_VERSION = 1.0.2
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1282EC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8104660BE0;
	Sat, 30 Dec 2023 18:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8104660BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cqhHvsH4w7H; Sat, 30 Dec 2023 18:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D668A60A7D;
	Sat, 30 Dec 2023 18:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D668A60A7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4EB81BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4EFF403BF
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4EFF403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6LJ-CIIgxw2 for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:42:15 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FC05400D9
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC05400D9
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5ab2f9f1so41767005e9.3
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 10:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703961732; x=1704566532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lWRNOQkzEvvzh+cw9Ih0MhrHlAMIeG/pYpmLFiZbitw=;
 b=VApPdm0s9rUHdbkNptgnDoWmoeieNiHlmZuABXeB7R9UTAX9kDnl6Kgy4kwButg/V3
 niCnihv3wrP3YJf8wT3oCE3FTrD0t4wMSmFEDvMzHfgUS+VG9MFvtfj8ptfLFavIQOyz
 CKJKdhsH8cHvPm1zFpvmxhqsUZR0khyXAKZrkJyrRHomWfwYZkWIliFHLAK+vaMi+2Od
 7IfX+eMAvyXrDBZ56n8Joutv9ByyLzLOlWNSSp9tGlmyzcZEFYszrURHQZyHiTa1xEex
 uv49BkjaEm3+qj8Oq1wxp6zZgQr7KekusV8fTDdPIKqJxpgeaU0hwGuTNH197ElUJR8v
 +Zaw==
X-Gm-Message-State: AOJu0YxUWDzupjclhc0MEaR5USjlQtTCszXcs3cKnWjpYMhcwPu1o44+
 ki1LAOKYPozP8sSxyAFEJScMsXUzfNk=
X-Google-Smtp-Source: AGHT+IHq5UqYIzRumcVeYJQK5H4g71in7xTvh1+Q/VyeH3FLqddoNsn315z4KgBQmyWePHPZNlw3KA==
X-Received: by 2002:a05:600c:3ca5:b0:40d:68a1:c08e with SMTP id
 bg37-20020a05600c3ca500b0040d68a1c08emr1475086wmb.2.1703961731704; 
 Sat, 30 Dec 2023 10:42:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b0040d725a9967sm7289250wmo.11.2023.12.30.10.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 10:42:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 19:42:10 +0100
Message-ID: <20231230184210.1141412-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703961732; x=1704566532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lWRNOQkzEvvzh+cw9Ih0MhrHlAMIeG/pYpmLFiZbitw=;
 b=hc8Lq991MIyuxonV5nqXDjmjEEc49Z9AktuMcMOg8o/h0e3/zby3oluw2eGhpgv/CQ
 ZnVGa02/fHl58l6PyoxcUo1MGfp81j7UWk03TSPdnyV9K6zm+UXhaxesD4iB0z3hc9ds
 5ShvmPgbZW4civozjsmj/cD4r9EBklBj4rKDwQIWshBnWAW059yNUVxCZoYXihNZWZ9l
 dpA5aI1eYiexkSHTINGkmNKhOmTSa+6/+VlcToE0UH4sh1DgrR1GdzgLR816Vd2cz/Nc
 E71BRfdCU4AuJx3ty2NPNKFhB5DdLssvzeOrKfughIfSAif8w92Eirbe0YdYpjtguqvx
 z4aQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hc8Lq991
Subject: [Buildroot] [PATCH 1/1] package/libnl: bump to version 3.9.0
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

https://github.com/thom311/libnl/compare/libnl3_7_0...libnl3_9_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 8a1bd56780..77d7781493 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_7_0/libnl-3.7.0.tar.gz.sha256sum
-sha256  9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939  libnl-3.7.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_9_0/libnl-3.9.0.tar.gz.sha256sum
+sha256  aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb  libnl-3.9.0.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 6896188f4d..8fbea3db5f 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.7.0
+LIBNL_VERSION = 3.9.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

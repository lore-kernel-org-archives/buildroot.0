Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25C7C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 09:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E41D410D0;
	Sat, 29 Oct 2022 09:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E41D410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Brcf1CNKGkU; Sat, 29 Oct 2022 09:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A244098A;
	Sat, 29 Oct 2022 09:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A244098A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05E391BF319
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 09:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6D3D60AFE
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 09:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D3D60AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvRVgrWUrewE for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 09:45:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A4BC60AA5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A4BC60AA5
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 09:45:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z14so9441763wrn.7
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 02:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLFnuTtdlIcjL1eM81NTNnIBVubrrEmZ4WoLY62iRXE=;
 b=VYNuZjTQLMX66W0Fd9GoTmfzxY7pIKs88HowCftqEucTyYGKyefRo2jHNSIwrMKHIq
 DimJh+EPTtY22PaVwosP/EuC6dj+A5SMtsfilsuEAstcyPZtNYpEKNBZ23RCGdLMWkGP
 183Zah0NiCwsTka6WFFUuts8UFHEpwN9AQoPR/QMZeOg23nN6aZDI8IdTJ5J5JE03reK
 P8Nt7Qbw84Bu3cs8CwedJT8B0YRqLOa6DaMD4n4GveARvPMucjYqiQiL1e3sWFKuLJzC
 HXWI1RyYi4kZKgKvYehcKOxpeQg7m212kvyHWCeNe2cPkRNYJGISs1f9v8wuiHQMlPd/
 PnFg==
X-Gm-Message-State: ACrzQf1VsyYjNIH+50qqweBGQdpxS/tUMf3gV6DMC0ioRRL8MM3dLG5n
 0b8OAmM6+hLFJpXK6s/6Tp2dwdZ8ORw=
X-Google-Smtp-Source: AMsMyM4JIxqHSYqlXEf+hadt9wsBIr1TVNSo53eYqXiNtVKcC9CgzXYcQJQm6nKpPSBPK/Dp7n+HcQ==
X-Received: by 2002:a5d:648c:0:b0:22e:6417:751a with SMTP id
 o12-20020a5d648c000000b0022e6417751amr1901561wri.261.1667036738441; 
 Sat, 29 Oct 2022 02:45:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m8-20020a7bcb88000000b003c6d21a19a0sm1101646wmi.29.2022.10.29.02.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 02:45:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 11:45:35 +0200
Message-Id: <20221029094535.133025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wLFnuTtdlIcjL1eM81NTNnIBVubrrEmZ4WoLY62iRXE=;
 b=DcnYNSjh4z4qLMJSIy23iuC/5ik9G9mfAaf5z0koKm399GF5tZm5VyxikUgQPmgc7z
 ZcBx2atESGRCPkMG1XBDN81QQjWBUbEsTvae0EdqQJeHsh2MKQvKVMwl7mRy620J1+T1
 0cukKiDuXT5U6L1VBJJBeMTNnJfywXSsYS53UaUSXWGiGCsh/eGr9Fjbp1GlCakrVjbf
 k9/twDkHDRvaBmuXdNsFtF1Vfno9+0zFHx3j2i6A45eJa0W9N64JzagdCWJvsdCHtac1
 mVxykLKF5JHi0rEN6pnFRbqoay90+0RbnRsX7Wd9RRkx8NrXY9uPaU3iORnK5FKWAAC+
 7gVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DcnYNSjh
Subject: [Buildroot] [PATCH 1/1] package/mtd: bump to version 2.1.5
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.infradead.org/pipermail/linux-mtd/2022-October/095383.html
https://lists.infradead.org/pipermail/linux-mtd/2022-January/090742.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 481788f844..a2133e3ce2 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.3.tar.bz2.asc
-sha256  11305a5daf6fc6ed85120695c8593290b577effb039adbfa63d35b4418ff5630  mtd-utils-2.1.3.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.5.tar.bz2.asc
+sha256  386e27fd121699b6b729bc2e8e04dda987b31cca6b16e12fb6cc6dcf26449f46  mtd-utils-2.1.5.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 45e7c0c61c..6e266a8760 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.1.3
+MTD_VERSION = 2.1.5
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

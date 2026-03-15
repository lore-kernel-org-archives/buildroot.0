Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A7CD58B0F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 06:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A34776103B;
	Sun, 15 Mar 2026 06:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sf2oZ60zeZQG; Sun, 15 Mar 2026 06:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B01660AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773556821;
	bh=bnuTibg8M2jcq3r2KmPaZYG51fAj1kWso08tOaC2Ru0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kWIBwJxbfSDbBSUWE+HD9J1YPS7O8Od8XScPF18/n63ouoFG12cbdASc848Mr0zRx
	 caa8cTERcJdSY0FaYnNeX+d/tfbuA8WYf4qhDwjEz5o0DSbNgRyx5O6YHDd8G/AJyR
	 Urkt/DehZzXuAIc8Y6mhVKwB2AEx93TvnY61cpZG/T8Jss9wzsozOv5VCFPVZCY1uj
	 1iYg8ulxzvtVN+97k6dSLl5v4Jf+jd5mOPrc0trJnk37u70mZ8VsmN5nI9/DrKyRmT
	 YxJ13C/9GRwJirpBhMgk3GKuClMAjpjZ9gglwOP0U8gcy0GXau8T4r4nyfIl1jMnbM
	 SRRtbmFXNYpzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B01660AE4;
	Sun, 15 Mar 2026 06:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8672B1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 06:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BFCD412AE
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 06:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rt3MzQrs-JEI for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 06:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C839240BD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C839240BD8
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C839240BD8
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 06:40:18 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2ab077e3f32so16226725ad.3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773556817; x=1774161617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0sVYtDnlXRbOg8R6/5wN7uKKBm/tasYmmcJlHzT23E=;
 b=nqUALz/dVCBkg6Zir/rHiRAL3G+UCuzisQTbHbyGMY8Kd5V4L4cgZchtYxC6fNpYWN
 GfsiokpAWCzjeOUUoPPQbTIkJeCQUNkedj6lzvfmtsQ81OQtWBVoa84l7H4RmH2BI96b
 +wfzsZXxq+5EJSiZJ3NGhvC+0VRFaHIr6FwVkcPDjYGTS2cip3k5+J0Eq31ATeQS+BLj
 +e9ppCoxnqW70bgNZ8h14zL7/zyEWpP+WMMFUuYRaCl2yI2dLC2E6BC/n6N6d1gzGiKd
 51aBqDiQA+VKOwPkF71MGJ5kZUBhcdz0Mln86ghsjOgUeTu5zBJ4Ez9Mwjs5goO3FrLL
 R84Q==
X-Gm-Message-State: AOJu0Ywg1slzOIj6rXKbphADadKWpu/aFMZCD8Vy5vlez89sAdUgOlaD
 Lh+K2iUtM1UNtuReUFWOSKP5XNe07msm/v4TxAVK5suwXxiqUyZ9s29dcBRpyw==
X-Gm-Gg: ATEYQzw6jN5LpiRe+mQf+OVTbR749tdPgdBF6QrPQDJIUXjwl1vdBexiPP/01ow5VeQ
 mUNaDcRrb+5BT0MyuFIFCGDusZwrSG/bO58t/M87z71T4iofla2JGWwOcfiK0+UKBPhx4SOuV13
 +mUPcYszh1FiA+toCHIDPGjP8RmJpbEV1F4X1VpRtBhaZ3WWabp/LzfwF7GoOMduEAIdlftT3lO
 pzeGG7yw4EMEi6HSfUPhXgVGhgMth8a5cHql65ZdWlXsyRWbsnLQnuQr1R5cAuq990W+oW/g00m
 9RgtivjygpyNmEKFAdz9i6eK7X88nxrh4in4I6xPF1jrI9/YBwXOP3Fqt7RMRUsclctVzS5lhQj
 s/XLkV35OSm9iUE3WbysHNjSlTjm66YHJKKlbQdxkDnQMo95JmMvs0S14cW+soJbX1uLWXY/1Ou
 VCFsReyu1moGPhcxEa3ijtqVsY9i3l6qhe2MzSTiUFT8Yuuw==
X-Received: by 2002:a17:903:2f92:b0:2ae:5ec4:2f80 with SMTP id
 d9443c01a7336-2aecac972a2mr89013845ad.47.1773556817259; 
 Sat, 14 Mar 2026 23:40:17 -0700 (PDT)
Received: from fedora ([2409:4064:e94:4c4c:eaf4:8a92:f628:ad1d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece62c701sm92192305ad.37.2026.03.14.23.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 23:40:16 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 15 Mar 2026 12:10:03 +0530
Message-ID: <20260315064004.10220-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773556817; x=1774161617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z0sVYtDnlXRbOg8R6/5wN7uKKBm/tasYmmcJlHzT23E=;
 b=E9ZV2Bfk1Uaz4e1qW9j+M604WsvVe5VOdKcNf6aBtZXELfcUW3Qz4phLNjBFJv6+Lv
 E3gFxI7NpF3DR63F7XIn0Hv40vZG0TM8vjlAdNpPwwoe2qOVcBFvQ7xn/6G/897bJRzv
 p0hhW135ei4kVi5dLDy7WGeKSAqCutWgeFeAa3PY3UR5t8M675fhaPBBuAcGzNkhzfht
 241TQIh9909ncje+Do8XQ3ZLKBn932+eND+F80Kv3lwZPOghN2KrrEzLCh8BFlW14Bu8
 0E44uZUVBjuYWN0FWG6Yvw8ux3/l13vOXc4ZkoDFH4e6KUPJ0cgFamRtLjFbTfZ4QlyI
 cp3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E9ZV2Bfk
Subject: [Buildroot] [PATCH] package/automake: bump version to 1.18.1
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

This release fixes the mdate-sh script to ignore SOURCE_DATE_EPOCH,
which was causing spurious makeinfo rebuilds.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/automake/automake.hash | 2 +-
 package/automake/automake.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.hash b/package/automake/automake.hash
index b2e70641db..b5b9cff731 100644
--- a/package/automake/automake.hash
+++ b/package/automake/automake.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469  automake-1.16.5.tar.xz
+sha256  168aa363278351b89af56684448f525a5bce5079d0b6842bd910fdd3f1646887  automake-1.18.1.tar.xz
 # License files, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index fd7933dd74..c74bdbf85e 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.16.5
+AUTOMAKE_VERSION = 1.18.1
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPL-2.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

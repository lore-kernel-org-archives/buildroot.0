Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB226C5AD49
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 02:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C80441994;
	Wed,  4 Jun 2025 02:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QpjYqcWHjPq; Wed,  4 Jun 2025 02:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52E48414E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E48414E8;
	Wed,  4 Jun 2025 02:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B7AB07
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 02:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D473D41E70
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 02:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVOB1bVj1PMH for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 02:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0507241E71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0507241E71
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0507241E71
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 02:40:15 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2349f096605so77915165ad.3
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 19:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749004815; x=1749609615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qTRBmB/bkdfSHd2biK1E8r+v0NRzzdMtwmxmd1FRFpk=;
 b=DrALjWM7MNJcL9EsJ4f9wUT3h3rZbaJK9K4+DjiA76jMgcrLKO7kYmTWhxjzXulrIx
 Kz6TAYtXNwUU327YH4rSzIhMvhcPR2bQXAt6xIgSoPyAyX9g3zBHO2f3xdbosGXW9zoF
 IDLWL37yeN9LaNUI1ne+0LhbVDa4daW39/9GeBz0bGvWxG3kk4fsKGcCIbjK3IUmHlbN
 oG7Tl5PEB1Eu1W8NvMafEEe7JUBhAK4XRQJ9MDZpt7718DOYVTES60kQgmjHuDzuGPFs
 +/Gyx2d+B+Bq6p2nx5Yf2swLC/vFU/F6heJkWvn3Vo2GJlou/XyCSgAodd0JF/eGpzIb
 UhFA==
X-Gm-Message-State: AOJu0YwxsZgvRhatWxJ8QrbfAxzlTR/bIvwbCbTtTCD/PknHjeRJw2Ux
 H1hIZCfP9mqMud3HoXUOVoyOHqvyH9JR67QrqwboQB+59BE6HC7p6sbHKc1NDxrN
X-Gm-Gg: ASbGnctu/RSpyRFUvZ7UVdyes6IrbzmGMBU2VitPju7RYaDD0DKE+2hVMQBao2Ljd0p
 Xh2O8vcJc4wCsAwXEkhFfwME05bH/58pqrLFtldj1g9vCXpbsbpELuPAMQ3On/GW9GDOfAu8Zfk
 nZtcMF448hZ9b5CIy0L0UmLbKKVmfuWLeRuAHdzRE68J1kGLHctMeERNLTBeNZqC3daSvEqBjai
 T6dVpE8SF0YjugOpW3WWmLru/OUdusGL7YC6RUQnMkhvN6cdYb9ddbnUl63a5+/io8r74rfrJbR
 BuHqfDR6IV+f7han+mJ8ziz8v5L+l5PJBzRTwkGlWkeOjGDeaYow3tToFFyd0Xc7lwm2EPA2uu6
 I0btFpyG3cDXoKiUqXBYnUr0etQkZZxg0HPsjlg==
X-Google-Smtp-Source: AGHT+IGrckCQgfQtqZjDmcTozz3mJhy5h+PVZDiXOjscGI8wGNPRvrG+gos8qQ+BKa+zjVDM5JJEaA==
X-Received: by 2002:a17:903:41d1:b0:234:b123:b4ff with SMTP id
 d9443c01a7336-235e1158d1amr14975955ad.21.1749004814732; 
 Tue, 03 Jun 2025 19:40:14 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bd9448sm93600705ad.66.2025.06.03.19.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 19:40:13 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Tue,  3 Jun 2025 19:40:10 -0700
Message-Id: <20250604024010.64035-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749004815; x=1749609615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qTRBmB/bkdfSHd2biK1E8r+v0NRzzdMtwmxmd1FRFpk=;
 b=Yv0tr/vR+tWvhZZy77+P8C4inFyP7tibKduMoNdgP4MuQAU9c4PBFXGTgTzChzcOxO
 HwASMxzuR4skND46nuc0KrXWOLbYOWLyTXn5CceSxQaWU8RtHjGsJMOgQs333CXpD4xi
 6fXe8o2Az80Dr7Rf5Q/+QzLev0ysmsp6Lx5x+ZYgXC3Dv/PvtxwlCaxvc0UZ8FoBlFO9
 5VR73JjowqsrG3/XCswYrIJqynr1Qn3zJgBO1ghhbqloNQZpzExA6nFlVhCcFl2l76vg
 mF60e8DJpzj3b5iS1nr+u/n8wsyZj0lbdkc9T2A2VuzxYcukP7/y0KkFsSeNQMxI4mCi
 P2uQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Yv0tr/vR
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.396
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

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.396

Changelog:
https://github.com/vcrhonek/hwdata/compare/v0.395...v0.396

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 8eb0597a98..59a3286c1c 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1166f733c57afa82cfdad56e62ef044835fbc8c99ef65f033e6a5802716b5c66  hwdata-0.395.tar.gz
+sha256  6ed6ff6eb9d137b9669af6966974643a015cf302a39237ef84dd2efa5e20bae8  hwdata-0.396.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 4de227b650..f21db41e27 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.395
+HWDATA_VERSION = 0.396
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

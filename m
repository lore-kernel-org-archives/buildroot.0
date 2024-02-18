Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA78C48BC4
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 06:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB78A40480;
	Sun, 18 Feb 2024 06:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUS0xddRzUwH; Sun, 18 Feb 2024 06:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E0194031E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E0194031E;
	Sun, 18 Feb 2024 06:22:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB9E1BF23C
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 06:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B3A40841
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 06:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmziCTtzXb2u for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 06:22:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA85040840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA85040840
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA85040840
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 06:22:44 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3c02adddb8eso2993106b6e.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 22:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708237363; x=1708842163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=729BL9F2B8IHXB23ZawuJhmbYWhgddCJth7OT9PpGBw=;
 b=Wy34vXLISEX+TAnLOquXf5LpmxTt+5PAx0xWTPKOde0UdTH+ioPuIOQBJqIith2wiK
 YTH1TPgS/AWExUU6cGfrqe4b2W0yzvk024pPFbyxmHxYpOBXGJCYTrAAucmKMUhXpjtY
 p86mYDUs0BCZqPqooCDCt5STXNYGj/wzbD3EALnCfU1vE1sM7KK6GlxYSujVFQ6xQG02
 5qbtyX/tBkBLqQAHe/5JuEesfn6eaEF95LTH/bOVYmKmODH3odfbpEjB9uPBZgpRch9t
 8B2YXMVPW4yRyerJpZU/NngCUjSkGlisR8wIDy+/tkqme/MxPEss8MS40O+cWH8BELm8
 NScA==
X-Gm-Message-State: AOJu0YwnutPQ/aER8fZoMRjNg0POKRfFU1HCHnWHJvQKhZeqZLnYh9Vu
 TGmq7B2sqdBDzpRrRPa/nJjZLbJ7TlqXav4RLKvHwexRjxXtTOdaahaWyNCsWDY=
X-Google-Smtp-Source: AGHT+IGMxF4GxJrPFAZiSDKQZS61lQTqFugIGFVP5K+Xx5A5zYLIj7AAiAP6WKniqQaAGs0X1koncA==
X-Received: by 2002:a05:6808:1907:b0:3c0:408f:2098 with SMTP id
 bf7-20020a056808190700b003c0408f2098mr13641445oib.24.1708237362662; 
 Sat, 17 Feb 2024 22:22:42 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 bn16-20020a056a00325000b006e0cfe94fc5sm2529669pfb.107.2024.02.17.22.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 22:22:42 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 22:22:39 -0800
Message-Id: <20240218062239.1052785-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708237363; x=1708842163; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=729BL9F2B8IHXB23ZawuJhmbYWhgddCJth7OT9PpGBw=;
 b=PTV0WkxRfLkiG1cYkebjVJhx0DJ/tDsU0Z5AHxzO5n9DncxE19hVA0Bgvp5Vmv9TMB
 e0H+//R87n7JNSIyc2yzjrFTy3EYdpsghHKmWJSzUcDYtZZlvvbu1w1BzLoMXUjMshXA
 paklUNXK0s7x//0Wc5ms3kou7ogb5TOqYA5E3LjbVks2MTtJ94JIpVIEHjK+QCle7U17
 oZPvmCSuipQZRZeeoYoBlgESjf7F8YISw4Zh1BF7c+x9o2fCcBFwVjkDdhJJMHMll5cU
 Hh7OSp+3Wep6GZHv7P1OERg3xckzO0msFHquGbK7h2u9XZLN+5vf7+t5m3Mjakyx8bUQ
 ZRMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PTV0WkxR
Subject: [Buildroot] [PATCH 1/1] package {sysrepo,
 libyang}: bump to version 2.2.150 (sysrepo), 2.1.148 (libyang)
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/sysrepo/sysrepo/releases
               https://github.com/CESNET/libyang/releases/tag/v2.1.148

$ ./utils/test-pkg -d br_test -k -c sysrepo.config sysrepo
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 3658b20e4e..e03278adfd 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e52b922fcf371933ad7de1686ad83504e3358236e7817b5af795b0db52fa221  libyang-2.1.111.tar.gz
+sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 5533c7c68e..fca0cd63f8 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.111
+LIBYANG_VERSION = 2.1.148
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 6a5e98f41b..056f70787d 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bebb7901682eb23bf4c73d086d0a45c124ec751a67793a66024f1d4203425730  sysrepo-2.2.36.tar.gz
+sha256  467efed8d0f62c26a0d200602b911096eb2d67858e620937ab68f96b316fa9b7  sysrepo-2.2.150.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 6b031ae6f9..7f2570bd7d 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.2.36
+SYSREPO_VERSION = 2.2.150
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436EBCF6496
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 21:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01BBE605D4;
	Sat, 28 Sep 2024 21:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2OitvUjIYmV; Sat, 28 Sep 2024 21:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8C8606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8C8606EB;
	Sat, 28 Sep 2024 21:50:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49AD21BF580
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 21:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C8E812CA
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 21:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEBqetq8EKEt for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 21:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BBC4812AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BBC4812AF
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BBC4812AF
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 21:50:54 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a340f9dd8aso16321805ab.2
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 14:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727560253; x=1728165053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DEuJIJnU/eoKxZ0G2H5eAQu9gbKN8ti0lpCyekEJNBE=;
 b=VWlzlOZdQOu8XF2HTVrUxI6HeghvWBRf06tOGKiBPtpOrZavBcdsvMj2umQl73hZKh
 oa1DTukRrTvPKdeC8G94PMBzyKUXJvbqnUNCoU0qD6iFvyLjKDYdWAH4yKsjX+DtysLW
 92D4SbLCUGzyEW/I073WG8jGB8WngkpjVDv5JBQUTZELVe02WQ2VJg+5FZ9akooSqaJ/
 AWtJlR/vhm6LHzX0KjGY4dOq+AvkBU7jVn2Wty3NAjXMHy432wntPuRpMXPMd1Wavb28
 1T5lcKlmKz2CBLXOmXdhXg6hMcH78HNmLJIR4+Dpf4P2xejhwVZNUCRBnbubNk7vhACN
 Se7w==
X-Gm-Message-State: AOJu0YyrBrob3IQNJcj5WlZP6GemjK+WF+XhsBsOYG7ocbBwMbFcoDAB
 HRDoAU7i1gjbjqUjhZ5k6XNFBjPk1rS/SU4/gZ3K5qp94PUCQhAcyWnJzg==
X-Google-Smtp-Source: AGHT+IEt1ZJHk3mmnJoSPEut8nQ/H1I+0WA78NUKeIVm7R+83F95iVSApaQLPo1t56gBE9JCDGaIZA==
X-Received: by 2002:a05:6e02:20c5:b0:3a0:9b0c:6b2c with SMTP id
 e9e14a558f8ab-3a3451aadcfmr58737875ab.18.1727560252756; 
 Sat, 28 Sep 2024 14:50:52 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344df3dfbsm14516885ab.84.2024.09.28.14.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Sep 2024 14:50:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Sep 2024 15:50:50 -0600
Message-Id: <20240928215050.3358893-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727560253; x=1728165053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DEuJIJnU/eoKxZ0G2H5eAQu9gbKN8ti0lpCyekEJNBE=;
 b=imVOYS/tSUAFA/Pcv6R/6NQ8IpMujloGZro6gvHQoIDowDx1Id57EZw31phwyX3+cp
 m/a8qaIw4LNvE3zF7wieU2yZOArGPevV0DxP/c5Jn1MEcdqI7kVGz4ADv2/0nxQW8JDj
 73VdbXFyssBQcoyZAzL5wml/kgmr6c+CL6qbb937ciKfEDWKNO12S86qjy0JG9sNowpp
 mBauI4rL10pGD7/Ctp0cpsg6Q2RtXL/WwusYlD0vhJ7t3Mu1ofLUYY8y8DCr1LvZNk7q
 qowm4fyvTmgnAB/VQ7rZh2WmwzgYW3N6vL+OOUZ1tPgXbwRuILOKAqqr+mxVusUCM4SU
 Hc1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=imVOYS/t
Subject: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.78
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index ffd78c40f8..1fd4e0fff3 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.77
+BLUEZ5_UTILS_HEADERS_VERSION = 5.78
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 1b10bfbf64..41e39e0b5c 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f689bc00e1d150812  bluez-5.77.tar.xz
+sha256  830fed1915c5d375b8de0f5e6f45fcdea0dcc5ff5ffb3d31db6ed0f00d73c5e3  bluez-5.78.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 59eb68de61..13a8ce2f0b 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.77
+BLUEZ5_UTILS_VERSION = 5.78
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

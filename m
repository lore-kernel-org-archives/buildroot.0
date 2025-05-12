Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F44C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 04:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59DE981A95;
	Mon, 12 May 2025 04:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3U610pQ5Y0y; Mon, 12 May 2025 04:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872F381589
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872F381589;
	Mon, 12 May 2025 04:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25590150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 04:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B78D815AB
 for <buildroot@buildroot.org>; Mon, 12 May 2025 04:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsDf4RoiIEum for <buildroot@buildroot.org>;
 Mon, 12 May 2025 04:24:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A417F81220
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A417F81220
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A417F81220
 for <buildroot@buildroot.org>; Mon, 12 May 2025 04:24:05 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so3285312b3a.2
 for <buildroot@buildroot.org>; Sun, 11 May 2025 21:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747023844; x=1747628644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=05Wu/WQcic8AmHm2IBt1lAVCInVpMUGCpp7ZlyjVzGY=;
 b=AGoZoEKCgoG5IgJ8ISiUofHQdYm8YOBU6oQ9SB6uRgd299/t0WYYRji51kIY8w6yN7
 YXPNh87aKg4S0vl8ay7nLxxZn1QsL/8Y5dHFm/SQKrdAMuj3D3rOxM/vmmnxfNAOYNVh
 vrWvNMTh0W63UXGEAW+QyVCV77OnE8DyC/UBH7LRUtrg8kxrhKtM6228lIT8c71KOVYY
 RORypLvAeGY5iqJXG9lZKrn1Zy+FGoHMK9mfHt1qMaJciDMEjXwQBy+F33UsIWLRi7qN
 xQ+kRqPxv1GiDTVwLNHlOoFuci38TmgvLBL0ekbB/Us5Zh6ycwh7DGoxPJljD1bpEIj3
 yD5Q==
X-Gm-Message-State: AOJu0YxNez/dzSJCrC0BqkeDO+a/lDEYuKhfgyERDRWruoH8NHsfFE3r
 +5ssHmZRJLzoI4ScLkXv86Zx30rxKSaFOyuDcf/POR/DME7c6O50QJMpxJpEO639UW4zNnz0glA
 R5J4=
X-Gm-Gg: ASbGncsOGji78krPyymjf7bWGMojBs4p7Y6fkeHWrr/py0q8C3z+GF6ANse9vmqA1vW
 eSmJ+htOeaOYQRLLX9plSZtlSbMq2X6wx9zH0o1ENGWl9a3zGOHxBhNW3Wu4/nHsEZCCrHm2FJ1
 L3nYUdc9s8hQcrmgtWW0emQu25fgVf0/tgsqymV3Fjs7D2wLXgaj7OGM9nMoBzjxjNPMFxN36UM
 uIsQMiEP2a7ksB0a/gnffU58uA51dVlBWVP1MpD9XwatMeP8cqwFhC7B2jOAFLfGnZC2zKFemp8
 ArJgRnQNGGCKRh0yKPfhKEb8Sjx6u2uojIFqMo5u4EWrmhkmrewETwHpQDZdIYPOG9hbvUQvnAA
 2S4HhrlovgNyutzqUPE68ky9A
X-Google-Smtp-Source: AGHT+IGviXk8W0g+vfDjfRfwAMh1IU48JO7euKZdVG66+Lqk5oelbHz9jWPkg394MXs2PWPBydcMdQ==
X-Received: by 2002:a17:903:1cc:b0:21f:988d:5756 with SMTP id
 d9443c01a7336-22fc917d52cmr153784295ad.42.1747023843680; 
 Sun, 11 May 2025 21:24:03 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc82c340fsm53518435ad.257.2025.05.11.21.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 May 2025 21:24:03 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 13:53:29 +0930
Message-ID: <20250512042329.2976727-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1747023844; x=1747628644;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=05Wu/WQcic8AmHm2IBt1lAVCInVpMUGCpp7ZlyjVzGY=;
 b=b+QXe21sKZ/mPEKv1zHGD7GIwBWqYKYEcG6D09wJ3COhSBqn2zUCKHeL1hOvwqoQlX
 18QV+JNMKg3CSuetqI7vlOijJlBqJMt4vyBzHr7zvzLEMDdadkdrlGj67drH0fScETL6
 Hvt5kCSlZ/REYd4EiMRkbWv94z7ShkTISk3GoSge3f+jgD1WQnalbt9U7n0o0piTCQYn
 XmH7gT/q9Db8UkD9ub6O1853Bt3VAA4cFt/7rU4+rf744mE5mMSBUrzzeYP9PM1mvw0m
 eefUs3vwrC/L9phpQbTRHKgwjaLxHqMohx9rhXeFKWQQ3/qy1THsTM2ok31+KXrbRL4V
 ewtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=b+QXe21s
Subject: [Buildroot] [PATCH 1/1] package/python-aniso8601: bump version to
 10.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/python-aniso8601/Config.in             | 2 +-
 package/python-aniso8601/python-aniso8601.hash | 4 ++--
 package/python-aniso8601/python-aniso8601.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aniso8601/Config.in b/package/python-aniso8601/Config.in
index cea76eeff5..234c36d0a3 100644
--- a/package/python-aniso8601/Config.in
+++ b/package/python-aniso8601/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_ANISO8601
 	help
 	  A library for parsing ISO 8601 strings.
 
-	  https://bitbucket.org/nielsenb/aniso8601
+	  https://codeberg.org/nielsenb-jf/aniso8601
diff --git a/package/python-aniso8601/python-aniso8601.hash b/package/python-aniso8601/python-aniso8601.hash
index c0e8f95f3b..9a33f9f9d4 100644
--- a/package/python-aniso8601/python-aniso8601.hash
+++ b/package/python-aniso8601/python-aniso8601.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aniso8601/json
-md5  29acca96d02d182b7ff09f02047b84a8  aniso8601-10.0.0.tar.gz
-sha256  ff1d0fc2346688c62c0151547136ac30e322896ed8af316ef7602c47da9426cf  aniso8601-10.0.0.tar.gz
+md5  ea9bb2b816aa448078d91aea3ce43d55  aniso8601-10.0.1.tar.gz
+sha256  25488f8663dd1528ae1f54f94ac1ea51ae25b4d531539b8bc707fed184d16845  aniso8601-10.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c3cca0b9a74fd29668bd99b5dcf0274d53be904de6778916dc852708f407b0f0  LICENSE
diff --git a/package/python-aniso8601/python-aniso8601.mk b/package/python-aniso8601/python-aniso8601.mk
index 1bb6628953..ed0230a0c3 100644
--- a/package/python-aniso8601/python-aniso8601.mk
+++ b/package/python-aniso8601/python-aniso8601.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANISO8601_VERSION = 10.0.0
+PYTHON_ANISO8601_VERSION = 10.0.1
 PYTHON_ANISO8601_SOURCE = aniso8601-$(PYTHON_ANISO8601_VERSION).tar.gz
-PYTHON_ANISO8601_SITE = https://files.pythonhosted.org/packages/f3/3f/dc8a28fa6dc72c13d8c158b01f8975f240e9e72c336cc1ae00f424e2d7ce
+PYTHON_ANISO8601_SITE = https://files.pythonhosted.org/packages/8b/8d/52179c4e3f1978d3d9a285f98c706642522750ef343e9738286130423730
 PYTHON_ANISO8601_SETUP_TYPE = setuptools
 PYTHON_ANISO8601_LICENSE = BSD-3-Clause
 PYTHON_ANISO8601_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

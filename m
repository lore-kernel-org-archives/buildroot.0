Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328B3C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F349A60655;
	Mon, 17 Feb 2025 11:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBmEu-F0-tr4; Mon, 17 Feb 2025 11:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DA7E60DF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA7E60DF9;
	Mon, 17 Feb 2025 11:49:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3DCDE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A8BE40C2B
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohpNxIhO_mUu for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:48:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC0B640832
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC0B640832
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC0B640832
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:48:56 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-854a68f5a9cso361412839f.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792935; x=1740397735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Bfi6yAcq39oTb9wTo06mQh1Meb1jkiVT2XdHqUio8g=;
 b=aXEMH6Z19TSN8834YhTe371i83RPRYkG3OBsYp2fqVv5LyLmYiHXdO/mc4Ibq7LT3D
 WfRI71zyCEJYigw6ymLhlcd0QxF9ydNCvEufLj3SKAZTwUKdJqphHYfj+Yy2ti0NllGH
 Us5k3A2vExABX0RKjS3hTbrlqM8euXKmMaIKmiuFk5kOC6Tm9NiCDfC50L/8WfYJv+dR
 fqsT2lCyLVWtFv2ESQIUSltdQfH8DDpgOhd2nInAr5v3FCtXVsDYHTAKCDpFbz2VPHrC
 GoRns2cAde5WdzBTc/KmnYWABLowcpDrpKqu+bBZbhPnm98bQl6ZRXt5XszWGoEH5twe
 5xTw==
X-Gm-Message-State: AOJu0Yxl0wyJZjHXwosEY9bVXH6O4F5YE9fHIAxTo3lvL+Z2/03zVvmP
 QI0mRjwo0Sjrh//uv2UmT1GnYyUELUFDC3aFc5d9S6cjZR5+Oc46VcB6EQ==
X-Gm-Gg: ASbGncvsdrkecU2gDHX4DWp4XA2aCTp68oflQ3q11/mym/iRDAKSYKelMFgs3B8yu2a
 LQV8WNEkeeWJJdoV8SzC3CsGA6JPikZmYYqAjO4eLlAjAyyFQ3fy/Lt57pGXvVxd9BZ4VjwKn+7
 xLwDRuQ5HarKlR9WQElyHmpveEjt0GpivdMMpCz7eFFgw0pHzG0Nb+E/GgaxjSjXFFiuDSV67sJ
 Eu8Qow27Stiraj3uFC2pu6aBfK8DcEmqHLV1wPRRKcOgQJ/+iSQ1i3eg9405M+VErXyOFgdJcta
 CcbuvsLC/UGNbLomo5X/mSpTl2VjoZA0x5bvlTjEqItnIKvCZ919nuaVLSU6JjeeWg==
X-Google-Smtp-Source: AGHT+IEn2tdIqUG69PJ/95OjFCJ3WAVfZmIaWEERr8yxMO8p1ggYCG+ioaqt9PFHvPG62gFl75ozBw==
X-Received: by 2002:a05:6e02:1d08:b0:3d1:a418:620b with SMTP id
 e9e14a558f8ab-3d28097e9a6mr72038055ab.17.1739792935625; 
 Mon, 17 Feb 2025 03:48:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d18fb66651sm20349625ab.60.2025.02.17.03.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:48:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:48:53 -0700
Message-Id: <20250217114853.1883872-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739792935; x=1740397735; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Bfi6yAcq39oTb9wTo06mQh1Meb1jkiVT2XdHqUio8g=;
 b=MqeKVIbkzMsWJNu8tlTjykkZclHImMctQMP+KB4+2h11sdaJ4XJFAsf70sOxImo1i8
 JohH9napE0EzcNfgyGlWvvt+Sv4wdwQpgQlgRLL3VHYKwlsxyXGDAqbP+IcmCRMEBaG8
 supj7LZYTR1C8iju7asF5VPnf2890NRK2kZaBOIXDcMaa6zA9E+jx7fsQsSBeS6LD+6r
 c2A+iH4RLx6I39btWE4gWFiFwbo7YHSa2tIlj5WUyFJRqytSb2C34Mse0BU9NYESPgo4
 vqpyBSvhilDbZbGYKnfAM3Sw1z9KNH9pF6eo06ZmzfnRawADqRNwfwvGuX0pYYfh8G9k
 qQJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MqeKVIbk
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 44.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index aa7e16a043..909b702d16 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  09a765af8da172785de52631fe6c626508fdc8e451b7fb01d52f58b7841a813b  python-cryptography-44.0.0-cargo2.tar.gz
+sha256  85cb9d02cf5237881d0b62abab086acd1149d972f6f8c5aece4f8e10a37c944c  python-cryptography-44.0.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 9ae1fdbd83..fd2c3d7a50 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 44.0.0
+PYTHON_CRYPTOGRAPHY_VERSION = 44.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/91/4c/45dfa6829acffa344e3967d6006ee4ae8be57af746ae2eba1c431949b32c
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/c7/67/545c79fe50f7af51dbad56d16b23fe33f63ee6a5d956b3cb68ea110cbe64
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36543C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE6360E3D;
	Mon, 17 Feb 2025 12:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaqFGXAQ2lPV; Mon, 17 Feb 2025 12:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58C360E1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B58C360E1D;
	Mon, 17 Feb 2025 12:00:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F528DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CA404094B
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw60Z6SZmMmP for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57D7540945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57D7540945
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57D7540945
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:00:07 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3d0465a8d34so37141405ab.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 04:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793606; x=1740398406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00wERd2+HwNODR5Bydapcs4/4zHupBiwuAf4DVxFOzU=;
 b=MUK7XVje+ETZ9ajJAMsF1I2+fTxJE3ji3SPQgOOaYAaDeC+EBsQtsK6S9zngzzfotw
 ueMlA460uj89cEjf9yhvkyUR8AMB0oz8kkgmhqLYy4iTeSnaopYDXfP78UkhrobvUdVC
 /hG+vjoK54aePl8paP/70wmIJWZ+v3I5yxGYMVHTPTe8uARa7k1OhY2DKjXc4dU05sCf
 mye8cheoL9t4MLQmm/pTR4OhLYDKfozHAcOeNuhTbD2Pv+z9TP0BIG6mh6ljRgXERoSG
 Kf8Z0DMuEH4eLer9FNoJDHQTHjcq3z303fMxuhWXUKsXgirTWAW1xjuVBAOr022fYraz
 1eBQ==
X-Gm-Message-State: AOJu0Ywj9UqocXZ2mUsgTImjeo/Up1eM0fWrKifF907uvRo7UpeDPbWY
 /Et9ZzuYouet6PXQ2KKyOeXae0zQSK5yg4IeGFgz3h09kTip8Y5YYrlrxw==
X-Gm-Gg: ASbGncuu0V3JXLeWqADWUV0wlKz2DF7D/z4Z4JLnJ/M7cCvcRrrCiviPDnH+HkVRxee
 1DbEoGhGxtCyjP9bLDL+bVm/j0NyWXGwWFtTQsoGesrHISQKk2TVmColuKKL0LhG8oFW42NpEim
 ZwpgoI6LfYlYsPbizBBrVqgbM32+wHQSbn/IIi2PGKswuWK2YIwmjpYHt7aH8VkqdDeoFHwreg7
 e+p66Wrk4jb7LUWhBC1ZCV4kh1F7S7aZesFRdRTjiOZi42g4kmrFJoj0F59DvJKyUYCvi+pLXRI
 C/aGnvJcm3maJ6CoMJzdn5KZ6jbe3OzG5ROQK9lwqrc/cDiGU3JuX/ME4mfNKICPAg==
X-Google-Smtp-Source: AGHT+IFenUT+M99hzn8Rm4YxLSXPGP6F33zDhacYXV58wQ7HquzqK8zgdfY2j4TW/IZMgMefShKtag==
X-Received: by 2002:a05:6e02:1569:b0:3a7:e83c:2d08 with SMTP id
 e9e14a558f8ab-3d2809d9b38mr89362575ab.22.1739793605814; 
 Mon, 17 Feb 2025 04:00:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d18fb67cc2sm503255ab.69.2025.02.17.04.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 04:00:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 05:00:02 -0700
Message-Id: <20250217120002.1887681-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739793606; x=1740398406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=00wERd2+HwNODR5Bydapcs4/4zHupBiwuAf4DVxFOzU=;
 b=fBG3N0bmp55LvNUofWvmmwMQ8vC7uqtTa2+LmEXAGK2gbu0V1OY+APhPHunf+Q2WOg
 70gsKMkQ39yTy8XxY1o/n3MS0Vq2g0VnE8LklsX1sq898EZoxGmjPTwgNKe2lldWYSmx
 lFhE7tyWuEEBcSR74MGFa2hfcEFhxGwkzIoMO3DTm3WVKoDChriRZxNxuqmHo+k2bOSa
 R+/Z1Yqtib+otv+RXa2AmP2R3yJZdOWYYbAtqfQ/ShKnWfCeCutv7EHxOL3k3JHwpTEY
 VjnzkYOq4oT/Xw8NltfV0aYmd36Ub991wnitieklO9IlgMuObJY5bJrTwPR7CO7lLbDm
 HZLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fBG3N0bm
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.12
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
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 0aa22e9fa3..a99e21d14c 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  17f04b60068122e998a60a3010679501  aiohttp-3.11.11.tar.gz
-sha256  bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e  aiohttp-3.11.11.tar.gz
+md5  efe78467dfb0b559cb4725554b1fb53a  aiohttp-3.11.12.tar.gz
+sha256  7603ca26d75b1b86160ce1bbe2787a0b706e592af5b2504e12caa88a217767b0  aiohttp-3.11.12.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 19e62745e0..5e436321b9 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.11.11
+PYTHON_AIOHTTP_VERSION = 3.11.12
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/fe/ed/f26db39d29cd3cb2f5a3374304c713fe5ab5a0e4c8ee25a0c45cc6adf844
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/37/4b/952d49c73084fb790cb5c6ead50848c8e96b4980ad806cf4d2ad341eaa03
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

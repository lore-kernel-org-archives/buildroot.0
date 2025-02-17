Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E04C0219E
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E94C60657;
	Mon, 17 Feb 2025 11:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8jORP-JHn2W; Mon, 17 Feb 2025 11:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C7860670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C7860670;
	Mon, 17 Feb 2025 11:23:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BCC5C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F3D60693
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iguHK9YborAI for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18FDF60657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18FDF60657
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18FDF60657
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:23:38 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-85517db52a2so79445239f.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739791417; x=1740396217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUqNcAifa2hRG9O/ms5mmuMh3FAvPunZqmdQTCA4R58=;
 b=qsIk3SStkST00OukgtfvD0vrAe3uUZxtnusgsHDx2kPo9rLlIhRpoZAmbE4JyCgwlD
 Xp+18zZbJ7UYYEtO4p1wDM8vDSGp/THM9GzN+KEdmftINb3LS4WTpGCDV0RiksQREoz0
 vZ1WSCfEkZzPjW1gZ9zzEU6Yc2oXWA7Al/Jlam9ytFrm+HcfGJ6e2qw1VCrRkaLpST+j
 7mrvTfLCT7zk/05mtXsth/dRxiwnTEciQdw7ak0fX8yVhplb6TNbNNEPJnDl2Q8D9PfT
 /P3HEP6KkLKOw0i5EXgwMyvNLHywvPxP+Nc3eB9lHph0XQMWRBmZcDl4rCVDS8eiVouK
 KX0g==
X-Gm-Message-State: AOJu0YyaXG+XcZLHFbR0YhsKxbM0ZEMZlMoRMkdPqOkG1RzRPMkA5f9C
 1cw2xy98Ab8t6ccvBiausTvoULfBWPxXrnDaIfPmbXFEZ/WGSyHiTMuPwA==
X-Gm-Gg: ASbGncuK80uddkDero+mqtBNGQgdFZYOqRU9KiONBe9Gv+jdLQJ723upKUSsPK9o51Y
 kbVLvsw698p8iYM6+iSlWY//w71XLzNspq3oPBA78XTnkkSRAOeptYAk/kM1PgixsraLckyVavF
 Ug/bL6Iqu2qzwb9VjISkh5su7pqX/qlmxvLj1BIOciLxSncpe/KBoLIvn3d37hmUDApdufiUyRI
 gD/7oNB/LYolmEr9hmtF9RFhidIGn2hVfV3KD6waSyk9atxrNMyxksgIqE55+nDmmLfADdsK/rb
 tx+q2Ewc14bDcceqIvEPNnh+SX+Z1B6o1Ln3AfxjsNQ9oS9JlqDscPVDnDVDxSzj/A==
X-Google-Smtp-Source: AGHT+IFWi+HvibaK7E7t++VpIwV0IbOyahQlgtf2kaVj/BYekxWDY4yoOnWP4wE7WcDJDkNNOqzExg==
X-Received: by 2002:a92:c24d:0:b0:3cf:c8ec:d390 with SMTP id
 e9e14a558f8ab-3d2807707b2mr85578575ab.4.1739791417589; 
 Mon, 17 Feb 2025 03:23:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d19d4033basm14933915ab.37.2025.02.17.03.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:23:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:23:35 -0700
Message-Id: <20250217112335.1855002-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739791417; x=1740396217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UUqNcAifa2hRG9O/ms5mmuMh3FAvPunZqmdQTCA4R58=;
 b=BO69TLo/FgNvsR1jiJxd6DrDUMgON+zz/VxzbEf1V3k3HeHTOQ1CWX94AkGRrLbMg/
 /EZ21FwjJaDxeW0IbkbVBNk0PYEBiRQCEpBfLws62RRW6/seg8hPC3XFxgXwRQZM0GIF
 0CY5r3bWD/72uyZhWOzWdaFZASA4eKoUP3WYTsRQHJmMTWToJd95tHSAzvMKCnzZa8ms
 pH21REl2YNzWXhqojEA+x+z16i6i8ydnxP5ODMDJ+tq8VNaCLEkFppUlc8XfGty3BHHg
 +l1cznEcsGfsKvwD8utRXYTKSYQZjn/Kx72ChCdyMD5FgeqKJXy7o03oma39/SCKO/SR
 Cuog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BO69TLo/
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.21.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date range removal:
https://github.com/getsentry/sentry-python/commit/7473afb77d7f0ba534bf5fdcd22622b06a5f7e62

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 0bf0392c77..b1b816fa51 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  1ee9b58ddcc2227b8534c7ab9c5b8da7  sentry_sdk-2.20.0.tar.gz
-sha256  afa82713a92facf847df3c6f63cec71eb488d826a50965def3d7722aa6f0fdab  sentry_sdk-2.20.0.tar.gz
+md5  a24d71a651889b89c12983c6bd3d1abf  sentry_sdk-2.21.0.tar.gz
+sha256  a6d38e0fb35edda191acf80b188ec713c863aaa5ad8d5798decb8671d02077b6  sentry_sdk-2.21.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
+sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index a404bcda15..25b419f1e2 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.20.0
+PYTHON_SENTRY_SDK_VERSION = 2.21.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/68/e8/6a366c0cd5e129dda6ecb20ff097f70b18182c248d4c27e813c21f98992a
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/08/63/3f0e88709cf4af992e2813c27d8ba628a891db0805e3fcc6dc834e142c5b
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

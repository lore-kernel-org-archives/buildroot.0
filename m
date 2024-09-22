Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44BCCF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EAC6813EC;
	Sun, 22 Sep 2024 06:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z8zoL29sFZU; Sun, 22 Sep 2024 06:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7995481449
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7995481449;
	Sun, 22 Sep 2024 06:58:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48D501BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37CAF606CA
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYoK8TINI4Jn for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C322605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C322605A3
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C322605A3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:58:20 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso191627139f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726988299; x=1727593099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VbbmBjySW8EAh254mZsNAg+7IYcjhNoYOhEo43tWHnQ=;
 b=CpkR8AzbcgR7751+kn42v2c3T89rcSr+y7cgHbRvkk/Q27DyaucsgoJOy+CfTuiA8B
 2+WUd5vg1Nw1BlPrfHIVKN2xUY4eswDIFA+dnGYOXPyJgTM5WxShehX5cRrsbEtv/F4f
 0jkJ1B7SqFdoX5K/UOZnEfD0IS+BB3PR/7WKfmt/sNuOA/4EcBXSm8Uo/u2JGLYdfma2
 CZAPf9r7l/SajXJ8ynQse8GBK9rLCRjU5zz3xSfcE8q8BWBzIm+7jakFkhf7QwncbxLF
 AHsgOEoq3Rg+wo4Kj6x+ZaIjepcGoA5Aba8PALGFfLYniAIeZRZm8OmpYdTg+uCT10lU
 bcaQ==
X-Gm-Message-State: AOJu0Yx0bg8QtfgAxemXC72v03x+aIeWcP3j5/FbEx0u2bgcA5ywIO/G
 mzKDUWUsKWrw4ljc8TwcnUvuk8Lh9qXVgeI1chVskTCTGDP/JX3QutHgHw==
X-Google-Smtp-Source: AGHT+IFMYvDK+G3v2R9I11zCiXlO8YCL8zJONNOi0V8QQnQFEtuXhHtM/5lkGupsEfgq7+qFLb+TCA==
X-Received: by 2002:a05:6602:26c5:b0:82a:aba5:dd92 with SMTP id
 ca18e2360f4ac-8320b2a0c3amr786774639f.8.1726988298876; 
 Sat, 21 Sep 2024 23:58:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49338889sm492358239f.38.2024.09.21.23.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:58:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:58:17 -0600
Message-Id: <20240922065817.985724-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726988299; x=1727593099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VbbmBjySW8EAh254mZsNAg+7IYcjhNoYOhEo43tWHnQ=;
 b=YMaBbz+DJ+tTFiIQ7nVGZqTTzfmOxODOXgi5Dz1Y5ywKZqsML2RKvuu++oTnu84s3J
 UwTfzdru71SNWLyaPBjQDewpbUybf5Aq44Gg4QTybBNLXVKg41WKBs+rc3inr5J6egoj
 Fba+TVnLGY+BGxG1EtSH1B1pFtyLH62DMmfKF35o+TL+DfDA53QEBGhFbgeVY2d4qbBp
 WsCdH924VA6HD5JipwOdIyxDSu/GyEQDnwGAcT0DYi4RRFvSl+PhQwV8lFGXBdLMYhov
 QrAh2ZnV/INGptAzxpuqrzLVksVaZnZb6ukg9tE0P1B9gdj+nj8ndU0NM4xBb7AYRFMK
 3ccg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YMaBbz+D
Subject: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to version
 3.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/jmcnamara/XlsxWriter/commit/97dd7c91d68cf4fd0f0af9cecd850ccdc6cfd43a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 4a4b946fcb..859fd19532 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  3df433a1b6427d40af6e7cac36f0b5c4  XlsxWriter-3.0.6.tar.gz
-sha256  2f9e5ea13343fe85486e349d4e5fdf746bb69dc7bc1dedfa9b5fae2bb48c0795  XlsxWriter-3.0.6.tar.gz
+md5  86f1c46dc20ca2b87aacbb2e1fc9c1ea  XlsxWriter-3.2.0.tar.gz
+sha256  9977d0c661a72866a61f9f7a809e25ebbb0fb7036baa3b9fe74afcfca6b3cb8c  XlsxWriter-3.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  b3b494c7e7456dad12ac1b3e61c60e850d60d3ce865fa056c4ce0ae680c03677  LICENSE.txt
+sha256  272e8fbd91096feeea0a250775ed83dfed17143ee4acd5d9567a1e42104c038f  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index f05b10670c..eb8c692e06 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.0.6
+PYTHON_XLSXWRITER_VERSION = 3.2.0
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/d4/b5/cef6fadeaf316a3bbe82a506252081f2e6533cdf4b69ed64f8831ac01fb0
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/a6/c3/b36fa44a0610a0f65d2e65ba6a262cbe2554b819f1449731971f7c16ea3c
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

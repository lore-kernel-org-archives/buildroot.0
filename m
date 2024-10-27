Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90D7D1358D
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 936C140241;
	Sun, 27 Oct 2024 23:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rmkr2OtMfHz; Sun, 27 Oct 2024 23:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4C540248
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C4C540248;
	Sun, 27 Oct 2024 23:55:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E451D112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C47D74028F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKPjo3ZFUhOx for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A09D240270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A09D240270
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A09D240270
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:55:21 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83aba65556cso156086939f.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730073320; x=1730678120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ylRlnZo4jmVT56yfnTqikJrpgbhwSzybBt8hZgjUQA4=;
 b=RbVik0UxH6ZTKI4q4wJIJ3zVM0JOazviUgpoTNMTzGlLRek40b/f77HUGbXc+vyOQ8
 tw04+k3UDSgHhosl7zQgtAGoflfGWgAn6/uPfzG4SKuUQLNjcA6zxm548cZ0byJf8UGC
 3+CPI7lvLG+1Vp7HzCNoFI0G8qR5gPAbjkOaG0HvmIE5osxoNWJQ06I/r37OxOLwut2I
 VHJ4JX71JzZrlObbKEfjXf+2NZnQtA/Pp7Dw2zoHZCWBmYCkRyFsLvEfuOcgPOPzfQDD
 9hFEYDSuOUJjB/0qzCjL6pj3vi9jjGEBWFx8DbO7oX45GTQGOsJevVCxE42a0TgOjmZK
 ITFg==
X-Gm-Message-State: AOJu0YzTKpby95R4Civj7o1b0XhtUZ10vcSP3BaJw5r7P/Zkzvn2e1H9
 ybE2GainlPrS8knYRJ/Uj4YnvmWlSlV0YvIXtTQ09bYvhLue9IVjoZc+WA==
X-Google-Smtp-Source: AGHT+IHT9me0AZ7u+utMU62AVys3SUBC+9l/hPtqOTrPW5GZwg1twFqSP9VG7x4p86MlzLO/nbvexA==
X-Received: by 2002:a05:6e02:198b:b0:3a3:632e:f009 with SMTP id
 e9e14a558f8ab-3a4ed36f819mr56585185ab.26.1730073320267; 
 Sun, 27 Oct 2024 16:55:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6dfc9c2sm13478255ab.48.2024.10.27.16.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:55:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:55:18 -0600
Message-Id: <20241027235518.3994033-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730073320; x=1730678120; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ylRlnZo4jmVT56yfnTqikJrpgbhwSzybBt8hZgjUQA4=;
 b=DKaDzAsl9yD1T4wQVzskT0OTYcTIcU2KptAD3vEZ/pYVxsx2gRdL6TKiWNtpGvOCUA
 bs4pFtFCpbmXUk0C+tuaIj0J9K6JmuCcmFzSunqvSWEOtpf8AlCJWTv32yMr322gSiAf
 DvJk6o91OuiZRywJ6sVpLRfQ3IBOjXnPV/7/pDtYzJFyzCdVkMtJbXLwqkaBd9s1jp48
 gKJZMa/udLa+SZJDoMPUOGESSLBLOBN81V4GXXNBoh5RQWADkLdVpXqE0y1bxwzqVMPK
 c9+roDsZZcMGs6ONieuansnhJYxrVylNZsdyjqIPQbmQDKMtmI5SZRMkvtFJdEI9LwP2
 wihw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DKaDzAsl
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 75.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 6ca17b8c73..272b2571f2 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  8e8aed1625afae37b59272ff981d6e1c  setuptools-75.1.0.tar.gz
-sha256  d59a21b17a275fb872a9c3dae73963160ae079f1049ed956880cd7c09b120538  setuptools-75.1.0.tar.gz
+md5  4d69de91ce968f45825bf36d95f2a626  setuptools-75.2.0.tar.gz
+sha256  753bb6ebf1f465a1912e19ed1d41f403a79173a9acf66a42e7e6aec45c3c16ec  setuptools-75.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 72d1c96543..bd3da05488 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 75.1.0
+PYTHON_SETUPTOOLS_VERSION = 75.2.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/27/b8/f21073fde99492b33ca357876430822e4800cdf522011f18041351dfa74b
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/07/37/b31be7e4b9f13b59cde9dcaeff112d401d49e0dc5b37ed4a9fc8fb12f409
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

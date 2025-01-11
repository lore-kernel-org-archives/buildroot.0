Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503DDE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F1F60708;
	Sat, 11 Jan 2025 16:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00mtOzNPDq-m; Sat, 11 Jan 2025 16:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05DA161148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DA161148;
	Sat, 11 Jan 2025 16:59:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E4E942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3154460E81
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRAdTCsiVpTy for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BAF860708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BAF860708
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BAF860708
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:58:59 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so91233439f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736614738; x=1737219538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SCNz8UMxwNaCF77R16tkz0nrEeTXoaHby/I/HElitMQ=;
 b=Qga/te/pEZctztLIFI7JC1SifGBlo42uscfPOI3KpZOVvBqRnAdyGcF0gy+EKb+Bq6
 uenTH65+Jx3oyfug3oUcLQv80SNNkYC9d/4SuLkYLUsFibRXYFUDg9qwyAPyD2B4v8wP
 YIftDlqdNAApVWHI0vYRqSZHOvvxjWdB/0iiZIo64dMJ8ODy3hpjVhXdqu/pgzUPHjP5
 M/N7M+32g1PitsG5lZBjG/x2hVkL3HOV4NsHJeIR2MaD6ul76aLkXc6noJBq5NLS8/jD
 UOKdcRccDO1Uoi3+zP/MWYZjrZbViCirhw1XmqSyUpn1g+RNMuJYNk9DNyiaSdokQTun
 W34A==
X-Gm-Message-State: AOJu0YymnVx8+FD7U/bjxlbBpI1H3sHUy0H/oPPZY6T58pkAx+FG9qZx
 8mUj6n78BE3KuN4ecZZr+Ga0U0uf8I6XHNNijAkIq5UOxfG1G27dVESNJ7YvaKI=
X-Gm-Gg: ASbGncu9IGnFtHL+zqiN5GvDoPg2m3uzwZLmXeMj1CGSuE7pjf1PQENHyv4bVqWG8rx
 knP5P9m/sK7ey64gGu9KywgZott1QjsJvk3f8xWSKR/i5Sh5KVwJfxAlQ20KPSKJp6xkzpqzNfr
 bpAgX99NXMcD7cLrsLNPf23SCvgd4qABasTyWqVCEVM8uYcL4ywkBnx1XtG7lg72IZW6xNtVaGo
 Gd+7nnemiorSMb49LVVYc6tlTKglSfQrciN9YIQxCEn87HnAgTlfoDSCnIFThg4Pb7hMnj5o69f
 1NB8b/M8xWjsB6qh6FBZMDlIDRu0OJ0=
X-Google-Smtp-Source: AGHT+IGswXeWbII4pBtKGcAkBFVH4PYuDQ74LvzazYEjlNyhZrGoH7yn/NFkHLGVzCu0AYUX+C+m2w==
X-Received: by 2002:a05:6602:4c08:b0:835:4931:b110 with SMTP id
 ca18e2360f4ac-84ce0081db3mr1331264439f.5.1736614738108; 
 Sat, 11 Jan 2025 08:58:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb5be0csm160714739f.27.2025.01.11.08.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:58:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:58:56 -0700
Message-Id: <20250111165856.2900513-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736614738; x=1737219538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SCNz8UMxwNaCF77R16tkz0nrEeTXoaHby/I/HElitMQ=;
 b=nZqA7NVCGKhBT8NwEQ7Z6OWkqMPODkWVTB2pIZnq8LeAuMD6Pxcv3rOCKuKUr5X4yP
 NHAk49qS/Z3J3DBDuA0+Hbrxy5F5sDK7I80wr7GhuKO5ieYmOooM7GXfcBxe34ve9cI+
 dDAOnDYjekxu6o7E+ajtb6TqicZyoLI8bsFXYEmpeB6hruXWYOTYheh8eN+suy8yBAp/
 +8LFJuHrDHuWafzwQ8CczYyKwZZ0gXKFsHr9Mshz96iRji13MS3xxc1RF1ZOeHrcAdZI
 kRGeD4aIGFlmjvF7LHLC35Zc2F4vHdVn1UyDNWyBAEWDNmT2+57hFQxKm659rYI5dEFA
 sOig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nZqA7NVC
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.27.1
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
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index c3dd0879cd..8fb00b3dac 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  0c7bbef3f83aa48e1786ecc089e8d6a23c35164e7e9b02917697eca7a23628a2  python-selenium-4.26.1-cargo2.tar.gz
+sha256  80364e62eb8ff463df8a4bf9858e6ee0769f4ff1bcf7952cd64d0407a6a3e8ff  python-selenium-4.27.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 8f5f2c3598..f622674fd2 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.26.1
+PYTHON_SELENIUM_VERSION = 4.27.1
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/3f/b1/e9efcb88d5682e802cf03bdee4886f854d75bdb2859d1e72cb74041b4ef6
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/44/8c/62c47c91072aa03af1c3b7d7f1c59b987db41c9fec0f158fb03a0da51aa6
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

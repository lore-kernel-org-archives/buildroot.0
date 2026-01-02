Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CA6FA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DAA81E28;
	Fri,  2 Jan 2026 21:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7laiaUMADEL; Fri,  2 Jan 2026 21:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7000E81E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390198;
	bh=JZGIC9BFZMScJXLFFEkXdq0RSULwhZS4bXXRUj1JkcA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RWr0XCzE+M55/aDwF0ybVngx1NQSOYSaruQFCv9VtoNm+j27je1hOAw5yUkHkU/QZ
	 jgx2rQWVt17MQlYMP0M2y6Cv8K1hugQ2yhf2tzPUbfoMuxN/IMlg+/jTExxfym4vQr
	 go1YdRLlNT7/fEHWZu/Qhs/QluXCL6qUQ9j1euqv/cxGvcIZt4jgSttWAOS74975ei
	 dVszHWs1RHqUQ0gMAOQVSz19bt0wAPjyFHrj5lF3EHpm34BbMT6wpXuZ9j9culLbsC
	 v/uWqomjwQnAiYjkdWJ0AU4f0qImTmKFk7puGmm6GOsjJ9gz0sXiOb1TSpUIJBHl4F
	 Cjb6+XB+d8RNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7000E81E27;
	Fri,  2 Jan 2026 21:43:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78BF919D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6929F60A48
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVZiycUyy-ZT for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:43:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D678F608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D678F608D4
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D678F608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:43:14 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-45085a4ab72so6807598b6e.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 13:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767390193; x=1767994993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQEOJ5tSghxLhy9LHeZ8QTHvM+1aw6UIpTbW7AzJY/s=;
 b=MvYRzw9tDM+p35nI6swnAVCBXEYrIwdaFlW0l7lUeMCzOowAKDhPwlRagTBOXcNAty
 unav7wCrFWgvgJqiDKCXvgUp+ESxraPuZ9YizSky4kHElFgcRCAo+AAsKixuObHSE4bU
 wZkOrGF4KFQW4V5Ld4QvYcX8BtonGy3y6NgIp+ys/sXmKuuGhEkrT7oxe364OFk3I8ag
 jWJtYqaoBRLQfPBMwSMWYy+9JnDx4rMF5lb6sDTim4n1U25lsSIgCPH+iETEiIDzHfTo
 ML6W/YDPrXVVBarOrM965MiybykvjGzl2Lxz/g5NB2tIbp4NI6iUXJBxya1ODR2ivlLZ
 ZQEw==
X-Gm-Message-State: AOJu0YwGVPyusJDDgTHsxjtmU4nhB/5V8Iob50JbD5viDIYYD0CRPHdb
 ZB3QORfxsVMjeqE/rTI0ZpauhtKJpoATs4qZ3gJ6BmLhK/2HyFc/ZMhRqBIHioZEvxw=
X-Gm-Gg: AY/fxX4ylg7mB+UkQEejvglyt84djs0ZIgSundAoh6j2HCJGG8cQCX8xjgFFKh0yBn/
 8NEbunDnLKIMIBWBSJxsY0q83ECe8IdkZCeBynKkJeO4BrkGkaXMbC2mf9xen9IL6rIFl16xHOD
 bqLUwyyEWuKGWIaHKcF+1AR0wzmEDNNwfWkgVaxkizbA4KvnpUP7/+QjFLAuWMvRcOWXH6LVJ+d
 wVPvo122AA0Xozn4XApi5Z5adksxUbfmjZR5gnoWmKOR5VnqxB2tb4k8JutB5LDmBaizzpNvd+n
 bN71zOnRM3ygpyIG7IE+9bzKM4xFYXj3fY8VCBc+YKttmlJJ65JjpvHauuuSjHtJBlU08vXg1OR
 hwVTHMzz389YuelxzWJvDEZhROYDjR6W4TYFBDbQAzan5p0vs8+tP2MAW8fhvD/JoajF+K0f0mm
 uBkFA+iJ5fIj5dgXOdbu+EcsVKbqoPNYQAV81ZShopTeX5htPpmwEwv6/2YY39MBOkOkwky7K5U
 rSlBs2t9UsbMS1dNcTksCb17OreIB6S5BVMhOnNGqrk22pDhZc+9o5mwNkPikCpUQ==
X-Google-Smtp-Source: AGHT+IF+yLtrxgfKNB0mlDpUCWAQvEZywr90Q6FwhH9HBYAOOtsFS8rLZ0QXq98QMnzW+o/NKyn3yw==
X-Received: by 2002:a05:6808:c1ae:b0:437:eb1d:cdde with SMTP id
 5614622812f47-457b1fc8fc9mr16486383b6e.33.1767390193361; 
 Fri, 02 Jan 2026 13:43:13 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3cc10e3sm20299192b6e.12.2026.01.02.13.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 13:43:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 14:43:10 -0700
Message-ID: <20260102214310.267633-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767390193; x=1767994993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gQEOJ5tSghxLhy9LHeZ8QTHvM+1aw6UIpTbW7AzJY/s=;
 b=WRYM0vAS8pSBbPQ7HcaKdX1Jj7fHbVK6dgVolpD9KiummCYMw9aTpoIgKSx18mcHAA
 iGJIpLOqq3BvdhEriNWHk6e/hioe6Xu+ye+ScfZadD9yNlnCKW2qUrs0bfkctvOO6g9c
 tx8zt3SOEwc6UXuqWTsidDx7V7JdT7r+HJBla0aSX0E7Lmb2tCg6e1Emjj8yOHhkkXrN
 3dhSnA8kwYHMWEXao6JzmtCaolkCF87HjdHqjs9SLEsevwa9Crx3njpzKq7QpBeKJ3lP
 1xYjq++17ze+gDh0vjXDtIB1PNmYmLPIAAmyQLdDB6Dm5Zpnjge/DBXq9f1zsSRUnWDF
 iblw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WRYM0vAS
Subject: [Buildroot] [PATCH 1/1] package/python-libusb1: bump to version
 3.3.1
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
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index cf270a2d3d..a933e98416 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  617502b66841e601c28c668c20c1d843  libusb1-3.2.0.tar.gz
-sha256  a11a6095e718cd49418a96329314da271cca6be7b4317a142724523371ac8961  libusb1-3.2.0.tar.gz
+md5  f4973afe56c872eb2b8e7a930f566bb4  libusb1-3.3.1.tar.gz
+sha256  3951d360f2daf0e0eacf839e15d2d1d2f4f5e7830231eb3188eeffef2dd17bad  libusb1-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 7d68377f51..10a727a7a9 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.2.0
+PYTHON_LIBUSB1_VERSION = 3.3.1
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/d9/b7/9e833af6cb52fa2aece1c6a1378667ca0172bead14f63ffccc3cb9862df3
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a2/7f/c59ad56d1bca8fa4321d1bb77ba4687775751a4deceec14943a44da18ca0
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

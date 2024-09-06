Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F34E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B61605E8;
	Fri,  6 Sep 2024 18:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUt3ue-nxX6m; Fri,  6 Sep 2024 18:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B622760657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B622760657;
	Fri,  6 Sep 2024 18:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C82C91BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B52FC4018A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myUIM1xDaYWa for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:15:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C0EF40151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C0EF40151
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C0EF40151
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:15:26 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82a3022be9eso98035939f.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725646525; x=1726251325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YoP6MkcS6k5zldtn3BPLLmHi4qRHiFnDNGnaG9oQ68w=;
 b=UPXlsCibetgdTlwJdsUz5155w5lTuj8gdfTx7sKTsRFRyAamK8B53WeeJcBTGPQ6Dz
 CGgpE6z/i7S3x4z31mstc3RLclzOjFY+qzSaJLiYUe58x1zHik9F1LUHxYbgkB4Hj9nX
 7SHCoWVVf/fhzLU7LYswuk7zEtiGGIcqLT5VQ9DLCrt5YWbQhl5xNZVz5K4IpE+rC1V1
 2ACXHltdmJshT8Z6As2gzHl+Q+kyE8v4uNa39n0zi1v5obWHCgpX0D9e7IIwNDYWaly6
 XcOYMNlU43cW02xL5HoQL0OML41TZlay938X+LJAZCj9z8EIpq16avorXn1WcEM+oETQ
 MnSg==
X-Gm-Message-State: AOJu0Yx/y4zjOIItiOde44t8xLmB0Q5TH0E8FM5SxFywf5l1PuYkt7TV
 XdhpxUkrr4pPkKBa0Esuq056H5ZXmjSoZbxPwiTWjTDposEamTncmEDzdg==
X-Google-Smtp-Source: AGHT+IEOhOmwqEZLLCn9K4tHBK276g+VWBNVdonvcMYF5a0ta2phjTxC4RJ9oKk4zRWVEg7NFsxPSg==
X-Received: by 2002:a05:6602:2c8b:b0:81f:cad4:c6e7 with SMTP id
 ca18e2360f4ac-82a96247f31mr375148739f.15.1725646525541; 
 Fri, 06 Sep 2024 11:15:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d07ad4d64bsm736307173.54.2024.09.06.11.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:15:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:15:17 -0600
Message-Id: <20240906181517.4105353-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725646525; x=1726251325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YoP6MkcS6k5zldtn3BPLLmHi4qRHiFnDNGnaG9oQ68w=;
 b=UUNtzHkEFMmMnebK5XAqOZARYJ6HXVlonTjKeRb+bddkbER9nv5XEznmE026t3L4+J
 QCLrAv7daQ1pTgYSSldpPlfj775FNBiY/qL9vAUmNocALagQrlPkBmDviOHU1nRLbgQu
 oZY+VGxTIJnd2oBl8i1aPAyHUANq2hTnokljtCtANssnrQQ8dTQKQtWx568UZy/VoULB
 TPP6dulQ03GlU3sZyxzEvPl6WVekJ/tDjsYuWOAoPf1FkGaFTiF8ATfXWxNywDXHUZYg
 pOFfcbU8ZCCkpvEZcLcUg/L/XwFkuJLt0oJdlLIrm0udTDJQYSs0SGga0Ev3mdA1nX0C
 ng8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UUNtzHkE
Subject: [Buildroot] [PATCH 1/1] package/python-httpx: bump to version 0.27.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httpx/python-httpx.hash | 4 ++--
 package/python-httpx/python-httpx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
index 381439f464..3ffd491c9e 100644
--- a/package/python-httpx/python-httpx.hash
+++ b/package/python-httpx/python-httpx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx/json
-md5  d6035d561136590900678ec6c78698cb  httpx-0.27.0.tar.gz
-sha256  a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5  httpx-0.27.0.tar.gz
+md5  f29763f29da610b185d2ca33937c572f  httpx-0.27.2.tar.gz
+sha256  f7c2be1d2f3c3c3160d441802406b206c2b76f5947b11115e6df10c6c65e66c2  httpx-0.27.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index edba2dbb04..c6a298f192 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX_VERSION = 0.27.0
+PYTHON_HTTPX_VERSION = 0.27.2
 PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
-PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/5c/2d/3da5bdf4408b8b2800061c339f240c1802f2e82d55e50bd39c5a881f47f0
+PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6
 PYTHON_HTTPX_SETUP_TYPE = pep517
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

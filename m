Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4EAD10BE3
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 519C960B4E;
	Sat, 26 Oct 2024 05:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azMqH6ccUrtP; Sat, 26 Oct 2024 05:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC640606C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC640606C8;
	Sat, 26 Oct 2024 05:06:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7980D5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66C8D4013D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81Yr0A6XxeoF for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 263F740118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 263F740118
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 263F740118
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:06:45 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-20ceb8bd22fso21616155ad.3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729919205; x=1730524005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qucgwPEFLXan0r9Nm3Dr2VcbyIbQx0LgEEJ+LUrBuV0=;
 b=khPZjSOcfPsPvCgYwkquVE1er9DilNHBwh0uJf9JaFZS5v7XrpLeLomWgb1lK1ASYa
 cN7hMbcqLPvbJlNzbsj/wOEFT/s8xtEA44JaZ+PO8bEaieSF7OIEaGfr7iKyehrbYgLj
 dTjlchoNNjeLD+xtIORNT2jEUudbUN085f5iu26rdyJelpaAKc/P6W6PQr6skXXsdY7v
 Wvb6yn+MNfkaMQuAR4XJLljNo6PXmlCm3EHWlnuIBhBW09oCbIeMpG6L28NM45ZzrzYZ
 gTNNBWPHzN2DnDq4Q6JiWAksmf2xi0wU/FiLoMZZXYQ+QNJhS4BcrjFQdLb94pbbwuou
 r2Yw==
X-Gm-Message-State: AOJu0YwMuHqQxmlpg4Y1xD925TxEUns3JlUCU2/B5FdmIOWLuiJOzeSb
 qEWmbzahC78ljZuq2fRr9jgg/7DJuXfk66fyuAbGT4ulyKtpNzkRUrGHmuQmXY94Yd7aV8ZAxau
 dlBk=
X-Google-Smtp-Source: AGHT+IFhJ7qguB35PcY4fS/9YfDOiKcaKoFaZEDb8DzfayTrFmHBNsNorziwB/DlMLTnwaDSpHUwXg==
X-Received: by 2002:a17:902:d548:b0:20b:5ea2:e06 with SMTP id
 d9443c01a7336-210c6cd6cb3mr21972775ad.56.1729919204673; 
 Fri, 25 Oct 2024 22:06:44 -0700 (PDT)
Received: from localhost.localdomain ([192.145.118.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc082cf2sm17480495ad.294.2024.10.25.22.06.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Oct 2024 22:06:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 22:06:36 -0700
Message-ID: <20241026050636.49990-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729919205; x=1730524005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qucgwPEFLXan0r9Nm3Dr2VcbyIbQx0LgEEJ+LUrBuV0=;
 b=ADH5rXx14/rMubvbBgLo982LK+MOOYP0NSlSLdON8plENl+YU4Au86fyMahHFSK54X
 JYPjtL2ICCvephQNdwnuSPEsmI5cbknbw3IMSAfKXYkJVt8PYIhuoRKCc3i1Vbw21NtG
 rmAj9p3bEuvh/cKWbDgQ3XIOrC0Cfbl+nogwuUyeACb+4jJQrHMAtyMk8DVyxrLnr1yZ
 cEqac60MiJG+AwmcuPOGYmBzWW268u3lqQ4qud5yKb0VLn3ndBRSNTRVPLVQpi/zGay6
 ZGTA1e8f7PuZ1oKEmHf8LzyMnChIXzh5YvcPE5kynQp4qxQXuSXZFj3KRvEAezsqjc67
 4mkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ADH5rXx1
Subject: [Buildroot] [PATCH v1 1/1] package/docker-engine: bump version to
 v27.3.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a major version bump to v27.

https://github.com/moby/moby/releases/tag/v27.3.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index b72b37223b..2fe19b61d5 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  db02d9b5d98e85284538d6ead43b549c025acf937e98c09d18395bb331c1e607  docker-engine-27.0.3-go2.tar.gz
+sha256  d18208d9e0b6421307342cdef266193984c97c87177b9262b1113e6e9e7e020e  docker-engine-27.3.1-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 268b851520..e3db31a279 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 27.0.3
+DOCKER_ENGINE_VERSION = 27.3.1
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D27C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D73FC400EF;
	Sun, 15 Sep 2024 05:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssDPJRD9pcCu; Sun, 15 Sep 2024 05:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9615140169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9615140169;
	Sun, 15 Sep 2024 05:03:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4D61BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E0F781B71
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc8JuSqhu3pQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 795F881ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795F881ABA
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 795F881ABA
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:03:07 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a09c93db34so2872885ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726376586; x=1726981386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDCZct7dSNKvxgE0Q40gXO9kKxpIBKah+iLPdcpndrM=;
 b=coHNxddwpuyv2Vztv1uYT0kzge1xNoGihWQAuPhc2vXi34i8XVI+sFuPIJNYGtuCa5
 uB81aCaVYpoQvtrrP2Lqk55ywuEG7h4lpd2zsaimcC9Itlpc0BEARZHWgkIDnx96JAgY
 H4bHhSqGfWgDem6DYx0K5gDutJFC/lluHQpCsbTRuYM7JubgljCiilZggSr06aEMonRZ
 bN0otMlXs9cBggKyK2R3cwmGKKwCYCerBtwxgMQBlAH6GiDUd6slQuq7qgqJMeZWJ5b8
 erRxDQFwpKOz+KVO6kLHg0WY4J2usP0B0kVuNUl9PahYWBmXJdposRC/GzB2tDfIJ1Yt
 yLtQ==
X-Gm-Message-State: AOJu0YwLfJpsf3k4qEm36AS3HXDCErkla0+kIyUFi+rzsCLVH6tBQNuV
 0gl4m33R9T9EX5VgYOM7O1pxq/61ljbnYkRYzMXQHaLeIsnSJaUKZBls4w==
X-Google-Smtp-Source: AGHT+IHcTh4Td6RIil7RSXid5XgM/cJJ/7W7nbOS9HQEm3D2qG2S7pY0Ad/5tBaK3i+MD9lS6ZJcUA==
X-Received: by 2002:a05:6e02:20c3:b0:3a0:65a0:460a with SMTP id
 e9e14a558f8ab-3a08b7853d2mr79924675ab.19.1726376586143; 
 Sat, 14 Sep 2024 22:03:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d027sm758531173.80.2024.09.14.22.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:03:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:02:58 -0600
Message-Id: <20240915050258.1409499-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726376586; x=1726981386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dDCZct7dSNKvxgE0Q40gXO9kKxpIBKah+iLPdcpndrM=;
 b=bwi1miCKpYisT5Fwrj9Tkd5XtxeXFJq6n+6LhXML65zK7W6Kwx+dJtqMbrMaxzE6Ra
 J2YYsfjnY0d7rkU/xm1F843Ktjh4OTUl6imWE4o68b7mukv76B07MTQ42t0iIsOYJWgC
 BDnS3ukDqR3ssh0O1VXdM5cnUvAM27RI0WgTtmvVkYdZJRF0AU6guWLg/8Mz1rk6NMDu
 Wgumr8GjQ0DrH85PRTG7zPTVd1k2YS9S80HzQ+gA1Eb9I5ui/YX9hM/JwLz2Er060rQy
 eCQuVXax8EhT7LLeXMR0bdJ1XzB4jqjD3WmjYi0NOR76CQ8aFCI0oE+/AP1DDvFzvp2Y
 aIHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bwi1miCK
Subject: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version 0.19.0
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
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index 382cccd47c..c523553657 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5  cbca26ec29cc50e32e8b070aa2ec0786  ecdsa-0.18.0.tar.gz
-sha256  190348041559e21b22a1d65cee485282ca11a6f81d503fddb84d5017e9ed1e49  ecdsa-0.18.0.tar.gz
+md5  3c9234e8b57eea26d88093f18d2aa358  ecdsa-0.19.0.tar.gz
+sha256  60eaad1199659900dd0af521ed462b793bbdf867432b3948e87416ae4caf6bf8  ecdsa-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 321e87e0a3..8fa2c431bc 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.18.0
+PYTHON_ECDSA_VERSION = 0.19.0
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/ff/7b/ba6547a76c468a0d22de93e89ae60d9561ec911f59532907e72b0d8bc0f1
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/5e/d0/ec8ac1de7accdcf18cfe468653ef00afd2f609faf67c423efbd02491051b
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BEAC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 17:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582B36087D;
	Tue, 11 Jun 2024 17:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKAbI1LFYvKY; Tue, 11 Jun 2024 17:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C0006088B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C0006088B;
	Tue, 11 Jun 2024 17:17:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F59E1BF38A
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 17:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C5A4406AA
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 17:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ftK2vjVvq_8 for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 17:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E87F2406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87F2406F3
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E87F2406F3
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 17:17:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so1725984a12.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 10:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718126237; x=1718731037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Y//pOizqkGLVOVy8vuECFkw67NJMn0cpGSR7cU9nqA=;
 b=QCDG1wRszpkiBTvnsUf8uZ5+dG8hheiZakX906Wr8GGQckU1LBl22fkh8Y556BBeox
 050lYHZm1gHcKXFwSj1e05/kXP5hTaOTNfMWwQknQzE/O3EvJN86AS6uB1T5Rb+yNAcw
 0V0vue98/R75mhzXTlYColg+LXdCysLDqaJUV3Ud92CeSnSoN1/D0778vkGRRWS4tgGz
 +f1hTByF6lYxDBi8WGLpvBB1HlzwpLcRzT0j92ycj15MuOX/uixNAA+QKCkevPpXk8WS
 mJfazONd1ATR5l2g0tVnxSuyFH7q2Vf98BBZum686Fg8bkBTBDiGjYItRiYMBluIi1MU
 tcjw==
X-Gm-Message-State: AOJu0YwiFeifb5qxA7qYQbUQn8xYLRX4OyZJKTiwH7mTr88Nt584+qv3
 SeBo30dx6AqElC8l5H8fGcj8MBYf5QLQcMazcquUkxbiwbXhdY4MNq6tO7sZxg+f1NV486qOAz4
 w
X-Google-Smtp-Source: AGHT+IHlQjWPRQXaNKUS4ojLG2dVPYFn0ph/eENyNIwPd18xuKQvgS3g0NYlOgad8vL2ITMKNBAqPg==
X-Received: by 2002:a17:906:3285:b0:a6a:b1c7:ff33 with SMTP id
 a640c23a62f3a-a6cd561b427mr774189966b.8.1718126237497; 
 Tue, 11 Jun 2024 10:17:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6e89b5ee63sm591960466b.122.2024.06.11.10.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 10:17:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 19:17:13 +0200
Message-ID: <20240611171714.3233115-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718126237; x=1718731037;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Y//pOizqkGLVOVy8vuECFkw67NJMn0cpGSR7cU9nqA=;
 b=oaUusVSRaC1xAvMAQ8yPgC4XRFyCmiyN8D9U2bJgcFLkm2A0PeGTM6J4dWo7y1tq6a
 npXQ/7fIJzmmjfw3/2NKAiqayyxAcoTI1IrPKsxe6DsuY7K1vJFVW0RsiWHE6YOK+9Mx
 CWCVU/mUJgEN/zLXhFscPhSSt1iRN8iU3xlRA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oaUusVSR
Subject: [Buildroot] [PATCH 1/2] package/snappy: bump to version 1.2.1
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/google/snappy/releases/tag/1.2.1
https://github.com/google/snappy/releases/tag/1.2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/snappy/snappy.hash | 2 +-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index 729d696d7e62..0439ca8a7ef2 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  49d831bffcc5f3d01482340fe5af59852ca2fe76c3e05df0e67203ebbe0f1d90  snappy-1.1.10.tar.gz
+sha256  736aeb64d86566d2236ddffa2865ee5d7a82d26c9016b36218fcc27ea4f09f86  snappy-1.2.1.tar.gz
 sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index c96dff35fa01..21c76cd50da2 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.10
+SNAPPY_VERSION = 1.2.1
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

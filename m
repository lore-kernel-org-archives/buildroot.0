Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041FAC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0209403CD;
	Mon,  1 Jul 2024 17:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tS3WERSehNWr; Mon,  1 Jul 2024 17:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 557FA403EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 557FA403EC;
	Mon,  1 Jul 2024 17:00:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 524661BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F80960740
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxiegtKoCPNG for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21A88606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21A88606A5
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21A88606A5
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:00:34 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7f3cd64e71cso95184439f.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 10:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719853233; x=1720458033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pqSJjWxK/PSgQlch1gTgM3zIa/mIKxW2Q1P8mPKGVyE=;
 b=hbHUBlc4vGkq9iFJYFhylK9Zx3moY5RszM54+OU6yQmJ4WdMP/Y7efzUzIgUrVUOgk
 JKS4myJwhdpdMLQP4LtCu1+thHwz7N+fITeA0pazKq6k1FOog4Y1Ie5BLIT0pYSniRh0
 uFz5pyZaWwNceGgzaE4KPOHaf63zmmwckIohtDoHq+d+Eo0M1Qv1qUP6SUVF3aF13sfO
 69a7weeZuE03ReqGaYorbIYYBDd5VhxxSI/WmhLxUKXBJezlgYBmkhEsUEorUupm1dWC
 Z92VM3qppFVwp15mdxaO/wmnojem9pggJxYT4EOhd8Jm2SOdftn9ssCxJxInzjf/4lkR
 tgbw==
X-Gm-Message-State: AOJu0YwQRw1PKUX7oVZEtzNtFcf57sZJXye3MNwsyrLWixTg9YcbYX6U
 /V3u+Nqr6U5Bd3N1nbwlsOlRdrAxG7ORcCLh6d5JHJz1tPzA4sf2U9A7Ig==
X-Google-Smtp-Source: AGHT+IEs3MgAL6V+r2PDm082VUs7nSQes77YLoOx5X/0LSh0MWrasaF+qVEWaDfsNze8XBImdwZqjw==
X-Received: by 2002:a6b:7215:0:b0:7f3:d2bb:790c with SMTP id
 ca18e2360f4ac-7f62ee0c400mr729461139f.7.1719853232772; 
 Mon, 01 Jul 2024 10:00:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73bba3c2sm2281721173.29.2024.07.01.10.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:00:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 11:00:30 -0600
Message-Id: <20240701170030.1634175-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719853233; x=1720458033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pqSJjWxK/PSgQlch1gTgM3zIa/mIKxW2Q1P8mPKGVyE=;
 b=N3qZQ4Ytwlt5GStKb5EHruwWEC5q8ygo5hjyJFB1xTyr4cJETLFXkmcvdfLurcThpL
 bcR9mcBuHjd0WbX9Qx2+PnNluCAtUuefgAFz4xi7XiEWFmPvMKsBjedWXTUHNK4SnLk4
 hyhBcXfecArcdKdAk1C27onHdEbpIS1fmvTu796owE+yO/jaWX0ZDiPX4GF10caq4bpy
 QRq8+B1klPWBVIq94Pj+YBACPVsDrCeAV+NmDakrbLbPQW5ujf3iup4cgd8l/v+bcQqm
 o4a/D0Zm4yAl4S7vhaC74DkYQYxAIDXVROkVfqBnGEfzfm8RPW3SC9ALSAeUhHJLmRKP
 HgfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N3qZQ4Yt
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2024.6.2
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 48e25119e5..0bb4a4fbc4 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  5a41f94d681748e76675f3cb4a7d517e  certifi-2023.11.17.tar.gz
-sha256  9b469f3a900bf28dc19b8cfbf8019bf47f7fdd1a65a1d4ffb98fc14166beb4d1  certifi-2023.11.17.tar.gz
+md5  d138c6217784e19cda28770b003ab23b  certifi-2024.6.2.tar.gz
+sha256  3cd43f1c6fa7dedc5899d69d3ad0398fd018ad1a17fba83ddaf78aa46c747516  certifi-2024.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 90aabaa1ac..1c5d4d262d 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2023.11.17
+PYTHON_CERTIFI_VERSION = 2024.6.2
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/d4/91/c89518dd4fe1f3a4e3f6ab7ff23cb00ef2e8c9adf99dacc618ad5e068e28
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/07/b3/e02f4f397c81077ffc52a538e0aec464016f1860c472ed33bd2a1d220cc5
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

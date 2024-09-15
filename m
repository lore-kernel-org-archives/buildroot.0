Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42152C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC3D5405DD;
	Sun, 15 Sep 2024 09:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wCMdQ0nfvP7; Sun, 15 Sep 2024 09:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 978C7405DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 978C7405DE;
	Sun, 15 Sep 2024 09:08:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC5B71BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B98860674
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4kGWIBrb2-b for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:08:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93FA860621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FA860621
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93FA860621
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:08:55 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a098e1cf45so6917795ab.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726391334; x=1726996134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yblWM/tFbawUUXCmXqPL6IlMkNDHkUtT0msDwFzRaqo=;
 b=OH26RfndOcKRB9kFGqqyzVGhW9vPrePvMJ17Tuw9xwm/5iNSME5zRPjy0BgWhv1VtV
 imK2Zbnd2mLyGPHFxOQwUNtHQ5Z/aUfLcuRlxQbJObcXHz+OnJsfUrwJpooRGDcDPs+y
 zKs8VeAVyMi1rdSGJH2NHNDE3djbMT/EjFmSpd6xipyAQ+mdjyB2b+uqE2CkJJUSNRG8
 sX8JNJ5nClrBhZXTkXJnQ7kaJWQUXE/AMM4CEO9Nq2a0resuJR2npj2IbfMcjWdLN4Ic
 txwcCnG9Gh4vEFUsGjmCLMYaCikAveX8YqHccgQ55XMZ5G42a1hKtkDDmg6l09YQ8Nm0
 ZjIw==
X-Gm-Message-State: AOJu0YwxmHcdWdx4hj37B74yFzXOTvMCzEtIhsBDoZJQ4KVDZTJ2ZkaL
 y9M/FZTruT2UXA7E4rf5xreFzi7ZkEPdtcrc2njvuDosZnrk+dvRTt1bnA==
X-Google-Smtp-Source: AGHT+IEV5gbJMSFbC3V2NH3Ok5RA7biAgGUT0e3uFoXf6PwdBFyvwcN9TvIDSDMt/1Skg8qTDr5m5g==
X-Received: by 2002:a05:6e02:20c3:b0:3a0:65a0:460a with SMTP id
 e9e14a558f8ab-3a08b7853d2mr82155045ab.19.1726391334221; 
 Sun, 15 Sep 2024 02:08:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8fcf5sm9330925ab.83.2024.09.15.02.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 02:08:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 03:08:52 -0600
Message-Id: <20240915090852.1586629-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726391334; x=1726996134; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yblWM/tFbawUUXCmXqPL6IlMkNDHkUtT0msDwFzRaqo=;
 b=MLkztVTQ4MhrmQKix69UlJM0hlvOKBYHLyu3LVsOYrCUHZ7nyUre94fhx4VVRfcVVJ
 G7PVchq0HGz33P1+B7eoOr7ZdGcUv3hstHpjYhEM9JvqJCEpzSR4VTRuwP1OpUmyIyZu
 KZxrtf0UjzwdH1nYIZ9ZK4GEiRSxieyOqJ/P93RZA4PetvDoE2OOywH1gPdhWPvsrDQA
 8g8fw8NqDuvLv+bigv42AM8XRGJi2opsxJ+/MFV2nXJ68vvbOeVQj8sr4skeLp6pJhcw
 ug2pNIThPI+I/DjmDuwKPePb/3kcjBcCBd2F6XTsN9Yv/zmviwjPRKHZxCJDUCFwu2Un
 LZ5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MLkztVTQ
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-collections: bump to
 version 5.1.0
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
 .../python-jaraco-collections.hash                          | 4 ++--
 .../python-jaraco-collections/python-jaraco-collections.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-collections/python-jaraco-collections.hash b/package/python-jaraco-collections/python-jaraco-collections.hash
index 0308d48641..d3d6742f0b 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.hash
+++ b/package/python-jaraco-collections/python-jaraco-collections.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.collections/json
-md5  2b12f44216432f1ce2ead377fd7a2b93  jaraco.collections-5.0.0.tar.gz
-sha256  1680e8d09f295f625c7ba926880175a26fdbe7092b4c76d198e30476b21cfe68  jaraco.collections-5.0.0.tar.gz
+md5  33a136eb3dd4c36090270ea2d4d43e7c  jaraco_collections-5.1.0.tar.gz
+sha256  0e4829409d39ad18a40aa6754fee2767f4d9730c4ba66dc9df89f1d2756994c2  jaraco_collections-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-collections/python-jaraco-collections.mk b/package/python-jaraco-collections/python-jaraco-collections.mk
index 1400e286ee..3414799f44 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.mk
+++ b/package/python-jaraco-collections/python-jaraco-collections.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_COLLECTIONS_VERSION = 5.0.0
-PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco.collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
-PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/e6/85/9c4ab9772bcc2c9b4beffd56aca70f646e4a1f3a576579fa401d742b46a8
+PYTHON_JARACO_COLLECTIONS_VERSION = 5.1.0
+PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco_collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
+PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/8c/ed/3f0ef2bcf765b5a3d58ecad8d825874a3af1e792fa89f89ad79f090a4ccc
 PYTHON_JARACO_COLLECTIONS_SETUP_TYPE = setuptools
 PYTHON_JARACO_COLLECTIONS_LICENSE = MIT
 PYTHON_JARACO_COLLECTIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

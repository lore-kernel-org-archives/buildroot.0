Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876B3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 00:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A35560C1A;
	Sun,  5 Nov 2023 00:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A35560C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLasFSAUUB5u; Sun,  5 Nov 2023 00:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F18560BFF;
	Sun,  5 Nov 2023 00:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F18560BFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF4271BF584
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B813F60BFF
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B813F60BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yTaO0EfySCx for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 00:00:33 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 734F760BBF
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 00:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 734F760BBF
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-357c9dc1068so8553755ab.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 17:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699142432; x=1699747232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=im8QFnjAcuGKnL510/mCEWQupq08TpMIr+bORIENhHc=;
 b=ZNj5VPmVnrQ0+x8SFh74/sKsBgHclf5fV2PrPtqiXHLn4vthE1I9ycuk2v7X9fgEZ8
 j5bQTLpedo0LPVzMIzGlwlGuS8b6QtPjcEIL0fRo2z+djkyqePZiTASTx9h4HNFuF0YL
 FTsg29j3cX6izimRcbmDAeKl8VrnDPgsTjaAhZkCX1HjxlLuq1xqiIQHG1s8u5TrnnVk
 ZfgbytnmRZ4gPGKRL82zoctaa8v+wka3apZc2jQwjjnEV+6K7agEcrHtJB+lpQfHjRX0
 DZFarsmIIq4llsT7Il2bh/uV9oj1r0q9zdMgRSXunAVLiVPaSzcT/hZiRzFkpju8X4N1
 zd4A==
X-Gm-Message-State: AOJu0YyGlE03NkDVuJN/3xXMkt5SAsitN68z/qQ8kHGM3ykdls8zt6js
 PCNX1d27AgJMQ0ryhf2adGs0x4yRDI0=
X-Google-Smtp-Source: AGHT+IHO3f5RhwGPAghU1cnJRyDx8gM0HbFOHmag8l5ty75Bob2PwakO7F+TFTFlR4oACY4Hg9IfVw==
X-Received: by 2002:a05:6e02:180e:b0:357:4779:9dbc with SMTP id
 a14-20020a056e02180e00b0035747799dbcmr7412156ilv.10.1699142432031; 
 Sat, 04 Nov 2023 17:00:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 k5-20020a056e0205a500b00357fc1e2ffesm1524632ils.23.2023.11.04.17.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 17:00:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 18:00:28 -0600
Message-Id: <20231105000028.2698957-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699142432; x=1699747232; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=im8QFnjAcuGKnL510/mCEWQupq08TpMIr+bORIENhHc=;
 b=OL5mniuPutCMoWCwuJCXOjgcLIdMZwe2b0qfaBqfpEP3fbzp2UsahbNOfc7onNpRMt
 +NYuzBx9dnblbz6ut3FHpXrjMofjnctB3Yd6qIG0SJiYczKvsE7DyR7AAHKv0VIdD+NC
 ZJiLaFQAem6zWU+jAzMyv+zO/1fyngJAFhRty8npjEPHMiTThuX0hWMevzxkYCFqab+L
 TML/GoX2WQiCTOp6FKn+SA+00E3qNUaxILuWt6EtrwqUYLn5NBbXH+Kt8i+pY7uT3ENG
 Ez47CffENFaJkdbN32e3Td+/mw6tsy71LDoMBvl0bL5iH0rvYwINRG13rzRvLDSvENYP
 COaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OL5mniuP
Subject: [Buildroot] [PATCH 1/1] package/python-argh: bump to version 0.30.4
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
 package/python-argh/python-argh.hash | 4 ++--
 package/python-argh/python-argh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index abfcec98f3..8bfb45d1c3 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,6 +1,6 @@
 # md5 from https://pypi.python.org/pypi/argh/json
-md5  d51d4ed7d82ce24a981169074f3e64e1  argh-0.28.1.tar.gz
-sha256  b2093086f0e809a3ecc24b64a2145309ee8f56d034936cd59e57c558a357329d  argh-0.28.1.tar.gz
+md5  7001dd9ff619cf1422ddf8bf813bd08a  argh-0.30.4.tar.gz
+sha256  9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960  argh-0.30.4.tar.gz
 # Locally computed
 sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index 82cef822e9..ccb9f61d48 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.28.1
+PYTHON_ARGH_VERSION = 0.30.4
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/bf/77/6758074453c83c7ac0456d397e95aaa91b33fbd2ec977dcf38be736ea177
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/37/3a/175f4a2c47e8c20e59cf25fe69546f76cf1196251a377b182e8f4542b4c4
 PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

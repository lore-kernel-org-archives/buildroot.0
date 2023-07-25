Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C024C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2568381F30;
	Tue, 25 Jul 2023 14:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2568381F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFhdBacWeBOV; Tue, 25 Jul 2023 14:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7C581EA5;
	Tue, 25 Jul 2023 14:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B7C581EA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8BC41BF588
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 926CE81EA5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 926CE81EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_MKhrhfnqpl for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:21:23 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A955E81CE7
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A955E81CE7
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7835e5fa459so210047139f.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690294882; x=1690899682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p8fcBo7tjGZ0Y9viKsZ9qruBOOd4ABedlcj66CMQsQU=;
 b=kIfJaxzLiJlT8yqEXh9U4XiebmYkO680c/KQppuiY9NMqIQuicAP8JI0c+1vKWbfoy
 /Yd4Ff+PPI/i4T53lQv3PvXstIgzk81XEkMF4/xKklSgf/PATbfkDx7N6mJtXrUKQyJx
 advSKA3TvLpcky9ZmEiKlAlzjODSPLCYikwgQMtWR3glHCMHJEZ3lol+R5//qoP4uSX6
 mQR5IZf2p3W5KHHEvbY+ThduNn9wT22EG3+TBF4ICYyGPvmnu4E2tznk11c85M97IRa+
 gNju4wbpsjC+iJxPLzx1wdDcEDinaZfTX261cESfI/adJVvgqJ9bs8hm2mj5CF4GhYqF
 V/Dg==
X-Gm-Message-State: ABy/qLbIx39lNyIHJGKPRZz6pBnzPtz995hQiiPZQrVME39et+TXcRbp
 2eS/Zes8b2JLiWgPallXEj/2X9jvkyg=
X-Google-Smtp-Source: APBJJlECc8VEceopULCVFoESUDY9O1oQo8tbEsbAE0fKOSR29/Hf2Mdqs+vT/BbwuAvanus6sWEzyA==
X-Received: by 2002:a6b:e511:0:b0:787:8cf:7426 with SMTP id
 y17-20020a6be511000000b0078708cf7426mr3409416ioc.6.1690294882272; 
 Tue, 25 Jul 2023 07:21:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 q28-20020a02cf1c000000b004290f6c15bfsm3684341jar.145.2023.07.25.07.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:21:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:21:20 -0600
Message-Id: <20230725142120.318785-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690294882; x=1690899682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p8fcBo7tjGZ0Y9viKsZ9qruBOOd4ABedlcj66CMQsQU=;
 b=KG4/hiTwX8X54hPHXcwb7s3GS5RY+kBnojJLT1iLXCroVdpw3cEVDGVCG4se5Z/LUS
 sxiZX3c1j6PgEH4psXu8hK2CB4e4tYE8jxDfNKbKDAB+VorkundMNG0tuMJIj5eRdYmw
 X9s4MPojOQaPrP912yLtCgoAzxeRucCGXYrMoJxYWTnnyihV4hIhI1aZ+UIzFnmQwQyG
 NlzMAnOcuIINR5ENq/lbjwc0yVFBc/86Fobi588v8Ehi8A0eKUldLB8VGeUEwj25chlu
 eEokMfydJ9HeTznzU13lyaWBFthBu2H8qH8RuHJ0QoLopquA7CpL4/m0ci83cqgN7Tr0
 0k7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KG4/hiTw
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.0.4
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

Migrate from setuptools to hatchling pep517 build backend.

License hash changed due contributors change:
https://github.com/urllib3/urllib3/commit/8e94754f85c59d826ac0604d0dd2a0b41874bb36

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 963967332e..2da7abdf29 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  38f7d1589aa9720101316d07fcbd05c8  urllib3-1.26.13.tar.gz
-sha256  c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8  urllib3-1.26.13.tar.gz
+md5  5d541b944febe50221e24c31cd6e887d  urllib3-2.0.4.tar.gz
+sha256  8d22f86aae8ef5e410d4f539fde9ce6b2113a001bb4d189e0aed70642d602b11  urllib3-2.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
+sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 5868927440..7ff58d9a4a 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.13
+PYTHON_URLLIB3_VERSION = 2.0.4
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c2/51/32da03cf19d17d46cce5c731967bf58de9bd71db3a379932f53b094deda4
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/31/ab/46bec149bbd71a4467a3063ac22f4486ecd2ceb70ae8c70d5d8e4c2a7946
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
-PYTHON_URLLIB3_SETUP_TYPE = setuptools
+PYTHON_URLLIB3_SETUP_TYPE = pep517
+PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling
+HOST_PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

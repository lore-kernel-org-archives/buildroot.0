Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC5AC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D951B81F06;
	Tue, 25 Jul 2023 13:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D951B81F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAixErdzcpiG; Tue, 25 Jul 2023 13:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 215B881FC1;
	Tue, 25 Jul 2023 13:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 215B881FC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4713E1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D106418A3
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D106418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZDNDyNXZirX for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:45:43 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08923418A2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08923418A2
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-783698a37beso307629639f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690292741; x=1690897541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=anF+LelZ8UOxkVj1tyl9mn8r5NxoD+DWKHKaDa6kxRA=;
 b=RIUdTiTwYet1LGpfyZ0zgxEyxD5X0SIr6QtjLZHeU2vk91t6HBT2tYwQFwYSgbZ1Ql
 z/SYWC9SoiFzKFUH1U1c4UeqH+HWOcYzugJwsaz8D0mXIdujJuLgSpCgOxhMkitk5p0i
 iBeH9UwP8CbI2foTDOEtGXyRfHTP6bx+xlQUp92gxaTJDtikD4TN8w83YUehCvoUafkl
 qMn29j4BH/Toa3e2K1MakihSg1BCM+YE7MK84tSV1T6aT1P/NdzcDO17tiIq94xB/TZO
 p+pQXtBRKw3J5eCKlqQOgF9X2S8YOjg2p1J+68w6hx+5toCJwSYucumlJoETCDowyIrI
 JDlA==
X-Gm-Message-State: ABy/qLanKLxIFwxmhbiCFXaMxfh7vzlf/MSVVGDjMsmqSVIw7h/j7T3h
 /YS9V+quPL/IkvS6v0M6iRLB+VJqjO8=
X-Google-Smtp-Source: APBJJlE6YvcgcYlVNO/IjP746EhbaVfU8rD+x+Lh1/xJfUDzk3ajyTOipsKybXoPY8YQOgGB//doSw==
X-Received: by 2002:a5e:a601:0:b0:783:5452:e335 with SMTP id
 q1-20020a5ea601000000b007835452e335mr2882448ioi.6.1690292741639; 
 Tue, 25 Jul 2023 06:45:41 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 g17-20020a02cd11000000b0042b326ed1ebsm3728163jaq.48.2023.07.25.06.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:45:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:45:39 -0600
Message-Id: <20230725134539.279482-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690292741; x=1690897541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=anF+LelZ8UOxkVj1tyl9mn8r5NxoD+DWKHKaDa6kxRA=;
 b=fASEqiBepLy88NmmCzAszCpNAsIwS3WuaJMcyaHQF4RQyvYTrHw7AG1OitrUK7g3kJ
 E1wWqRgPJIMxeffoEcDFVLHDtsrFNovnplgUerryJTlqFJyF3jzPwWHGUzNgdMr3BUzO
 TZGBVvQMa2kWriEGNfuUN/nw8xsvwwROxGgwfmyRAqg7OpS1RuT+Wh6W5a56FfT/VGII
 NgZvvEB6lUB3ukzCDfScnriTFn+AD8y8aG5g0x+IImP3CQXRw6APw7Wehfw4Eq+ScuUs
 DbAGqO7mw+cSR5/GHVBFhF8SygWmc2sEeY1trvYqZsY1/HTKPeSXNkC2VpGEKcorlXl6
 FRpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fASEqiBe
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.4.0
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
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index 04a3a44e89..466dd6931b 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  14e9ffd849c6a1dfa3c6b1fb1ff77b14  frozenlist-1.3.3.tar.gz
-sha256  58bcc55721e8a90b88332d6cd441261ebb22342e238296bb330968952fbb3a6a  frozenlist-1.3.3.tar.gz
+md5  4a14df2fe30853d9e18f73002493a860  frozenlist-1.4.0.tar.gz
+sha256  09163bdf0b2907454042edb19f887c6d33806adc71fbd54afc14908bfdc22251  frozenlist-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 88833b0465..10c6bc6314 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.3.3
+PYTHON_FROZENLIST_VERSION = 1.4.0
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/e9/10/d629476346112b85c912527b9080944fd2c39a816c2225413dbc0bb6fcc0
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/8c/1f/49c96ccc87127682ba900b092863ef7c20302a2144b3185412a08480ca22
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

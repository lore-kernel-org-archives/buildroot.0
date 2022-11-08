Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E33C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 22:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 040C581E2B;
	Tue,  8 Nov 2022 22:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 040C581E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJTL53wV4GJI; Tue,  8 Nov 2022 22:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F3081E27;
	Tue,  8 Nov 2022 22:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F3081E27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 151701BF5EA
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 22:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC9DB60D93
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 22:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9DB60D93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVVSgiKwKuC2 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 22:02:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB27660D60
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB27660D60
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 22:02:02 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id 63so12591034iov.8
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 14:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IvLZrrAcG1YlpNwRgzvOngft8SpIViG4jv6bKFGWeTo=;
 b=pRXhg/SIqcuLSoGrbhEgs2Fo/cVr9ss8FJScHBIe8G3aCxrdXP6RN5xjUo8KAfGDnl
 3gQ6E56XMJIeB3aUhJyGOiqXJGFhgd/o+WfFnEUueAX41FLCWsrtJHk0/aSmvziq82c0
 4Vaoqa5R6ujNelK0gUg54UsmRlPsgrz+7JqeujEWiHUd6udtIT4InJlC07lKASDpLAN0
 A73Vveup3ymLyQuDOe2sLpgRvC6IHZE27hW3EDRrOamGEXkbDZx6m78J8aFSmNyzvKcF
 hu9v8otpzScA6liAucSb+RydYPrPELdPFS0b4wW6xzQ0jGVVJRAU8zHZ3x4h/KVpg3uC
 4/NA==
X-Gm-Message-State: ACrzQf302R8QdodtkALaSY2c9UyzeRPmktyDQt9mlwOYWS8CfrY8BBIO
 q3baD5jZ3UCMpphuQffiDrOyTmvabDJiHA==
X-Google-Smtp-Source: AMsMyM5HP6E8jUgSyFnrJ2TzMXXoEQGpRv9ORS+Irc70gAEOuPGkWzjKNDCTcDay5w76+WJ3PLuzNQ==
X-Received: by 2002:a6b:c3c1:0:b0:6d8:9ec2:40e0 with SMTP id
 t184-20020a6bc3c1000000b006d89ec240e0mr11657915iof.0.1667944921404; 
 Tue, 08 Nov 2022 14:02:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 j14-20020a92200e000000b002ff32b2ab1esm4185920ile.1.2022.11.08.14.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 14:02:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Nov 2022 15:01:59 -0700
Message-Id: <20221108220159.3567657-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IvLZrrAcG1YlpNwRgzvOngft8SpIViG4jv6bKFGWeTo=;
 b=aqDqk9LAOkd5Ltj6d/0ljlG9+LasKXBMShXZc5LCkZip52lzDH2zlS2ElblIjA37x6
 K+OLmJzxNZVl2cIfTBp4WJfCEbYbmLhKP+fi1T+omfgAxF4E/H9DSt0e6MDL7IdbrQNy
 Y4OweBnNwIWE2EYumzk7v+tX3wz8qpJgiXkyCel8q6BqPBshqJfow+wbgPccEdpviwZC
 7E6GwVSiFHbrz7lOctWavmRdHlQYHHm5vOWC4ZuOJigWT1KE7IxPP/K6LA9vBsYkvnPM
 K5JVfwUbVvdufmathfCSBzhfFflIJ8YXjJhxic7WeHqkExpcECVNosKBEhjkjqaKFVqJ
 U/zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aqDqk9LA
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.3.3
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
index 4d1ac3b411..04a3a44e89 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  6ac017ba79ac7a1491e47e89012efeab  frozenlist-1.3.1.tar.gz
-sha256  3a735e4211a04ccfa3f4833547acdf5d2f863bfeb01cfd3edaffbc251f15cec8  frozenlist-1.3.1.tar.gz
+md5  14e9ffd849c6a1dfa3c6b1fb1ff77b14  frozenlist-1.3.3.tar.gz
+sha256  58bcc55721e8a90b88332d6cd441261ebb22342e238296bb330968952fbb3a6a  frozenlist-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 51b5d42832..88833b0465 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.3.1
+PYTHON_FROZENLIST_VERSION = 1.3.3
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/8a/95/229aacfe85daa28e2792481a98c336bc30d3729533e6a44db537880aca21
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/e9/10/d629476346112b85c912527b9080944fd2c39a816c2225413dbc0bb6fcc0
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

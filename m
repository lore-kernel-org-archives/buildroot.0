Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89FFF81EEA;
	Thu,  3 Nov 2022 14:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89FFF81EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7CZHkHZ79dE; Thu,  3 Nov 2022 14:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD3EA81EE4;
	Thu,  3 Nov 2022 14:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3EA81EE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6F561BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928A360FA2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928A360FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwFaO5vPJ6vj for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:36:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4072160F9C
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4072160F9C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:36:46 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id q142so1470819iod.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UULfIZIJK666sYlJkScVPimta7UJYC1CbIG14fzsDiA=;
 b=CckQUpAMf9Og5g3offz0Yyp7v+zOKdGpg6xOwUbRAIFlmKp8S43FSnu5uGXJGyUZK8
 4NdssH57g+ZIEB1tgenfgPRkpjLIq0Mm6T1yM0GD4L5A7ixBf4GHjdRKa5OMwrQggoHN
 +ZwyhpFaUUge+C+eaxdHyDdghEH42Fn9IiGuaMFNEmG5GQ7O7f2Y7qkRfAS/2AY0zQUh
 5wdCqZsEbFGlzBgKW4MzeWTPBx0tg32SvukCdIWdrhMOusapZzLDqdDwmXGFwhUFpxa2
 3ATqpIWsv8cqAJalC/bXauY5rPD8qC1bj9hGQfP5m3sZGjCVeCTrj7delhxHX/m05oVY
 ZOdw==
X-Gm-Message-State: ACrzQf1/58xNxNd8BCoXEoLPQQGSO2Nmb3inpjtfHoxuz0aIjHPCYDFt
 Dms/8QykhSSKIRLf4iLbw3Lp3p60AP5yztGx
X-Google-Smtp-Source: AMsMyM7zWjdhkuQ5MDYqWB9gvDFQJpv1rTWs/oz/sxlA6wqCbznDEQGTeGwKle9JY+/jvXF1w4Fjxg==
X-Received: by 2002:a6b:3103:0:b0:6ce:e628:dba9 with SMTP id
 j3-20020a6b3103000000b006cee628dba9mr15795088ioa.151.1667486205018; 
 Thu, 03 Nov 2022 07:36:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y1-20020a056e02118100b002f9652849f6sm356448ili.67.2022.11.03.07.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:36:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:36:42 -0600
Message-Id: <20221103143642.2186317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UULfIZIJK666sYlJkScVPimta7UJYC1CbIG14fzsDiA=;
 b=Y/SiL2IR98mgSpLoPwKXsYL0fgZqXllriM1DxAi01jTK5d/EOPULmjJEZX8ci+RGEm
 +PGNCweQdCRbyFGs7AElYR7f9wXZFjbmTmAvgj7oLRP2uF0/AFFb884fajUahviSvGeL
 l5klXfbgUfPyUX0mR+XvFTNXfdGCfFVGOw2jBHUBq+dRv8BYLsIDEoWsg9p5ajxU7WyN
 7EUJx3KNSyoLvVutDJnVn7cp/6DBIF9dp7h4BrrZpht+jMBOL0OLLusTvnlNrkXGyQ2j
 LRRsbmJiolcWKvItY+S1zanCEPpXCfYFRGrDgYfdhBN/kuFLaHD6KXuiDjhTGa8GOaob
 pJAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y/SiL2IR
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.0.0
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 9 +++++----
 package/python-pymodbus/python-pymodbus.mk   | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 8e60d94e62..b5243567b7 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,4 +1,5 @@
-# sha256 locally computed
-sha256  088c7ece2a11cad652939719695c457f26f9148cd7d2f4a79872167925180ad5  pymodbus-2.2.0.tar.gz
-# Hash for license file
-sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  doc/LICENSE
+# md5, sha256 from https://pypi.org/pypi/pymodbus/json
+md5  25a8724539d0eac1b09d9b41812d86f9  pymodbus-3.0.0.tar.gz
+sha256  37c9b6f3e5c82f39ee42047ca48cbc9fd0c49a6731126789500191e9deea6cbc  pymodbus-3.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index d96e21a55c..2ed7e94afe 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 2.2.0
+PYTHON_PYMODBUS_VERSION = 3.0.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = $(call github,riptideio,pymodbus,v$(PYTHON_PYMODBUS_VERSION))
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/0f/5a/50e9492f98ef911af18c2b603bc003fef726e84d22bac2ce6e651643b29c
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
-PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
+PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

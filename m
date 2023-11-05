Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEC8C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 08:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F5B9404D3;
	Sun,  5 Nov 2023 08:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F5B9404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeLvkcJpGKt5; Sun,  5 Nov 2023 08:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBFF9404DB;
	Sun,  5 Nov 2023 08:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBFF9404DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6E701BF588
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD07382153
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD07382153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOsPqUE6jxsf for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 08:10:52 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBDD882147
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 08:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBDD882147
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7a6907e9aa8so130902739f.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699171851; x=1699776651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JQs4vnfO+XYdyntKUq1+iAIDrooS61c49mh5pK7M64w=;
 b=gAxXlloVD/Yw+A94y4UjNj+QmQUyTcvEomr8ecJEuAiFHJkfn0PIb62hGswNzsVquQ
 XbqSdDPvlFs9fR0E0yDkmZX6YtoLJeDrD2/FmnjnWSp8sS26s4RKO4i4m+AUaSBnOF9Z
 k5oWxRR6G91DBqSsttuNG0pEWgEHL4rM4GcH+iNJLzSS+khqip6eMmet/uPOXI1Z7ExX
 k+ExOkRKdmjtWP4Wcy2E3knB0V8tX2/ByZbXG4CvOevptO2nOtVblN8KrNk3C6cuGdw1
 4I375n9Yc3Z0lzBawWM0xpLY0gsnqEdPZdvMv1lKpE/18KxJC0rnDjoFVAL941g3Uugi
 C+9Q==
X-Gm-Message-State: AOJu0YztNcOZdkw1lUJA0+DtxfBuiz9nvhJdcO26NmnqQymc43rVBgRq
 pe6ocnHRVwwgDsHjD4xPrJbvEIBfxgY=
X-Google-Smtp-Source: AGHT+IHZmqLn3L3ZKqsSwp9fVV7VB0KB6ZLHE53NqLZz0LLniG4bRr8kRCGJOrBgLqnr+9HTcQzh8g==
X-Received: by 2002:a05:6602:1492:b0:792:9a1a:228b with SMTP id
 a18-20020a056602149200b007929a1a228bmr33362568iow.2.1699171851305; 
 Sun, 05 Nov 2023 01:10:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 v9-20020a02b909000000b004290985a1efsm1512406jan.43.2023.11.05.01.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:10:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:10:48 -0700
Message-Id: <20231105081048.2899248-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699171851; x=1699776651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JQs4vnfO+XYdyntKUq1+iAIDrooS61c49mh5pK7M64w=;
 b=NR+QtbtaHclpyHzTo2yDI5LhA73qwv+8cukMKOZIncxtsYK86GEPOkPuR0zyjI20l9
 pOG9uEEvpakSstU0n9gZpNRVnFheCUo6kfRxHijNR1CH2iLvyLveq3ehyNzz7tXOA6xp
 Fmz3y+MtQ+RKP/rJTNQIwTVLoxMH0/fqza9w5DoN5oXvkK1hPkX+ijuDwXjYdWM0toPg
 3N0SIu3FE9l2zMGfy5Vcv4jWkuY4oW62W+DBTIZLnfG1FuHDC7kPFI/WvkIWElyZtld6
 UJok18REviVa6DyTU8D2I6SedURrEomAp5m8hx9S9quO76fkXvaxzoj7vPdKDyPZT1M1
 ICoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NR+Qtbta
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump to
 version 4.0.0
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

License hash changed due to copyright notice removal:
https://github.com/jaraco/jaraco.functools/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-jaraco-functools/python-jaraco-functools.hash    | 6 +++---
 package/python-jaraco-functools/python-jaraco-functools.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index a7cbb3daf1..97db6b75fb 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  f25708d7f38b9264459046fcc0afc8c1  jaraco.functools-3.5.2.tar.gz
-sha256  45b05c158f3ad28731075556ffd4749bd254ec67f91e1eb367dcfebff1151db4  jaraco.functools-3.5.2.tar.gz
+md5  6683d6f56930d4f0b34157b083813cf3  jaraco.functools-4.0.0.tar.gz
+sha256  c279cb24c93d694ef7270f970d499cab4d3813f4e08273f95398651a634f0925  jaraco.functools-4.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 8f64c4687e..5637b75629 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 3.5.2
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.0.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco.functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/b4/ea/9abca360081de9157668fcc52765989158aaf29b4826f26fcb17852d08e6
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/57/7c/fe770e264913f9a49ddb9387cca2757b8d7d26f06735c1bfbb018912afce
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

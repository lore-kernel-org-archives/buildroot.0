Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6946FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0496A410A4;
	Sat, 10 Dec 2022 20:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0496A410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StZmMmyLOmzn; Sat, 10 Dec 2022 20:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 066AD409B3;
	Sat, 10 Dec 2022 20:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066AD409B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7C861BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F2AA404A1
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2AA404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUboAVvecgah for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:41:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C3A40239
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94C3A40239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:41:39 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id m15so1598576ilq.2
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TYz4xinzBa9ICAu9qZeY1msQvyoaXtZ6x+4dOU5OQ0s=;
 b=uW4wtQhk+kBPtCRVAxTaiZtdYLUF05R/eroRUq8VIj+Miacut7GySnDy9u9CzCL8aw
 /yolERlpHJssnhlHLTwiIb9UAxRFNtCvlIkbMkb/cmT8XpeuLggFlbSEao67ZeQMFjHC
 f6rgYvmdq+qFoPwVIZOy7m7fnFqvPP9TuNgopXKDB1RaeMSvldm4V53nmByRMMmUGVtg
 p0RHM7JYIV0mmyZU5CTHPkRmlKSs8TKw5iwGp/E6L23DJPZUzzxcwHONLaX5Lhmv3MfP
 4XtKd6Lz7LdimVnb96luboVFikxzYkWeFd/OK7+y8vP7GX9UUzkRCXKGb3UiA5uhCTSI
 ITBQ==
X-Gm-Message-State: ANoB5pm5X515GmE+gkT5rXiOPiCpV/t9GMRxXNaMmOZ1h2bOxZf3YPw5
 zfIB1mzeNUfrbk89aOlLPHV5kwdKtKIWaack
X-Google-Smtp-Source: AA0mqf4iBhgVUxcqN2PYWkoqD2jJuxmBBHPwCw6s8xjq/QYq7dTNPF1QI0Fu2urDDUxeXgcADfM8aQ==
X-Received: by 2002:a92:dd8b:0:b0:303:154:9ffc with SMTP id
 g11-20020a92dd8b000000b0030301549ffcmr6278869iln.19.1670704898429; 
 Sat, 10 Dec 2022 12:41:38 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 f9-20020a02b789000000b00389b36027a6sm1662979jam.92.2022.12.10.12.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:41:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:41:36 -0700
Message-Id: <20221210204136.3590650-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TYz4xinzBa9ICAu9qZeY1msQvyoaXtZ6x+4dOU5OQ0s=;
 b=o4VUp+T8vaJFwvHtszCd/WRMOLJjTEtRrOX2/jFTP0LIsK0h70UyWywwb5onZTsxcJ
 YlYqTRTP/Ysq7EEMbbaNy1AHfu2u7tnd54PDAa3NbqW/+ZkpvA8ysO9PkS8LBWp1bUAm
 skFX6a+MwekeasXuRO8MYdzESzDKiX4fd7zAs6xpSgoHKo7xorMzCkLt41AnjwuTINc0
 1V33KIoeEtwTDwrIJPWQl/I/QNKsP9We6E6YXXmKE9GQWem6ijavB9rz/hdDDRtHZIKv
 9nK2CLfabHXlwECiCModDbAXS2HvBCpUXFT080ngt2JBQkAfrcZeRcuD2VOq7FMMEYql
 qjrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o4VUp+T8
Subject: [Buildroot] [PATCH 1/1] package/python-tempora: bump to version
 5.1.0
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
 package/python-tempora/python-tempora.hash | 4 ++--
 package/python-tempora/python-tempora.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index d802a63d87..39249eb4fa 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  24b77c173a7e89084004a38fe44e3ce3  tempora-5.0.2.tar.gz
-sha256  31fa5bb33b2641026211f23e808eb8bd351901988b167d45f323c8f450ecf211  tempora-5.0.2.tar.gz
+md5  f9954a8c3b091f9769eb7bbe0faddccf  tempora-5.1.0.tar.gz
+sha256  3e7c4a5369a1788c88a99b6be3a4c74c0c7728d3b62fd768a7e81bd0be0e88df  tempora-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index e22ac52472..68516a8388 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.0.2
+PYTHON_TEMPORA_VERSION = 5.1.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/72/2c/9aff4204a4ea5172b0cb3508f8a504ab6562ba539825ea2e33a5b4cb629b
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/a9/4e/41863232e77742b3a5b30a81e1398abd102aa0a67657bc86a53800966b8e
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

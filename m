Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEB1C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67E4A8135C;
	Sun,  6 Nov 2022 16:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E4A8135C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkkmeheTWHgk; Sun,  6 Nov 2022 16:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90516817B0;
	Sun,  6 Nov 2022 16:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90516817B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A93F51BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 801DB404EE
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 801DB404EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRheedWfnLNY for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:34:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F6D9404ED
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F6D9404ED
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:34:27 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id r81so7193525iod.2
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 08:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=06gU4FLle4AYwK1SfgBX8bu7c4UmQLXTLf29VlAaOBI=;
 b=f7dlQATgSZFddsZhA5Upp2Hw+u15slntInCk9oynLIMOwxwSkFqgq3SzflJtqqQrox
 DLAMJ7wdKguesuDpFFIrokwRNrM9AMx00SC/KF1ogpOZO5dv3bwbWyELIdQt07SLgZIm
 B2MhYnYwVh8qqxAKEz+vlHlEnNJZw/j1DsKZ+D7M//PcjB4rQv14DDyDUEYvNuXjxT2Q
 448me3/QN1JdZiKmU11IRz0Oz4rR1axE0y08DnpeJ39GO8nARMTGmzMXNV5wq5JdLaMU
 3OehtVxP3E7Q4QROKP80gmEuuSVXLqzx2NvJrtnd4eg0N4pZ3NfEYxBbfzGVkclWxdU/
 h5Rw==
X-Gm-Message-State: ACrzQf3BAjYnkJN6NanBKiE+GFJpeppXPof/mFkcQSO0ZsmpgF/oowEW
 Y/ecmQZ/ch2BS/Wd8xggSjx16vcZarY+Vg==
X-Google-Smtp-Source: AMsMyM7/3FNV+oRNCAVeDVhvR3CqgepPexBlTozDhqjvpraxD4lX5a5tFvwmz6aCxD0l/YmqZb3l1A==
X-Received: by 2002:a02:cc38:0:b0:375:6182:d220 with SMTP id
 o24-20020a02cc38000000b003756182d220mr21381101jap.16.1667752465831; 
 Sun, 06 Nov 2022 08:34:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b9-20020a056e02184900b002f90d038403sm2009824ilv.63.2022.11.06.08.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 08:34:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 09:34:23 -0700
Message-Id: <20221106163423.371420-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=06gU4FLle4AYwK1SfgBX8bu7c4UmQLXTLf29VlAaOBI=;
 b=qUDS8oEZNiFxlJilzEQ81DSBrqyW4lqHoOWUKnXwpagHjHhQ27rHmi3ovW0hF/bNZD
 SYL3glwq6+jjnqIDfivLDlXVl7TLEdSnAj5FDo5xVfRCLJar9b3dMjOP/RDWf+xtCQfk
 b6ZHczgnz7YNXDEf95GZeozdF5AbjbYn8AA2QW2BBY47JzyuSFSEZSJUY0cJJkhEu2yD
 yYyc7WFOUkHHs7uy8Dd6gNoNKtiqP/kBGS5j/Z96PLBg3vKoEBgrn3IrF/twbtlaxaLn
 k59E2o2NJwfmi+RaT3kS/8rr7T2nSalN86u/G9qwew6/EW6Vy7zX2MYcoA9/RhZp3Afh
 9UZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qUDS8oEZ
Subject: [Buildroot] [PATCH 1/1] package/python-pyparted: bump to version
 3.12.0
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

Migrate from distutils to setuptools package infrastructure.

Switch to pypi sdist source.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparted/python-pyparted.hash | 6 ++++--
 package/python-pyparted/python-pyparted.mk   | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index 0c3e4a15fd..a13276ce79 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  d214288ae1a70b5925861ce01b3352378eb6b1419aa3b786f509e9ef2a501c02  python-pyparted-3.11.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyparted/json
+md5  97df779564210100ea3e4eda0d33f7b9  pyparted-3.12.0.tar.gz
+sha256  da985e116beb733371feb605b174db9eec8bd0eedffc8f739f8e603f51b521e7  pyparted-3.12.0.tar.gz
+# Locally computed sha256 checksums
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 9d48fd9351..5e12995e2e 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYPARTED_VERSION = 3.11.6
-PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,v$(PYTHON_PYPARTED_VERSION))
-PYTHON_PYPARTED_SETUP_TYPE = distutils
+PYTHON_PYPARTED_VERSION = 3.12.0
+PYTHON_PYPARTED_SOURCE = pyparted-$(PYTHON_PYPARTED_VERSION).tar.gz
+PYTHON_PYPARTED_SITE = https://files.pythonhosted.org/packages/c2/d0/d32aa5758d6567eef620075f5c84f475c93bb1bf8da9d17051ce3ef055db
+PYTHON_PYPARTED_SETUP_TYPE = setuptools
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
 PYTHON_PYPARTED_LICENSE_FILES = COPYING
 PYTHON_PYPARTED_DEPENDENCIES = parted
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

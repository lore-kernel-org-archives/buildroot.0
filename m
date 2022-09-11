Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567CECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 22:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460C7610E3;
	Sun, 11 Sep 2022 22:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460C7610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4OaC6KLeYt5G; Sun, 11 Sep 2022 22:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D9F6104E;
	Sun, 11 Sep 2022 22:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D9F6104E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA111BF34F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 22:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A55883E68
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 22:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A55883E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xD4jujso9-iM for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 22:53:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734EF83E32
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 734EF83E32
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 22:53:42 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id b17so3728496ilh.0
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 15:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=vlaLXz1jxcKSaPHZnIPZL4BYaIFFPWpB58WEez9Z1m4=;
 b=1SuVZ+XhForkkGzENN1orTmeWlpzChlFlMtLVS4xXhLZC8+EGkEGMwgpyxq+LseuPN
 CE8kBmqR8jcvnAPEPgNbrV6EvMysbnIN1+41ZLV2ORCjCCTPwmHLdRG73vJ2mVB2DpVC
 o5/Z+Q5PgdICC7i/R4iRww4eHhhKmMkyg6/niqfzYrdgNyI8opgMt66zZVTcQ5GW+juz
 siSJmwPkPOXF6x2rCutikUw81l8e6Y5TtGKQUkS6hrURSREd9RvkIddjsxRY0c1q46wY
 Ywx3/xr16wZ0DYaDi5FC5/K8TNzGFkHA1d5p/P67xkxuQekby9a6woYwcR+2E0nmfqfM
 JhoA==
X-Gm-Message-State: ACgBeo36BXvTci4u3plYPmLTxtOg1FhtZv8iZidWeJF+kIa2b5v83Q/D
 6kt9oLJKnU3nSV+BZ6vkKRrffTzaBAU=
X-Google-Smtp-Source: AA6agR7RFdRySLoItaty7M9kQKUkGeAvwVRkUpU6+4WfGua4p9YNzK7/NQp1FEY8RxgfNecRKx3U6A==
X-Received: by 2002:a92:d12:0:b0:2eb:5775:79a9 with SMTP id
 18-20020a920d12000000b002eb577579a9mr8568571iln.25.1662936821103; 
 Sun, 11 Sep 2022 15:53:41 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 f5-20020a056638112500b003495b85a3b9sm2792477jar.178.2022.09.11.15.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 15:53:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 16:53:39 -0600
Message-Id: <20220911225339.3713775-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=vlaLXz1jxcKSaPHZnIPZL4BYaIFFPWpB58WEez9Z1m4=;
 b=QzFePn1QMJstlr0J+pMOSm/8LHgCNZ1Nk7ce/GUz3ovv40FSWlsgrZD2R8Qfhr0fOh
 triQ7ukcnO2f1HhUbPYeff33Z+D00Xfo0AbvmNuyhEt50kEtcEnPqacxGVMt5tyI6I3t
 7DHWLzk6Ex2zGaMsGjxI1twAtQ1Z+E5IwG4E+8FUJQ4ApCp8OqNzkNygAvJNyncZBb2v
 XYkt2D7Kyg2963R/z2qrRjQpF6QHoF7y0RRVNeZJTF8rHiz+CVfCOAi6aW4CpzocPorv
 oDRmCYqkFnBd1mivGXTEEYHc54ABX5bL8XkrHJJhsvtjubDD8UpX59M4y/u6j4ndxkJB
 8sug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QzFePn1Q
Subject: [Buildroot] [PATCH 1/1] package/python-chardet: bump to version
 5.0.0
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

License hash changed due to reformatting:
https://github.com/chardet/chardet/commit/c5e5d5a8f1b6e135a8bffd8d60b2f726bb168339

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-chardet/python-chardet.hash | 6 +++---
 package/python-chardet/python-chardet.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index fb4260a227..7721814279 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  bc9a5603d8d0994b2d4cbf255f99e654  chardet-4.0.0.tar.gz
-sha256  0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa  chardet-4.0.0.tar.gz
+md5  8013c248c098e165ac53d900e1a1278a  chardet-5.0.0.tar.gz
+sha256  0368df2bfd78b5fc20572bb4e9bb7fb53e2c094f60ae9993339e8671d0afb8aa  chardet-5.0.0.tar.gz
 # Locally computed
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 448877d056..1d737891a0 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 4.0.0
+PYTHON_CHARDET_VERSION = 5.0.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/ee/2d/9cdc2b527e127b4c9db64b86647d567985940ac3698eeabc7ffaccb4ea61
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/31/a2/12c090713b3d0e141f367236d3a8bdc3e5fca0d83ff3647af4892c16c205
 PYTHON_CHARDET_SETUP_TYPE = setuptools
 PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

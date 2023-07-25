Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71A5C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CE83418A2;
	Tue, 25 Jul 2023 13:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CE83418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFy8vnTv1e3I; Tue, 25 Jul 2023 13:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4166B418A3;
	Tue, 25 Jul 2023 13:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4166B418A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B73841BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D54E60F90
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D54E60F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jseVELHtA4u for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:41:07 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C476660F75
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C476660F75
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-348de515667so5028295ab.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690292466; x=1690897266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p7zGmvigM1NV7eo1Gp4ESa7nR7cXkT2Za1zfMVD2Wvc=;
 b=CNQv6oYQveBYKg/oLgGPzDGM2A2Qv76Ook4qkOhS+TyoxbVmh7MLyilpD907oSMe4G
 g/ee0v8Aq3pdgOHOvSUQGsHyb+sTEP/tdZKTyq/2sGh3l3QlzEozDevXDgOHxu+vVGWk
 PoPeN6yEpci6VQnLLdNvpbU32LFNuuhTb6QVRVoYYXxoJeQ+2gv9366hrA6SMfityjHE
 fYQeRQlMJOnxhdutG6ORXAiLjcNTeVtnqH/P820C6GTnuTcBJcIR1aifB/GTEwIUWrUV
 HPjeAWwgUgOh9xFaOjGds0tf8pjG8Qxrso6XzfAzY6OXLnnnSC2eV5uRceg7Tq0sUC9l
 nGtQ==
X-Gm-Message-State: ABy/qLYO4ssjzpPX23XujtggVr32tAluPO7wRc8geGlIIbOvnGNjE9Bh
 vT+CWav+9o6YlXFVX9vr6/VvvVTaRpE=
X-Google-Smtp-Source: APBJJlE+/9mVAulPkleB7jgtqOUAQRj6o9aIQC02d0L/B9Ljx/JooJhMP3ZO3ECktPh2IALQJS+Phw==
X-Received: by 2002:a05:6e02:e06:b0:348:d1b4:e566 with SMTP id
 a6-20020a056e020e0600b00348d1b4e566mr2473576ilk.22.1690292466379; 
 Tue, 25 Jul 2023 06:41:06 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 s16-20020a92d910000000b003425eeb2e17sm3734466iln.26.2023.07.25.06.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:41:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:41:02 -0600
Message-Id: <20230725134102.277216-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690292466; x=1690897266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p7zGmvigM1NV7eo1Gp4ESa7nR7cXkT2Za1zfMVD2Wvc=;
 b=rYfsAXMxdV+B2GtoYEJPwiW6cyH4vGBGu4gy5IJEGOPd/YmVOhoL5CSzfQwZ00V6sf
 mBcZJNcDwJZ6dtbmzAlie9Y1Y5FMgZdbwgm7SV7ZdweNADah+Mic17Z1CiKSK4ruImNe
 KwRSKpHe47fjEmb3PYFGVsIsViaBvisj/AOOoBiCqGfBYXvukikjatPIYuVi/rhPucqF
 hokCYV9JbyKy/ohZ/x4DAqm9N4+vRm7PAEDEtEjg/Hij/Bfz0ULyWWDrv8+EVWUFhbL1
 a+Tymg7a0iAIYgnw10xyRI+cLJF3lCFrkHxnjLi4M9anO+WQCmT5Bb6wHjwlA6rKIZiZ
 dhxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rYfsAXMx
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.41.1
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

Switch from zip to tar.gz download.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash |  4 ++--
 package/python-fonttools/python-fonttools.mk   | 12 +++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 4b4751dc82..84119d3346 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  f4775967d29b0da2f29ba499eed34f88  fonttools-4.38.0.zip
-sha256  2bb244009f9bf3fa100fc3ead6aeb99febe5985fa20afbfbaa2f8946c2fbdaf1  fonttools-4.38.0.zip
+md5  34d9fb935c3eaf5d2bd3572d88613bd2  fonttools-4.41.1.tar.gz
+sha256  e16a9449f21a93909c5be2f5ed5246420f2316e94195dbfccb5238aaa38f9751  fonttools-4.41.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index d31d3a2889..2fe7f50115 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.38.0
-PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/55/5c/a4a25cf6db42d113d8f626901bb156b2f7cf7c7564a6bbc7b5cd6f7cb484
+PYTHON_FONTTOOLS_VERSION = 4.41.1
+PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/e5/55/86c43d626bbe12fb384e61152ded4f76a280d30a022968c471f850cdb0d5
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
 PYTHON_FONTTOOLS_DEPENDENCIES = host-python-cython
 PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
 
-define PYTHON_FONTTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_FONTTOOLS_DL_DIR)/$(PYTHON_FONTTOOLS_SOURCE)
-	mv $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)
-endef
-
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

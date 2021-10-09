Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF531C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974ED60F9C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 974ED60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B504833DB;
	Sat,  9 Oct 2021 20:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMSjmI-A0ao2; Sat,  9 Oct 2021 20:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4387833CD;
	Sat,  9 Oct 2021 20:58:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49F961BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 397B9826BF
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nX5nfq8Gv0Z for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74C8B8239A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:44 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id np13so10149249pjb.4
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AGCipIiYwWPLkVp49/xRhn//I0WBPhcYmmaxEe0BPMg=;
 b=BvC0nElWPLNYOh8uFtfO1XsmJRkcXYuD5dB4eefI6yJ5NPpkU3377aV2Skoa5kR3Rf
 ERknHDciR5K1xHhKqLJdFAXKitZXbAT1FM89cork/AL0WpSlTUEbLNwC6kzPuwxyA0h0
 zBGkHH7xAPcULoGlJ2c8hrlAY164+cvTlg445gffNN4S2sfSFvXNm/yUlRsf0Ya2j9Hu
 lYmorIbr/lS8zzphVO2nGS1eBZTVUNBEySS6BV0NdoB2lSMmCXoKl0cazuhW5JmeTuZ7
 23R4acfFrIudZuLEJzPx/rBjQOxe5lNFhWsP01nN0GnUddS6L7mSJtkXIDEyf23zKr5b
 raZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AGCipIiYwWPLkVp49/xRhn//I0WBPhcYmmaxEe0BPMg=;
 b=qnqfhmFhyj5XLxYYGyoocZi514AJINNCu29ELPtSEZiZb/cSCgz/Y+q0r/ao8s7WSQ
 sWbVSaDOGxGp0IjxOmxTgJj+417X/cqA6tf/kf3c5DscUeGmUHgS2I6ELOBbfiYI2FLI
 LJ+P0pZgCxp1I5kjAfOudFPkh4oFCmk1DdOH3zJlwhKMlTuhpxL6A1VtNxolrecy/Tl1
 3U2KgbywpS4MgwSyU6UBKjEgsa0t9ZEcLb5Qh3sAwn/YMJi6twjZFg67JQJheiRVhoM3
 RWczPg3YxusG3c2KAl8C+Jg3vGsDZvm+fEKBFRhQbNTdSaQObC0InDlkq670VLq/fDNr
 XanQ==
X-Gm-Message-State: AOAM531VB84itvwDzVTK/re2uim+WAN96zdb1ztvvDzAWHq4X7+aqbUq
 K+bpeUovpNFZXkK1SUA5nTix/lCSkR4RUg==
X-Google-Smtp-Source: ABdhPJzcOSep7ba+ERYrAWu5X/o2M8ihGfQ5EjBdOF2eVi3jOSNNuAS51z56gGcZUUFiL9MxmG8Z3Q==
X-Received: by 2002:a17:902:e881:b0:13f:2a76:bbfa with SMTP id
 w1-20020a170902e88100b0013f2a76bbfamr2730120plg.10.1633812943771; 
 Sat, 09 Oct 2021 13:55:43 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:43 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:19 -0700
Message-Id: <20211009205523.3137859-17-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 16/20] package/python-numpy: bump to version
 1.21.2
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license file information as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-numpy/python-numpy.hash | 11 +++++------
 package/python-numpy/python-numpy.mk   | 16 +++++++++-------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index ff9d02643c..7c111f7bc8 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,9 +1,8 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.18.1
-sha256  da204ce460aa4247e595b7c7189d2fb2ed5f796bc03197055de01dac61d0125e	numpy-1.18.2.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.21.2
+sha256  76af194fbc117934ec5bbe2ff15177adbd05aeed23f18ee209ed88edcd777e05  numpy-1.21.2.tar.gz
 # License files, locally calculated
-sha256  ad81d0c21843ba6ce6fe5fa3eaacb61120be70cd798c52f63df3f4c12a843f0c	LICENSE.txt
-sha256  d3045980e80a6b39f98586c24bc7f39a7625b4b9f08ce72e367d12814743d047	numpy/core/src/multiarray/dragon4.c
-sha256  426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
-sha256	154a8706fa0fdeff1073bf6239c4ecf51f562ab107066eef839dade1a45c824c	doc/scipy-sphinx-theme/LICENSE.txt
+sha256  bc1b0af15cdc9415ea26c5f1df352c226ac86425ec0fb9ab38d111018bf1c6f2  LICENSE.txt
+sha256  2be6947e0432ecf7950ee8fe38681316749dd06d1de17c9ec4de6d2f55adb3a1  numpy/core/src/multiarray/dragon4.c
+sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
 sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 72c6e0c981..ae72b87db0 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.18.2
+PYTHON_NUMPY_VERSION = 1.21.2
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
-PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
-PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
-			doc/scipy-sphinx-theme/LICENSE.txt \
-			numpy/linalg/lapack_lite/LICENSE.txt \
-			tools/npy_tempita/license.txt \
-			numpy/core/src/multiarray/dragon4.c
+PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
+PYTHON_NUMPY_LICENSE_FILES = \
+	LICENSE.txt \
+	numpy/core/src/multiarray/dragon4.c \
+	numpy/core/include/numpy/libdivide/LICENSE.txt \
+	numpy/linalg/lapack_lite/LICENSE.txt \
+	tools/npy_tempita/license.txt
+
 PYTHON_NUMPY_SETUP_TYPE = setuptools
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D70DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A8461090
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7A8461090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990B640687;
	Thu, 14 Oct 2021 23:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_y6jTy05I_H; Thu, 14 Oct 2021 23:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9B740613;
	Thu, 14 Oct 2021 23:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7855F1BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D97240105
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFx-Tm_jZr0g for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76B1E400F1
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:59 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id m14so6734788pfc.9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AGCipIiYwWPLkVp49/xRhn//I0WBPhcYmmaxEe0BPMg=;
 b=kuH3XXJhM1ncCM4TB9OFcXnDvxytmnD3PiomMrlS+WQNmhx7+njUUojKgB7/l1Ye8J
 jcVPcnDTD5+ESIsrxT0GyCqsutUyEJfXcfBmVf6pFyLD/3DYEARwjbdShGu0vxdyVAGY
 dbya49gwf90u/ooe85l4HHXNrkaaF0wrayuP7M+l5FNFtIaogH1m6j1hTkoWpL4EHX8y
 IFARvGyDT0LgDU397bJ3hJTXsZu3sDvs5eNIQaaFECE5w56TcRS4LJE27w7Im+l2yNNm
 YJP17LpFM5PrMxGH/95j/9EabQpLcfRwmumOijWJhaaJCLiCMTxiL9vij+J8o4ZEt3eD
 IQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AGCipIiYwWPLkVp49/xRhn//I0WBPhcYmmaxEe0BPMg=;
 b=0mpG0oRTWXPyUh4l+PeiA/C2NkpFxec0ETu+/mIgdUo+EemilBu8mzTQTvcBrt0qTN
 WgCk+MrwCMGXnqlMPo4HT5C8PRoKDOwU0Nh+QvwmXmbm9ytX06wjHVvs3Ns8xmrPEzJn
 gWfM2NYnYoJ0QqXWr9fCaShuOtXbOm6CnP58t9BPP/eHkgAp6cC87/5vpQHZnDnqmVs/
 x9qiLJh4T8VxFlaIeQyuiTtsfNCivwltGw/EBmld9sFAfS/dGVfRgEdRYQYe+n9ZH+hi
 19ERcj6z9Jk3EdbGyTku2oU/liLC1IDOGgwl2UXCZ2oRM2IzOnGzcS4w62Vs3cZZ+K+O
 gqJw==
X-Gm-Message-State: AOAM5325KVVq71zpLUyTJpTVSug7rykODgIWYMZ/zJK2uM1MyCyhFdde
 BCxho1vN+VfYzwervjZRKlK7UyTs8So=
X-Google-Smtp-Source: ABdhPJxV1ntaLjCYBKLIl5K+AqXHeaMONyxWCK1eesc6gMhm+C0o7lXvLOM3gBWcfx1hIVdlQEjH7Q==
X-Received: by 2002:a63:cd57:: with SMTP id a23mr6380350pgj.320.1634252338703; 
 Thu, 14 Oct 2021 15:58:58 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:58 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:45 -0700
Message-Id: <20211014225849.832479-8-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 07/11] package/python-numpy: bump to version
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
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
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

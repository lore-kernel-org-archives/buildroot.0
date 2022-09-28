Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C647C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 19:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D51E40C30;
	Wed, 28 Sep 2022 19:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D51E40C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mARk_BAF_hjY; Wed, 28 Sep 2022 19:35:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 304F040C1C;
	Wed, 28 Sep 2022 19:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 304F040C1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ECB41BF3E0
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D1D83434
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D1D83434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPEyqTyrFeW8 for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 19:34:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E494C83422
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E494C83422
 for <buildroot@busybox.net>; Wed, 28 Sep 2022 19:34:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so2906238wmb.0
 for <buildroot@busybox.net>; Wed, 28 Sep 2022 12:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Ow67fVBLFmu9nQrzoGlNUnW34YRyGfE1B6m7w7hFamE=;
 b=o7cVFPwgdeFg5pziPhBojpmTg/Nwjyo4x6NIU7HpobaHvm3Ip4COyIVc9/bhR5FdVO
 F2FGNqBKdwSE0Sot5JNMDZh2zGMaX8mQmZYmO/c9j3kof9/y4/KQV/F2iJ9VVEpgqxLo
 Ouw0QUDe6wAKHK9gmAFS/HtoIgXaVWDxQjPWdFqxkEGipaZo7C4hCi/6X1fLjAM1MZuA
 /1+fr5qnEChQp8tmu310DCwuKw6xZ7p63DafNAOVg/r9+ORJ7ZQndUnBlBoCQF1Ha9he
 Q2BZe8f609Ex6P23Pt5BDtCpZVB/pyuSUF9/EpNhkiuSa4Q/f1g7Cj2b7YfqEGcdMSWq
 Uveg==
X-Gm-Message-State: ACrzQf1lQRI/A+qNt7HOVKvOR9f81hk5UUbGqKyomDUhMyfrqDxR7zsw
 lhTwLxZX7uLQisHVeouwNBJcKv9O90PU/w==
X-Google-Smtp-Source: AMsMyM6AOqUIYY+y8XPxf78/Ntuc6XHowhvx7L2zWv8cEi/zQiGroze4npAw9wpOldcnpPA2XGSylw==
X-Received: by 2002:a05:600c:4ec8:b0:3b4:bdc6:9b3d with SMTP id
 g8-20020a05600c4ec800b003b4bdc69b3dmr8011077wmq.181.1664393696920; 
 Wed, 28 Sep 2022 12:34:56 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:8043:4b00:ed03:af64:3498:bc20])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4743000000b00225307f43fbsm4961006wrs.44.2022.09.28.12.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 12:34:56 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Wed, 28 Sep 2022 21:34:37 +0200
Message-Id: <20220928193437.13407-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Ow67fVBLFmu9nQrzoGlNUnW34YRyGfE1B6m7w7hFamE=;
 b=dzlHTTCai93NDJc02hm1G+W71pClCY4D1LhWLVTxVEWPTc43Kth7XMZ+3FLfj7xEVJ
 w++ItIKfQ6ksPFtc58N3FZzEhtF4QOhpveLzCXTBUnQh7anhZecJVrVBPw4vTDd3vWx4
 vrxP7bU0af5xPp0Vf22DlklCnQ6h37gwKy8SvBbIIA9JbvqyS1u5aZsI5FTt1bpLASjd
 BdXDvqs68Oa6PRhK+MJns28uYT7wIyQSZISYfKXsOYTDyuVFbj5T8oRQwP/itM5GKAcV
 2y9V7F/6hYQe1nOvcvsX23ZFEz5omGFiJl5IP0LmIsQUR1HTbKafvCfEwYDpr9B8wwOX
 7FJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dzlHTTCa
Subject: [Buildroot] [RESEND v1 1/1] package/python-scipy: bump version to
 1.9.1
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
Cc: Ralf Gommers <ralf.gommers@gmail.com>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
Scipy is expected to move to a meson build infrastructure
by the next release

scipy-.tar.xz is no longer released.

For some reason, a new "Python.h" missing header
build time failure arised. I solve it with a -Ipython include.

Then test script failed, with linker/runtime missing symbols error,
all related to the linear algebra portion (which we do test).
Errors like "undefined reference to __atomic_compare_exchange 8"
regarding
"site-/scipy/optimize/_highs/_highs_wrapper.cpython-310-arm-linux-gnueabi.so"
to be specific. I solved it with a -latomic flag.

Once 1.9.2 is out, we know we already have my V3-1.9.1 patch
serie that builds "fine" with meson, it involved a minor tweak
(hopefuly solved by this time). The test script no longer did pass though,
this serie is not 100% ready to go
---
 package/python-scipy/python-scipy.hash | 2 +-
 package/python-scipy/python-scipy.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 0274679c43..1ba239aabf 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
+sha256  26d28c468900e6d5fdb37d2812ab46db0ccd22c63baa095057871faa3a498bc9  scipy-1.9.1.tar.gz
 sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
 sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index a8c23c6c88..1619b9f40a 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.8.1
-PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
+PYTHON_SCIPY_VERSION = 1.9.1
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
 PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
@@ -36,6 +36,8 @@ PYTHON_SCIPY_INSTALL_STAGING = YES
 PYTHON_SCIPY_SETUP_TYPE = setuptools
 PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
 
+PYTHON_SCIPY_CFLAGS = \
+	-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
 	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
 # -lnpyrandom localization
@@ -44,6 +46,7 @@ PYTHON_SCIPY_LDFLAGS += \
 
 PYTHON_SCIPY_ENV = \
 	F90=$(TARGET_FC) \
+	CFLAGS="$(PYTHON_SCIPY_CFLAGS) -latomic" \
 	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
 
 # Provide system configuration options to numpy distutils extensions, telling
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

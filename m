Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B068BECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 21:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCAF41834;
	Thu,  1 Sep 2022 21:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCAF41834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUdl0NVocW8t; Thu,  1 Sep 2022 21:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1A1E40895;
	Thu,  1 Sep 2022 21:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A1E40895
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E17B51BF3C9
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 21:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE51581261
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 21:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE51581261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sy1_oDv7UyxZ for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 21:44:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBCB78125A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBCB78125A
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 21:44:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so210236wms.5
 for <buildroot@busybox.net>; Thu, 01 Sep 2022 14:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OP72osl0/Ca7tLwwK+aIBbs7OYRHbSHtlrwJL5gQrNU=;
 b=ogH2fPo+mW07xCVx/gAEmNeRFliHSkQ4m30I7Yhd5LCbI294gJA+nbZJeSP1YAsZVt
 Mcgs1AZErQjENvxKBh8QiGZ5FYk4OqZpGn4sTY5mGcx7CLEJ7LrbtnWs8EkYDn0CDUlf
 lNBu3Ase9b/1fMxbsSSX6N/jyKeEonAm4sCEtBMuV/NIJtZCwTkUSQdcS5FO09blp9tp
 0rWWDP7yHuJurOGajjazG3cFtbQSKZG9F9ZwaBjX92DfXUgphmte4cIiD4cBhGjSbkpc
 X1KMmSw9vsVfxK8VpCsYI0wCDbfFcM7zeKIl/QvQ567l+aeoqaXxz8PSFrIXOijFrHK1
 ZSsg==
X-Gm-Message-State: ACgBeo0G8BvtZd9Y/HfsIASCiraReaEPOHb9//NWWjLoofkhQvVY4zX2
 P38oJBcl8VRFkSeme06C2AaIus7n2tE=
X-Google-Smtp-Source: AA6agR7EUjyhtwEBTeuyc/ha/VHGnMAG7KCG64TkTiPnRyefbgDEZlZhGvGQ47O2WKPHMdOvRkci8Q==
X-Received: by 2002:a05:600c:4152:b0:3a6:48c0:509c with SMTP id
 h18-20020a05600c415200b003a648c0509cmr685152wmm.24.1662068654715; 
 Thu, 01 Sep 2022 14:44:14 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:8043:4b00:ed03:af64:3498:bc20])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056000137c00b002205cbc1c74sm15417161wrz.101.2022.09.01.14.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 14:44:14 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Thu,  1 Sep 2022 23:43:35 +0200
Message-Id: <20220901214335.25684-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OP72osl0/Ca7tLwwK+aIBbs7OYRHbSHtlrwJL5gQrNU=;
 b=geOe4uzogQ2Suw9QIZ3VrIyOq5IjdtmPb+lfv4TX3h7H6//jkzsEupcx2D9FiAyiJG
 a2GBJV3ttgYrQIJeSke/y1ElzeLR5U3IwPES1bT/lOPnp8MCOMn+dsMx5J4dhRE/cdEC
 BHbMgG+CnLnr45lupOKy4vy8b8oFLc4H8pa1gPo+r/evMut9uQg6wY8/9rxIwf0Bbnpf
 RoMwMZYl55GLvx5ggbC+ejhI4ZtytAQdDkaw9HW13iF6fSs4wb99RESTCvChciVWFZYP
 DkS0ilrZPIGUkWnA0gQ0GspFvMzU4+Z9glOmQzpOFLMvVHW32089Zz0KjOYIc71ppZeO
 oUtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=geOe4uzo
Subject: [Buildroot] [PATCH v1 1/1] package/python-scipy: bump version to
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
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Scipy is expected to move to a `meson` build infrastructure
by the next release

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
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

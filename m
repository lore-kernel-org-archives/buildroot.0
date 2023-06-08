Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE6FC7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA076153E;
	Thu,  8 Jun 2023 18:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA076153E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkCuEdVM_qUa; Thu,  8 Jun 2023 18:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDBC61540;
	Thu,  8 Jun 2023 18:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BDBC61540
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A73CC1BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80F8A611B9
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F8A611B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgZFGNlbnh7H for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F6D610B6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2F6D610B6
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30d5931d17aso684938f8f.3
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247734; x=1688839734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3fZiXAjK/DBUXeD4rFk476PwG3qImWfI/5xu2fT3lI=;
 b=kRHqDDMOVXsYxcS6MwSMYvpsnCXXt8jsa7ZXAXRh8dzheriPxVXBpm5TMXnbbpdq1T
 dNJdX+BwREaznP/D5V3UzLKmgdrrxQlFPIONLAmrL1eSqq2Qc07fMB0vjSIuA3tSuMhw
 b+tsTcvyTO5LzAzGBh4IHq0DP3kOQtMK0W/4BxBCgDH3G/N8qomrLleDHTzW+xL9TPjH
 nfsOzLbrc3r1oxU0jLH+yq6afmIRhU67XzqHRILW1v3fnNsEdLvnmAlrMxgD4Dw/qlhS
 BzuCpGtP/MObj2TBOLAGF0pF4ukxI95t8HQvtyr4VQWqrCSMOMkLSHhVGGKFh1E8q7px
 kWbA==
X-Gm-Message-State: AC+VfDyw+1tuwOD/+F06PWVULK6at/mEtuQdfpxFLJ8/Kq/uJyJHS5SP
 qwixjYEHgAxtKtPbyRMpQwkKK6C/poE=
X-Google-Smtp-Source: ACHHUZ7REWkXDCx0kiXGpjTLpql7P5yQT2D6QSB8C68jc1RcIcfa7fVPPKVEXC7uKivAIPW7YQkDoA==
X-Received: by 2002:a5d:6705:0:b0:306:30e8:eb34 with SMTP id
 o5-20020a5d6705000000b0030630e8eb34mr7381862wru.48.1686247733899; 
 Thu, 08 Jun 2023 11:08:53 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:53 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:34 +0200
Message-Id: <20230608180844.189528-6-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247734; x=1688839734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3fZiXAjK/DBUXeD4rFk476PwG3qImWfI/5xu2fT3lI=;
 b=l0xfe/jBowo0fVw7qFw9ID/teQJRaaSXZqtKl/DkqPSW5Xn+QulJQwCko5aMUfmqTg
 HSl+IpFEDWo6b1XET73HkXq6bWFKgTjBRtGYQlMfkaHNpMs5L1o5Fs9McWpL8O8754vH
 IZ5wvLGsxqr9Ug8Ssv+Fycu+JcB0FDAiiC5YSrSjHrrsucrTqdUumyKfcJAVXimTtyDK
 MyP0pQxFpLgbQI6Ko96pnD32Ef6OazBu8SdsISHYb+XLOBO8aKm9Q2Kvss+cvOiu7H81
 eMMGGV16APXFPH6lI+PAPxPhFP7rww8A2hS3f2gEZN8XWwKmfU+k1v7TSjRZd9yeGRrt
 OOng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=l0xfe/jB
Subject: [Buildroot] [PATCH 06/16] support/testing: TestPythonPy3SciPy: use
 base configuration
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The base configuration now provide a glibc toolchain,
we can safely switch to it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_python_scipy.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index 007bc9ffa5..999a497ad9 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -5,14 +5,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3SciPy(TestPythonPackageBase):
     __test__ = True
-    # We can't use the base configuration, as we need a glibc
-    # toolchain for scipy
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SCIPY=y
         BR2_TARGET_ROOTFS_EXT2=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

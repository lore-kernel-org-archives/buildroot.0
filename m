Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0915EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 18:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF457418A8;
	Mon, 26 Jun 2023 18:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF457418A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crikCNxbGkNc; Mon, 26 Jun 2023 18:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF72418B4;
	Mon, 26 Jun 2023 18:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF72418B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEC331BF378
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A343B418B8
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A343B418B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ho7YP3hu_QK8 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 18:15:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E934418B4
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E934418B4
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 18:15:40 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so169130339f.0
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803339; x=1690395339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbPodvK/RMv7UwrIfETYD4QuVirjUz7S9fYn/lQRTYQ=;
 b=QJvW23G09B3H9M4LBwfSL9rRbIQvohOFu2cLvDai+cNIwgEtjbNhXhYO0z0KopsriT
 Qym7kQ0mCr1oucRBRGh9fA2PZjkV964i8ozJrllgKUp3nyX60QtvDf6qTn0eXtEflV4F
 0YMS9djp/8vtqFDXL/jl5bnte5kA5ts6kJlShhnCtN270MIx32HyYLbtv/wHVsixfQdA
 ox17Mg0RxLPpE9vEuyFvtsY6EfTciKIB/Jf0HwhVnP1uP9AMRJHqdLP2P6XvvSvxJbkd
 WVlAs6W24ck3Zl8BL5PKTC9pnWqlvQsJpTNxgrnLD5xVqTnn40DPnP+JHSEw5JwlD0is
 5OUA==
X-Gm-Message-State: AC+VfDwJ40X9cXYgsR4x8iPkv8KaDN2a58SyeZmr3w2kydNK9VXL4W+g
 MZVv4uYfhUnQ0m/e+kDzHud203x8Vpk=
X-Google-Smtp-Source: ACHHUZ5NNohciNlJyUxvfl+GA3qH0R1WYi+om+vq32xjHp9JVO1r1epAQV05/td/gaUjeK3rE4JNRQ==
X-Received: by 2002:a05:6602:14:b0:783:63d6:4c5 with SMTP id
 b20-20020a056602001400b0078363d604c5mr2196913ioa.12.1687803339211; 
 Mon, 26 Jun 2023 11:15:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 z24-20020a029f18000000b004269bbd4586sm1867653jal.77.2023.06.26.11.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 11:15:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 12:15:30 -0600
Message-Id: <20230626181531.2312002-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626181531.2312002-1-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687803339; x=1690395339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbPodvK/RMv7UwrIfETYD4QuVirjUz7S9fYn/lQRTYQ=;
 b=RGIwze8emyI0Stzn0wP0rGH4iB30jeO6hIgRZGwQOcbU7jK88O+U6wSAYzzW28CQH4
 ls5CVdxQ3ErwQE7Bxpsf6vFXiy+EQRj4u3yewR16+lPF9Gidg74F1c/Ilf2HnANfw63B
 3mS6V1mbNAZhC98WqJrMzPbRP0UXyVKyLeRt+AhKplSnk9AS8Dnh75SINNg9gKp2jfWu
 EllHKHrq/qu8+TMJuSftnRiCLJFwJX2UrWbLyA7NQFcMz2IoN4onvDs7cGZyYx0ggvLS
 ZWRPbIBqZgHxXdJckaB6WEckTMkgDOyrJS7I+bNx3b7MqiUA2QYx5JQbhv8qZjKvAxK+
 Z0xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RGIwze8e
Subject: [Buildroot] [PATCH 4/5] package/python-scipy: bump to version 1.11.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to meson package infrastructure.

Add new openblas dependency.

License hash changed due to date update:
https://github.com/scipy/scipy/commit/d3f0aea40f64e478085b6478a9fe55ca8a75b087

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scipy/Config.in         |  3 +++
 package/python-scipy/python-scipy.hash |  5 ++--
 package/python-scipy/python-scipy.mk   | 37 +++++++++-----------------
 3 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
index 229b5997ad..0a4acb9699 100644
--- a/package/python-scipy/Config.in
+++ b/package/python-scipy/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_PYTHON_SCIPY
 	bool "python-scipy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS # lapack
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # openblas
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LAPACK
+	select BR2_PACKAGE_OPENBLAS
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime scipy::io
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -20,6 +22,7 @@ config BR2_PACKAGE_PYTHON_SCIPY
 comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 0274679c43..9634771139 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,7 +1,6 @@
 # Locally generated
-sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
-sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
-sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
+sha256  f9b0248cb9d08eead44cde47cbf6339f1e9aa0dfde28f5fb27950743e317bd5d  scipy-1.11.0.tar.gz
+sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index a8c23c6c88..3010cfbd54 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.8.1
-PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
-PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
+PYTHON_SCIPY_VERSION = 1.11.0
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/fa/d0/724c8204f87b6f807e3e67de32b8b4922d579154a448ce94e89129064bf1
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
@@ -16,7 +16,6 @@ PYTHON_SCIPY_LICENSE = \
 	Qhull
 PYTHON_SCIPY_LICENSE_FILES = \
 	LICENSE.txt \
-	scipy/linalg/src/lapack_deprecations/LICENSE \
 	scipy/ndimage/LICENSE.txt \
 	scipy/optimize/tnc/LICENSE \
 	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
@@ -25,34 +24,24 @@ PYTHON_SCIPY_LICENSE_FILES = \
 PYTHON_SCIPY_CPE_ID_VENDOR = scipy
 PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
 PYTHON_SCIPY_DEPENDENCIES += \
+	host-python-cython \
 	host-python-numpy \
 	host-python-pythran \
 	zlib \
 	lapack \
+	openblas \
+	python3 \
 	python-numpy \
 	python-pybind
 PYTHON_SCIPY_INSTALL_STAGING = YES
 
-PYTHON_SCIPY_SETUP_TYPE = setuptools
-PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+PYTHON_SCIPY_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
 
-PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
-	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
-# -lnpyrandom localization
-PYTHON_SCIPY_LDFLAGS += \
-	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
+PYTHON_SCIPY_CONF_OPTS = -Dblas=openblas -Dlapack=lapack
 
-PYTHON_SCIPY_ENV = \
-	F90=$(TARGET_FC) \
-	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
+PYTHON_SCIPY_MESON_EXTRA_PROPERTIES = \
+	numpy-include-dir='$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include'
 
-# Provide system configuration options to numpy distutils extensions, telling
-# to find all include files and libraries in staging directory.
-define PYTHON_SCIPY_CONFIGURE_CMDS
-	-rm -f $(@D)/site.cfg
-	echo "[DEFAULT]" >> $(@D)/site.cfg
-	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
-	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
-endef
-
-$(eval $(python-package))
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

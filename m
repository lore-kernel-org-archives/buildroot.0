Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032C2C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7987C41682;
	Wed, 27 Jul 2022 19:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7987C41682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaqQYRG4melE; Wed, 27 Jul 2022 19:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E7941677;
	Wed, 27 Jul 2022 19:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E7941677
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 837E71BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9E940122
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9E940122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id heIyzw13d1vW for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:30:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A5AE400D8
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A5AE400D8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:30:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h8so25814534wrw.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCQHmuQvBBb8T3SafWg+I/d3lKQoydDFI62/j21Rh+M=;
 b=pQe3R0ZC+NRtu8i70g00sATeIML/qPNAz4suJeGFM2CZV9IGScbvS80vTHBgrcHNha
 KAB/eBII1boUj1e1rfDQAFnB9RPKWOVDZymEqe/uf18m09ONJsuqf0TZDefKUJMgCGdz
 a1kvq9urjSCjLi0mTzwdtAfr0nCmEXiSnKy7kxDMpm83KxmPvfiQXJRF+IUWwnWl2Vjw
 j4SGDYlDyEav/1b+rQe3HYkTk2G0dTLAqeZGIxSJptywlOxrwi46Z3p2TFw/A7LQ3h9u
 2SvPpLFZkF3c6atKcDAxT2lHw+ziGNxhIhe5mqExhRqGURNnYhm8BwkY1ZcPKmB3pjY3
 DiEA==
X-Gm-Message-State: AJIora/c07gOeZsdCmh6EZnY18qJB7dHnf2TbngbSnVPkWaz4p+L/6B1
 1hhXBwxowgHKlWPOkZP/zfW1DXI2Vzsg8w==
X-Google-Smtp-Source: AGRyM1v7DfB6qOQV1LSN3IqvEgKz3t7lGBz0o4C03IJPv7GIBPQE6JBLNpXHqPj5+2XLHZCoXpL6Dg==
X-Received: by 2002:adf:eb8f:0:b0:21e:3b49:5b8e with SMTP id
 t15-20020adfeb8f000000b0021e3b495b8emr15394959wrn.258.1658950213231; 
 Wed, 27 Jul 2022 12:30:13 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b0021eed2414c9sm605554wrm.40.2022.07.27.12.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 12:30:12 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:29:48 +0200
Message-Id: <20220727192948.18653-4-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCQHmuQvBBb8T3SafWg+I/d3lKQoydDFI62/j21Rh+M=;
 b=hXPnNP8+StePvXdVn4NKqHAfRrZ2+nQl9EGIGfELoZZQNItINna87CyXukR2L7ndmt
 BJClR5IG8gvm50GJabdwVS9NcpQEV6uyJxF2350EEeMMpYwOCeJhruo1CYwTa9EblPtt
 RAIunjXN6mZwUmKZq81Cvj6a+JXJVAt/j7USKY2MsQhs8441uxkCQzxrDsVgzZN/fzrJ
 vma+GZKhZVgbTNCcyWvOUIDNy8/BtWKrhP5Sp1GEO57A80Zs3XvLbNMu0nXdm0mTfEGO
 pNVAe4T+I/LH3ehJY6e+hJZXHswNAjIEhq1IfMM4zqehg+dUeLYqJ6B2qM9M6ringkCw
 Ij2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hXPnNP8+
Subject: [Buildroot] [PATCH v5 4/4] package/python-scipy: new package
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jmfriedt@femto-st.fr,
 gwen@trabucayre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jagan Teki <jagan@amarulasolutions.com>

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
[Arnout:
 - Indent hash file with two spaces.
 - Bump to 1.7.3 to fix build failure with recent GCC.
 - Get from github instead of PyPI.
 - Add host-meson and host-python-pythran dependencies.
 - Properly propagate Config.in dependencies.
 - Correct usage of BR2_INSTALL_LIBSTDCPP symbol.
 - Remove F77, no longer used.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Guillaume:
 - -lnpymath: npymath.ini localization problem
 - -lnpyrandom resolution problem
 - fix legal-info for latest version LICENSE.txt
 - zlib is a scipy::io module runtime requirement
 - update serie for scipy 1.8.1 (latest)
]
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                             |  3 ++
 package/Config.in                      |  1 +
 package/python-scipy/Config.in         | 30 ++++++++++++
 package/python-scipy/python-scipy.hash |  9 ++++
 package/python-scipy/python-scipy.mk   | 63 ++++++++++++++++++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 50a295a743..ee6cb536ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1180,6 +1180,7 @@ F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
+F:	package/python-scipy/
 F:	package/reaver/
 F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
@@ -1307,6 +1308,8 @@ F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
+F:	package/python-pybind/
+F:	package/python-scipy/
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
diff --git a/package/Config.in b/package/Config.in
index 174cfde73e..985de3aedb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1228,6 +1228,7 @@ menu "External python modules"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
+	source "package/python-scipy/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
new file mode 100644
index 0000000000..a016d411af
--- /dev/null
+++ b/package/python-scipy/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_PYTHON_SCIPY
+	bool "python-scipy"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # openblas
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS # lapack
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_LAPACK
+	select BR2_PACKAGE_OPENBLAS
+	select BR2_PACKAGE_ZLIB # runtime scipy::io
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  The SciPy library is one of the core packages that make up the
+	  SciPy stack. It provides many user-friendly and efficient
+	  numerical routines such as routines for numerical integration,
+	  interpolation, optimization, linear algebra and statistics.
+
+	  https://www.scipy.org/scipylib/
+
+comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
new file mode 100644
index 0000000000..bdded7a1a6
--- /dev/null
+++ b/package/python-scipy/python-scipy.hash
@@ -0,0 +1,9 @@
+# Locally generated
+sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
+sha256  32b2f41fb8c1193a066c1686bb3237e79f918685bf545cb6dfcb68753ac35152  LICENSE.txt
+sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
+sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
+sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
+sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/dsolve/SuperLU/License.txt
+sha256  0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING
+sha256  34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb  scipy/spatial/qhull_src/COPYING.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
new file mode 100644
index 0000000000..de240198df
--- /dev/null
+++ b/package/python-scipy/python-scipy.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# python-scipy
+#
+################################################################################
+
+PYTHON_SCIPY_VERSION = 1.8.1
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
+PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
+PYTHON_SCIPY_LICENSE = \
+	BSD-3-Clause, \
+	BSD-2-Clause, \
+	BSD, \
+	BSD-Style, \
+	Apache-2.0, \
+	MIT
+PYTHON_SCIPY_LICENSE_FILES = \
+	LICENSE.txt \
+	scipy/linalg/src/lapack_deprecations/LICENSE \
+	scipy/ndimage/LICENSE.txt \
+	scipy/optimize/tnc/LICENSE \
+	scipy/sparse/linalg/dsolve/SuperLU/License.txt \
+	scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING \
+	scipy/spatial/qhull_src/COPYING.txt
+PYTHON_SCIPY_DEPENDENCIES += \
+	host-meson \
+	host-python-numpy \
+	host-python-pythran \
+	zlib \
+	lapack \
+	openblas \
+	python-numpy \
+	python-pybind
+PYTHON_SCIPY_INSTALL_STAGING = YES
+
+PYTHON_SCIPY_SETUP_TYPE = setuptools
+PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+
+# -lnpymath npymath.ini localization
+PYTHON_SCIPY_NPY_PKG_CONFIG_PATH = \
+	$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/lib/npy-pkg-config
+
+PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
+	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
+# -lnpyrandom localization
+PYTHON_SCIPY_LDFLAGS += \
+	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
+
+PYTHON_SCIPY_ENV = \
+	F90=$(TARGET_FC) \
+	NPY_PKG_CONFIG_PATH=$(PYTHON_SCIPY_NPY_PKG_CONFIG_PATH) \
+	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
+
+# Provide system configuration options to numpy distutils extenions, telling
+# to find all include files and libraries in staging directory.
+define PYTHON_SCIPY_CONFIGURE_CMDS
+	-rm -f $(@D)/site.cfg
+	echo "[DEFAULT]" >> $(@D)/site.cfg
+	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
+	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
+endef
+
+$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

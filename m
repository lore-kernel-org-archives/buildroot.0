Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212E7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 17:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C31A0400B8;
	Sat, 19 Feb 2022 17:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4szaT-XXnbNW; Sat, 19 Feb 2022 17:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C1D040436;
	Sat, 19 Feb 2022 17:03:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9601D1BF94B
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8543082419
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7ZYz9bnaIYQ for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 17:03:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0A881BC6
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 17:03:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e3so19762716wra.0
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 09:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f1d6XwcVlBCqcvrkJyegqvlHDyf2xyAnHTCdj0WZYj4=;
 b=eqstYpvT2fFHLzBfa0Rl1VsN2LfNuVpV4G50oTBtjLWGW2x5HMjPHoIaS6qvewmIr+
 pyTwyDDOuYpmh2hAj5l2yj6tEnJJbQu96NJw4mNYHOTA/Y241U6bOO8gWp10lxMc9VOc
 fKJchJ/jBbnJ+5x3bjDDRGkMTatOpmiUu3LHLn/Nqg2MEd9My7osTZB+mySoZwl4Q8cf
 R0mjLGTxTUYx8aOyMLl1r5dVrhwIMMepg0k4DAntaZrcWNtQdGJIPIIUGZKCJ+n7rNDF
 jiMzG0eFQAuJcRzkkVjAWkpvmwiS2RakgrBW6UQJo3mWHh5lsyt/Rzh6MS7Cxz9uDiFq
 C9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f1d6XwcVlBCqcvrkJyegqvlHDyf2xyAnHTCdj0WZYj4=;
 b=w+3jzydrlb8+J8DZJXcykK3Ikux8h06hmvxsHWYSP/PYqIndw5jaci7j7iIB//IITM
 zg9UiJm0giP5eEQOHG+uSSKYp+keosoX3RKx5MOXwtVCoZjUjDVZdxGcPU+7+CPZMoB/
 4ld/hFCzylVsb4De+pT6uKvLiM98AGhU51mxfzuRQrsVXCDGxUZxeRHkImyOrhYW7iBk
 7Bezyab693pI9t9dJg6Q9fItWF/CPkgOyOTDZ0ddatIpP78Jo8oz9iGAi5+0p20K97Dd
 LFnNKRcw7U6A8nb4QNM01uOTnUattyQ4SAHqQ4ATy05uywAC3907eYpB0VLPnQTQ7jaC
 EPew==
X-Gm-Message-State: AOAM532IQVKZ6X4qzhOUYJaulT4Q7+e1XjT3YtAwAgSt3Uoy7gkiPftj
 7At9ODGJ8VsGd/z7UsRYhh3Pwkk5Q5n5ZQ==
X-Google-Smtp-Source: ABdhPJyjHj0OvCXQGWF3q6cTo1C+64gKO828gyM7sMlDmZzjeUEhnmbZGJqHjm2DolJD8PImL4oi2w==
X-Received: by 2002:adf:f001:0:b0:1e4:b7b1:87c1 with SMTP id
 j1-20020adff001000000b001e4b7b187c1mr10326377wro.238.1645290186797; 
 Sat, 19 Feb 2022 09:03:06 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id a1sm28034291wri.36.2022.02.19.09.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 09:03:06 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 18:02:10 +0100
Message-Id: <20220219170210.11691-4-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220219170210.11691-1-guillaume.bressaix@gmail.com>
References: <20220219170210.11691-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] package/python-scipy: new package
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
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
]
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---
Hello Arnout,

the current patch serie winds up in
"numpy.distutils.npy_pkg_config.PkgNotFound: Could not find file(s) ['npymath.ini']"
I managed to have setuptools locate npymath.ini by pointing to its parent folder like this.
I noticed your python-numpy.mk rework puts a double "//" in npymath.ini path,
but that does not seem to impact negatively.

Then, build almost passes, but fails when -lnpyrandom gets used, producing errors like:
arm-buildroot-linux-gnueabihf/bin/ld: output/host/lib/python3.10/site-packages/numpy/random/lib/libnpyrandom.a:
error adding symbols: file format not recognized

it looks like -lnpyrandom points to /host/lib instead of /staging/usr/lib,
which I 'solve' by prepending the correct location to the LDPATH so it gets picked up first.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                             |  3 ++
 package/Config.in                      |  1 +
 package/python-scipy/Config.in         | 29 ++++++++++++
 package/python-scipy/python-scipy.hash |  9 ++++
 package/python-scipy/python-scipy.mk   | 62 ++++++++++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..c8766c872e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1149,6 +1149,7 @@ F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
+F:	package/python-scipy/
 F:	package/reaver/
 F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
@@ -1280,6 +1281,8 @@ F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
+F:	package/python-pybind/
+F:	package/python-scipy/
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
diff --git a/package/Config.in b/package/Config.in
index 10209d84d7..0edde1c919 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1209,6 +1209,7 @@ menu "External python modules"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
+	source "package/python-scipy/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
new file mode 100644
index 0000000000..98d02b28a8
--- /dev/null
+++ b/package/python-scipy/Config.in
@@ -0,0 +1,29 @@
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
index 0000000000..ef9a24e05d
--- /dev/null
+++ b/package/python-scipy/python-scipy.hash
@@ -0,0 +1,9 @@
+# Locally generated
+sha256  4042211bed8e6c658b9e2a4ca829806f0b33437faa7878c8dc6d6f72845b1694  scipy-1.7.3.tar.xz
+sha256  5cbdbe33385779958be8b9310497e32d2eec144d82ef425780d3e19f8af6de76  LICENSE.txt
+sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
+sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
+sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
+sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/dsolve/SuperLU/License.txt
+sha256  0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING
+sha256  34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb  scipy/spatial/qhull_src/COPYING.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
new file mode 100644
index 0000000000..2fbd4316f3
--- /dev/null
+++ b/package/python-scipy/python-scipy.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# python-scipy
+#
+################################################################################
+
+PYTHON_SCIPY_VERSION = 1.7.3
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

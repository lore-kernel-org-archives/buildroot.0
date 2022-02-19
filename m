Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019E6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 16:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1BE5607CA;
	Sat, 19 Feb 2022 16:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSu8c3yapJ10; Sat, 19 Feb 2022 16:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FAD5607A8;
	Sat, 19 Feb 2022 16:54:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A96C71BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97CA581CA3
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLH73CE1uBRn for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 16:54:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D4F381BD9
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 16:54:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e3so19739419wra.0
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 08:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tQ/GF/z3rSDs62C5swVzcXiiLe3REYK7u+beOafEVPg=;
 b=icmjIx8Ogoa4zdNsdU988livwZPAP+gzh4HtPX7sBOsqcuNC14HIGftB3JIObLgwbR
 NLZcgRvhxIN0H2i5lzorCqpX9JkY0fnGxgCW0zu0iu2C6lfFlFrl7uDxDkREgGfzYgzH
 /v2DShf37WCy5a3uE8B8HrBbsF/XQCg9BgeaPHOy/+4gp6yQumyZVKGiPcRme2NXppxs
 P4mMPbS6U4wB6GgOuWSgpVrjObNhnM/BZqiwPTlpcII0mGDkUKTqbs5WTTjxmTmD9m1s
 jomn+nxcM0DBeZsXdbx3chzgh0yWZ6+OkdTW8MgqlnPEdjoJBRtqjgJwJxD2Y9/F0ugW
 xGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQ/GF/z3rSDs62C5swVzcXiiLe3REYK7u+beOafEVPg=;
 b=A6FCtTf88e0LzmHCftMuxTC9oX9O2vwK1k230GnUeWsQXDucEKKnX/YKNQa/jSswo4
 5r5a8MOTUhHzhcHIVf6njsVQBDf1E3Pwtvy2PPyUAy6yKSRkITGeXROUuJDq6TvdV78c
 UFxambJnU2HuorAFpgFEPC78gUhG5donV4XUNrJgA7js+3YRGQvPorjtIFjktAgZd/bg
 BC2RFH46TYieoDwRIQsioJ8nUtFaboPBgBYamDon/BhaEcuSJN3RJZx+bX5d/l5/me7o
 dBfvk2f+qi22MvMNEA2fdhNJ4ffK+9cUzbBXkLxm2tJPr/yvN1yJc/bbhRLRbtvVobOT
 SJUA==
X-Gm-Message-State: AOAM530yHUcEgWRm5h1B6QSJvPY/kU/LIMUQMFUTJ7vYAxOb7mxAOm1m
 16pZa3m9NhVdllN1tzu3GBiXANSXfbyhmQ==
X-Google-Smtp-Source: ABdhPJwJpPnDCg8I1ED0eSbXs19nr9P4ryIPfx7XgXO4kzWpVHI/PqWeBk869xAeb/z6ZnrftpLSFQ==
X-Received: by 2002:adf:cc86:0:b0:1e4:b25d:cfc5 with SMTP id
 p6-20020adfcc86000000b001e4b25dcfc5mr9945622wrj.7.1645289642224; 
 Sat, 19 Feb 2022 08:54:02 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id f18sm3206549wmg.21.2022.02.19.08.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 08:54:01 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 17:53:11 +0100
Message-Id: <20220219165311.9775-4-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220219165311.9775-1-guillaume.bressaix@gmail.com>
References: <20220219165311.9775-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-scipy: new package
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
Cc: jeanmichel.friedt@femto-st.fr,
 "Guillaume W . Bres" <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, thomas.petazzoni@bootlin.com,
 yann.morin.1998@free.fr, gwen@trabucayre.com
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

-lnpyrandom resolves to /host/lib instead of /staging/usr/lib,
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

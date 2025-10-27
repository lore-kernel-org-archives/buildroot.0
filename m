Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8568CCF9E0
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 07:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 754F040D2E;
	Mon, 27 Oct 2025 07:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNLnY5ivHgw9; Mon, 27 Oct 2025 07:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A41F412EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A41F412EB;
	Mon, 27 Oct 2025 07:46:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0155443F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 07:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB72B40ADE
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 07:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99J0tOWTHdin for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 07:46:23 +0000 (UTC)
X-Greylist: delayed 58380 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Oct 2025 07:46:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C3B0405B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C3B0405B6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=info@rootkitlabs.com;
 receiver=<UNKNOWN> 
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C3B0405B6
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 07:46:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 942E5444E0;
 Mon, 27 Oct 2025 07:46:17 +0000 (UTC)
From: info@rootkitlabs.com
To: buildroot@buildroot.org
Cc: Ryan Walker <info@rootkitlabs.com>
Date: Mon, 27 Oct 2025 08:46:10 +0100
Message-ID: <20251027074610.547678-1-info@rootkitlabs.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-GND-Sasl: info@rootkitlabs.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rootkitlabs.com; s=gm1; t=1761551178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2lMKhczAwzcsARtxVSKRR8dpLFTstouA+WM35u5MALI=;
 b=h328PK8CkiyVZ+Ah1bApsfYddsNBep6XcXcQ1w6aXHZtF+IwnC1QkD+idm18Kj165+bvUC
 LIPG7Enq4BgJ5xIAk0KgwEnzMO6KR+ItVZ2kI0CpHq+VLw/7xiz5Jj8gf1izF3x+QbVv9j
 1l6mIcyBY+PZZwulRQsgtQBs65b1ePSPtNM9t7U3CDVkPXAuKWmPnEr0b+EexCRxFA5wGB
 NOoMwjifgdikRS90iAg8DdIXBsULwHDMdHwFo1NHJtmULVgen49vhp8R+VpkmZ3IKbAMDF
 PGLLqVCpz3hoqjWRZ3CMwwyjeHqEF9oZAArEAVL55ItcsyTMT8qwQal6YkIXlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rootkitlabs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rootkitlabs.com header.i=@rootkitlabs.com
 header.a=rsa-sha256 header.s=gm1 header.b=h328PK8C
Subject: [Buildroot] python-pandas port
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ryan Walker <info@rootkitlabs.com>

Hey! I'm trying to get pandas installed on my buildroot image. This is the issue I'm running into.

>>> import pandas
Traceback (most recent call last):
  File "<python-input-0>", line 1, in <module>
    import pandas
  File "/usr/lib/python3.13/site-packages/pandas/__init__.py", line 49, in <module>
  File "/usr/lib/python3.13/site-packages/pandas/core/api.py", line 1, in <module>
  File "/usr/lib/python3.13/site-packages/pandas/_libs/__init__.py", line 18, in <module>
  File "interval.pyx", line 1, in init pandas._libs.interval
  File "hashtable.pyx", line 1, in init pandas._libs.hashtable
  File "missing.pyx", line 1, in init pandas._libs.missing
  File "/usr/lib/python3.13/site-packages/pandas/_libs/tslibs/__init__.py", line 40, in <module>
  File "conversion.pyx", line 1, in init pandas._libs.tslibs.conversion
  File "offsets.pyx", line 1, in init pandas._libs.tslibs.offsets
  File "timestamps.pyx", line 1, in init pandas._libs.tslibs.timestamps
  File "tzconversion.pyx", line 55, in init pandas._libs.tslibs.tzconversion
ValueError: Buffer dtype mismatch, expected 'const int64_t' but got 'long long'

Here are my changes to buildroot, I've used the vendor meson version (as that's what required right now) to build numpy and bumped the version.

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 30271e35e5..2cfa8c7310 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -137,6 +137,7 @@ define inner-meson-package
 # packages.
 #
 ifndef $(2)_CONFIGURE_CMDS
+$(2)_MESON ?= $$(MESON)
 ifeq ($(4),target)

 $(2)_CFLAGS ?= $$(TARGET_CFLAGS)
@@ -157,7 +158,7 @@ define $(2)_CONFIGURE_CMDS
 	CC_FOR_BUILD="$$(HOSTCC)" \
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
 	$$($$(PKG)_CONF_ENV) \
-	$$(MESON) setup \
+	$$($$(PKG)_MESON) setup \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
@@ -178,7 +179,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
 	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 	$$(HOST_CONFIGURE_OPTS) \
-	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
+	$$($$(PKG)_CONF_ENV) $$($$(PKG)_MESON) setup \
 		--prefix=$$(HOST_DIR) \
 		--libdir=lib \
 		--sysconfdir=$$(HOST_DIR)/etc \
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 6629cebbce..583bd1aa58 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,5 +1,7 @@
 # Copied from https://github.com/numpy/numpy/releases/tag/v1.25.0
-sha256  f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19  numpy-1.25.0.tar.gz
+sha256  e29554e2bef54a90aa5cc07da6ce955accb83f21ab5de01a62c8478897b264fd  numpy-2.2.6.tar.gz
+sha256  a7d018bfedb375a8d979ac758b120ba846a7fe764911a64465fd87b8729f4a6a  numpy-2.3.4.tar.gz
+
 # License files, locally calculated
 sha256  1034d3bd61783f3b5e7ec3e7ca818f4da4135132323a0ef99f4c0edb3c7f6bd2  LICENSE.txt
 sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 200fac20a1..a96aee8809 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-PYTHON_NUMPY_VERSION = 1.25.0
+PYTHON_NUMPY_VERSION = 2.3.4
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
@@ -18,12 +18,28 @@ PYTHON_NUMPY_CPE_ID_VENDOR = numpy
 PYTHON_NUMPY_CPE_ID_PRODUCT = numpy

 PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
+
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython

 PYTHON_NUMPY_CONF_ENV += \
 	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
 	PYTHONPATH=$(PYTHON3_PATH)

+PYTHON_NUMPY_MESON_EXTRA_PROPERTIES += \
+	sizeof_long_double=8 \
+	longdouble_format='IEEE_DOUBLE_LE'
+
+HOST_PYTHON_NUMPY_MESON_EXTRA_PROPERTIES += \
+	sizeof_long_double=8 \
+	longdouble_format='IEEE_DOUBLE_LE'
+
+# Numpy requires a custom version of meson
+PYTHON_NUMPY_MESON = \
+    PYTHONNOUSERSITE=y $(HOST_DIR)/bin/python3 -B $(@D)/vendored-meson/meson/meson.py
+
+HOST_PYTHON_NUMPY_MESON = \
+    PYTHONNOUSERSITE=y $(HOST_DIR)/bin/python3 -B $(@D)/vendored-meson/meson/meson.py
+
 ifeq ($(BR2_PACKAGE_LAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += lapack
 PYTHON_NUMPY_CONF_OPTS += -Dlapack=lapack
@@ -49,9 +65,10 @@ HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
 # So, the numpy distutils extension packages would explicitly link this
 # config path for their package environment.
 define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
-	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/core' \
-		$(PYTHON3_PATH)/site-packages/numpy/core/lib/npy-pkg-config/npymath.ini
+	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/_core' \
+		$(PYTHON3_PATH)/site-packages/numpy/_core/lib/npy-pkg-config/npymath.ini
 endef
+
 PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES


And here are my config files for pandas.

config BR2_PACKAGE_PYTHON_PANDAS
    bool "python-pandas"

    help
        Powerful data structures for data analysis, time series, and statistics.

    select BR2_PACKAGE_PYTHON_DATEUTIL
    select BR2_PACKAGE_PYTHON_PYTZ
    select BR2_PACKAGE_PYTHON_NUMPY
    select BR2_PACKAGE_BZIP2
    select BR2_PACKAGE_HOST_PYTHON_VERSIONEER
    select BR2_PACKAGE_HOST_PYTHON_MESON_PYTHON
    select BR2_PACKAGE_HOST_PYTHON_NUMPY
    select BR2_PACKAGE_HOST_PYTHON_CYTHON

################################################################################
#
# python-pandas
#
################################################################################

PYTHON_PANDAS_VERSION = v2.3.3
PYTHON_PANDAS_SITE = https://github.com/pandas-dev/pandas
PYTHON_PANDAS_SITE_METHOD = git
PYTHON_PANDAS_INSTALL_STAGING = YES

PYTHON_PANDAS_LICENSE = BSD
PYTHON_PANDAS_LICENSE_FILES = LICENSE

PYTHON_PANDAS_DEPENDENCIES = \
    bzip2 \
    python-dateutil \
    python-pytz \
    python-numpy \
    host-python-versioneer \
    host-python-numpy \
    host-python-cython

PYTHON_PANDAS_MESON_EXTRA_PROPERTIES += \
	sizeof_long_double=8 \
	longdouble_format='IEEE_DOUBLE_LE'

PYTHON_PANDAS_CONF_ENV += \
	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
	PYTHONPATH=$(PYTHON3_PATH)

$(eval $(meson-package))

Lastly here is line 55 of tzconversion.pyx.

cdef const int64_t[::1] _deltas_placeholder = np.array([], dtype=np.int64)


Any help appreciated, looking to push this upstream once I get it working.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

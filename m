Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7A6D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11C1813AD;
	Sat, 26 Oct 2024 21:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qu3WOFh3qJjg; Sat, 26 Oct 2024 21:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE00E81225
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE00E81225;
	Sat, 26 Oct 2024 21:47:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3D2C5C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6399A605E1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl9VV621qF-z for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47DB86059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DB86059A
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47DB86059A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:47:46 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a3b4663e40so11699275ab.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729979265; x=1730584065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDUa/EAzGmwqsssq2VrPXSWkRN7qOYUo3ofnVI46M5M=;
 b=ivS+D54apFgHQmhM+mhilCEvq9SKySnmPhPyxfXmAvEi9fRFwZLjPvNLhSdUCzxnwg
 CaItfCyP2gNo+otFGcFZOteDYoMKG44wT3CIPRZdKGHdqgfsNllRdk0/aZRt3tTcWkXI
 iHbZcBgtPbnzfsfk0DnCctinpVBnD+kwpf4zBGJV4LJuHyTTkwpnqiq6XZtzU9edCcsM
 gAhM8cyuB1k48fL/JkMbZlb5+qn+sbjEaoBtD+P5rpCOosRgWmkQeyWPRjmL6NKvx6y5
 kimHSoJJw7V4yxoOkDhclcEMmzUfEI/nYQoJRdxPT8/9SosD0DIsTlnfXeH7tvWjwA1g
 6r0A==
X-Gm-Message-State: AOJu0YyQ5HEtyOl4cRssS+MSHmww8vo7TizvrdCAlU17R0DueFlth4ua
 eL01ZV4u4ZDf7ky7wiXunX4qKEbXcbI7mnXfZm735rLjUL3ewmXsMfL2Eg==
X-Google-Smtp-Source: AGHT+IEK0fZcawk7cCfu+QPwQi1R9wAX9ROA0dmBNoDfTVdJQu458057pL8EeUUGLchHhPuPyPY6WQ==
X-Received: by 2002:a05:6e02:194a:b0:3a4:e377:d906 with SMTP id
 e9e14a558f8ab-3a4ed2b1f77mr25160525ab.1.1729979264954; 
 Sat, 26 Oct 2024 14:47:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e022e2sm8914685ab.51.2024.10.26.14.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 14:47:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:47:40 -0600
Message-Id: <20241026214741.3735496-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729979265; x=1730584065; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RDUa/EAzGmwqsssq2VrPXSWkRN7qOYUo3ofnVI46M5M=;
 b=OVorugOgX36q4q2f/oCUTYgNogtmsBXwjnSfHFR/NWZUAlPM/zPgjsyOFPZFN3m8IB
 pT+pk/fT4Ks4kqCKolUOUJGszf+UYuqSPO4VosxBjNF8pkK/WA91exe9ci0qlQTdHTHU
 An14xTafufcAJ4WNQPbGRVs617FXumbM877kPKZbQOP2GpG7ePuuhVul1BDaLZ/DtsP5
 riMFXOljsVcjYYIdNU25F7qe4w922TiIMWc+jUNxvuyLajQ02U21a8KRmJaE3zNrmukC
 icO1wx9yuTiCSbndkc2uKzV3wktT3veMJ+VhKY5Qm+Wg+DPKf/Xq9c9zQxB152s6HG1J
 nkVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OVorugOg
Subject: [Buildroot] [PATCH v6 1/2] package/python-numpy: bump to version
 1.26.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new supported architectures.

License hash changed due to date update:
https://github.com/numpy/numpy/commit/c1ffdbc0c29d48ece717acb5bfbf811c935b41f6

We need to build python-numpy with its vendored version of meson as
it currently relies on features that are not yet upstream. To do this
we can simply set the PYTHONPATH with the vendored meson path before
the normal PYTHON3_PATH so that the vendored version will have
precedence. We need to set this for both host and target numpy.

We also need to set the architecture specific longdouble_format
property as numpy is unable to determine the value for this without
being able to execute target binaries.

See:
https://github.com/numpy/numpy/blob/3e7e5c3cabb8f1a0d940dc6f2058fed4a8c3e284/doc/source/building/cross_compilation.rst

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - add comment about test program
  - add missing BR2_i386 long double format
  - remove duplicate BR2_armeb
Changes v4 -> v5:
  - Add new architectures
  - fixup longdouble option
---
 package/python-numpy/Config.in         |  6 +++
 package/python-numpy/python-numpy.hash |  7 +--
 package/python-numpy/python-numpy.mk   | 62 ++++++++++++++++++++++++--
 3 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index e10618f058..f8c71274cd 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -3,15 +3,21 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	# Numpy has some CPU specific code
 	default y if BR2_arc
 	default y if BR2_aarch64
+	default y if BR2_aarch64_be
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
+	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_sh
+	default y if BR2_sparc
+	default y if BR2_sparc64
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_PYTHON_NUMPY
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 6629cebbce..34426e7557 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,7 +1,8 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.25.0
-sha256  f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19  numpy-1.25.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/numpy/json
+md5  19550cbe7bedd96a928da9d4ad69509d  numpy-1.26.4.tar.gz
+sha256  2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010  numpy-1.26.4.tar.gz
 # License files, locally calculated
-sha256  1034d3bd61783f3b5e7ec3e7ca818f4da4135132323a0ef99f4c0edb3c7f6bd2  LICENSE.txt
+sha256  263223390c43a9d4a0841e0209265fd927a198f8e89c8eee809b7437d7e5e8c2  LICENSE.txt
 sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
 sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 200fac20a1..eec0e20d24 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.25.0
+PYTHON_NUMPY_VERSION = 1.26.4
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
-PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
+PYTHON_NUMPY_SITE = https://files.pythonhosted.org/packages/65/6e/09db70a523a96d25e115e71cc56a6f9031e7b8cd166c1ac8438307c14058
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
 PYTHON_NUMPY_LICENSE_FILES = \
 	LICENSE.txt \
@@ -22,7 +22,10 @@ HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 
 PYTHON_NUMPY_CONF_ENV += \
 	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
-	PYTHONPATH=$(PYTHON3_PATH)
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"
+
+PYTHON_NUMPY_NINJA_ENV += \
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"
 
 ifeq ($(BR2_PACKAGE_LAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += lapack
@@ -38,6 +41,59 @@ else
 PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
+# Generated by running this test program under QEMU:
+# https://github.com/numpy/numpy/blob/v1.26.4/numpy/core/meson.build#L376-L455
+ifeq ($(BR2_arcle),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_arceb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_aarch64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
+else ifeq ($(BR2_aarch64_be),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_arm),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_armeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_i386),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
+else ifeq ($(BR2_or1k),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_m68k),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = MOTOROLA_EXTENDED_12_BYTES_BE
+else ifeq ($(BR2_mips),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_mipsel),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_powerpc),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_BE
+else ifeq ($(BR2_powerpc64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_BE
+else ifeq ($(BR2_powerpc64le),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_LE
+else ifeq ($(BR2_riscv),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
+else ifeq ($(BR2_sh4)$(BR2_sh4a),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_sh4eb)$(BR2_sh4aeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_sparc),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_sparc64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_x86_64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_16_BYTES_LE
+endif
+
+PYTHON_NUMPY_MESON_EXTRA_PROPERTIES = \
+	longdouble_format='$(PYTHON_NUMPY_LONGDOUBLE_FORMAT)'
+
+HOST_PYTHON_NUMPY_CONF_ENV += \
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+HOST_PYTHON_NUMPY_NINJA_ENV += \
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
+
 # Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
 # in-tree code.
 HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

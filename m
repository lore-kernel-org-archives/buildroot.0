Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F032BC3ABB2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 02:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C768140F83;
	Tue, 17 Sep 2024 02:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_P4rCo1p9d9; Tue, 17 Sep 2024 02:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2951240E86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2951240E86;
	Tue, 17 Sep 2024 02:13:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67CDF1BF3D2
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B0140E86
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GWFnBgBN7Lf for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 02:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74D7A40274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D7A40274
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74D7A40274
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 02:13:40 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b482so128034039f.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 19:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726539219; x=1727144019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m8hXIO3Qjsz/ofbYrf9j3MY3YT18xEW3yO9UdiEJw2Y=;
 b=fksYTDNiBBwVZ9dRJweH08BUkGj8byXZGkXwVMgR/UH9SFIbaMJoj0GRYl/g4minsu
 TEt1WvWdZ+7KtwcmOLgcBSIytHXvCzAzbp1OznZ1eK3/T820BwN56R5W/OAUHlifIsfD
 sh4Iwtp80ny97S2gAF/oQxNzL6vqzWD96/l4eykHY03eMObCQ5X6j/IDLBWJ70aOxa3V
 uG6G1vnAUr7k+hAqFAvgDihg3LX501qR4Rjt0X0BfDULvu/N8ocB5lGCPYrJy00MwkdV
 P5bqTECP4ORULJTknC6TApmfQ/YLvIJdmhGpZf0WKGEZvlT7IMcwLusDF7VBSDrS1R1F
 mvfg==
X-Gm-Message-State: AOJu0Yz5iHOhAN9JyEsL8qk8ACMmzAzDYlxv8ZhucXswgcir1rfmLe/w
 FvleiAq+/GcOpjSLBHhyX1aZpeRfQ6Hn3I0u54wBTObuznk5op+RViR3kQ==
X-Google-Smtp-Source: AGHT+IE7pNjCy9B/IWAiqsWfVegl8wzcCpxGpnHxkmfVBEfEvvwBiCeSMrmJCclaM4+/Vlc33BLH+Q==
X-Received: by 2002:a05:6602:1402:b0:82c:fa71:2326 with SMTP id
 ca18e2360f4ac-82d376e83e4mr1261444139f.8.1726539218759; 
 Mon, 16 Sep 2024 19:13:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed34fb4sm1811265173.149.2024.09.16.19.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 19:13:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 20:13:30 -0600
Message-Id: <20240917021332.3838579-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726539219; x=1727144019; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m8hXIO3Qjsz/ofbYrf9j3MY3YT18xEW3yO9UdiEJw2Y=;
 b=js8A2wxsw/C4DbnFheOd2Q6lOmbAdsnKhbiVxoxjKMwCWVtkah8P/liXILwN6MYdVL
 L7UozLZsKb7K88VjzgXJu7f0/3Bd3exgmHqu6bYlm/P50xKhKrF3eb7NZX8CoUJc24Mq
 f6M0q6tHfaI8y5uUwGqPBq57psZKwqSzwNIKKPMNqt2x3xxTAxotFnvgOrouKHU30DA4
 Yumm/qYyz8KXXdRlbkFjZ3ic3esZVnXon8eAsz9wBBEdtYJComSftQbqCgBtdpoa7hwO
 msUIX55MatglnmElLBRkUs1DYA1wKpUMmoJcgO2Q/AGkZhQP9nWte5S87cAMvCsmzKeE
 P1Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=js8A2wxs
Subject: [Buildroot] [PATCH v5 1/3] package/python-numpy: bump to version
 1.26.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
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
Changes v4 -> v5:
  - Add new architectures
  - fixup longdouble option
---
 package/python-numpy/Config.in         |  6 +++
 package/python-numpy/python-numpy.hash |  7 +--
 package/python-numpy/python-numpy.mk   | 60 ++++++++++++++++++++++++--
 3 files changed, 67 insertions(+), 6 deletions(-)

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
index 200fac20a1..c866977e89 100644
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
@@ -38,6 +41,57 @@ else
 PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
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
+else ifeq ($(BR2_armeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
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

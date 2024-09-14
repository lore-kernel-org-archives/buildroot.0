Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B761FC021BA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6800281A99;
	Sat, 14 Sep 2024 20:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHiBkk9eI8Yd; Sat, 14 Sep 2024 20:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A02181B71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A02181B71;
	Sat, 14 Sep 2024 20:37:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E459C1BF86D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A93B6076D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZX5Ai5fIYdz for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F6626064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F6626064F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F6626064F
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:37:49 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso138361039f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726346268; x=1726951068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMTi/XzO7fHy/ERyLTmdkSV6DsVQLb6EnDkKnmHoPt8=;
 b=vVA+fP9Q6n4r9sMFgkC8GqFomVdK3X8ZQwnj0G5gSvT+bW+V9UE+ars8BUrsQncapX
 7MwpCaDd6tRNa5rubIYRJ2corU4n6HP1lqrjE10YVopcAdIHjhk1rVdrV7LRaUhw/YD4
 kNKTWtDDdv/Uikep5wBfMQz5mDf6Qn6ksQPtlmvZqmXAW5Uj7pd6ckHv4BOy1mCH+4un
 q1JahKFD+nI2Jeoi49Ko25rP7CLifL+9Lu6YQAUBncGfqLNGHOYy6QJ8suEt3Czq5d+l
 ilgeYk09Fe3OyQEPCEpOkdCDWmvqpfMQuaddjINvCVa6kMSgItI8hPvt6PyHAChw7Ib6
 iU7A==
X-Gm-Message-State: AOJu0YwXClpPWwhcMfptNONXJiEmeKJ2Zj2K4a+PWQQKx/qJ3ZeZzX2F
 SAWPdc6TEfwSDF9NqN9L5LPtDAc1TBLM/11i7NthErWaWACgJKzTSku2e9gc
X-Google-Smtp-Source: AGHT+IHAnDvnzzRXhxlm+KUIDgrwlTkeYN7LUne8Ch0zL5Fssrqa+dFHzYk/wTFkck5B9ZbMN3T5gg==
X-Received: by 2002:a05:6602:6a87:b0:82d:314:23de with SMTP id
 ca18e2360f4ac-82d1f922332mr1055535839f.8.1726346268130; 
 Sat, 14 Sep 2024 13:37:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d093sm564035173.74.2024.09.14.13.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 13:37:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:37:38 -0600
Message-Id: <20240914203740.1089249-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726346268; x=1726951068; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JMTi/XzO7fHy/ERyLTmdkSV6DsVQLb6EnDkKnmHoPt8=;
 b=WN0chloYWYSioCOa81McElrOq2XqDXn6mCjMWxKdnzOr25nml5DzMzzpYO1alBfedo
 aNCOvCrl5oQonyRxokguPVmKuneTSfALL1ryQ6KqvXi5b77Xlc66sgn9iaVPZbXA3Y7N
 IpPt8maTnF73ZcWSdfhxjiW5+hD9qZjG/ydB1pf6lAdt4JUmyw04h/mVT939PUxLChAQ
 pQ2dmq19NvaYJphXJYtYAQLaVdqeF7rDZV9TRJmxLxc0gJP44pr1tL2FuzrQA5C+MFLu
 9J9f9NVJauIk7UN+8Kq9w7nlGRTDlMLkQNZxkAqNhsDeV0o+4ihAR45yBeSgPEk9A55c
 JZpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WN0chloY
Subject: [Buildroot] [PATCH v4 1/3] package/python-numpy: bump to version
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
 package/python-numpy/python-numpy.hash |  7 ++--
 package/python-numpy/python-numpy.mk   | 44 ++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 6 deletions(-)

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
index 200fac20a1..36ae278ff1 100644
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
@@ -38,6 +41,41 @@ else
 PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
+ifeq ($(BR2_arcle),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_arceb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_aarch64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
+else ifeq ($(BR2_arm),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
+else ifeq ($(BR2_armeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = MOTOROLA_EXTENDED_12_BYTES_BE
+else ifeq ($(BR2_i386),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
+else ifeq ($(BR2_mips),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_mipsel),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
+else ifeq ($(BR2_powerpc),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_powerpc64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_sh),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_x86_64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
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

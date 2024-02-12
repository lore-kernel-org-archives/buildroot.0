Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE192C4829A
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7245384118;
	Mon, 12 Feb 2024 00:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixYSZBEtH_Ct; Mon, 12 Feb 2024 00:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F349E84124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F349E84124;
	Mon, 12 Feb 2024 00:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 652C91BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 511EA40189
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMGiXO-RBYXd for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9916440106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9916440106
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9916440106
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:41:08 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bffface817so150990439f.3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707698467; x=1708303267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMTi/XzO7fHy/ERyLTmdkSV6DsVQLb6EnDkKnmHoPt8=;
 b=hZHWVX2lZvrJ+wkLpQw5Hat3OmuxK49w52Tj4ygp0HSGklrx/9AESl/+CqLMR2e9zs
 0AJCjZhKXUEtl/BWISBdSEIKckvE9tbdjUkfTwJEFl6f/4YExrpQ2ObLoVhUDxTrhwnU
 DO5AhSGCy7mVzCMqYHPBxebr1uo7MI1WFYU9knCEY6KFHAQgucvId8YIQskXPj1L+8V2
 tDmCvvevVcTCSj840G8YJ0Gy52EltfLLwlp5Zk6dNdZm6vNb9fxWkInnVVlrbcn2S5c0
 XZHauQcP07KxVGDrZVhZUOFTRVXQOyJh3OqRthIvWP2QGQU8jBHOvlbxy6v3oN+eWH/x
 tsdw==
X-Gm-Message-State: AOJu0YxLjNDUmPmTghoABQ5Dy3EKrfJ8Q+7RS0xiStqQn+nsvT1Ewbwc
 ovwAmrNRdqOv/TMbyYzMj/snzx145MsKiUZyyjnPunW3FplPmF0Ok2SFEW3A0iw=
X-Google-Smtp-Source: AGHT+IETZy0WYCqJzElq8x5W4FNUjhuoM+aeBxwjL+zxUFv2xm8ECUQJZs6fjm2Onre4Qn38BwOAPQ==
X-Received: by 2002:a6b:6114:0:b0:7c4:4a37:c7ba with SMTP id
 v20-20020a6b6114000000b007c44a37c7bamr7662431iob.4.1707698467097; 
 Sun, 11 Feb 2024 16:41:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9W4E0NmBP9AVqQfP3buZasf9a5bzmzup69vGIIAoPeZKjBQDY0vseC9mUSF3KHI/Q06tE5DPJhRnKlt46fD7hBiuC31gqR2F51KM9Y5F9rw4J5gc/2iTalv4UWe3mjmLKC/1/dPuGkQedz80eb7HWxYjKBKNlnTQ0eGNaU6bELrJRI3VoIzEukFW/EJu40KBjCeqcCCIV3Fjb3v3zG1KPKKZ8uP2edMPPBsL2QSKnbmD5ln8gELHag+84GEmsAQ1IqBBi8+x0kzezdq4aonChHIqGZXXh8dMgtgQ1YzPSQPyWg6csaonCBi+qUAEXhe01V+neACpl938H24crKrXmgb8=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 cs23-20020a056638471700b004715747ede4sm1141084jab.55.2024.02.11.16.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 16:41:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 17:40:59 -0700
Message-Id: <20240212004101.614670-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212004101.614670-1-james.hilliard1@gmail.com>
References: <20240212004101.614670-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707698467; x=1708303267; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JMTi/XzO7fHy/ERyLTmdkSV6DsVQLb6EnDkKnmHoPt8=;
 b=LjMxZKqX22EyayRKXJAhulN/hQPFz5O/3j87/LYOegQ2MxU2H/QCOigZQR8jUFsZmD
 zrsTG1uL8YKlAT03u0CxxZOIeS7KdRiWTnR23NUoOlwbubxl47WOdE8l0/1OL0Nt/oHI
 KtmuHaF+P0uVmeKDtJPGfPkJKg6hbiJ91lUc5ISnZJOJFr7RzHXh9uL4JnKhnDFyjITW
 AaZfW56ebN1+3aOJDw6mMxTPiIfhT8BHl3VZS/LCdyeVgNU4Mkk/6avnYqyHqSpBba5q
 BU5ee8gLuRv7a8fv1Vz35mBebXlJ41o4muJjr2U2MbKHD+n8sQn6KrwffQONRQ92PdOW
 ieYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LjMxZKqX
Subject: [Buildroot] [PATCH v3 3/5] package/python-numpy: bump to version
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
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

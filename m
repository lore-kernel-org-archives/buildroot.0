Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D882DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 07:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719FD60C05;
	Sun,  1 May 2022 07:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_6_bByDYX4t; Sun,  1 May 2022 07:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6690560BEF;
	Sun,  1 May 2022 07:44:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0901BF3EF
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 07:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C85C401D5
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 07:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thjQmCKfgiZi for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 07:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E286400AB
 for <buildroot@buildroot.org>; Sun,  1 May 2022 07:44:12 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id e15so13630500iob.3
 for <buildroot@buildroot.org>; Sun, 01 May 2022 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zQsTS+ROby2B8QNj46xQkLxP0s1qB0/uXWZqEHU3JnU=;
 b=M+reA13bkOi9IAq8cEzNk3TQc2ohUPzJNKApp6ab74B3BJHmP44Da+G4PUnQXlWhPc
 Mke+C6oy8ujdimi4sNfuBN+GHp53AvCOUCOPJkZGK1HnBkjXiUjtkgruug+VI5zcss2R
 yFgWJ5xFtukrPH9/mmNKFxK2twC5WVXQPjjGkIMXtIZv5GvmPr04G3oj5qFu2sQwgcsb
 Q77LWfeYlWENzaYSydW2HW8JXEHDH154Qar2labhVJ3+rVmzuALJ2rEuW8pOr2dSTWQe
 X7L6m2JHdRIBqOTO8w8xHVzoCZQNsJUft57ualsdBpXoloo+7IjUp/7V9JTV2liZcBCY
 Fkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zQsTS+ROby2B8QNj46xQkLxP0s1qB0/uXWZqEHU3JnU=;
 b=WgJCQOgRczO1E2ZMMUikjRKZgVdXXG4efPLX7kWJDbwE5efkgmvkNuox7TzHPU7rDc
 M1jfqJyPQ4eOfxmJZZesidwUVhmgrHHWMNE9Q5gO4gENXrumsrQzAtQWMN2NGdJn6qcM
 k2Am6Qe5TFgFKInCpO87d+mEpYwscWf3gHwLdMXSCks42vgvGEPT15Jeqvh9cjRBre+U
 sywSTIQlpsO77ylkveFfHX/WmSs7dObIM/mLrnZrJgNtRhR5Bg2IFHW/khT2mSARPIJh
 CMJRs5jL27HsYm5oA2SiZgfvBD0AJTcryHYTh5U7WnO0Ztm1KVNXUknxHmpQ/YwzVYA0
 F3ng==
X-Gm-Message-State: AOAM5332T75p0Z6QMjJZvD+qCmxrAKhiFy3sRpnQEufWOiKg+TJhT044
 NitnOSiZyme8W5nEhg7zEqatYPPPbjM=
X-Google-Smtp-Source: ABdhPJxLtEJLsX0q/l+S9qSsY1EHW8wabi58TlKvTKQ9kvLFFJOyJeZCBbwg2racBw15xwzBtqPI1w==
X-Received: by 2002:a05:6638:4086:b0:32b:4ecb:86e5 with SMTP id
 m6-20020a056638408600b0032b4ecb86e5mr3018613jam.221.1651391051244; 
 Sun, 01 May 2022 00:44:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j18-20020a02a692000000b0032b3a7817b3sm2103377jam.119.2022.05.01.00.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 00:44:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 01:44:00 -0600
Message-Id: <20220501074401.1135229-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/pkg-python: add setuptools-rust
 infrastructure
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The setuptools-rust package infrastructure is essentially a variant
of the setuptools package infrastructure which sets up the env
and download hooks required for building setuptools-rust packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 46 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b86e12423f..a9bb12550c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -110,6 +110,24 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
+# Target setuptools-rust-based packages
+PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
+	$(PKG_CARGO_ENV)
+
+# Host setuptools-rust-based packages
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
+	$(HOST_PKG_CARGO_ENV)
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -177,14 +195,30 @@ $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
-else ifeq ($$($(2)_SETUP_TYPE),setuptools)
+else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+$(2)_DL_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+else
 $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = setup.py build
 $(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+$(2)_DL_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
+ifndef $(2)_CARGO_MANIFEST_PATH
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(3)_CARGO_MANIFEST_PATH)
+else
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+endif
+else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
@@ -208,7 +242,7 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= -m installer dist/*
 endif
 else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 
 # Target packages need both the python interpreter on the target (for
@@ -225,8 +259,14 @@ endif # ($(4),target)
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
-ifeq ($$($(2)_SETUP_TYPE),setuptools)
+ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_DEPENDENCIES += host-python-setuptools-rust host-rustc
+# We need to vendor the Cargo crates at download time
+$(2)_DOWNLOAD_POST_PROCESS = cargo
+$(2)_DOWNLOAD_DEPENDENCIES = host-rustc
+endif
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

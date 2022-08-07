Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D45C19F2D
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 00:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2556E41838;
	Sun,  7 Aug 2022 00:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2556E41838
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kN0fez0Rt9ss; Sun,  7 Aug 2022 00:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E14141834;
	Sun,  7 Aug 2022 00:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E14141834
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 538D61BF3A1
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28AA840359
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28AA840359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHgo5WtGQ8uY for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 00:38:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DAB64012D
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DAB64012D
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 00:38:54 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10ea30a098bso6896856fac.8
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 17:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ZjO2FVYtC4a+/2w6z+LdMfnkEE+FY9j8ei5OoJ0scZs=;
 b=2HfIbMHgJLkzKO5xXgpaF7dh1//2NIL7nzAI4HSWRalZ20KeFWHhbxffO9ldGIilJx
 mwpCctzhesqwffUDeI5EUzBl6xf0xljpfhPR0+PvanNtrOGTohzvTAXK/NWQ0Pw/bLiq
 kNyPZY4kvhrbQ4hxAtjJRYPlw/Dbf6X0KAWXh5DfsOYTQ1e5PyWSxVkUp5QerclkKV4J
 u0390IXoh4OnZvg07ekoY9BT2jihC28MNCgRaR55mahMwLC89XNvrpz9eICyYuaFKq9q
 wriaI4hxsaun0vFuuDTM7mU8FzvB3OtZQFRzBxICg009aMqiome99d6IJSyyiPG3OtF4
 OOQA==
X-Gm-Message-State: ACgBeo3GPw+/DNC6fNgDO5oPFOrcQ41st6EU0Fdw36jH0MV7gpBdJiTh
 Q/k4ypRWxY7ENMEdxzKhhMR6l7rwRvs=
X-Google-Smtp-Source: AA6agR6SSJm1ZJy/k5eDDeyt8DTdVHqL6HGJO4kL7/ghSLQkh6wabtyKvZixT5TvtHvBuCdpP68G0g==
X-Received: by 2002:a05:6870:c0ca:b0:10d:cc1e:5c4c with SMTP id
 e10-20020a056870c0ca00b0010dcc1e5c4cmr6198677oad.132.1659832732323; 
 Sat, 06 Aug 2022 17:38:52 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 j8-20020a9d7f08000000b0061cac699458sm1469298otq.38.2022.08.06.17.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 17:38:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 18:38:28 -0600
Message-Id: <20220807003832.1177015-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ZjO2FVYtC4a+/2w6z+LdMfnkEE+FY9j8ei5OoJ0scZs=;
 b=ELvpcXpYMWhc8094LcQVREl83czvZg9NqkAJGXUfytUe1HO8vuR3/RR9R93M6Iia/H
 qVtUGDu+xwgJ8709lmemlpZquwVO0vl+r7Rmvo+xRQF4LHcOqQ/u4I0lglbA3G4kNcHg
 HtKN2eKlOjWZq+JdKm3dCU71O/jZ7lQ/j5b1/Sdtg/KeliRA4GqFcwysrydYY6AP1Nlb
 kjb5SU6IfCIEarviI2W+/abWihxRYRLUeZWMtCK0Ja3d8dx8SPPo7ep+qtJTAoWY/O+b
 bKvdT010JQO6DNwq9GsJm+iAnm1/GnxDn9FnaDZo0jk1XvnfTWMfFFXrIcbMV5ViQ46K
 6olw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ELvpcXpY
Subject: [Buildroot] [PATCH v4 1/5] package/pkg-python: add
 pyo3(setuptools-rust/maturin) infrastructure
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pyo3 package infrastructure provides two build backends, one
of which is based on setuptools while the other is a pep517 backend.

The setuptools-rust build backend is a setuptools extension that is
capable of building python rust extensions.

The maturin build backend is a pep517 build extension that is itself
written in rust, it is itself bootstrapped using setuptools-rust but
is not itself a setuptools extension and uses pep517 infrastructure.

As both backends use pyo3 we need to set up the pyo3 environment in
addition to cargo vendoring for each.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - generalize infrastructure to support both pyo3 build backends
---
 package/pkg-python.mk | 92 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 87 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5794e3a195..0dcd2622c5 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -113,6 +113,24 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
+PKG_PYTHON_PYO3_ENV = \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+HOST_PKG_PYTHON_PYO3_ENV = \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+# Target setuptools-rust-based packages
+PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(PKG_PYTHON_PYO3_ENV)
+
+# Host setuptools-rust-based packages
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(HOST_PKG_PYTHON_PYO3_ENV)
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -142,6 +160,16 @@ HOST_PKG_PYTHON_PEP517_ENV = \
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
+# Target maturin packages
+PKG_PYTHON_MATURIN_ENV = \
+	$(PKG_PYTHON_PEP517_ENV) \
+	$(PKG_PYTHON_PYO3_ENV)
+
+# Host maturin packages
+HOST_PKG_PYTHON_MATURIN_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV) \
+	$(HOST_PKG_PYTHON_PYO3_ENV)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -180,25 +208,41 @@ $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
-else ifeq ($$($(2)_SETUP_TYPE),setuptools)
+else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+else
 $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
-else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
+ifeq ($$($(2)_SETUP_TYPE),maturin)
+$(2)_BASE_ENV = $$(PKG_PYTHON_MATURIN_ENV)
+else
 $(2)_BASE_ENV = $$(PKG_PYTHON_PEP517_ENV)
+endif
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
 else
+ifeq ($$($(2)_SETUP_TYPE),maturin)
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_MATURIN_ENV)
+else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
+endif
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_CMD = -m installer dist/*
 endif
@@ -211,7 +255,29 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= -m installer dist/*
 endif
 else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
+endif
+
+# We need to vendor the Cargo crates at download time for pyo3 based
+# packages.
+#
+ifneq ($$(filter maturin setuptools-rust,$$($(2)_SETUP_TYPE)),)
+ifeq ($(4),target)
+$(2)_DL_ENV = $$(PKG_CARGO_ENV)
+else
+$(2)_DL_ENV = $$(HOST_PKG_CARGO_ENV)
+endif
+ifndef $(2)_CARGO_MANIFEST_PATH
+ifdef $(3)_CARGO_MANIFEST_PATH
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(3)_CARGO_MANIFEST_PATH)
+else
+ifneq ($$($(2)_SUBDIR),)
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+endif
+endif
+else
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+endif
 endif
 
 # Target packages need both the python interpreter on the target (for
@@ -228,19 +294,35 @@ endif # ($(4),target)
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
-ifeq ($$($(2)_SETUP_TYPE),setuptools)
+ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
-else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_DEPENDENCIES += host-python-setuptools-rust
+endif
+else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
+ifeq ($$($(2)_SETUP_TYPE),maturin)
+$(2)_DEPENDENCIES += host-python-maturin
+endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 # Don't add dependency on host-python-installer for
 # host-python-installer itself, and its dependencies.
 ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
 $(2)_DEPENDENCIES += host-python-installer
 endif
+endif
+
+# Pyo3 based packages(setuptools-rust and maturin) will need rust
+# toolchain dependencies for the host Python interpreter (both host
+# and target).
+#
+ifneq ($$(filter maturin setuptools-rust,$$($(2)_SETUP_TYPE)),)
+$(2)_DEPENDENCIES += host-rustc
+$(2)_DOWNLOAD_POST_PROCESS = cargo
+$(2)_DOWNLOAD_DEPENDENCIES = host-rustc
 endif # SETUP_TYPE
 
 # Python interpreter to use for building the package.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

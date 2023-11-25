Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79BFC4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 21:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FFEE8126D;
	Sat, 25 Nov 2023 21:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FFEE8126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ONgkTZv7m_a; Sat, 25 Nov 2023 21:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B00638174D;
	Sat, 25 Nov 2023 21:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B00638174D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73E811BF473
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50947400B8
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50947400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iFUe4NBUe0Ae for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 21:05:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA5CE40167
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA5CE40167
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8846873A6; Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ee9b7ee9ce60476609a66c35f4fa94ba7f61175b
X-Git-Newrev: 6b915358babe37a721b4f6e032ec884174bd6e0b
X-Patchwork-Hint: ignore
Message-Id: <20231125210555.C8846873A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-python.mk: replace
 $(_BASE_INSTALL*_CMD) with $($(SETUP_TYPE)_INSTALL*_CMD)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b915358babe37a721b4f6e032ec884174bd6e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The _BASE_INSTALL*_CMD variables are set based on the setup type, and
only based on the setup type. Because of this, we have a large
conditional tree in inner-python-package which makes things hard to
read.

Rather than conditions, it's also possible to use indirect variables.
Concretely, we can define PKG_PYTHON_DISTUTILS_INSTALL_TARGET_CMD etc.,
and use $(PKG_PYTHON_$($(PKG)_SETUP_TYPE)_INSTALL_TARGET_CMD) instead of
$($(PKG)_BASE_INSTALL_TARGET_CMD) to dispatch to the right
_INSTALL_TARGET_CMD variable. The same applies to _INSTALL_STAGING_CMD
and HOST_..._INSTALL_CMD.

Since the _INSTALL*_OPTS variables are not (or no longer) used anywhere
else, we can fold them into the _INSTALL*_CMD variables.

setuptools-rust, flit and maturin didn't have their own definition of
_BUILD_CMD but were under the setuptools resp. pep517 condition. For
these, we have to define new variables that copy the value from
PKG_PYTHON_SETUPTOOLS_BUILD_CMD resp. PKG_PYTHON_PEP517_BUILD_CMD.

The condition tree is now empty, except for the error handling. Rework
the conditions for the error handling and remove all other conditions.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 101 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 41 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index be9756acc4..bda79116c8 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -65,11 +65,13 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr
 
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_DISTUTILS_INSTALL_TARGET_CMD = \
+	setup.py install --no-compile \
 	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
-PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
+PKG_PYTHON_DISTUTILS_INSTALL_STAGING_CMD = \
+	setup.py install \
 	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
@@ -80,7 +82,8 @@ HOST_PKG_PYTHON_DISTUTILS_ENV = \
 HOST_PKG_PYTHON_DISTUTILS_BUILD_CMD = \
 	setup.py build \
 
-HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
+HOST_PKG_PYTHON_DISTUTILS_INSTALL_CMD = \
+	setup.py install \
 	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
@@ -99,11 +102,15 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) \
+	install --no-compile \
 	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) \
+	install \
 	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
@@ -114,7 +121,9 @@ HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
 	$(PKG_PYTHON_SETUPTOOLS_CMD) build
 
-HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
+HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) \
+	install \
 	--prefix=$(HOST_DIR) \
 	--root=/ \
 	--single-version-externally-managed
@@ -128,6 +137,12 @@ PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
 	$(PKG_PYTHON_SETUPTOOLS_BUILD_CMD)
 
+PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD)
+
 # Host setuptools-rust-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
@@ -137,6 +152,9 @@ HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD)
 
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD)
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -148,14 +166,18 @@ PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--interpreter=/usr/bin/python \
 	--script-kind=posix
 
-PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
 	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
 	--data=$(TARGET_DIR)/usr
 
-PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
+PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
 	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
@@ -169,7 +191,9 @@ HOST_PKG_PYTHON_PEP517_ENV = \
 HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
 	-m build -n -w
 
-HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
+HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
 	--interpreter=$(HOST_DIR)/bin/python \
 	--script-kind=posix \
 	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
@@ -184,6 +208,12 @@ PKG_PYTHON_FLIT_ENV = \
 PKG_PYTHON_FLIT_BUILD_CMD = \
 	$(PKG_PYTHON_PEP517_BUILD_CMD)
 
+PKG_PYTHON_FLIT_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_FLIT_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
 # Host flit packages
 HOST_PKG_PYTHON_FLIT_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV)
@@ -191,6 +221,9 @@ HOST_PKG_PYTHON_FLIT_ENV = \
 HOST_PKG_PYTHON_FLIT_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
+HOST_PKG_PYTHON_FLIT_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 # Host flit-bootstrap packages
 HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV)
@@ -198,6 +231,9 @@ HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV = \
 HOST_PKG_PYTHON_FLIT_BOOTSTRAP_BUILD_CMD = \
 	-m flit_core.wheel
 
+HOST_PKG_PYTHON_FLIT_BOOTSTRAP_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 # Target maturin packages
 PKG_PYTHON_MATURIN_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
@@ -207,6 +243,12 @@ PKG_PYTHON_MATURIN_ENV = \
 PKG_PYTHON_MATURIN_BUILD_CMD = \
 	$(PKG_PYTHON_PEP517_BUILD_CMD)
 
+PKG_PYTHON_MATURIN_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_MATURIN_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
 # Host maturin packages
 HOST_PKG_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV) \
@@ -216,6 +258,9 @@ HOST_PKG_PYTHON_MATURIN_ENV = \
 HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
+PKG_PYTHON_MATURIN_INSTALL_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_CMD)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -242,37 +287,11 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-# Distutils
-ifeq ($$($(2)_SETUP_TYPE),distutils)
-ifeq ($(4),target)
-$(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
-endif
-# Setuptools
-else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
-ifeq ($(4),target)
-$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
-endif
-else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
-ifeq ($(4),target)
-$(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+ifneq ($$(filter-out distutils setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
-else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
-ifeq ($(4),target)
+ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
-else
-$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
-endif
-else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 
 # We need to vendor the Cargo crates at download time for pyo3 based
@@ -368,7 +387,7 @@ define $(2)_INSTALL_TARGET_CMDS
 		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_INSTALL_TARGET_CMD) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
 endif
@@ -383,7 +402,7 @@ define $(2)_INSTALL_STAGING_CMDS
 		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_INSTALL_STAGING_CMD) \
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
 endef
 endif
@@ -415,7 +434,7 @@ define $(2)_INSTALL_CMDS
 		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_CMD) \
+		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_INSTALL_CMD) \
 		$$($$(PKG)_INSTALL_OPTS))
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6BE728E2
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616F68235C;
	Fri, 29 Sep 2023 20:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 616F68235C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6jOc00VFMRz; Fri, 29 Sep 2023 20:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64DE582381;
	Fri, 29 Sep 2023 20:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64DE582381
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F37061BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D70D540AA2
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D70D540AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3emdhNsiLrdy for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA0F440223
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA0F440223
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C2098367B; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:02:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf117989a02970edd9e33320772fde7be03b1fe5
X-Git-Newrev: a8fe36b5325e616b7c997c18527b969d9e7e9189
X-Patchwork-Hint: ignore
Message-Id: <20230929200351.8C2098367B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: add setuptools-rust
 and maturin infrastructure
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8fe36b5325e616b7c997c18527b969d9e7e9189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python has two build backends for packages that use Rust:
setuptools-rust and maturin. Both are provided by the pyo3 package
infrastructure (but that's not relevant for Buildroot).

The setuptools-rust build backend is a setuptools extension that is
capable of building python rust extensions.

The maturin build backend is a pep517 build extension that is itself
written in rust, it is itself bootstrapped using setuptools-rust but
is not itself a setuptools extension.

Both are from the pyo3 build infrastructure, so we add both of them in a
single patch. They also share a lot of the cargo-specific handling.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: remove the _PYO3_ENV variables, the add little benefit]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk | 88 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 85374ae8bb..28ee4cb85f 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -109,6 +109,18 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
+# Target setuptools-rust-based packages
+PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+# Host setuptools-rust-based packages
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -146,6 +158,18 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
+# Target maturin packages
+PKG_PYTHON_MATURIN_ENV = \
+	$(PKG_PYTHON_PEP517_ENV) \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+# Host maturin packages
+HOST_PKG_PYTHON_MATURIN_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV) \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -184,25 +208,41 @@ $(2)_BASE_BUILD_CMD   = setup.py build
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
 $(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
@@ -215,7 +255,29 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
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
@@ -232,19 +294,35 @@ endif # ($(4),target)
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
-ifeq ($$($(2)_SETUP_TYPE),setuptools)
+ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-setuptools
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DDAC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A635E417DC;
	Mon,  4 Dec 2023 20:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A635E417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mjt21DKhgOdy; Mon,  4 Dec 2023 20:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 942E741821;
	Mon,  4 Dec 2023 20:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 942E741821
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30C9B1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F176241766
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F176241766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sRq4CsBz0FB for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2347C41750
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2347C41750
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21249879B9; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e447e8b2fdf94bed898208f69c2acf7a1856df0
X-Git-Newrev: b28b95d1e4087e7569522565a8327f45f39e11de
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.21249879B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: replace
 $(_BASE_BUILD_CMD) with $($(SETUP_TYPE)_BUILD_CMD)
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

commit: https://git.buildroot.net/buildroot/commit/?id=b28b95d1e4087e7569522565a8327f45f39e11de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The _BASE_BUILD_CMD variable is set based on the setup type, and only
based on the setup type. Because of this, we have a large conditional
tree in inner-python-package which makes things hard to read.

Rather than conditions, it's also possible to use indirect variables.
Concretely, we can define PKG_PYTHON_DISTUTILS_BUILD_CMD etc., and use
$(PKG_PYTHON_$($(PKG)_SETUP_TYPE)_BUILD_CMD) instead of
$($(PKG)_BASE_BUILD_CMD) to dispatch to the right _BUILD_CMD variable.

Once we do the same for all other variables that are set in the
condition tree, we'll be able to remove the condition tree entirely.

setuptools-rust, flit and maturin didn't have their own definition of
_BUILD_CMD but were under the setuptools resp. pep517 condition. For
these, we have to define new variables that copy the value from
PKG_PYTHON_SETUPTOOLS_BUILD_CMD resp. PKG_PYTHON_PEP517_BUILD_CMD.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 50 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 8e8955f3c4..5f8ef14262 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -57,7 +57,8 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	$(PKG_PYTHON_ENV) \
 	LDSHARED="$(TARGET_CROSS)gcc -shared"
 
-PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
+PKG_PYTHON_DISTUTILS_BUILD_CMD = \
+	setup.py build \
 	--executable=/usr/bin/python
 
 PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
@@ -76,6 +77,9 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	$(HOST_PKG_PYTHON_ENV)
 
+HOST_PKG_PYTHON_DISTUTILS_BUILD_CMD = \
+	setup.py build \
+
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)
 
@@ -86,6 +90,9 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 PKG_PYTHON_SETUPTOOLS_CMD = \
 	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
 
+PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) build
+
 PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
@@ -104,6 +111,9 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(HOST_PKG_PYTHON_ENV)
 
+HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) build
+
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--root=/ \
@@ -115,16 +125,25 @@ PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 
+PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_BUILD_CMD)
+
 # Host setuptools-rust-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
 	$(HOST_PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
 
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD)
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
 
+PKG_PYTHON_PEP517_BUILD_CMD = \
+	-m build -n -w
+
 PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--interpreter=/usr/bin/python \
 	--script-kind=posix
@@ -147,6 +166,9 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_PEP517_ENV = \
 	$(HOST_PKG_PYTHON_ENV)
 
+HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
+	-m build -n -w
+
 HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--interpreter=$(HOST_DIR)/bin/python \
 	--script-kind=posix \
@@ -162,26 +184,41 @@ HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 PKG_PYTHON_FLIT_ENV = \
 	$(PKG_PYTHON_PEP517_ENV)
 
+PKG_PYTHON_FLIT_BUILD_CMD = \
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
+
 # Host flit packages
 HOST_PKG_PYTHON_FLIT_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV)
 
+HOST_PKG_PYTHON_FLIT_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
+
 # Host flit-bootstrap packages
 HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV)
 
+HOST_PKG_PYTHON_FLIT_BOOTSTRAP_BUILD_CMD = \
+	-m flit_core.wheel
+
 # Target maturin packages
 PKG_PYTHON_MATURIN_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
 	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 
+PKG_PYTHON_MATURIN_BUILD_CMD = \
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
+
 # Host maturin packages
 HOST_PKG_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV) \
 	$(HOST_PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
 
+HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -211,37 +248,30 @@ $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 # Distutils
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
-$(2)_BASE_BUILD_CMD = setup.py build $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
 $(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
 else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-$(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 ifeq ($(4),target)
 $$(error flit-bootstrap setup type only supported for host packages)
 else
-$(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else
@@ -326,7 +356,7 @@ define $(2)_BUILD_CMDS
 		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_BUILD_CMD) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_BUILD_CMD) \
 		$$($$(PKG)_BUILD_OPTS))
 endef
 endif
@@ -373,7 +403,7 @@ define $(2)_BUILD_CMDS
 		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_BUILD_CMD) \
+		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_BUILD_CMD) \
 		$$($$(PKG)_BUILD_OPTS))
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

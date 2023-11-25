Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8C9C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE5DC41B9C;
	Mon,  4 Dec 2023 20:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE5DC41B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISQlb55GUORX; Mon,  4 Dec 2023 20:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF62641869;
	Mon,  4 Dec 2023 20:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF62641869
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4BA1BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F7CF60B4E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7CF60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id avrAkSQKo4XB for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18BD060FF6
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18BD060FF6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16C0C879B7; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aae25fb55e13198cfabbcbd7e561767d337c0407
X-Git-Newrev: 9e447e8b2fdf94bed898208f69c2acf7a1856df0
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.16C0C879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: replace
 $(_BASE_ENV) with $($(SETUP_TYPE)_ENV)
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e447e8b2fdf94bed898208f69c2acf7a1856df0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The _BASE_ENV variable is set based on the setup type, and only based on
the setup type. Because of this, we have a large conditional tree in
inner-python-package which makes things hard to read.

Rather than conditions, it's also possible to use indirect variables.
Concretely, we can use $(PKG_PYTHON_$($(PKG)_SETUP_TYPE)_ENV) instead
of $($(PKG)_BASE_ENV) to dispatch to the right ENV variable.

Once we do the same for all other variables that are set in the
condition tree, we'll be able to remove the condition tree entirely.

Because $($(PKG)_SETUP_TYPE) is lowercase (e.g. 'setuptools' or
'pep517'), while the existing _ENV variables have uppercase names (e.g.
PKG_PYTHON_SETUPTOOLS_ENV), we need to convert the setup type to
uppercase. Introduce the variable $(PKG)_SETUP_TYPE_UPPER for this.

flit was reusing the _BASE_ENV definition from pep517, and flit-bootstrap
also didn't have its own _ENV definition yet, so those have to be added.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 52 ++++++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index c1640d71bb..8e8955f3c4 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -158,6 +158,18 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
+# Target flit packages
+PKG_PYTHON_FLIT_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+# Host flit packages
+HOST_PKG_PYTHON_FLIT_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+# Host flit-bootstrap packages
+HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
 # Target maturin packages
 PKG_PYTHON_MATURIN_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
@@ -194,54 +206,34 @@ ifndef $(2)_SETUP_TYPE
  endif
 endif
 
+$(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
+
 # Distutils
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
-$(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_CMD = setup.py build $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
 $(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
 else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
-$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
-else
-$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-endif
 $(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
-ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
-else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-endif
 $(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-ifeq ($$($(2)_SETUP_TYPE),maturin)
-$(2)_BASE_ENV = $$(PKG_PYTHON_MATURIN_ENV)
-else
-$(2)_BASE_ENV = $$(PKG_PYTHON_PEP517_ENV)
-endif
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
 else
-ifeq ($$($(2)_SETUP_TYPE),maturin)
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_MATURIN_ENV)
-else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
-endif
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
@@ -249,7 +241,6 @@ else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 ifeq ($(4),target)
 $$(error flit-bootstrap setup type only supported for host packages)
 else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
@@ -332,7 +323,8 @@ ifeq ($(4),target)
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
 		$$($$(PKG)_BUILD_OPTS))
@@ -346,7 +338,8 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
@@ -360,7 +353,8 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
@@ -376,7 +370,8 @@ else # host
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
 		$$($$(PKG)_BUILD_OPTS))
@@ -390,7 +385,8 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_CMD) \
 		$$($$(PKG)_INSTALL_OPTS))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

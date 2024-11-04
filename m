Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5598D1CA04
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F4380C7E;
	Mon,  4 Nov 2024 22:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12XtfSEzbrRi; Mon,  4 Nov 2024 22:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED7480C8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED7480C8C;
	Mon,  4 Nov 2024 22:20:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D80FAB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C60AC405B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvVbkxzAhzR9 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85D3A400AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85D3A400AC
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:20:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7080C85D22; Mon,  4 Nov 2024 22:20:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 23:19:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f27fc081e8755e2bd0071690a4e55c118981b337
X-Git-Newrev: 0205f4c2b8d5b74967c1b1e361b21e238a245edd
X-Patchwork-Hint: ignore
Message-Id: <20241104222005.7080C85D22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: add poetry setup
 type
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0205f4c2b8d5b74967c1b1e361b21e238a245edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we have many python packages using the poetry(poetry-core) build
system we should add a setup type for it so that we don't have to
manually specify the host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.adoc |  2 +-
 docs/manual/adding-packages-python.adoc    | 20 +++++++++----------
 package/pkg-python.mk                      | 31 ++++++++++++++++++++++++++++--
 utils/scanpypi                             |  2 ++
 4 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 44852afa04..15de559deb 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -429,7 +429,7 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use the +flit+, +hatch+, +pep517+,
+   for Python modules that use the +flit+, +hatch+, +pep517+, +poetry+
    +setuptools+, +setuptools-rust+ or +maturin+ mechanisms. We cover
    them through a xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 790e2899cf..b42c06e54c 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -51,8 +51,8 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +setuptools+ Python build system is used. The six
-supported ones are +flit+, +hatch+, +pep517+, +setuptools+,
+this case the +setuptools+ Python build system is used. The seven
+supported ones are +flit+, +hatch+, +pep517+, +poetry+, +setuptools+,
 +setuptools-rust+ and +maturin+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
@@ -96,14 +96,14 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The five supported values are +flit+, +hatch+,
-  +pep517+ and +setuptools+, +setuptools-rust+ and +maturin+. If you
-  don't know which one is used in your package, look at the +setup.py+
-  or +pyproject.toml+ file in your package source code, and see whether
-  it imports things from the +flit+ module or the +setuptools+
-  module. If the package is using a +pyproject.toml+ file without any
-  build-system requires and with a local in-tree backend-path one
-  should use +pep517+.
+  by the package. The seven supported values are +flit+, +hatch+,
+  +pep517+, +poetry+, +setuptools+, +setuptools-rust+ and +maturin+.
+  If you don't know which one is used in your package, look at the
+  +setup.py+ or +pyproject.toml+ file in your package source code,
+  and see whether it imports things from the +flit+ module or the
+  +setuptools+ module. If the package is using a +pyproject.toml+
+  file without any build-system requires and with a local in-tree
+  backend-path one should use +pep517+.
 
 A few additional variables, specific to the Python infrastructure, can
 optionally be defined, depending on the package's needs. Many of them
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 3c607b5277..32ace4aac1 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -258,6 +258,33 @@ HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
 HOST_PKG_PYTHON_MATURIN_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
+# Target poetry packages
+PKG_PYTHON_POETRY_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+PKG_PYTHON_POETRY_BUILD_CMD = \
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
+
+PKG_PYTHON_POETRY_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_POETRY_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
+PKG_PYTHON_POETRY_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-poetry-core
+
+# Host poetry packages
+HOST_PKG_PYTHON_POETRY_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+HOST_PKG_PYTHON_POETRY_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
+
+HOST_PKG_PYTHON_POETRY_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -284,8 +311,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit' or 'hatch'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin poetry,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit', 'hatch' or 'poetry'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
diff --git a/utils/scanpypi b/utils/scanpypi
index f832d5cab0..af62c01632 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -419,6 +419,8 @@ class BuildrootPackage():
                     self.setup_metadata['method'] = 'flit'
                 elif build_backend == 'hatchling.build':
                     self.setup_metadata['method'] = 'hatch'
+                elif build_backend == 'poetry.core.masonry.api':
+                    self.setup_metadata['method'] = 'poetry'
                 elif build_backend == 'setuptools.build_meta':
                     self.setup_metadata['method'] = 'setuptools'
                 else:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

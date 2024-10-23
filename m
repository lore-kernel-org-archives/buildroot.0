Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F910CFA472
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC13240180;
	Wed, 23 Oct 2024 21:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd9c8BTpZgiA; Wed, 23 Oct 2024 21:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4105940152
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4105940152;
	Wed, 23 Oct 2024 21:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BDDF972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA5540152
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SxxepzO-r9j for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BCCA40149
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BCCA40149
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76EEE86431; Wed, 23 Oct 2024 21:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:00:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e739d49b235c1692edbb51dcc23671eaa79fd4f
X-Git-Newrev: 1459c0a6f06caf5340fd8c54d160ca4e96306669
X-Patchwork-Hint: ignore
Message-Id: <20241023210114.76EEE86431@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: add hatch setup type
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

commit: https://git.buildroot.net/buildroot/commit/?id=1459c0a6f06caf5340fd8c54d160ca4e96306669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we have many python packages using the hatch(hatchling) build
system we should add a setup type for it so that we don't have to
manually specify the host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.adoc |  6 +++---
 docs/manual/adding-packages-python.adoc    | 14 +++++++-------
 package/pkg-python.mk                      | 31 ++++++++++++++++++++++++++++--
 utils/scanpypi                             |  2 ++
 4 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 4ca11507e1..cb19f3bac9 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -429,9 +429,9 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use the +flit+, +pep517+, +setuptools+,
-   +setuptools-rust+ or +maturin+ mechanisms. We cover them through a
-   xref:python-package-tutorial[tutorial] and a
+   for Python modules that use the +flit+, +hatch+, +pep517+,
+   +setuptools+, +setuptools-rust+ or +maturin+ mechanisms. We cover
+   them through a xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
 
 * *Makefiles for Lua modules*: We have a dedicated infrastructure for
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index f33770f95c..790e2899cf 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -51,9 +51,9 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +setuptools+ Python build system is used. The five
-supported ones are +flit+, +pep517+, +setuptools+, +setuptools-rust+
-and +maturin+.
+this case the +setuptools+ Python build system is used. The six
+supported ones are +flit+, +hatch+, +pep517+, +setuptools+,
++setuptools-rust+ and +maturin+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
 generates all the Makefile rules that actually allow the package to be
@@ -96,10 +96,10 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The five supported values are +flit+, +pep517+ and
-  +setuptools+, +setuptools-rust+ and +maturin+. If you don't know
-  which one is used in your package, look at the +setup.py+ or
-  +pyproject.toml+ file in your package source code, and see whether
+  by the package. The five supported values are +flit+, +hatch+,
+  +pep517+ and +setuptools+, +setuptools-rust+ and +maturin+. If you
+  don't know which one is used in your package, look at the +setup.py+
+  or +pyproject.toml+ file in your package source code, and see whether
   it imports things from the +flit+ module or the +setuptools+
   module. If the package is using a +pyproject.toml+ file without any
   build-system requires and with a local in-tree backend-path one
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index dea4f39ca0..3c607b5277 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -200,6 +200,33 @@ HOST_PKG_PYTHON_FLIT_BOOTSTRAP_BUILD_CMD = \
 HOST_PKG_PYTHON_FLIT_BOOTSTRAP_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
+# Target hatch packages
+PKG_PYTHON_HATCH_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+PKG_PYTHON_HATCH_BUILD_CMD = \
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
+
+PKG_PYTHON_HATCH_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_HATCH_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
+PKG_PYTHON_HATCH_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-hatchling
+
+# Host hatch packages
+HOST_PKG_PYTHON_HATCH_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+HOST_PKG_PYTHON_HATCH_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
+
+HOST_PKG_PYTHON_HATCH_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 # Target maturin packages
 PKG_PYTHON_MATURIN_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
@@ -257,8 +284,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit' or 'hatch'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
diff --git a/utils/scanpypi b/utils/scanpypi
index f47150ceb6..f832d5cab0 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -417,6 +417,8 @@ class BuildrootPackage():
                 self.build_backend = build_backend
                 if build_backend == 'flit_core.buildapi':
                     self.setup_metadata['method'] = 'flit'
+                elif build_backend == 'hatchling.build':
+                    self.setup_metadata['method'] = 'hatch'
                 elif build_backend == 'setuptools.build_meta':
                     self.setup_metadata['method'] = 'setuptools'
                 else:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

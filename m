Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A47CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E7841674;
	Mon, 25 Apr 2022 21:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98pSIyo4yvta; Mon, 25 Apr 2022 21:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BD541511;
	Mon, 25 Apr 2022 21:26:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55D1B1BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 426E960E81
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvUZOV_Dqbem for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 357A960C34
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D0972844C0; Mon, 25 Apr 2022 21:15:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 23:19:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba317308439cec343d1c4844c802e17843808162
X-Git-Newrev: 8b4f831f36cd653504f38023f909f76912730534
X-Patchwork-Hint: ignore
Message-Id: <20220425211512.D0972844C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: migrate flit to new
 bootstrapping sequence
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b4f831f36cd653504f38023f909f76912730534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are a number of flit toolchain dependencies currently in the
process of deprecating distutils based fallbacks.

This will be needed in order to update tomli.

We need to migrate these to use a new bootstrap based build+install
sequence which relies on flit's bootstrap wheel build+install
features to build and install host-python-pypa-build and
host-python-installer which gives us a full pep517 toolchain.

Note that one can run host-python-flit-core commands for building
and installing itself since the package build directory is the cwd.

We need to add a special flit-bootstrap SETUP_TYPE for dependencies
of host-python-pypa-build and host-python-installer which can not
use the normal flit SETUP_TYPE which would cause a circular dependency
issue.

To avoid further special casing for host-python-flit-core and
host-python-installer, we add two additional changes:
- _BASE_INSTALL_CMD is set with ?=, so it can be overridden by the
  package;
- No _DEPENDENCIES are added for host-python-flit-core and
  host-python-installer, to avoid circular dependencies. These two are
  responsible for their own dependencies.

Although flit-bootstrap _BASE_ variables are almost identical to the
flit/pep517 variables, only _BASE_ENV is really identical. To make
things easier to understand, treat flit-bootstrap as a completely
separate SETUP_TYPE. This also allows us to check that it is only used
for host packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: simplify things by delegating some special casing to the
packages themselves; add check that it's only for host.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 867341fc7b..464578a35c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -154,6 +154,9 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--scripts=$(HOST_DIR)/bin \
 	--data=$(HOST_DIR)
 
+HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
+	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -214,6 +217,14 @@ $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
+else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
+ifeq ($(4),target)
+$$(error flit-bootstrap setup type only supported for host packages)
+else
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
+$(2)_BASE_BUILD_CMD = -m flit_core.wheel
+$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
 endif
@@ -239,6 +250,10 @@ $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
+else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
+ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
+$(2)_DEPENDENCIES += host-python-flit-core host-python-installer
+endif
 endif # SETUP_TYPE
 
 # Python interpreter to use for building the package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

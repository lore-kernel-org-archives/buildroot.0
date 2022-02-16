Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C2CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7472240157;
	Wed, 16 Feb 2022 21:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQPXB67WTwoS; Wed, 16 Feb 2022 21:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1031540A3F;
	Wed, 16 Feb 2022 21:23:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98BA51BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B6D340024
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHhM5l6Be61o for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:22:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 043F041721
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:22:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 38A8B83724; Wed, 16 Feb 2022 21:15:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:32:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d1ca33e81230eaa5fe41c4945075c62821128a8b
X-Git-Newrev: c3810c131761922ae8c046840c78430c4125f16e
X-Patchwork-Hint: ignore
Message-Id: <20220216211511.38A8B83724@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-python.mk:
 refactor build/install opts
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3810c131761922ae8c046840c78430c4125f16e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The python package infrastructure defines a number of helper variables
that are used to construct the build and install commands. However,
there are still a few parts (setup.py and its argument) that are set
explicitly in _BUILD_CMDS and _INSTALL_CMDS. This creates problems if we
want to add another setup type that does not use setup.py.

Therefore, move the setup.py part into the helper variables as well.
Since this means that the variable becomes a full command rather than
just options, rename them to _BUILD_CMD and _INSTALL_CMD.

While we're at it, also clean up the whitespace in the definition of
these variables. They were aligned on = at some point, but that
alignment was already broken.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 02df061a19..61f0dd6ec2 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -130,27 +130,27 @@ endif
 # Distutils
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
-$(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
-$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
+$(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
+$(2)_BASE_BUILD_CMD = setup.py build
+$(2)_BASE_BUILD_OPTS = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
+$(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
+$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
+$(2)_BASE_BUILD_CMD   = setup.py build
+$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifeq ($(4),target)
-$(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
+$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
+$(2)_BASE_BUILD_CMD = setup.py build
+$(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
+$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
+$(2)_BASE_BUILD_CMD = setup.py build
+$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")
@@ -186,8 +186,8 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) setup.py \
-		$$($$(PKG)_BASE_BUILD_TGT) \
+		$$($(2)_PYTHON_INTERPRETER) \
+		$$($$(PKG)_BASE_BUILD_CMD) \
 		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
 endef
 endif
@@ -200,8 +200,9 @@ ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) setup.py install \
-		$$($$(PKG)_BASE_INSTALL_OPTS) $$($$(PKG)_INSTALL_OPTS))
+		$$($(2)_PYTHON_INTERPRETER) \
+		$$($$(PKG)_BASE_INSTALL_CMD) \
+		$$($$(PKG)_INSTALL_OPTS))
 endef
 endif
 
@@ -213,8 +214,8 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) setup.py install --no-compile \
-		$$($$(PKG)_BASE_INSTALL_TARGET_OPTS) \
+		$$($(2)_PYTHON_INTERPRETER) \
+		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
 endif
@@ -227,8 +228,8 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) setup.py install \
-		$$($$(PKG)_BASE_INSTALL_STAGING_OPTS) \
+		$$($(2)_PYTHON_INTERPRETER) \
+		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434D540308;
	Mon, 25 Apr 2022 21:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5Qe-jdgWeAZ; Mon, 25 Apr 2022 21:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091604028E;
	Mon, 25 Apr 2022 21:25:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 297501BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25CB860E85
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdvFKWW2x-lA for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B38060E81
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DC37A844C1; Mon, 25 Apr 2022 21:15:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 23:21:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b4f831f36cd653504f38023f909f76912730534
X-Git-Newrev: 03d19696c752939aa46ac826df34ad9c2e4e6258
X-Patchwork-Hint: ignore
Message-Id: <20220425211512.DC37A844C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: remove hardcoded
 paths for host Python
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
Content-Type: multipart/mixed; boundary="===============1697038370788800256=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1697038370788800256==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=03d19696c752939aa46ac826df34ad9c2e4e6258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When installer is used to install packages for host Python, it can figure
out by itself which paths to use. We just need to use the installer CLI
instead of our wrapper script.

Signed-off-by: Роман Донченко <dpb@corrigendum.ru>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 464578a35c..e9de5cb8d3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -146,14 +146,6 @@ HOST_PKG_PYTHON_PEP517_ENV = \
 	PYTHONNOUSERSITE=1 \
 	$(HOST_CONFIGURE_OPTS)
 
-HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
-	--interpreter=/bin/python \
-	--script-kind=posix \
-	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
-	--scripts=$(HOST_DIR)/bin \
-	--data=$(HOST_DIR)
-
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
@@ -215,7 +207,7 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
-$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+$(2)_BASE_INSTALL_CMD = -m installer dist/*
 endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 ifeq ($(4),target)
@@ -223,7 +215,7 @@ $$(error flit-bootstrap setup type only supported for host packages)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m flit_core.wheel
-$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+$(2)_BASE_INSTALL_CMD ?= -m installer dist/*
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")

--===============1697038370788800256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1697038370788800256==--

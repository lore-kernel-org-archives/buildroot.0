Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625E6C32789
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7FBB60D62;
	Mon, 22 Aug 2022 09:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7FBB60D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICtgLkq-kGhm; Mon, 22 Aug 2022 09:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FBF7606F2;
	Mon, 22 Aug 2022 09:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBF7606F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CEBF1BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E96094048D
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E96094048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pzg6644Jw014 for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:55:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16006400D2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16006400D2
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 180D287A82; Mon, 22 Aug 2022 09:40:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 11:39:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d349d50dac5a264c174cb6e0fd9f197ea780f2ed
X-Git-Newrev: d752f73b0c0e4ba50738cd1e7f4472f61fce9089
X-Patchwork-Hint: ignore
Message-Id: <20220822094038.180D287A82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: use pyinstaller.py for
 host python packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=d752f73b0c0e4ba50738cd1e7f4472f61fce9089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python installer cli isn't able to overwrite files of packages
that already exist, this causes problems when doing a rebuild or
update without a full clean.

Since we need to add functionality to our pyinstaller.py script to fix
this issue we must also use pyinstaller.py for host python packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk          | 12 ++++++++++--
 support/scripts/pyinstaller.py |  0
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5794e3a195..c15a168f60 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -139,6 +139,14 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_PEP517_ENV = \
 	$(HOST_PKG_PYTHON_ENV)
 
+HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
+	--interpreter=$(HOST_DIR)/bin/python \
+	--script-kind=posix \
+	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(HOST_DIR)/bin \
+	--data=$(HOST_DIR)
+
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
@@ -200,7 +208,7 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
-$(2)_BASE_INSTALL_CMD = -m installer dist/*
+$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 ifeq ($(4),target)
@@ -208,7 +216,7 @@ $$(error flit-bootstrap setup type only supported for host packages)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m flit_core.wheel
-$(2)_BASE_INSTALL_CMD ?= -m installer dist/*
+$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
old mode 100755
new mode 100644
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

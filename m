Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72EDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854B8828B5;
	Sat, 30 Apr 2022 18:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYXTmlvtoDMq; Sat, 30 Apr 2022 18:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8443581D70;
	Sat, 30 Apr 2022 18:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 229651BF951
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 115E781B52
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cK5yiMAknJjQ for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AB6981A99
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D72E884B54; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94831ab236ca336109a4f2b78b30129c8dcdf1b5
X-Git-Newrev: 60aa067d74e41a7a598eb7ac44978f84d77a0eae
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.D72E884B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: deduplicate common
 env/opts variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=60aa067d74e41a7a598eb7ac44978f84d77a0eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are many varibles shared via setuptools, distutils and pep517,
combine those common env/opts variables to make them easier to
maintain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 96 +++++++++++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 53 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e9de5cb8d3..b86e12423f 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -33,78 +33,77 @@ PKG_PYTHON_HOST_PLATFORM = linux-$(PKG_PYTHON_ARCH)
 PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON3_PATH)/_sysconfigdata__linux_*.py
 PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
 
-# Target distutils-based packages
-PKG_PYTHON_DISTUTILS_ENV = \
+# Target python packages
+PKG_PYTHON_ENV = \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 
+# Host python packages
+HOST_PKG_PYTHON_ENV = \
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1 \
+	$(HOST_CONFIGURE_OPTS)
+
+# Target distutils-based packages
+PKG_PYTHON_DISTUTILS_ENV = \
+	$(PKG_PYTHON_ENV) \
+	LDSHARED="$(TARGET_CROSS)gcc -shared" \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
+
 PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
 
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
+	--prefix=/usr
+
+PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
+	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	PATH=$(BR_PATH) \
-	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	$(PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--executable=/usr/bin/python \
-	--single-version-externally-managed \
+	--single-version-externally-managed
+
+PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
-	--executable=/usr/bin/python \
-	--single-version-externally-managed \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR) \
@@ -113,28 +112,21 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	PATH=$(BR_PATH) \
-	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	$(PKG_PYTHON_ENV)
 
-PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--interpreter=/usr/bin/python \
-	--script-kind=posix \
+	--script-kind=posix
+
+PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
 	--data=$(TARGET_DIR)/usr
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
-	--interpreter=/usr/bin/python \
-	--script-kind=posix \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
@@ -142,9 +134,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 
 # Host pep517-based packages
 HOST_PKG_PYTHON_PEP517_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV)
 
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

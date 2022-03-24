Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA28FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 19:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A5F54106F;
	Thu, 24 Mar 2022 19:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adfTAOvnLDzG; Thu, 24 Mar 2022 19:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 055CA40502;
	Thu, 24 Mar 2022 19:49:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75BA81BF379
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D53480B4B
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7P84I0rGmGH for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F30A801D5
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 247DB85BA2; Thu, 24 Mar 2022 19:39:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 20:47:19 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7a6448f1aaef2f1da7fa2016b5f473d5e9aeec64
X-Git-Newrev: be37df00dabf5155d7d9bd8ff7414ed2e44426fa
X-Patchwork-Hint: ignore
Message-Id: <20220324193927.247DB85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-coherence:
 drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=be37df00dabf5155d7d9bd8ff7414ed2e44426fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The package does not work with python3, is unmaintained upstream and depends
on twisted which no longer works with python2, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  7 ++++++
 package/Config.in                                  |  1 -
 .../0001-Fix-twisted-detection.patch               | 29 ----------------------
 package/python-coherence/Config.in                 | 10 --------
 package/python-coherence/python-coherence.hash     |  3 ---
 package/python-coherence/python-coherence.mk       | 13 ----------
 6 files changed, 7 insertions(+), 56 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3f3b42a2a9..197fb4d899 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_PYTHON_COHERENCE
+	bool "python-coherence package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it does not work with
+	  Python 3.x and is unmaintained.
+
 config BR2_OPENJDK_VERSION_LTS
 	bool "OpenJDK LTS version was renamed to OpenJDK 11"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d45e6d3a86..22ff876c62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -935,7 +935,6 @@ menu "External python modules"
 	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
-	source "package/python-coherence/Config.in"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
diff --git a/package/python-coherence/0001-Fix-twisted-detection.patch b/package/python-coherence/0001-Fix-twisted-detection.patch
deleted file mode 100644
index c0e51b9e31..0000000000
--- a/package/python-coherence/0001-Fix-twisted-detection.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3cf8d89cbb44b5c7a0693d0b5d665e68acc3927c Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <wiz@NetBSD.org>
-Date: Tue, 10 May 2016 00:14:33 +0200
-Subject: [PATCH] Fix twisted detection.
-
-Addresses https://github.com/coherence-project/Coherence/issues/25
-
-Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- coherence/__init__.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/coherence/__init__.py b/coherence/__init__.py
-index 2e4e8f1..4c4d73d 100644
---- a/coherence/__init__.py
-+++ b/coherence/__init__.py
-@@ -24,8 +24,6 @@ try:
-     if twisted_version < Version("twisted", 2, 5, 0):
-         raise ImportError("Twisted >= 2.5 is required. Please install it.")
- 
--    if twisted_web_version < Version("twisted.web", 2, 5, 0):
--        raise ImportError("Twisted.Web >= 2.5 is required. Please install it")
- except ImportError, exc:
-     # log error to stderr, might be useful for debugging purpose
-     for arg in exc.args:
--- 
-2.8.1
-
diff --git a/package/python-coherence/Config.in b/package/python-coherence/Config.in
deleted file mode 100644
index 0f50080e67..0000000000
--- a/package/python-coherence/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PYTHON_COHERENCE
-	bool "python-coherence"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_TWISTED
-	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
-	select BR2_PACKAGE_PYTHON_PYASN1
-	help
-	  A DLNA/UPnP Media Server and Framework for the Digital Living.
-
-	  https://github.com/coherence-project/Coherence
diff --git a/package/python-coherence/python-coherence.hash b/package/python-coherence/python-coherence.hash
deleted file mode 100644
index 3c2d45b537..0000000000
--- a/package/python-coherence/python-coherence.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  97c8b700b3fe73d48eacb259008f410d6567e5d7d1b8e96386f8cc2422135ca5  python-coherence-b7856985fd496689ca1f9024925ae737297c00d1.tar.gz
-sha256  7713ed8484b4d3364c7f6f2c02aed427b06a0159b1f77aecf907d47016812e81  LICENCE
diff --git a/package/python-coherence/python-coherence.mk b/package/python-coherence/python-coherence.mk
deleted file mode 100644
index 24da7f70a7..0000000000
--- a/package/python-coherence/python-coherence.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# python-coherence
-#
-################################################################################
-
-PYTHON_COHERENCE_VERSION = b7856985fd496689ca1f9024925ae737297c00d1
-PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,$(PYTHON_COHERENCE_VERSION))
-PYTHON_COHERENCE_SETUP_TYPE = setuptools
-PYTHON_COHERENCE_LICENSE = MIT
-PYTHON_COHERENCE_LICENSE_FILES = LICENCE
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

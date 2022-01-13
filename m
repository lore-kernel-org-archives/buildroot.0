Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41084C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE7D60797;
	Thu, 13 Jan 2022 20:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBE2X4W2oiiC; Thu, 13 Jan 2022 20:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE8B6FB52;
	Thu, 13 Jan 2022 20:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A84E81BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A40CB6FB52
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DOgi5_7_YKp for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:28:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D795260797
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:28:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8EC4D82DEE; Thu, 13 Jan 2022 20:21:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 21:27:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eee3a1ed92f47d833fe620b1e28cdbc35f5b1ae8
X-Git-Newrev: a607efc6d3606e862babfbd17ca8e39398f7c2a5
X-Patchwork-Hint: ignore
Message-Id: <20220113202144.8EC4D82DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: remove python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=a607efc6d3606e862babfbd17ca8e39398f7c2a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since at least gdb 7.8, python3 support has been available. As part of
the progressive retiring of python2 support, it is time to drop its
support in gdb by:

- Removing BR2_PACKAGE_HOST_GDB_PYTHON in package/gdb/Config.in.host
  and removing the choice to leave just a BR2_PACKAGE_HOST_GDB_PYTHON3
  option.

- Adding BR2_PACKAGE_HOST_GDB_PYTHON to Config.in.legacy

- Changing depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 to
  depends on BR2_PACKAGE_PYTHON3 in package/gdb/Config.in

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           |  7 +++++++
 package/gdb/Config.in      |  2 +-
 package/gdb/Config.in.host | 20 +-------------------
 package/gdb/gdb.mk         | 12 +-----------
 4 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6c6aca5ac9..dd64b7da1b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_HOST_GDB_PYTHON
+	bool "GDB Python2 support removed"
+	select BR2_LEGACY
+	help
+	  Python2 is deprecated and no longer supported.
+	  Please migrate to Python3.
+
 config BR2_PACKAGE_GSTREAMER1_MM
 	bool "gstreamer1-mm package removed"
 	select BR2_LEGACY
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 6f1a883de7..daad6c910d 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -77,7 +77,7 @@ config BR2_PACKAGE_GDB_TUI
 
 config BR2_PACKAGE_GDB_PYTHON
 	bool "Python support"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  This option enables Python support in the target gdb.
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a6e1d7f53c..56999fa9e0 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -30,29 +30,11 @@ config BR2_PACKAGE_HOST_GDB_TUI
 	help
 	  This option enables terminal user interface (TUI) for gdb
 
-choice
-	prompt "Python support"
-	default BR2_PACKAGE_HOST_GDB_NOPYTHON
-	help
-	  Select the version of Python you wish to use
-
-config BR2_PACKAGE_HOST_GDB_NOPYTHON
-	bool "None"
-	help
-	  This option disables Python support in the cross gdb.
-
-config BR2_PACKAGE_HOST_GDB_PYTHON
-	bool "Python 2"
-	help
-	  This option enables the Python 2 support in the cross gdb.
-
 config BR2_PACKAGE_HOST_GDB_PYTHON3
-	bool "Python 3"
+	bool "Python support"
 	help
 	  This option enables the Python 3 support in the cross gdb.
 
-endchoice
-
 config BR2_PACKAGE_HOST_GDB_SIM
 	bool "Simulator support"
 	depends on !BR2_arc
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4ff498230a..05de3c14d1 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -201,17 +201,10 @@ GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),y)
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # CONF_ENV: for top-level configure; MAKE_ENV: for sub-projects' configure.
 GDB_CONF_ENV += BR_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
 GDB_MAKE_ENV += BR_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
 GDB_DEPENDENCIES += python3
-else
-# CONF_ENV: for top-level configure; MAKE_ENV: for sub-projects' configure.
-GDB_CONF_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
-GDB_MAKE_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
-GDB_DEPENDENCIES += python
-endif
 GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
 else
 GDB_CONF_OPTS += --without-python
@@ -287,10 +280,7 @@ else
 HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
-ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
-HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
-HOST_GDB_DEPENDENCIES += host-python
-else ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON3),y)
 HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python3
 HOST_GDB_DEPENDENCIES += host-python3
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

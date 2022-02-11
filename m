Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936EBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F3B261C2C;
	Fri, 11 Feb 2022 19:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Xa9GCFbi0-Z; Fri, 11 Feb 2022 19:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7B360BEA;
	Fri, 11 Feb 2022 19:12:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1314C1BF3F7
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DC9160B12
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1iSziSyCheq for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7674A61C2C
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3452E82DDC; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:07:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fc1b258d39b215194b868eb002200871e535595
X-Git-Newrev: ea6a0a60e28f3047e762806a0cef3b4d55d7b576
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.3452E82DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: drop host-python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea6a0a60e28f3047e762806a0cef3b4d55d7b576
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python2 is gone, so drop the _NEEDS_PYTHON2 logic.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy     |  6 ++++++
 boot/uboot/Config.in | 28 +++-------------------------
 boot/uboot/uboot.mk  |  8 +-------
 3 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2b1fd48de5..0794813a97 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_TARGET_UBOOT_NEEDS_PYTHON2
+	bool "host-python 2.7 support for U-Boot was removed"
+	select BR2_LEGACY
+	help
+	  Option was removed together with python 2.7 support.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "gst1-plugins-bad plugin libmms was removed"
 	depends on BR2_USE_WCHAR
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1fd4dede92..953c36135e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -143,45 +143,23 @@ config BR2_TARGET_UBOOT_NEEDS_DTC
 	  Select this option if your U-Boot board configuration
 	  requires the Device Tree compiler to be available.
 
-config BR2_TARGET_UBOOT_NEEDS_PYTHON
-	bool
-
-choice
-	bool "U-Boot needs host Python"
-
-config BR2_TARGET_UBOOT_NEEDS_PYTHON_NONE
-	bool "no"
-	depends on !BR2_TARGET_UBOOT_NEEDS_PYTHON
-	help
-	  Select this option if U-Boot does not need any
-	  host python to build.
-
-config BR2_TARGET_UBOOT_NEEDS_PYTHON2
-	bool "python 2.x"
-	help
-	  Select this option if U-Boot needs a host Python 2.x
-	  interpreter. This is the case for some U-Boot
-	  configurations, prior to U-Boot 2020.01.
-
 config BR2_TARGET_UBOOT_NEEDS_PYTHON3
-	bool "python 3.x"
+	bool "U-Boot needs host python 3.x"
 	help
 	  Select this option if U-Boot needs a host Python 3.x
 	  interpreter. This is the case for some U-Boot
 	  configurations, after U-Boot 2020.01.
 
-endchoice
-
 config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
 	bool "U-Boot needs pylibfdt"
-	select BR2_TARGET_UBOOT_NEEDS_PYTHON
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
 	help
 	  Select this option if your U-Boot board configuration
 	  requires the Python libfdt library to be available.
 
 config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
 	bool "U-Boot needs pyelftools"
-	select BR2_TARGET_UBOOT_NEEDS_PYTHON
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
 	help
 	  Select this option if your U-Boot board configuration
 	  requires the Python pyelftools library to be available.
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d05b9bb479..9e227fed91 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -207,9 +207,7 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
-UBOOT_DEPENDENCIES += host-python host-python-setuptools
-else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
 UBOOT_DEPENDENCIES += host-python3 host-python3-setuptools
 endif
 
@@ -218,12 +216,8 @@ UBOOT_DEPENDENCIES += host-swig
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
-ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
-UBOOT_DEPENDENCIES += host-python-pyelftools
-else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
 UBOOT_DEPENDENCIES += host-python3-pyelftools
 endif
-endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
 UBOOT_DEPENDENCIES += host-openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

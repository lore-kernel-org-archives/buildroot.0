Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47899CD5BB1
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF8760F84;
	Thu, 13 Nov 2025 09:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwTsgFhje7uF; Thu, 13 Nov 2025 09:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4201760F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4201760F96;
	Thu, 13 Nov 2025 09:53:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D632230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81B9040A03
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPyAT1mNTkAx for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A958940A11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A958940A11
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6634845F5; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 10:50:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c41af1dcc09427e9a4a71e98cccc3aca7b5e0554
X-Git-Newrev: 0343a58a70baccc72843b18490344b37ccb04ceb
X-Patchwork-Hint: ignore
Message-Id: <20251113095342.A6634845F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procrank_linux: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0343a58a70baccc72843b18490344b37ccb04ceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is causing build errors with newer gcc versions:

procrank.c:381:9: error: implicit declaration of function 'asprintf';
 did you mean 'vsprintf'? [-Wimplicit-function-declaration]

The latest upstream commit dates back to 2018 and no open issues/
bug reports are present so the projects seems unmaintained.

Instead of fixing build errors for such a project which is not used by
any other package we remove it from buildroot.

Fixes:
https://autobuild.buildroot.net/results/f2b/f2b41d27cf32808783b582e8ad714fb653c05713/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                           |  6 ++++++
 package/Config.in                          |  1 -
 package/procrank_linux/Config.in           |  7 -------
 package/procrank_linux/procrank_linux.hash |  3 ---
 package/procrank_linux/procrank_linux.mk   | 22 ----------------------
 5 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 87db0a14b7..856ae58c67 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_PROCRANK_LINUX
+	bool "procrank_linux has been removed"
+	select BR2_LEGACY
+	help
+	  procrank_linux is unmaintained and has been removed
+
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2 has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 25dd308644..f42e7cc96c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2889,7 +2889,6 @@ menu "System tools"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
-	source "package/procrank_linux/Config.in"
 	source "package/procs/Config.in"
 	source "package/psmisc/Config.in"
 	source "package/pwgen/Config.in"
diff --git a/package/procrank_linux/Config.in b/package/procrank_linux/Config.in
deleted file mode 100644
index 59d462b6d4..0000000000
--- a/package/procrank_linux/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PROCRANK_LINUX
-	bool "procrank_linux"
-	help
-	  procrank is a tool commonly used by Android platform
-	  developers to find out how much memory is really being used.
-
-	  https://github.com/csimmonds/procrank_linux
diff --git a/package/procrank_linux/procrank_linux.hash b/package/procrank_linux/procrank_linux.hash
deleted file mode 100644
index cc9c403a0e..0000000000
--- a/package/procrank_linux/procrank_linux.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  1c3592b549b6793b29ab561568f493d0edbfe288ea2aed59afa689eaa26b5d9e  procrank_linux-21c30ab4514a5b15ac6e813e21bee0d3d714cb08.tar.gz
-sha256  38751245389e1e23f73e6f5384b5cbe7fa972cc4410c5adc9c04b082a0b9561a  NOTICE
diff --git a/package/procrank_linux/procrank_linux.mk b/package/procrank_linux/procrank_linux.mk
deleted file mode 100644
index 415a4e41b7..0000000000
--- a/package/procrank_linux/procrank_linux.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# procrank_linux
-#
-################################################################################
-
-PROCRANK_LINUX_VERSION = 21c30ab4514a5b15ac6e813e21bee0d3d714cb08
-PROCRANK_LINUX_SITE = $(call github,csimmonds,procrank_linux,$(PROCRANK_LINUX_VERSION))
-PROCRANK_LINUX_LICENSE = Apache-2.0
-PROCRANK_LINUX_LICENSE_FILES = NOTICE
-
-define PROCRANK_LINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" \
-		LOCAL_CFLAGS="$(TARGET_CFLAGS)"
-endef
-
-define PROCRANK_LINUX_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/procrank \
-		$(TARGET_DIR)/usr/bin/procrank
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

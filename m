Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61F3CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910E584553;
	Wed,  5 Nov 2025 20:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jA9t5wUitvh; Wed,  5 Nov 2025 20:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F968455E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99F968455E;
	Wed,  5 Nov 2025 20:50:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF5054C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C13613F0
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BuRoo2BHWvSf for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D254613ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D254613ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D254613ED
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:50:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D3DBA4C1093
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:48:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51230)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vGkQY-000000001uY-3lBf
 for buildroot@buildroot.org; Wed, 05 Nov 2025 20:48:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  5 Nov 2025 21:48:14 +0100
Message-ID: <20251105204818.2096762-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251105204818.2096762-1-bernd@kuhls.net>
References: <20251105204818.2096762-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762375703;
 bh=rbrrft3+9CU40nNtlf68yTy8QmMZtabHz98pOcFRy8E=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=llKHRPC3PTv6D18msRUKgJ4xwvlHvKj7eXKEo5u03pnpfvGu6kgY3OmlxqpdsjqnP
 Y9a8zLojLAVLDk9iU8iuTUHamV3q2VkZKzMUMWOMH2ZrxCzpqqH3qP1zm9aaW6PibG
 9jxGA1rZZ4JuOGpdlu0E+MdywZ4Qd6xktdSIph4f+nMqNxrLHBHguXpHFNQt7PNlzr
 s15sk9hOsf3qNG5m+JhMAFYKcihp04D7ZWCj5fWE7Ug9RHltUQoJAwMrux058LeP91
 VabhfWkGCA0vbNMoYxD7y/hMPgvmA6qrUAWjUeK5R35b1Cj56H0AuEKEwdicGWRDWV
 jEXBtSh5f365w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=llKHRPC3
Subject: [Buildroot] [PATCH v2 11/12] package/procrank_linux: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 Config.in.legacy                           |  6 ++++++
 package/Config.in                          |  1 -
 package/procrank_linux/Config.in           |  7 -------
 package/procrank_linux/procrank_linux.hash |  3 ---
 package/procrank_linux/procrank_linux.mk   | 22 ----------------------
 5 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 package/procrank_linux/Config.in
 delete mode 100644 package/procrank_linux/procrank_linux.hash
 delete mode 100644 package/procrank_linux/procrank_linux.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index df57ff95a3..1d94504cce 100644
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
index b74b577f8a..d1887891df 100644
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

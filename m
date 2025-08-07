Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9E2C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 21:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 013AB4051F;
	Thu,  7 Aug 2025 21:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5pEt0bta0kc; Thu,  7 Aug 2025 21:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B9F740399
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B9F740399;
	Thu,  7 Aug 2025 21:16:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9625F10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 21:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 935374026C
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 21:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d8Hv5t2-E8C for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 21:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3474027A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB3474027A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 21:16:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A793D87025; Thu,  7 Aug 2025 21:16:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 23:00:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84a3a8f39a46716b8081bd7bdfac3a9fbbcba28d
X-Git-Newrev: bd05f6bd1f0ecfec586a7a0557d4a0faad7b38ed
X-Patchwork-Hint: ignore
Message-Id: <20250807211638.A793D87025@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: allow selecting upstream
 releases on ARC
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd05f6bd1f0ecfec586a7a0557d4a0faad7b38ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/binutils and package/gcc both allow to use upstream versions
on ARC, but package/gdb allows using only the ARC version. Adjust the
packaging to align package/gdb with package/binutils and package/gcc,
so that upstream versions of gdb can be built for ARC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gdb/Config.in.host | 10 +++++++---
 package/gdb/gdb.mk         |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 54247ad642..ac50a292ff 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,11 +41,15 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_15
-	depends on !BR2_arc
+	default BR2_GDB_VERSION_15 if !BR2_arc
+	default BR2_GDB_VERSION_ARC if BR2_arc
 	help
 	  Select the version of gdb you wish to use.
 
+config BR2_GDB_VERSION_ARC
+	bool "gdb arc (14.x)"
+	depends on BR2_arc
+
 config BR2_GDB_VERSION_14
 	bool "gdb 14.x"
 
@@ -68,7 +72,7 @@ endif
 # If cross-gdb is not enabled, the latest stable version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2023.09-release" if BR2_arc
+	default "arc-2023.09-release" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.3"	   if BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index b39b103d00..ca9c6d74d5 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -8,7 +8,7 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 
-ifeq ($(GDB_VERSION),arc-2023.09-release)
+ifeq ($(BR2_GDB_VERSION_ARC),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

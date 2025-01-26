Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A25C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D7A70473;
	Fri, 28 Feb 2025 17:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJsxmPo7-4uY; Fri, 28 Feb 2025 17:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3694A70914
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3694A70914;
	Fri, 28 Feb 2025 17:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 172291DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B615C4286F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kV9GQDRKy9a for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 165624280E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165624280E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10C6487A0C; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 16:46:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 38afba8d24dc9ec4211afa52086f632b72041cde
X-Git-Newrev: 149ed404d22d6f2bae40c81a212ce479b90a1450
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.10C6487A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: change the
 default to GDB 15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=149ed404d22d6f2bae40c81a212ce479b90a1450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This requires a bit of trickery on BR2_GDB_VERSION. Indeed, when the
target variant of gdb is enabled, but not the host variant, the
version choice is not available, and a default version is
used. However, version 15.x, which is now the default, requires GCC >=
9, so we have to be careful and use GDB 15.x by default if the
toolchain has GCC >= 9, or stick to GDB 14.x otherwise.

Of course, that will not fly long term, as at some point we'll drop
gdb 14.x, but for the time being, let's default to this older gdb
release if the target compiler is too old.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 1d718257c6..699c6a96c4 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_14
+	default BR2_GDB_VERSION_15
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -73,7 +73,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2023.09-release" if BR2_arc
 	default "13.2"     if BR2_GDB_VERSION_13
-	default "14.2"     if BR2_GDB_VERSION_14 || !BR2_PACKAGE_HOST_GDB
-	default "15.1"	   if BR2_GDB_VERSION_15
+	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
+	default "15.1"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.1"	   if BR2_GDB_VERSION_16
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

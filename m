Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8DCC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3563247A19;
	Fri, 28 Feb 2025 16:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PaqoFj2NgBc; Fri, 28 Feb 2025 16:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A6F44FDAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A6F44FDAD;
	Fri, 28 Feb 2025 16:48:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FB811DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C018D42E36
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8It6rjeo6cB for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66BE4265D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66BE4265D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DEE6876C0; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 00:04:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7824d5c4c842bff0d9dd6eae63c0da256082b503
X-Git-Newrev: f6fe892141cd4c8b6dd934df92eb1fe7d9469e0c
X-Patchwork-Hint: ignore
Message-Id: <20250228162954.9DEE6876C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/procps-ng: add wchar
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6fe892141cd4c8b6dd934df92eb1fe7d9469e0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since procps-ng was bumped from 3.3.17 to 4.0.4 in commit
d79f40dbbe98983bc657d4c82d46b38b8283351b ("package/procps-ng: security
bump to version 4.0.4"), the build has been failing on !wchar
configurations with:

src/ps/output.c:68:10: fatal error: wctype.h: No such file or directory
   68 | #include <wctype.h>
      |          ^~~~~~~~~~
compilation terminated.

The problematic code has been added by upstream commit
https://gitlab.com/procps-ng/procps/-/commit/605ea4a8f7460920b6de9e432757bd13f80f0dba,
which landed in upstream release v4.0.0.

To solve this, we simply add a BR2_USE_WCHAR dependency, and update
the comment related to this dependency on the only reverse dependency
of procps-ng.

Fixes:

  http://autobuild.buildroot.net/results/afc035e866bec6f2c14f9d52fa74a9c1897706de/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igt-gpu-tools/Config.in | 2 +-
 package/procps-ng/Config.in     | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 809c8e28ac..08fc34e917 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_USE_WCHAR # elfutils, procps-ng
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
 	select BR2_PACKAGE_CAIRO
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 7af0e97fb4..2b97096f00 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -1,7 +1,13 @@
+comment "procps-ng needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  Standard informational utilities and process-handling tools.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

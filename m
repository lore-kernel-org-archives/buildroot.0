Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC95C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CE283298;
	Fri, 24 May 2024 12:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3S9u8DUKyb4; Fri, 24 May 2024 12:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80CE7832D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80CE7832D4;
	Fri, 24 May 2024 12:35:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31A4B1CF7AC
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CB9940933
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLjxeG_klP1d for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 109A84087F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 109A84087F
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:34:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08E1387553; Fri, 24 May 2024 12:34:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 14:33:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d96b3c331cb0e0cf3bec3d3b1496ed9adb426d05
X-Git-Newrev: 7233016f25e29ab6fdc692a5fc00fe7cdb751ef7
X-Patchwork-Hint: ignore
Message-Id: <20240524123457.08E1387553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mokutil: select libxcrypt if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=7233016f25e29ab6fdc692a5fc00fe7cdb751ef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 2e6e121496bfcbe09c018558be13733077b6df9b:

mokutil.c:45:10: fatal error: crypt.h: No such file or directory
   45 | #include <crypt.h>
      |          ^~~~~~~~~

Fixes: 2e6e121496bfcbe09c018558be13733077b6df9b
 - http://autobuild.buildroot.org/results/59e470ad6bf7f48314cd26ed4163c095e4c803ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mokutil/Config.in  | 1 +
 package/mokutil/mokutil.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
index 3f0c760f7d..dd02078b4e 100644
--- a/package/mokutil/Config.in
+++ b/package/mokutil/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_MOKUTIL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	select BR2_PACKAGE_EFIVAR
 	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	help
 	  mokutil is a tool to import or delete the machines owner
diff --git a/package/mokutil/mokutil.mk b/package/mokutil/mokutil.mk
index 6e83d9f138..f176fa5bee 100644
--- a/package/mokutil/mokutil.mk
+++ b/package/mokutil/mokutil.mk
@@ -14,6 +14,7 @@ MOKUTIL_DEPENDENCIES = \
 	efivar \
 	host-pkgconf \
 	keyutils \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	openssl
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5279C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 13:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96601606AE;
	Tue,  4 Jun 2024 13:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBVo6_PBJTXP; Tue,  4 Jun 2024 13:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A8B8606DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A8B8606DA;
	Tue,  4 Jun 2024 13:28:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE7751BF2A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB55740511
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfPo5Kq16bYB for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A5D7404B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A5D7404B4
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2440487AAE; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 15:15:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 454426961cf43c8ab0cf13b8fe83e498b1de424a
X-Git-Newrev: 6a1c376492d6bb39a8725baae934f2b248501e0c
X-Patchwork-Hint: ignore
Message-Id: <20240604132830.2440487AAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedumpfile: enable build with
 musl libc
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a1c376492d6bb39a8725baae934f2b248501e0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

makedumpfile libc dependency is coming from elfutils. Commit
bf9583a50276f52 ("package/elfutils: enable on musl") removed elfutils
libc dependency. makedumpfile now builds fine with musl libc. Remove
its libc dependency.

Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedumpfile/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index 62549f851f..325a31d7b6 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -8,11 +8,10 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_s390x
 	default y if BR2_sparc64
 
-comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "makedumpfile needs a toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_MAKEDUMPFILE
 	bool "makedumpfile"
@@ -20,7 +19,6 @@ config BR2_PACKAGE_MAKEDUMPFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_XZ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

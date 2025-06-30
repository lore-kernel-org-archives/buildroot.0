Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E51C83039
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 19:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77CEB41C8D;
	Mon, 30 Jun 2025 19:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avafC4z3qP9B; Mon, 30 Jun 2025 19:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FB841C83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FB841C83;
	Mon, 30 Jun 2025 19:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3653A223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44DC041AE0
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJX4SI5cKhQU for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 19:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C7A41C83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C7A41C83
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 846C884D86; Mon, 30 Jun 2025 19:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jun 2025 21:38:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ba3ed65745c52ff454155db0bfe5394619ddb2
X-Git-Newrev: 268d7ad180215b22bc026f57bc11724cacfb8565
X-Patchwork-Hint: ignore
Message-Id: <20250630194233.846C884D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: elfutils programs now
 require a c++ toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=268d7ad180215b22bc026f57bc11724cacfb8565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0.192 release of elfutils introduced the src/srcfiles.cxx program,
that lists all source files of a given ELF binary. As this is a C++
program, we need a toolchain that supports it.

Without it, the build system tries to use "no" as the CXX compiler,
resulting in the following errors :

  /bin/sh: line 1: no: command not found

as can be seen here for example :

https://autobuild.buildroot.net/results/849/849221c794a469a423857a290db775d150b84900

Add a dependency to a CPP toolchain for the elfutils programs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/elfutils/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 9608ef4905..e866dd448b 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -24,11 +24,13 @@ if BR2_PACKAGE_ELFUTILS
 config BR2_PACKAGE_ELFUTILS_PROGS
 	bool "Install programs"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
 
-comment "elfutils programs needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "elfutils programs needs a glibc toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_INSTALL_LIBSTDCPP
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

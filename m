Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B175C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73ACD83C39;
	Fri, 11 Jul 2025 10:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LT0P1Nf1e6f8; Fri, 11 Jul 2025 10:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08E7683C19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08E7683C19;
	Fri, 11 Jul 2025 10:10:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E11968
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C9256065D
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWf1tzdGKtvD for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2199608FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2199608FE
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1A8B86342; Fri, 11 Jul 2025 10:09:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:14:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b672f9e988c0d589d3c45816116f13edbfbcda3f
X-Git-Newrev: 0b54b252dfbcb85b35a70b690ec813f1b710adc8
X-Patchwork-Hint: ignore
Message-Id: <20250711100951.C1A8B86342@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/elfutils:
 elfutils programs now require a c++ toolchain
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b54b252dfbcb85b35a70b690ec813f1b710adc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 268d7ad180215b22bc026f57bc11724cacfb8565)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C66FC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 19:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F36524255F;
	Thu, 11 Jan 2024 19:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36524255F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwZC6tB10cGi; Thu, 11 Jan 2024 19:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECE7423E1;
	Thu, 11 Jan 2024 19:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECE7423E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54DB21BF3A0
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39554405DF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39554405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHQoPxn4Vu41 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 19:24:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 245E0400C8
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 19:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 245E0400C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FD6A85EAE; Thu, 11 Jan 2024 19:24:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 20:21:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15e524a10e4db3c1300464a5793edf9f2f95c7fb
X-Git-Newrev: bb3ede3b36fe8e38b4e3f17696c4b131e3f84b96
X-Patchwork-Hint: ignore
Message-Id: <20240111192452.0FD6A85EAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/criu: disable i386
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb3ede3b36fe8e38b4e3f17696c4b131e3f84b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building for i386 raises the following build failure since the additon
of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

Makefile:23: *** "The architecture i386 isn't supported".  Stop.

Setting ARCH=x86 won't work either as it results in the following build
failure:

compel/arch/x86/plugins/std/memcpy.S: Assembler messages:
compel/arch/x86/plugins/std/memcpy.S:20: Error: bad register name `%rdi'
compel/arch/x86/plugins/std/memcpy.S:21: Error: bad register name `%rdx'
compel/arch/x86/plugins/std/memcpy.S:22: Error: `shrq' is only supported in 64-bit mode
compel/arch/x86/plugins/std/memcpy.S:24: Error: `movsq' is only supported in 64-bit mode
compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S: Assembler messages:
compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S:13: Error: bad register name `%rcx'
compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S:19: Error: bad register name `%rax'

Fixes:
 - http://autobuild.buildroot.org/results/94cc463762b57efacf743d107a8dda7660a995a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/criu/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index ff3bf30229..b3bb830768 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV7M
 	default y if BR2_ARM_CPU_ARMV8A
 	default y if BR2_aarch64
-	default y if BR2_i386
 	default y if BR2_mips
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

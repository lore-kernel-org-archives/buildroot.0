Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F32C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA55440004;
	Sun, 24 Mar 2024 15:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uAkl9EaYSVM; Sun, 24 Mar 2024 15:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D29024034A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D29024034A;
	Sun, 24 Mar 2024 15:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 163CE1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03BBE6079E
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1j9qAlr-ndS for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D5A6075B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35D5A6075B
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E40183B9A; Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:42:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1455d5241b288770aeea7f5ba6dcd1ea31966ba1
X-Git-Newrev: 9553dc9a55c13916c26aaae4fac037d35ddacca3
X-Patchwork-Hint: ignore
Message-Id: <20240324155538.1E40183B9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gmp: fix target build with host
 gcc 4.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9553dc9a55c13916c26aaae4fac037d35ddacca3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GMP does not build if the host gcc is v4.9 due to the following error

  gen-sieve.c: In function 'setmask':
  gen-sieve.c:99:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     for (unsigned i = 0; i < 2 * a * b; ++i)
     ^
  gen-sieve.c:99:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

The gen-sieve utility was added in GMP v6.3.0. It is built using
CC_FOR_BUILD (host compiler) during cross compilation as it generates
build files. Autoconf does not have a macro for add -std=c99 to
CC_FOR_BUILD, so it must be set manually. For the target, it is set
correctly thanks to the AC_PROG_CC_C99 macro.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/gmp/gmp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index bd401c6a80..7e8da9025c 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,6 +14,8 @@ GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
+GMP_CONF_ENV += CC_FOR_BUILD="$(HOSTCC) -std=c99"
+
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
 ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

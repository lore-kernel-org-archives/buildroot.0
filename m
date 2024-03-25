Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF7FC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE77481E4F;
	Mon, 25 Mar 2024 09:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiC-VrVmohKa; Mon, 25 Mar 2024 09:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB7C81E63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB7C81E63;
	Mon, 25 Mar 2024 09:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61FEA1BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB1740697
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOiKu3egQhVd for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 570714068C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 570714068C
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:05:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D8D083D8B; Mon, 25 Mar 2024 09:05:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 10:02:33 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 424f7ba6cc04e15a98fa4e8596978485890eff03
X-Git-Newrev: c283546b48bc7c989cae6a3bc71b242a367da788
X-Patchwork-Hint: ignore
Message-Id: <20240325090542.4D8D083D8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gmp: fix target
 build with host gcc 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=c283546b48bc7c989cae6a3bc71b242a367da788
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 9553dc9a55c13916c26aaae4fac037d35ddacca3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

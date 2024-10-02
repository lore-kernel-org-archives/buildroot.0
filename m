Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E97CF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD74184051;
	Wed,  2 Oct 2024 20:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAE3ppBSxvKs; Wed,  2 Oct 2024 20:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EFAD818C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EFAD818C9;
	Wed,  2 Oct 2024 20:35:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C89E61BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE3B1407D6
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAK6buiPT2nI for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86BB407D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A86BB407D2
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E66A84701; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:34:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6b364c2e311011bb5626c6a156be34daf919dd0
X-Git-Newrev: d75e29c9b23d0edf47dadba365f592e5f7f957a7
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.8E66A84701@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arm: add support for FDPIC
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d75e29c9b23d0edf47dadba365f592e5f7f957a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux on ARM supports FDPIC binaries intended for use on no-MMU
systems. This patch enables support for building a toolchain that
produces FDPIC binaries, only for ARMv7-M platforms, for which FDPIC
binaries are relevant.

The target name for a FDPIC toolchain must be
arm-<vendor>-uclinuxfdpiceabi, which doesn't follow the standard
format and requires a special case.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm  | 1 +
 package/Makefile.in | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b44a164e03..219215d122 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -89,6 +89,7 @@ config BR2_ARM_CPU_ARMV7A
 
 config BR2_ARM_CPU_ARMV7M
 	bool
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
 
 config BR2_ARM_CPU_ARMV8A
 	bool
diff --git a/package/Makefile.in b/package/Makefile.in
index 808b71a93e..829636900b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,7 +39,13 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 endif
 
 # Compute GNU_TARGET_NAME
+# FDPIC on ARM requires a special target name: it has no OS field and must
+# use the suffix -uclinuxfdpiceabi.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-uclinuxfdpiceabi
+else
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif
 
 # FLAT binary format needs uclinux, except RISC-V which needs the
 # regular linux name.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

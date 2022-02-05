Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACD0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D79408A0;
	Sat,  5 Feb 2022 22:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9mZPzugKH-7; Sat,  5 Feb 2022 22:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C2B4088D;
	Sat,  5 Feb 2022 22:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7601BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BAB0817EB
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xo6Kp72vNIKe for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC8A581801
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BE1AC82AE5; Sat,  5 Feb 2022 22:47:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:41:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eff46a6c97203e7874edc931c4180f606f08275
X-Git-Newrev: 1c667a11400e51618a4b38d288816cbb3ee7478f
X-Patchwork-Hint: ignore
Message-Id: <20220205224746.BE1AC82AE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: enable context/coroutine
 for arm variants
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c667a11400e51618a4b38d288816cbb3ee7478f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add boost context support for aarch64/aarch64_be.

Context support for ARM is only available in the AAPCS ABI, so switch to
AAPCS ABI for all ARM variants.

While we're at it, update the URL about the context architecture support
to the one corresponding to the current version of boost.

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
[Arnout: update URL, extend commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/boost/Config.in | 3 ++-
 package/boost/boost.mk  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 1c405a36c3..2c458bf88a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -68,12 +68,13 @@ config BR2_PACKAGE_BOOST_CONTAINER
 	  Standard library containers and extensions.
 
 # see
-# http://www.boost.org/doc/libs/1_59_0/libs/context/doc/html/context/architectures.html
+# http://www.boost.org/doc/libs/1_78_0/libs/context/doc/html/context/architectures.html
 # for the list of supported architectures. Sparc pretends to be
 # supported, but it doesn't build.
 config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	bool
 	default y if ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM)
+	default y if (BR2_aarch64 || BR2_aarch64_be)
 	default y if BR2_i386
 	default y if BR2_mips
 	default y if BR2_mipsel
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 2d2a8fb311..b6681b0ad3 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -85,7 +85,7 @@ HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
 
 ifeq ($(BR2_MIPS_OABI32),y)
 BOOST_ABI = o32
-else ifeq ($(BR2_arm),y)
+else ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
 BOOST_ABI = aapcs
 else
 BOOST_ABI = sysv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

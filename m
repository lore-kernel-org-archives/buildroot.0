Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF59C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6FC60F6B
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F6FC60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 476424062F;
	Fri, 12 Nov 2021 22:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdwDM4LuM1Mx; Fri, 12 Nov 2021 22:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD6B4062E;
	Fri, 12 Nov 2021 22:41:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1CB1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D065640183
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7c--zu8FPmbQ for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE6AD40253
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 610988C967; Fri, 12 Nov 2021 22:36:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:26:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18557c6757f2e38362762f8ea1ddae91be5837f9
X-Git-Newrev: bd4f70b185503d9d04c1393be67236a7f6735cf7
X-Patchwork-Hint: ignore
Message-Id: <20211112223605.610988C967@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: building for 64-bit target
 requires a 64-bit host for all platform
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd4f70b185503d9d04c1393be67236a7f6735cf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently only x86_64 target requires a 64-bit host but building
aarch64 target with a 32-bit host is allowed.

This constraint is for all architectures [1].

[1] http://lists.busybox.net/pipermail/buildroot/2021-November/628301.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 5417c3f0bd..3111a2548f 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb || BR2_aarch64
-	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
+	default y if BR2_i386 || BR2_x86_64
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
 		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	default y if BR2_powerpc
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Building for 64-bit target requires a 64-bit host
+	depends on !BR2_ARCH_IS_64 || BR2_HOSTARCH = "x86_64"
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

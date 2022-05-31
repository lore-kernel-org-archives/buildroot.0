Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF43FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8063C84054;
	Tue, 31 May 2022 08:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2__neaviAfro; Tue, 31 May 2022 08:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE4083339;
	Tue, 31 May 2022 08:20:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A84B41BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9615A40C72
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCeXd0-Q_T3t for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:20:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF9BE40A6D
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:20:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EA87886865; Tue, 31 May 2022 08:09:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:19:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 80907060476f1a8b3ed69da2c11e5d1dbe670d87
X-Git-Newrev: 9866e2e64ac12ba6ea1461c2c7410c42125d7aac
X-Patchwork-Hint: ignore
Message-Id: <20220531080905.EA87886865@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: allow
 building for risc-v
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

commit: https://git.buildroot.net/buildroot/commit/?id=9866e2e64ac12ba6ea1461c2c7410c42125d7aac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

WPE WebKit works just fine on RISC-V. For the current stable version
the build system automatically picks the LLint JavaScript interpreter,
and the upcoming 2.38.x release series will include (and automatically
enable) JIT support.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 36523bdb41..8e80c73302 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -7,6 +7,10 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	# Disabled on MIPS big endian due to sigbus
 	default y if BR2_mipsel || BR2_mips64el
 	# Disabled on PowerPC pending runtime testing
+	# RISC-V needs the g/imafd ISA.
+	default y if BR2_riscv && BR2_RISCV_ISA_RVI \
+		&& BR2_RISCV_ISA_RVM && BR2_RISCV_ISA_RVA \
+		&& BR2_RISCV_ISA_RVF && BR2_RISCV_ISA_RVD
 	# Disabled on SuperH because of segfault
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

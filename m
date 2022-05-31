Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708FAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CD9040C8F;
	Tue, 31 May 2022 08:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_xF-XTxYbl6; Tue, 31 May 2022 08:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2589840C91;
	Tue, 31 May 2022 08:20:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA4AA1BF989
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9637C60FF2
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMV8eT_vpc_x for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00DAA60ED6
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:20:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F39B7867A5; Tue, 31 May 2022 08:09:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:19:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9866e2e64ac12ba6ea1461c2c7410c42125d7aac
X-Git-Newrev: c3c19e82b482538870906161dc72a3efa7ca1b20
X-Patchwork-Hint: ignore
Message-Id: <20220531080905.F39B7867A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: allow
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3c19e82b482538870906161dc72a3efa7ca1b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

WebKitGTK works just fine on RISC-V. For the current stable version the
build system automatically picks the LLint JavaScript interpreter, and
the upcoming 2.38.x release series will include (and automatically
enable) JIT support.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bc8207d93b..052800c8cf 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -7,6 +7,10 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
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

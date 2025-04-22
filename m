Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA1AC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 822D960F36;
	Mon, 19 May 2025 10:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmZ965-5R2Bn; Mon, 19 May 2025 10:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A95A3615E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A95A3615E8;
	Mon, 19 May 2025 10:45:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FD7CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FE3B4108C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJMwHPv3nAt7 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0B5241786
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0B5241786
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE433873D5; Mon, 19 May 2025 10:39:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 21:39:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6bcefa73b1aeefcca81fd4ca2e33f5bf1d3ce9e3
X-Git-Newrev: 386e6bb4799471acc61c085fdc6472b2e43b0554
X-Patchwork-Hint: ignore
Message-Id: <20250519103955.AE433873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pixman: only compile
 with riscv vector support when selected
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=386e6bb4799471acc61c085fdc6472b2e43b0554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Pixman defaults to building with the riscv vector extension. Instead,
only build with vector if the buildroot user has selected
BR2_RISCV_ISA_RVV.

This option exists since pixman 0.44.0, to which the Buildroot package
was updated as part of Buildroot commit
ba2fb599cd002b57fa70e978d91884c98d8aad05.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pixman/pixman.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 391950cbfc..76e72d6d96 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -74,6 +74,12 @@ else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled
 endif
 
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+PIXMAN_CONF_OPTS += -Drvv=enabled
+else
+PIXMAN_CONF_OPTS += -Drvv=disabled
+endif
+
 PIXMAN_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0852DC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D91944004F;
	Fri, 28 Feb 2025 16:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oXjHs1VgqW6; Fri, 28 Feb 2025 16:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF59502B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF59502B6;
	Fri, 28 Feb 2025 16:57:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CA0E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5031547CA5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ubr3p_TCz00K for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2236A419DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2236A419DC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A5EB83ACF; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:23:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e7f14af27d18a286243eab5540fb837b1823e339
X-Git-Newrev: 11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8
X-Patchwork-Hint: ignore
Message-Id: <20250228163009.1A5EB83ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: mark as
 broken
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The ARC toolchains from Synopsys unfortunately are not "pure"
toolchains: their sysroot no only contains the C library, but also
additional libraries, most notably libncurses and libexpat.

This confuses Buildroot, and causes build issues, and is anyway not a
supported situation. Until the toolchains get fixed, let's mark them
as broken.

Fixes:

  http://autobuild.buildroot.net/results/38766332c391ce97a566c6e2255a947e6074152b/
  (and possibly a number of others)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../toolchain-external/toolchain-external-synopsys-arc/Config.in      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 98bfc2513c..07688a1416 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -5,6 +5,10 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 		BR2_archs4x_rel31 || BR2_archs4x
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	# The toolchains have libncurses and libexpat in their
+	# sysroot, confusing Buildroot and causing build
+	# issues. Disable until the toolchains get fixed.
+	depends on BR2_BROKEN
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

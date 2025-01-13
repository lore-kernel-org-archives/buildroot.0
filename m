Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7BBC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB8680E56;
	Mon, 13 Jan 2025 20:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pr20E8UyXh_e; Mon, 13 Jan 2025 20:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC2C780E8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2C780E8F;
	Mon, 13 Jan 2025 20:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFFA0940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A417980EA7
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADh2PpwK0EA7 for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA3AD80E82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA3AD80E82
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C13108575F; Mon, 13 Jan 2025 20:29:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:23:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 481920a1817fe06d77248000c12562368c95118c
X-Git-Newrev: e7f14af27d18a286243eab5540fb837b1823e339
X-Patchwork-Hint: ignore
Message-Id: <20250113202942.C13108575F@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: fix condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7f14af27d18a286243eab5540fb837b1823e339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC just depends on
BR2_arc, but the choice of toolchains that appears once
BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y only has choices for:

	depends on BR2_arc750d || BR2_arc770d

and

	depends on BR2_archs38_64mpy || BR2_archs38_full || \
		BR2_archs4x_rel31 || BR2_archs4x

which means that if you have a BR2_archs38=y configuration, you end up
with no choice of toolchain, and the build fails with "No C library
selected". Fix this by making sure BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
can only be selected when an actual toolchain is available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../toolchain-external/toolchain-external-synopsys-arc/Config.in      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index dc333f8474..98bfc2513c 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,6 +1,8 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC 2024.06 toolchain"
-	depends on BR2_arc
+	depends on BR2_arc750d || BR2_arc770d || \
+		BR2_archs38_64mpy || BR2_archs38_full || \
+		BR2_archs4x_rel31 || BR2_archs4x
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

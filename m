Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90961C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 09:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B3C413CB;
	Wed, 22 Jan 2025 09:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u10B85fRucX6; Wed, 22 Jan 2025 09:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F47413CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F47413CC;
	Wed, 22 Jan 2025 09:21:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BEC3C1
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 09:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAB6E40012
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 09:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSCRF8L3EgvB for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 09:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98C2E401FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98C2E401FB
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 09:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 804817F8BE; Wed, 22 Jan 2025 09:21:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jan 2025 22:34:33 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 5e078a644a4f68819525c436e20b5bcbfb79aba9
X-Git-Newrev: 5b9b37bf11734725ed1ab97dc957b63423befa1c
X-Patchwork-Hint: ignore
Message-Id: <20250122092155.804817F8BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b9b37bf11734725ed1ab97dc957b63423befa1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
(cherry picked from commit e7f14af27d18a286243eab5540fb837b1823e339)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

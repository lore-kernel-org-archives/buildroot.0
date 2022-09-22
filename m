Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D08C54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8649610F3;
	Thu, 22 Sep 2022 12:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8649610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_qtMPxUBdmZ; Thu, 22 Sep 2022 12:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1123D61009;
	Thu, 22 Sep 2022 12:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1123D61009
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD501BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B6C683DFC
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B6C683DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idbI3gwzG5Xc for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:42:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 826DE83DF9
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 826DE83DF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71C8D85E2A; Thu, 22 Sep 2022 12:42:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:32:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 48215e43944929aa1d4f3ffd2cdfe6a6ad6cd05a
X-Git-Newrev: c7493cb042b1acc46f0c837f85f15e3425e481b0
X-Patchwork-Hint: ignore
Message-Id: <20220922124234.71C8D85E2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/config-fragments/autobuild/bootlin-armv7m-uclibc.config: specify
 configuration more precisely
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7493cb042b1acc46f0c837f85f15e3425e481b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Due to a bug in the CodeSourcery ARM toolchain packaging, this
toolchain currently appears as available even for noMMU
configurations, which is obviously wrong. Due to this, the
bootlin-armv7m-uclibc.config fragment ends up using the CodeSourcery
ARM toolchain, which is obviously wrong for an ARM noMMU
configuration, causing a build failure when matching the toolchain
capabilities with the configuration.

Even though we will separately fix the CodeSourcery ARM toolchain
packaging, it makes sense to ensure that the
bootlin-armv7m-uclibc.config fragment explicitly selects the Bootlin
toolchain.

Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 43fc826d82acc089991d561ebca37feaf1aa421d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/bootlin-armv7m-uclibc.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/autobuild/bootlin-armv7m-uclibc.config b/support/config-fragments/autobuild/bootlin-armv7m-uclibc.config
index 8d05409647..48f2bb3488 100644
--- a/support/config-fragments/autobuild/bootlin-armv7m-uclibc.config
+++ b/support/config-fragments/autobuild/bootlin-armv7m-uclibc.config
@@ -1,4 +1,5 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

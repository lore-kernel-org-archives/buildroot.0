Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F47C54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45504610FB;
	Thu, 22 Sep 2022 12:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45504610FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uj9sNM2f2wPz; Thu, 22 Sep 2022 12:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F329610FC;
	Thu, 22 Sep 2022 12:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F329610FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9591BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7589840C15
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7589840C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6RXcw_2p_m7 for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:43:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEAAE40BCB
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEAAE40BCB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C89F85E2A; Thu, 22 Sep 2022 12:43:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:32:37 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 149a643bcc2fbd6b331ee3ff7c3ef177a6920ac5
X-Git-Newrev: d6c0d674d9802b7fa3dd4a8543559feb8df52625
X-Patchwork-Hint: ignore
Message-Id: <20220922124309.9C89F85E2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6c0d674d9802b7fa3dd4a8543559feb8df52625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97475C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 280C860A90;
	Sat, 17 Sep 2022 12:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 280C860A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yN9H54Es402; Sat, 17 Sep 2022 12:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E20C60A7B;
	Sat, 17 Sep 2022 12:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E20C60A7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85EED1BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DA7741C8F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA7741C8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzxLfRcVYIpN for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:48:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46DAC41BBA
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46DAC41BBA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2A95484258; Sat, 17 Sep 2022 12:48:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:45:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ca1a9cfcf6f42c873b90cd19f87177635e7a805
X-Git-Newrev: 43fc826d82acc089991d561ebca37feaf1aa421d
X-Patchwork-Hint: ignore
Message-Id: <20220917124845.2A95484258@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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

commit: https://git.buildroot.net/buildroot/commit/?id=43fc826d82acc089991d561ebca37feaf1aa421d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

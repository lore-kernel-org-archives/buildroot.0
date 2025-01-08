Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D584E77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 056F381BC6;
	Wed,  8 Jan 2025 22:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MU6557Z40kfb; Wed,  8 Jan 2025 22:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D60F81C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D60F81C38;
	Wed,  8 Jan 2025 22:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4154E1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4FBB402FF
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gmCYZWB0pRg for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A58F4030C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A58F4030C
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46EE183F99; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 23:01:59 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 420b686e377edc4cced68cdf17208cc982937fc8
X-Git-Newrev: be585e15ed009eb3bcae52ef49b8b19d67044a3e
X-Patchwork-Hint: ignore
Message-Id: <20250108220554.46EE183F99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/gobject-introspection: disable on Microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=be585e15ed009eb3bcae52ef49b8b19d67044a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The build of GOI on Microblaze fails as qemu-user hangs forver when
running the GOI programs. Considering how small Microblaze targets
are, the use-case for GOI is very small if not inexistant, and it's
unlikely anybody is ever going to debug this, so just disable GOI on
Microblaze.

This issue is causing timeouts in the autobuilders on a regular basis:

  http://autobuild.buildroot.net/?status=TIMEOUT&reason=gobject-introspection%

Fixes:

  http://autobuild.buildroot.net/results/f8e5ef74478c63c89e7b99fb928b97ac4518f943/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8548c7586a56938b2f52f5c41050441b53a457f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gobject-introspection/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 345118745f..681655c2d4 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -2,6 +2,11 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	# gobject-introspection programs cause a hang of Qemu on
+	# Microblaze, and supporting GOI on Microblaze is not very
+	# relevant.
+	depends on !BR2_microblazeel
+	depends on !BR2_microblazebe
 
 config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	bool "gobject-introspection"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD4EE77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAED8193E;
	Wed,  8 Jan 2025 22:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rm5l-psLfM3p; Wed,  8 Jan 2025 22:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A3D81947
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A3D81947;
	Wed,  8 Jan 2025 22:05:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 588107AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DDDA40146
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YjwfNM63SNc for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 198FF409B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 198FF409B7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15C7083F27; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 23:01:16 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 36ec020e6fc1e99a344d12ed2c493ff5877c742b
X-Git-Newrev: eb3631955a9c9ce5c69cb0dd4756544a86a3cf21
X-Patchwork-Hint: ignore
Message-Id: <20250108220445.15C7083F27@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb3631955a9c9ce5c69cb0dd4756544a86a3cf21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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

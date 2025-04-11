Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A410C369A9
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A8426F738;
	Fri, 11 Apr 2025 10:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mcmXPWTIj1b; Fri, 11 Apr 2025 10:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CAD76F69C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CAD76F69C;
	Fri, 11 Apr 2025 10:45:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49D88138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CB626F4FC
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSqzouWhqeF8 for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6275960D78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6275960D78
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C971843A6; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:26 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 1723303a624f282e09fba15cfc1f10327bff0edc
X-Git-Newrev: 68feea01df4359375044bc5e1a74fa72b88bf09d
X-Patchwork-Hint: ignore
Message-Id: <20250411104450.5C971843A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/mesa3d-demos:
 depend on vulkan-loader if enabled
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68feea01df4359375044bc5e1a74fa72b88bf09d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Vulkan support in mesa3d-demos requires vulkan-loader. Without an
explicit config flag it is autodetected, and may or may not be enabled
depending on build order, leading to unpredictable results.

Fix this by explicitly enabling Vulkan support and depending on
vulkan-loader if BR2_PACKAGE_VULKAN_LOADER=y, and disabling Vulkan
support otherwise.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7a55e82cb80c971370010df6a5513a7e565f1a72)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mesa3d-demos/mesa3d-demos.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 8acba9270a..cc0121f6d6 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -69,4 +69,11 @@ else
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_VULKAN_LOADER),y)
+MESA3D_DEMOS_DEPENDENCIES += vulkan-loader
+MESA3D_DEMOS_CONF_OPTS += -Dvulkan=enabled
+else
+MESA3D_DEMOS_CONF_OPTS += -Dvulkan=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

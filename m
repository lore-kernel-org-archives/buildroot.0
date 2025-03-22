Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22D3C35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867C541E8E;
	Sat, 22 Mar 2025 13:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndKvV3qAcp1u; Sat, 22 Mar 2025 13:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A7541E9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A7541E9A;
	Sat, 22 Mar 2025 13:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99584E2
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82FDD83B61
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ay4mN_ol-Rub for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 13:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A58683F06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A58683F06
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63C1B8823F; Sat, 22 Mar 2025 13:01:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Mar 2025 13:51:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e59cb9e95630efbefadead1ffa8f11e11fc13737
X-Git-Newrev: 7a55e82cb80c971370010df6a5513a7e565f1a72
X-Patchwork-Hint: ignore
Message-Id: <20250322130110.63C1B8823F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: depend on
 vulkan-loader if enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a55e82cb80c971370010df6a5513a7e565f1a72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Vulkan support in mesa3d-demos requires vulkan-loader. Without an
explicit config flag it is autodetected, and may or may not be enabled
depending on build order, leading to unpredictable results.

Fix this by explicitly enabling Vulkan support and depending on
vulkan-loader if BR2_PACKAGE_VULKAN_LOADER=y, and disabling Vulkan
support otherwise.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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

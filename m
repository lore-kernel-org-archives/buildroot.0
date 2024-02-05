Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1948BC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A422C40C02;
	Mon,  5 Feb 2024 21:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A422C40C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HDmcHIq71Ya; Mon,  5 Feb 2024 21:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFFB40B5B;
	Mon,  5 Feb 2024 21:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFFB40B5B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8001BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E97F840160
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E97F840160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHVVUd_nnhZS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:28:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCBFE4012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCBFE4012F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C762386DF9; Mon,  5 Feb 2024 21:28:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:25:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a627753d35d2ba97d5bddfc2491ca8b5577eba49
X-Git-Newrev: f27b0322a5019c4016d2800ccc1b586eb6af7bd5
X-Patchwork-Hint: ignore
Message-Id: <20240205212811.C762386DF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: vulkan renderer depends
 on vulkan loader
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f27b0322a5019c4016d2800ccc1b586eb6af7bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without the vulkan-loader package present, the configure step fails with the
following error message:

```
Run-time dependency vulkan found: NO (tried pkgconfig and system)
Message: Install "vulkan" or pass "-Dvulkan=disabled" to disable it.
```

The above error is due to the lack of the vulkan.pc file provided by the
vulkan-loader package. A search of autobuild failures containing
BR2_PACKAGE_WLROOTS=y and BR2_PACKAGE_MESA3D_VULKAN_DRIVER=y shows two build
failures. However, the failure reasons happened before wlroots could compile.
One for gerbera-1.10.0 and another for host-rust-1.64.0.

Add a dependency on the vulkan-loader package to resolve the above issue.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wlroots/wlroots.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index bb5c8f497d..fdd2fb8250 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -41,9 +41,9 @@ else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER)$(BR2_PACKAGE_VULKAN_LOADER),yy)
 WLROOTS_RENDERERS += vulkan
-WLROOTS_DEPENDENCIES += mesa3d
+WLROOTS_DEPENDENCIES += mesa3d vulkan-loader
 endif
 
 WLROOTS_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

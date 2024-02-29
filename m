Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D1DC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D78F41B5D;
	Thu, 29 Feb 2024 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBXT4FjES-d8; Thu, 29 Feb 2024 15:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB46B41DF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB46B41DF2;
	Thu, 29 Feb 2024 15:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 220751BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA5004180E
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSpUlDHCzCVk for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E795D41821
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E795D41821
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63BB787D41; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:39:31 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0412998ea51527982cc2e938f4efefcccb7d9663
X-Git-Newrev: 489015b033db39133a82610d723a1980ba6593af
X-Patchwork-Hint: ignore
Message-Id: <20240229154802.63BB787D41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wlroots: vulkan
 renderer depends on vulkan loader
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

commit: https://git.buildroot.net/buildroot/commit/?id=489015b033db39133a82610d723a1980ba6593af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit f27b0322a5019c4016d2800ccc1b586eb6af7bd5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

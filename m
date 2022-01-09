Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EBFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7CDF40495;
	Sun,  9 Jan 2022 18:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkkmFpW9Ubk9; Sun,  9 Jan 2022 18:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84C0B40530;
	Sun,  9 Jan 2022 18:09:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2881E1BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159F140166
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7H3ZekyzN-r for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:08:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAAAD40118
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:08:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BF0BF82D96; Sun,  9 Jan 2022 18:02:38 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 19:01:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 106aa6ce0e92f367226f6aba3caa1a84ff7a9640
X-Git-Newrev: f7178fd1ca0340d0fad34734ab5a462c7f95debd
X-Patchwork-Hint: ignore
Message-Id: <20220109180238.BF0BF82D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix vulkan intel
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7178fd1ca0340d0fad34734ab5a462c7f95debd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is possible to build the vulkan intel driver without X11/GLX.

- remove xorgproto dependency; it is already given via
  BR2_PACKAGE_MESA3D_OPENGL_GLX/BR2_PACKAGE_MESA3D_NEEDS_X11 and was
  already gone from the .mk file

- enable DRI3 automatically when X11 is enabled, like we do for other
  drivers

- libxshmfence is implied by DRI3 (both in Config.in and mesa3d.mk), but
  we need to propagate dependencies (RISCV_32 doesn't apply since it's
  x86 only)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: select DRI3 like other drivers though, which simplifies the
whole thing]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 12 +++++-------
 package/mesa3d/mesa3d.mk |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 34b0352056..b9a5574b63 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -378,21 +378,19 @@ comment "Vulkan drivers"
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	depends on BR2_PACKAGE_XORG7 # xorgproto
-	select BR2_PACKAGE_MESA3D_DRI3
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
-	select BR2_PACKAGE_XORGPROTO
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
-comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >= 3.17"
+comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_XORG7
+		!BR2_TOOLCHAIN_USES_GLIBC
 
 comment "Off-screen Rendering"
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e34ed4264f..aa365838ab 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -146,7 +146,6 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
 else
-MESA3D_DEPENDENCIES += xlib_libxshmfence
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

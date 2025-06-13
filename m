Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5CFC71148
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A38860F34;
	Fri, 13 Jun 2025 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mn9YOZsAayGM; Fri, 13 Jun 2025 21:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A954C60F3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A954C60F3D;
	Fri, 13 Jun 2025 21:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E15CB1DC
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C503060F40
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EzlRt7PpGx5 for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE8960F34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBE8960F34
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB03683601; Fri, 13 Jun 2025 21:15:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Jun 2025 23:13:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d02a1239a553f31605e63b0fb50d9ea4e5e0d987
X-Git-Newrev: 9aff5cb69799b742a7d5de4cc845e519eddcd664
X-Patchwork-Hint: ignore
Message-Id: <20250613211512.DB03683601@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: clarify MESA3D_OPENCL
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aff5cb69799b742a7d5de4cc845e519eddcd664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fc7c7d74aa61 ("package/mesa3d: add RustiCL support") extended the
BR2_PACKAGE_MESA3D_OPENCL dependencies to include
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS &&
BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER) as an alternative provider.

This is correct as in the kconfig language && has a higher priority than ||,
E.G. A || B || C && D is parsed as A || B || (C && D)

https://docs.kernel.org/kbuild/kconfig-language.html#menu-dependencies

But it is somehat unclear, so add a parenthesis for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index fd9beb4704..b5c1d92d68 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -58,8 +58,8 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
-		BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
-		BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
+		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
+		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

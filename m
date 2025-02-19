Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF051C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FF3170688;
	Fri, 28 Feb 2025 17:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzdAglFjyOFj; Fri, 28 Feb 2025 17:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 524457039A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 524457039A;
	Fri, 28 Feb 2025 17:20:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10BA01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F94F42558
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZOro_s-FxaD for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393264695D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 393264695D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3406A80807; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 12:22:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a02e437417193c467b3df67ea811523b8e0517e6
X-Git-Newrev: 64b2f03f5a2e35b7ab873d6f7db64735a0567d59
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.3406A80807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi: don't uselessly
 select libdisplay-info
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64b2f03f5a2e35b7ab873d6f7db64735a0567d59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit c61934611111 (package/kodi: bump version to 21.0-Omega) added a
select onto libdisplay-info from a blind option that only represents
whether a specific subset of Kodi is available, not whether Kodi itself
is enabled.

This causes useless builds of libdisplay-info for a lot of builds where
Kodi is not enabled.

Move the select to the main Kodi symbol itself, guarded with the proper
condition, like a few existing dependencies for GBM.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1977263db8..9661ab47bc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -27,7 +27,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_LIBDISPLAY_INFO
 
 comment "kodi needs udev support for gbm"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
@@ -108,6 +107,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TINYXML2
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
+	select BR2_PACKAGE_LIBDISPLAY_INFO if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

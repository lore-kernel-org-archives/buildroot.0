Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BCEC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA6B60A4E;
	Mon,  8 Jul 2024 20:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tfaq7BRFbjfK; Mon,  8 Jul 2024 20:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 572E060901
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 572E060901;
	Mon,  8 Jul 2024 20:45:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91AAF1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C3F660901
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GHk1hPT2EuW for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6AF060849
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6AF060849
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C29AB83D59; Mon,  8 Jul 2024 20:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:45:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20f72e6af2bbb151f51530441cb6994a215dcbef
X-Git-Newrev: 8df68d2bb454ff22a32c598e343e63cd7e3c02f6
X-Patchwork-Hint: ignore
Message-Id: <20240708204536.C29AB83D59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: allow building
 with musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=8df68d2bb454ff22a32c598e343e63cd7e3c02f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NetworkManager officially supports building with musl since version
1.30, so the restriction to glibc toolchain is no longer necessary.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/4f7c04eaf94849d0455e97ba9bcfdd0b84e6459d/NEWS#L615

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 57d7543131..1d9a02c1d3 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
@@ -59,10 +59,11 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	  This option enables support for OpenVSwitch
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

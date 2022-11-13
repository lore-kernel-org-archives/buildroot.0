Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BC3C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727B260BC9;
	Sun, 13 Nov 2022 16:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727B260BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hyz2Iytmi5rL; Sun, 13 Nov 2022 16:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A278960759;
	Sun, 13 Nov 2022 16:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A278960759
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB701BF86C
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A45D60BCD
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A45D60BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmN-4bxPlQ0K for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5215B60759
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5215B60759
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D159836ED; Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:00:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7f0b5e0cb71b9ba4f93432e67f670162e2a5c058
X-Git-Newrev: 3514b6e094d75cfcde8b1ecf8b3f061987d16335
X-Patchwork-Hint: ignore
Message-Id: <20221113160416.3D159836ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openvmtools:
 refactor using BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=3514b6e094d75cfcde8b1ecf8b3f061987d16335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b05b6bb9faab4e611e65227a4c4e9800b1556590)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvmtools/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index c866b36569..88cccd08af 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -1,6 +1,11 @@
+config BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_OPENVMTOOLS
 	bool "openvmtools"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -51,7 +56,7 @@ comment "resolutionkms needs udev, a toolchain w/ threads"
 endif
 
 comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, locale"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_ENABLE_LOCALE || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

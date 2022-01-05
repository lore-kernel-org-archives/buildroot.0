Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4E4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5498C40A1F;
	Wed,  5 Jan 2022 21:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEfNRJ44U2CQ; Wed,  5 Jan 2022 21:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD0D40A18;
	Wed,  5 Jan 2022 21:00:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 137F81BF9C8
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 021036FBC3
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3WV40ACH0fG for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53F556FBBC
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 299DE832C5; Wed,  5 Jan 2022 20:54:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 21:59:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c0b521987f929ce88ae97ee2bf6f923311061a7
X-Git-Newrev: ae2c55df06e2163b6094b72775180c3a3afc4250
X-Patchwork-Hint: ignore
Message-Id: <20220105205428.299DE832C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/android-tools: add host gcc >= 5
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae2c55df06e2163b6094b72775180c3a3afc4250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add host
gcc >= 5 dependency

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/android-tools/Config.in.host | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
index 433f4e384f..898ddb2199 100644
--- a/package/android-tools/Config.in.host
+++ b/package/android-tools/Config.in.host
@@ -11,11 +11,15 @@ if BR2_PACKAGE_HOST_ANDROID_TOOLS
 
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol
 	help
 	  This option will build and install the fastboot utility for
 	  the host, which can be used to reflash target devices
 	  implementing the fastboot protocol.
 
+comment "fastboot needs a toolchain w/ host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
 	bool "adb"
 	help
@@ -25,9 +29,13 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
 
 config BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS
 	bool "ext4 utils"
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol
 	help
 	  This option will build and install the ext4 utils for the
 	  host, i.e. make_ext4fs, ext4fixup, ext2simg, img2simg,
 	  simg2img and simg2simg.
 
+comment "ext4 utils needs a toolchain w/ host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

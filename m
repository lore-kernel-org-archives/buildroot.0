Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF4AC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEA4740474;
	Tue, 20 Aug 2024 21:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYDvaK_VlSB2; Tue, 20 Aug 2024 21:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD00040B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD00040B38;
	Tue, 20 Aug 2024 21:26:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8F871BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D641A40679
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SAOTGDmcSXu for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E445C40393
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E445C40393
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:26:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF183861D7; Tue, 20 Aug 2024 21:26:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 23:24:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e5abb71310e12be5fedb5bfea2aa6543e345aa5
X-Git-Newrev: 89e9ec35f73d79ebd6ddace35e7192e3ca40f0f1
X-Patchwork-Hint: ignore
Message-Id: <20240820212632.DF183861D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/eudev: correct !static
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=89e9ec35f73d79ebd6ddace35e7192e3ca40f0f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

eudev itself includes dlfcn.h, so even without kmod it cannot be built
statically:

grep -rs dlfcn build/eudev-3.2.14/src
eudev-3.2.14/src/shared/util.c:#include <dlfcn.h>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/Config.in | 2 +-
 system/Config.in        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6e7bbe4648..669a8a15ae 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # needs C99 compiler
-	depends on !BR2_STATIC_LIBS # kmod
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/system/Config.in b/system/Config.in
index bc0c6eb6bc..244e4af531 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -254,7 +254,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using devtmpfs + eudev"
 	depends on BR2_USE_WCHAR # eudev
-	depends on !BR2_STATIC_LIBS
+	depends on !BR2_STATIC_LIBS # eudev
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

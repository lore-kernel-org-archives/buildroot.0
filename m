Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEDEC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CB5F40B8C;
	Tue, 20 Aug 2024 21:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYyVX_9X5krQ; Tue, 20 Aug 2024 21:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EC5F40B94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EC5F40B94;
	Tue, 20 Aug 2024 21:26:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 774DF1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 650A540393
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lm87dfi3sj7 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6414066E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B6414066E
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:26:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8DC2861D8; Tue, 20 Aug 2024 21:26:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 23:25:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 89e9ec35f73d79ebd6ddace35e7192e3ca40f0f1
X-Git-Newrev: 46d9fdff48c106c22f6d96cad8b9011f28baf653
X-Patchwork-Hint: ignore
Message-Id: <20240820212632.E8DC2861D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/eudev: make kmod
 support optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=46d9fdff48c106c22f6d96cad8b9011f28baf653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Eudev can be built without kmod support, E.G.  for setups not using a
modular kernel - So support that.

Make the option default y for backwards compatibility.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/Config.in | 8 +++++++-
 package/eudev/eudev.mk  | 9 ++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 669a8a15ae..65cfc1d2de 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining
 	  better compatibility with existing software such as OpenRC and
@@ -23,6 +22,13 @@ if BR2_PACKAGE_EUDEV
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
+config BR2_PACKAGE_EUDEV_MODULE_LOADING
+	bool "enable kernel module loading"
+	default y
+	select BR2_PACKAGE_KMOD
+	help
+	  Enable kernel module loading support
+
 config BR2_PACKAGE_EUDEV_RULES_GEN
 	bool "enable rules generator"
 	help
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 33cc638291..8318bc1ed4 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -19,13 +19,20 @@ EUDEV_CONF_OPTS = \
 	--enable-blkid
 
 # eudev requires only the util-linux libraries at build time
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs kmod
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
 EUDEV_PROVIDES = udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
 EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
 endif
 
+ifeq ($(BR2_PACKAGE_EUDEV_MODULE_LOADING),y)
+EUDEV_CONF_OPTS += --enable-kmod
+EUDEV_DEPENDENCIES += kmod
+else
+EUDEV_CONF_OPTS += --disable-kmod
+endif
+
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule-generator
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

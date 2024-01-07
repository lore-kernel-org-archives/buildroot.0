Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC24C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 15:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E0660B9E;
	Sun,  7 Jan 2024 15:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61E0660B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3nCmuzuUQ8n; Sun,  7 Jan 2024 15:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF27260B3B;
	Sun,  7 Jan 2024 15:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF27260B3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC31C1BF3BF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9300A414A1
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9300A414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4lp_rQDALik for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 15:48:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEFFC4149F
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 15:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFFC4149F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A42A83B7C; Sun,  7 Jan 2024 15:48:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 16:45:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b37249581fa4a221923540478db7fa720e04035d
X-Git-Newrev: ee9c92e4a4d518d07da5fc3d64aa695509ecdea7
X-Patchwork-Hint: ignore
Message-Id: <20240107154830.9A42A83B7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lvm2: fix libaio handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee9c92e4a4d518d07da5fc3d64aa695509ecdea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libaio is only needed for standard install

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lvm2/Config.in | 2 +-
 package/lvm2/lvm2.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 577a90656a..ddb398d160 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LVM2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_STATIC_LIBS # It fails to build statically
-	select BR2_PACKAGE_LIBAIO
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and
@@ -27,6 +26,7 @@ if BR2_PACKAGE_LVM2
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y
+	select BR2_PACKAGE_LIBAIO
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9caf99eb9b..474ea30bdc 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
 	--disable-nls \
 	--with-symvers=no
 
-LVM2_DEPENDENCIES += host-pkgconf libaio
+LVM2_DEPENDENCIES += host-pkgconf
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
@@ -49,6 +49,7 @@ LVM2_CONF_OPTS += --disable-selinux
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
+LVM2_DEPENDENCIES += libaio
 LVM2_INSTALL_STAGING_OPTS += install
 LVM2_INSTALL_TARGET_OPTS += install
 ifeq ($(BR2_INIT_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795C7C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EB241F95;
	Sat, 13 Jan 2024 13:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34EB241F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fUKF9V8lMNg; Sat, 13 Jan 2024 13:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71DBE41F80;
	Sat, 13 Jan 2024 13:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DBE41F80
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8391BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA2F360C10
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2F360C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJmtwSQtRjIA for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0E7D60B78
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0E7D60B78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF09085E2C; Sat, 13 Jan 2024 13:34:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:50:43 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d59600235378e04b392290880c74ddd4958b405c
X-Git-Newrev: 3801c4e4be34a7d0ad3032991cccaa0c80f47506
X-Patchwork-Hint: ignore
Message-Id: <20240113133411.DF09085E2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/lvm2: fix libaio
 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=3801c4e4be34a7d0ad3032991cccaa0c80f47506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

libaio is only needed for standard install

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ee9c92e4a4d518d07da5fc3d64aa695509ecdea7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/Config.in | 2 +-
 package/lvm2/lvm2.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index cc740dd40c..5d19f78b8a 100644
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
@@ -29,6 +28,7 @@ config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	default y
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
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

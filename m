Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B058AC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 09:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E1DE843AF;
	Wed, 29 Nov 2023 09:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E1DE843AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qp18RSM8YELe; Wed, 29 Nov 2023 09:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACAB8820D5;
	Wed, 29 Nov 2023 09:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACAB8820D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3A6C1BF969
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A4DF81319
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4DF81319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiUYIqtz5efx for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB25B8129B
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB25B8129B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8ECA87572; Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 10:00:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e88823d667cf0a459242da7cdb7f71269b69e536
X-Git-Newrev: 273b634f24ecce9a3d4be3ab4dbd0371f7d26e73
X-Patchwork-Hint: ignore
Message-Id: <20231129090117.A8ECA87572@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openrc: fix uclibc handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=273b634f24ecce9a3d4be3ab4dbd0371f7d26e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix issues spotted by Yann E. Morin in commit
ca169d1d0a5df92e6a1f0850e6969cc525849e6f:
 - BR2_TOOLCHAIN_BUILDROOT_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC
 - Add dependency to openrc package and not only to init system

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openrc/Config.in | 5 +++--
 system/Config.in         | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index 4691be63a2..adc61d2546 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENRC
 	bool "openrc"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_INIT_OPENRC
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod tools
 	select BR2_PACKAGE_KMOD # runtime
@@ -23,7 +24,7 @@ config BR2_PACKAGE_OPENRC
 
 	  https://github.com/OpenRC/openrc
 
-comment "openrc needs a toolchain w/ dynamic library"
+comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_INIT_OPENRC
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/system/Config.in b/system/Config.in
index b90e40e415..33ca69b933 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -105,13 +105,13 @@ config BR2_INIT_OPENRC
 	bool "OpenRC"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # openrc
 	select BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_ROOTFS_SKELETON_DEFAULT
 
 comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
 
 # In Buildroot, we decided not to support a split-usr when systemd is
 # used as an init system. This is a design decision, not a systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

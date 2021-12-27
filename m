Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED73C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 909C181A92;
	Mon, 27 Dec 2021 20:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHlpiHts4sVy; Mon, 27 Dec 2021 20:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE90981A65;
	Mon, 27 Dec 2021 20:08:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 240711BF3C6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BA9A60A93
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjGVxwIAKb0f for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:07:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4312E60AA1
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8BF4E82A9A; Mon, 27 Dec 2021 20:02:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 21:07:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b7c0d7d04ba6323146b66e2fb42f97b116e2c7d
X-Git-Newrev: 7e53aedcdd06b78f7e118cbce64af1c15f5de296
X-Patchwork-Hint: ignore
Message-Id: <20211227200202.8BF4E82A9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncmpc: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e53aedcdd06b78f7e118cbce64af1c15f5de296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

threads dependency was wrongly removed by commit
d29d1368478df621c2426820e1a6019225467234

Fixes:
 - http://autobuild.buildroot.org/results/151765cb4000643048e8d86c7a49bc8bcbf9f390

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncmpc/Config.in | 5 +++--
 package/ncmpc/ncmpc.mk  | 3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 4155404fcf..eda6e0bbd5 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
@@ -13,7 +14,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, gcc >= 7"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 91859cbc24..41fface525 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -20,8 +20,7 @@ NCMPC_CPE_ID_VENDOR = ncmpc_project
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
 	-Ddocumentation=disabled \
-	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled) \
-	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-Dsignalfd=true,-Dsignalfd=false)
+	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled)
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

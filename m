Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C38C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 772AF61233;
	Mon, 30 May 2022 21:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCjVUsbRxMKl; Mon, 30 May 2022 21:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0C66121A;
	Mon, 30 May 2022 21:25:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8231BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89BC96121A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NGLABZHdS-U for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:25:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10C4B60DFA
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:25:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 155F086822; Mon, 30 May 2022 21:13:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:25:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e48c2d5f1996e827e6db3f01797f5087ba527d4
X-Git-Newrev: 2753d9ef82fe1bb5ff402341c56d18b2a4eb3d1d
X-Patchwork-Hint: ignore
Message-Id: <20220530211343.155F086822@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcr: put back
 BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2753d9ef82fe1bb5ff402341c56d18b2a4eb3d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5452b5887005298a87650ff4003ecfaecfd9aca0 wrongly removed
BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS dependency resulting in the
following build failure:

Makefile:576: *** libgpg-error is in the dependency chain of libgcrypt that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/261a137824109342fd83b766a299c1eeda6ff401

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcr/Config.in    | 2 ++
 package/midori/Config.in | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index 7c5fdba008..dbc22cf478 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GCR
 	bool "gcr"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -15,6 +16,7 @@ config BR2_PACKAGE_GCR
 	  https://developer.gnome.org/gcr/
 
 comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/midori/Config.in b/package/midori/Config.in
index f45444a289..6029c0a9df 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gcr -> libgcrypt -> libgpg-error
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

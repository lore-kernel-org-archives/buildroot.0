Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34607C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 15:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1520607EE;
	Sat, 19 Apr 2025 15:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qx94PTz3w0tJ; Sat, 19 Apr 2025 15:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5746071E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB5746071E;
	Sat, 19 Apr 2025 15:10:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 063DA228
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E058740235
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YM1JEHgbX0wz for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35C0F40151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35C0F40151
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 215EB85BE2; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 17:04:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93ffe1a088b0f0be957dba9a33ad6c97279bb995
X-Git-Newrev: 70bcb7655bc1893c76e682cbb7c750b84c70ca64
X-Patchwork-Hint: ignore
Message-Id: <20250419151032.215EB85BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseview: fix, update,
 and reorganise dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=70bcb7655bc1893c76e682cbb7c750b84c70ca64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependencies for pulseview are not entirely clean:
  - arch deps are not first;
  - second-level inherited deps are listed;
  - deps are not alphabetically ordered (for deps on packages);
  - the comment is hidden even when the arch deps are met, because of an
    incorrect dependency on Qt5;
  - qt5 is a depends-on when it could be a select.

Update the dependencies to fix all the points above.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseview/Config.in | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index f122551b9f..b1f9dc25d7 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -1,40 +1,40 @@
 config BR2_PACKAGE_PULSEVIEW
 	bool "pulseview"
-	depends on BR2_PACKAGE_QT5
-	# libsigrok->libglib2:
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_USE_WCHAR  # libsigrok, qt5
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # qt5
 	depends on BR2_INSTALL_LIBSTDCPP
-	# libsigrok->libzip
-	depends on !BR2_STATIC_LIBS
-	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_ENABLE_LOCALE
+	depends on !BR2_STATIC_LIBS # libsigrok, qt5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigrok
+	depends on BR2_HOST_GCC_AT_LEAST_5  # qt5
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
-	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 4.9"
+comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_ENABLE_LOCALE \
+		|| BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| !BR2_HOST_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

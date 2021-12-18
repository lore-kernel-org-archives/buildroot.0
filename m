Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CD2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E6C60B3A;
	Sat, 18 Dec 2021 21:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wrjrsvKB9ns; Sat, 18 Dec 2021 21:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF39F607F9;
	Sat, 18 Dec 2021 21:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 912C91BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D4C84D73
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YfzaeZgPdiW for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:42:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9606784D71
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:42:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3C2D382580; Sat, 18 Dec 2021 21:37:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 22:42:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b3055cc8d25e496928643ef93f3a47910fa4974
X-Git-Newrev: ff58dc6c35ac9e128c676780d7cd333abf4cd446
X-Patchwork-Hint: ignore
Message-Id: <20211218213732.3C2D382580@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-pk-helper: fix dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff58dc6c35ac9e128c676780d7cd333abf4cd446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix dependencies which are wrong since the addition of the package in
commit e13c9ccf436cf13b53bec6933e5be4bb071cfad9 resulting in the
following build failure:

Makefile:587: *** duktape is in the dependency chain of polkit that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/706a09b245880e99109a4cc99faffe83f458afc4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cups-pk-helper/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
index 63a0d3acd8..113f433795 100644
--- a/package/cups-pk-helper/Config.in
+++ b/package/cups-pk-helper/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_CUPS_PK_HELPER
 	bool "cups-pk-helper"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
 	depends on BR2_USE_WCHAR # libglib2
+	depends on !BR2_STATIC_LIBS # polkit -> duktape
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_POLKIT
 	help
@@ -11,7 +13,7 @@ config BR2_PACKAGE_CUPS_PK_HELPER
 
 	  https://wiki.freedesktop.org/www/Software/cups-pk-helper/
 
-comment "cups-pk-helper support needs a toolchain with threads, wchar, gcc >= 7"
+comment "cups-pk-helper support needs a toolchain with threads, wchar, dynamic library, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

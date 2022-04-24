Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15DCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9858560BBA;
	Sun, 24 Apr 2022 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mb2UIai8SZ-B; Sun, 24 Apr 2022 15:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC35860F39;
	Sun, 24 Apr 2022 15:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA2D1BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CBDF60B77
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AORKCLkYtIb1 for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C548E60B62
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3D9388422F; Sun, 24 Apr 2022 15:43:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 16:53:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7744aba7bcc7f4ad38ff4bba3d0c37969544fce
X-Git-Newrev: dfb42ab91b7b1f58bc89362403321ed7063dda9f
X-Patchwork-Hint: ignore
Message-Id: <20220424154321.3D9388422F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: force libzlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfb42ab91b7b1f58bc89362403321ed7063dda9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force libzlib instead of depending on it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/assimp/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 833e559a6f..5ffb50cd79 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_LIBZLIB
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
@@ -14,11 +15,7 @@ config BR2_PACKAGE_ASSIMP
 	  http://www.assimp.org
 
 comment "assimp needs a toolchain w/ C++, wchar"
-	depends on BR2_PACKAGE_LIBZLIB
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
-comment "assimp needs libzlib"
-	depends on !BR2_PACKAGE_LIBZLIB
-
 comment "assimp needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

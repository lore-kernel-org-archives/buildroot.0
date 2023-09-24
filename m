Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB91CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71BA341827;
	Sun, 24 Sep 2023 10:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71BA341827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZs_Ia38eb7Y; Sun, 24 Sep 2023 10:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A37F418E3;
	Sun, 24 Sep 2023 10:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A37F418E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE871BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8118060B98
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8118060B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-druPxmqPi2 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D3AC60ED5
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D3AC60ED5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67297874A8; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 12:25:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33e5043ebac2e11873a9f1dcb02fc4afa497886e
X-Git-Newrev: 3e8e2e0b43b557286cf29f99c8923e5a92a6b44d
X-Patchwork-Hint: ignore
Message-Id: <20230924103354.67297874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libostree: needs headers >= 5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e8e2e0b43b557286cf29f99c8923e5a92a6b44d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux/fsverity.h is only available since kernel 5.4 and
https://github.com/torvalds/linux/commit/085771ec14b9bdb843fe9283d4703ced395d1b0b
resulting in the following build failure since bump to version 2023.5 in
commit c64a3e9767757f6bab0ecf2df35871508003f39e and
https://github.com/containers/composefs/commit/d3b4b1a2599e74757a3ada47a88645b363067a0a:

composefs/libcomposefs/lcfs-writer-erofs.c:37:10: fatal error: linux/fsverity.h: No such file or directory
   37 | #include <linux/fsverity.h>
      |          ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/045987a09cf9061dae80db6ada1f912b2867db26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libostree/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 696e8e1d6c..9c59413eb1 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBOSTREE
 	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 # linux/fsverity.h
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,8 +19,9 @@ config BR2_PACKAGE_LIBOSTREE
 
 	  https://ostree.readthedocs.io/en/latest/
 
-comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar"
+comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar, headers >= 5.4"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
+		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

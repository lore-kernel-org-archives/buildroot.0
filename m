Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB18C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9412384031;
	Sun, 10 Apr 2022 21:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_AE19wngLkU; Sun, 10 Apr 2022 21:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D478402C;
	Sun, 10 Apr 2022 21:12:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3E71BF9A4
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47A904160B
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dafw30nH-Gvf for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55C8F415E9
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F2D0B83912; Sun, 10 Apr 2022 21:02:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:07:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b1080d57ae642bd5d4b5783c49d4ba49f13dfe8
X-Git-Newrev: 35be926c97836989d6cecbc7ecb49f9c9bd46eba
X-Patchwork-Hint: ignore
Message-Id: <20220410210201.F2D0B83912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spice: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=35be926c97836989d6cecbc7ecb49f9c9bd46eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

spice needs C++ since bump to version 0.15.0 in commit
b784f1bc0fc3ac33a20549069a81ff98260b58e9 and
https://github.com/freedesktop/spice/commit/e6e6ded681ff154f236f260f071389c4c8c0d944:

configure: error: *** A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/4e0dc43c28d45176cccf573fb56ea9690192f754

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 2241b55b3d..ca5c562ca1 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,12 +1,14 @@
-comment "spice server needs a toolchain w/ wchar, threads"
+comment "spice server needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

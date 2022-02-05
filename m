Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44E3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 17:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85E13813F7;
	Sat,  5 Feb 2022 17:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkNSnNomlkXx; Sat,  5 Feb 2022 17:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98AC58143B;
	Sat,  5 Feb 2022 17:29:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCFC31BF30E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B99A340259
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_QYNp56l8_8 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 17:28:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C66840265
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 17:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7813682A81; Sat,  5 Feb 2022 17:21:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 18:26:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ec5f99b3a00a1ec4dd6677a0ee6418267ffba25
X-Git-Newrev: 403892137cbf134f729834b98ede008760b8c4f0
X-Patchwork-Hint: ignore
Message-Id: <20220205172122.7813682A81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptopp: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=403892137cbf134f729834b98ede008760b8c4f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

no -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -fPIC -DCRYPTOPP_DISABLE_ARM_NEON -c cryptlib.cpp
make[1]: no: Command not found

Fixes:
 - http://autobuild.buildroot.org/results/fa90b416a219a512a482e7dc63e2d72b184307c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
index feb945db2f..1648a73f9d 100644
--- a/package/cryptopp/Config.in
+++ b/package/cryptopp/Config.in
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_CRYPTOPP
 	bool "cryptopp"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	help
 	  A free C++ class library of cryptographic schemes
 
-comment "cryptopp needs a toolchain w/ dynamic library, wchar"
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+comment "cryptopp needs a toolchain w/ C++, dynamic library, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEAFC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:58:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C074B60EB2
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C074B60EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 999716F90C;
	Wed,  4 Aug 2021 00:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFoCcr4aUjTb; Wed,  4 Aug 2021 00:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8FF60B08;
	Wed,  4 Aug 2021 00:58:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CC221BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 473794069F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EU22Y85vcoz2 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53ACB40F27
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9B4A087884; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 047d7cb173ac9fa9f2c53886166a7b41fbf21909
X-Git-Newrev: be38432532b23275869a3a914c0ad0031323259c
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.9B4A087884@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gtest: needs gcc >= 4.9
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=be38432532b23275869a3a914c0ad0031323259c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

gtest unconditionally uses is_trivially_copy_constructible since
version 1.11.0 and
https://github.com/google/googletest/commit/c13c27a513ecd1cbf5700a45fe590e85e8ae6770

So add a dependency on gcc >= 4.9 to avoid a build failure since commit
9dfbbbb4105c47602da048c9bb9499fb8862e768

Fixes:
 - http://autobuild.buildroot.org/results/3d23d7c2c340c23e468890e4df73a9b3b142ecf6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtest/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 3f1f38556f..d8bcf6343f 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
@@ -48,7 +49,8 @@ config BR2_PACKAGE_GTEST_GMOCK
 
 endif # BR2_PACKAGE_GTEST
 
-comment "gtest needs a toolchain w/ C++, wchar, threads"
+comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2C0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D344A40449;
	Mon,  6 Dec 2021 18:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFOa8V2L8Mlu; Mon,  6 Dec 2021 18:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06238400CF;
	Mon,  6 Dec 2021 18:42:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F21C1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C80AD41C65
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6AmbQHn7U6Si for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A94B41C62
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D952E81468; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:19:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d925c1260f14cebff0b479a2abff8e95a8da222d
X-Git-Newrev: 7b5271ecfd64e6cc2562c5911266f107236cef22
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.D952E81468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgeos: add threads dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b5271ecfd64e6cc2562c5911266f107236cef22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Buildroot commit 2dd2f3751ff2aa60df7de5453e65aa148f64645d, the
libgeos package was bumped from 3.9.1 to 3.10.1.

Since version 3.10.0, libgeos uses mutex since (commit https://github.com/libgeos/geos/commit/3fcbd1e0c52843c2ae0b4809c9f89f74ce529afe#diff-38d1bc63228770a179e474aef4fd26b1a2ab5f5758a5d98d07ac556498dd1f3d)

Toolchains without threads support fails to build:
/home/giuliobenetti/autobuild/run/instance-1/output-1/build/libgeos-3.10.1/include/geos/index/strtree/TemplateSTRtree.h:376:10: error: 'mutex' in namespace 'std' does not name a type
  376 |     std::mutex lock_;
      |          ^~~~~

So it needs threads.

Fixes:

 http://autobuild.buildroot.net/results/2d5fe2866dfa24f5747fbc826fea1108a2a6cb47/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgeos/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 86a1cddcf3..5e861ab010 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
@@ -13,7 +14,8 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, threads not binutils bug 21464, 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		   !BR2_TOOLCHAIN_HAS_THREADS || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

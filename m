Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B05C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81B8440A5B;
	Thu, 13 Jan 2022 17:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmAe0qa_-PXI; Thu, 13 Jan 2022 17:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AE8340105;
	Thu, 13 Jan 2022 17:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3DCE1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0D383EAF
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uPXwn5-Urey for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4B7F83E9B
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:52:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D79168353E; Thu, 13 Jan 2022 17:46:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 18:52:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4eec4c13633500fb4688b2c28d033551dda5ea9c
X-Git-Newrev: 7996a1a18b7ea8102c7a0ddae57de9624902594f
X-Patchwork-Hint: ignore
Message-Id: <20220113174620.D79168353E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglvnd: needs __sync_*_4
 intrinsics
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

commit: https://git.buildroot.net/buildroot/commit/?id=7996a1a18b7ea8102c7a0ddae57de9624902594f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:

/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/EGL/libEGL.so.1.1.0.p/libegl.c.o: in function `AtomicIncrement':
libegl.c:(.text+0x614): undefined reference to `__sync_add_and_fetch_4'

Fixes:
 - http://autobuild.buildroot.org/results/a204953020a714057ec6690e63a3ad8ac621acd5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglvnd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index 2d99be8632..cd19fde582 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGLVND
 	bool "libglvnd"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  The GL Vendor-Neutral Dispatch library
@@ -45,4 +46,5 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 endif
 
 comment "libglvnd needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

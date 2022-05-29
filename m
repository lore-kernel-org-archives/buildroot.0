Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21659C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A252442649;
	Sun, 29 May 2022 08:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FaA5vYVVMWE; Sun, 29 May 2022 08:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D22B419F0;
	Sun, 29 May 2022 08:55:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B97D1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 398FD60DB2
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bmh12og26hNV for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CE8560C18
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1270A85F51; Sun, 29 May 2022 08:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:43:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 88a86922b061b1da0348dbcb3cb0bf14ec5e0b09
X-Git-Newrev: b6ab73fe1f466c0e30171b59ef3cdfcaeed16e5c
X-Patchwork-Hint: ignore
Message-Id: <20220529084303.1270A85F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcc: restrict
 hs4x_rel31 to arc gcc fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6ab73fe1f466c0e30171b59ef3cdfcaeed16e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

All the ARC variants are supported by upstream gcc, except for the
HS48 rel31 (hs4x_rel31) which is only supported by the ARC fork.

Fixes:
http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9432e0c53b5
http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153faca4b32c2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 770c9e5ce3de4ef1743948898a37e9a2ad76ca8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index f6b9b4fa9d..2b12035c4b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_GCC_VERSION_10_X
@@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_GCC_VERSION_11_X
@@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
 	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
 	depends on !BR2_sparc
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

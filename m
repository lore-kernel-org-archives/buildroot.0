Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FED6E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4BA440571;
	Sat, 30 Sep 2023 13:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4BA440571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhHLCdU6OKL3; Sat, 30 Sep 2023 13:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7FED40C16;
	Sat, 30 Sep 2023 13:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7FED40C16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4AC1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECE8340571
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECE8340571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id avtF0bwKGLRq for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42602400A6
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42602400A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A50D839F6; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 14:49:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2bad2e0bf2704d261bb7552b561d30be8c27c9c
X-Git-Newrev: cc3634187790d352684d892fd2bbdc9f2ba84925
X-Patchwork-Hint: ignore
Message-Id: <20230930131103.2A50D839F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-final: move hook further
 down
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc3634187790d352684d892fd2bbdc9f2ba84925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The HOST_GCC_FINAL_M68K_LIBGCC_FIXUP hook is tweaking the staging
directory. In preparation for additional rework, let's move it further
down in the file so that the diff of the rework will be easier to look
at.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc-final/gcc-final.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index c6ed0e35b9..ae6aedb2e7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -135,15 +135,6 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-# coldfire is not working without removing these object files from libgcc.a
-ifeq ($(BR2_m68k_cf),y)
-define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
-	find $(STAGING_DIR) -name libgcc.a -print | \
-		while read t; do $(GNU_TARGET_NAME)-ar dv "$t" _ctors.o; done
-endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
-endif
-
 HOST_GCC_FINAL_LIBS = libgcc_s libatomic
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
@@ -199,4 +190,13 @@ define HOST_GCC_FINAL_INSTALL_LIBS
 endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBS
 
+# coldfire is not working without removing these object files from libgcc.a
+ifeq ($(BR2_m68k_cf),y)
+define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+	find $(STAGING_DIR) -name libgcc.a -print | \
+		while read t; do $(GNU_TARGET_NAME)-ar dv "$t" _ctors.o; done
+endef
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+endif
+
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

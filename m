Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF94C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D844B4F254;
	Fri, 28 Feb 2025 16:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cc4hOQJbdh7r; Fri, 28 Feb 2025 16:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2D824F22F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2D824F22F;
	Fri, 28 Feb 2025 16:36:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6DD094F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A502183C30
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFJ5pcZUOLg1 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D753883C61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D753883C61
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C70F485E25; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 14:45:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 91d1207de0b3cda9b9722f7ca09131cde7c14bd9
X-Git-Newrev: 9fcfec83410c470bc38d6d43461fead1832d9cef
X-Patchwork-Hint: ignore
Message-Id: <20250228163034.C70F485E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/grpc: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dead code
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fcfec83410c470bc38d6d43461fead1832d9cef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This work-around was added in commit
716f8b34c526c702aa19e9a66a25df5d3a6ea663 ("package/grpc: work around
gcc bug 85180") to work around a bug on Microblaze. However, since
commit
ae0557403a3a4cbf5354f0ab1784a08623382e5e ("package/libabseil-cpp: add
BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS"), grpc depends on
libaseil-cpp, which isn't available on Microblaze, making the
GCC_BUG_85180 no longer needed, and effectively dead code. This commit
drops it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/grpc/grpc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 47ebf1997c..39be4f583f 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -59,11 +59,6 @@ GRPC_CFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
 GRPC_CXXFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-GRPC_CFLAGS += -O0
-GRPC_CXXFLAGS += -O0
-endif
-
 GRPC_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

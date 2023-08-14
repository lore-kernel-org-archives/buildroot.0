Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE5C001E0
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 07:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5976441620;
	Mon, 14 Aug 2023 07:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5976441620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lID4fzOuibja; Mon, 14 Aug 2023 07:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C50415EB;
	Mon, 14 Aug 2023 07:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C50415EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7721BF399
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 07:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 402B881846
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 07:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 402B881846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOwlrWSqbOin for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 07:16:55 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EA1381842
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 07:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA1381842
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4616E3520BFF; Mon, 14 Aug 2023 09:16:51 +0200 (CEST)
Date: Mon, 14 Aug 2023 09:16:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNnU4wGoYvMTOSkQ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691997411; bh=hGoiVgJvfGht6sRbDmOKwOCqXx30H8i0pyihslkAuPU=;
 h=Date:From:To:Subject:From;
 b=Kk1w+eeMtAOeRwalqXWjCKrFWPBxOfRrJveKfdUcbxRbbtttKROPeS3fnR53dRGq6
 WGMXyycvzNv30mHiJyEb2qHw5Q0226gd4h++k+f6UbHL6BPMBgLuxDiaHdOE9rsYZn
 yhWfGD6Bi7Spr9aXp8cafuND7K5OyxkzAaeCKye1HJWQ33njkKsY4FxpOw1PB3kGSM
 HkMdcJZS/vG7YnbL9MfEaIA4xXtM5PgcSfANR/gMsExxrOBHrDGwvbAzsy9o/124ok
 QkWE1Z9MgRWGoIVeLY+JzmrvSkNsOV97vnnTK2cpgSIMZn1vPwsAPp/zCqXD+WCR9I
 c+sBNE3MEh3DQ==
Subject: [Buildroot] [PATCH] package/perftest: fix unmet direct dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rdma-core selects perftest and needs NPTL.
Should be backported to stable branches, because the problem
exist since the addition of the package.

Fixes:
 - http://autobuild.buildroot.net/results/00c/00ce19a1589c6028ee77c333ed9107e2c8c8d6de

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/perftest/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perftest/Config.in b/package/perftest/Config.in
index 25cd1a9b8d..0a4114015b 100644
--- a/package/perftest/Config.in
+++ b/package/perftest/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
 config BR2_PACKAGE_PERFTEST
 	bool "perftest"
 	depends on BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # rdma-core
 	depends on !BR2_STATIC_LIBS # rdma-core
 	# musl does not define sysconf(_SC_LEVEL1_DCACHE_LINESIZE)
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

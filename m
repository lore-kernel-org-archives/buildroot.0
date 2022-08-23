Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB31AC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CEA3409F8;
	Tue, 23 Aug 2022 20:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CEA3409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEik0AAukfPQ; Tue, 23 Aug 2022 20:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72599405D6;
	Tue, 23 Aug 2022 20:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72599405D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 502441BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B648405D6
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B648405D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id heaXlcn4Eyzr for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:58:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 768F84012B
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768F84012B
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2E18487BF4; Tue, 23 Aug 2022 20:43:51 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:58:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bd0cc0cb8a9a3016ca4970a21ebbf7f497dfe96
X-Git-Newrev: 701e6f34e0c54c3041cfd9e154ed4da6902c4823
X-Patchwork-Hint: ignore
Message-Id: <20220823204351.2E18487BF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg: SIMD needs VSX with little
 endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=701e6f34e0c54c3041cfd9e154ed4da6902c4823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SIMD needs VSX with little endian to avoid the following build failure:

In file included from /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolor-altivec.c:25:
/nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolext-altivec.c: In function 'jsimd_rgb_ycc_convert_altivec':
/nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jsimd_altivec.h:93:26: warning: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vsl'? [-Wimplicit-function-declaration]
   93 | #define VEC_LD(a, b)     vec_vsx_ld(a, b)
      |                          ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/be6d5ad0cee4ee19eb25e595d44555a1af6e073b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/jpeg/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 0a786060d7..371f89aa49 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_JPEG_SIMD_SUPPORT
 	bool
 	default y if BR2_X86_CPU_HAS_MMX
 	default y if BR2_ARM_CPU_HAS_NEON
-	default y if BR2_POWERPC_CPU_HAS_ALTIVEC
+	default y if BR2_POWERPC_CPU_HAS_ALTIVEC && !BR2_powerpc64le
+	default y if BR2_POWERPC_CPU_HAS_VSX && BR2_powerpc64le
 	default y if BR2_aarch64 || BR2_aarch64_be
 
 config BR2_PACKAGE_JPEG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

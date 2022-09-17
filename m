Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA85ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355F7826B4;
	Sat, 17 Sep 2022 14:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355F7826B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4Ur4U4tjeYF; Sat, 17 Sep 2022 14:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B8A813C4;
	Sat, 17 Sep 2022 14:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B8A813C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5B4A1BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEA816112A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEA816112A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZwrxyPsI0mV for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:27:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D31E461122
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D31E461122
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C1F228439A; Sat, 17 Sep 2022 14:27:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:22:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f3eca5d7e073f9dc1f10dca3aa97bfe2089f88c8
X-Git-Newrev: 2c172993b87955efca2665c08c7dd850ba5b2e44
X-Patchwork-Hint: ignore
Message-Id: <20220917142748.C1F228439A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jpeg: SIMD needs
 VSX with little endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c172993b87955efca2665c08c7dd850ba5b2e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 701e6f34e0c54c3041cfd9e154ed4da6902c4823)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

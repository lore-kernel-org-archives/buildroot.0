Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C77ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 18:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A3060F53;
	Sat, 17 Sep 2022 18:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A3060F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XepYWRf1bTB; Sat, 17 Sep 2022 18:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B69D460D6F;
	Sat, 17 Sep 2022 18:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B69D460D6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE3C61BF335
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A4DE4016A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4DE4016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmfPdn_yhm7L for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 18:52:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF7964011F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF7964011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF91084608; Sat, 17 Sep 2022 18:52:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 20:48:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a722532f00ec8fce5692ed085b6291dec261a524
X-Git-Newrev: 06e32e8c7a248d0de19a294033eb7033e980bec4
X-Patchwork-Hint: ignore
Message-Id: <20220917185246.AF91084608@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ffmpeg: altivec
 needs VSX with little endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=06e32e8c7a248d0de19a294033eb7033e980bec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

In file included from libavcodec/ppc/audiodsp.c:31:
libavcodec/ppc/audiodsp.c: In function 'scalarproduct_int16_altivec':
./libavutil/ppc/util_altivec.h:123:5: error: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vslh'? [-Werror=implicit-function-declaration]
  123 |     vec_vsx_ld(offset, b)
      |     ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b772d285f978ff9bc3b07872d009633c943f20b1

VSX is indeed an extension to AltiVec, so having VSX implies having
AltiVec [0], so we can condition the altivec support on LE, on VSX being
available.

To be noted, however, is that ffmpeg has a configre switch dedicated to VSX:
--enable-vsx.  We do not add support for that here, as we are just fixing
the AltiVec support.  Adding VSX configure flag is left as an excercise for
a future feature addition.

[0] https://en.wikipedia.org/wiki/AltiVec#VSX_(Vector_Scalar_Extension)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - add comment in .mk
  - exend commit log to explain VSX implies AltiVec
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a26ab27397c81928bdacc96473f80b2c47fc534d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 82d229903f..ced5ce598f 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -511,7 +511,11 @@ endif
 FFMPEG_CONF_OPTS += --disable-asm
 endif # MIPS
 
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC):$(BR2_powerpc64le),y:)
+FFMPEG_CONF_OPTS += --enable-altivec
+else ifeq ($(BR2_POWERPC_CPU_HAS_VSX):$(BR2_powerpc64le),y:y)
+# On LE, ffmpeg AltiVec support needs VSX intrinsics, and VSX
+# is an extension to AltiVec.
 FFMPEG_CONF_OPTS += --enable-altivec
 else
 FFMPEG_CONF_OPTS += --disable-altivec
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

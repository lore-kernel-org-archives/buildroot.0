Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32C1ECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 083ED405C8;
	Sat, 27 Aug 2022 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 083ED405C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_HqsoIzE_LX; Sat, 27 Aug 2022 20:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5D20405B1;
	Sat, 27 Aug 2022 20:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5D20405B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8A591BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 824BD4093F
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 824BD4093F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hewZ0WQvgyW5 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:27:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E5034092D
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E5034092D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EBA3687E30; Sat, 27 Aug 2022 20:12:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 22:23:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ebdf1c47bd0d4e16f0fecc6363281f8cb59227b
X-Git-Newrev: a26ab27397c81928bdacc96473f80b2c47fc534d
X-Patchwork-Hint: ignore
Message-Id: <20220827201240.EBA3687E30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: altivec needs VSX with
 little endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=a26ab27397c81928bdacc96473f80b2c47fc534d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

In file included from libavcodec/ppc/audiodsp.c:31:
libavcodec/ppc/audiodsp.c: In function 'scalarproduct_int16_altivec':
./libavutil/ppc/util_altivec.h:123:5: error: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vslh'? [-Werror=implicit-function-declaration]
  123 |     vec_vsx_ld(offset, b)
      |     ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b772d285f978ff9bc3b07872d009633c943f20b1

VSX is indeed an extension to AltiVec, so havinf VSX implies having
AltiVec [0], so we can condition he altivec support on LE ,on VSX being
available.

To be noted, however, is that ffmpeg has a configre switch dedicated to
VSX: --enable-vsx. We do not use it add support for that here, as we are
just fixing the AltiVec support. Adding VSX configure flag is left as an
excercise for a future feature addition.

[0] https://en.wikipedia.org/wiki/AltiVec#VSX_(Vector_Scalar_Extension)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - add comment in .mk
  - exend commit log to explain VSX implies AltiVec
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

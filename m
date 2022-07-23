Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC9DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F1E41652;
	Sat, 23 Jul 2022 14:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9F1E41652
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cA_SkM4Fs2mQ; Sat, 23 Jul 2022 14:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C462B4164E;
	Sat, 23 Jul 2022 14:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C462B4164E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF2651BF957
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA1AC40B1A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA1AC40B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIoShpaEur6w for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9718400AC
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9718400AC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D2693844C9; Sat, 23 Jul 2022 14:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2380157f6688c5c065fa19060a2c33145bab95b
X-Git-Newrev: 242b87e2996fcc464789835b96e0fa5b1d4e531f
X-Patchwork-Hint: ignore
Message-Id: <20220723141949.D2693844C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add missing
 --enable-libquadmath-support option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0172202305613245145=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0172202305613245145==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=242b87e2996fcc464789835b96e0fa5b1d4e531f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_TOOLCHAIN_HAS_LIBQUADMATH is set, --enable-libquadmath-support
option is missing. So the float128 support is not fully enabled in gcc.

This lead to a build issue with gcc 12 on PowerPC power8 due to missing
M_2_SQRTPIq definition (provided by libquadmath.h).

../../../libgfortran/intrinsics/erfc_scaled.c: In function ‘erfc_scaled_r17’:
../../../libgfortran/intrinsics/erfc_scaled.c:143:22: error: ‘M_2_SQRTPIq’ undeclared (first use in this function); did you mean ‘M_2_SQRTPIf’?
  143 | # define _M_2_SQRTPI M_2_SQRTPIq
      |                      ^~~~~~~~~~~

This is fixed by adding --enable-libquadmath-support (like crosstool-ng
handling [1]).

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/2510178766

[1] https://github.com/crosstool-ng/crosstool-ng/blob/crosstool-ng-1.25.0/scripts/build/cc/gcc.sh#L370

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 128cf8421d..42484f539b 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -118,7 +118,7 @@ endif
 
 # quadmath support requires wchar
 ifeq ($(BR2_USE_WCHAR)$(BR2_TOOLCHAIN_HAS_LIBQUADMATH),yy)
-HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
+HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath --enable-libquadmath-support
 else
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath --disable-libquadmath-support
 endif

--===============0172202305613245145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0172202305613245145==--

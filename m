Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFBCC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 10:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1037A60746;
	Wed, 21 Aug 2024 10:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zm3k3w3W0nl; Wed, 21 Aug 2024 10:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DB16073A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DB16073A;
	Wed, 21 Aug 2024 10:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF5CC1BF354
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 10:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDDBC81346
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 10:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IveMEzEo2uNv for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 10:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70A7E81344
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A7E81344
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70A7E81344
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 10:41:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 562C840003;
 Wed, 21 Aug 2024 10:41:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 12:41:53 +0200
Message-ID: <20240821104154.1941433-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724236916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=j8Rz3TR8hyuvVC0Fk2MESp5c1Nw6Yv+U7a82sQ4UIBw=;
 b=UBJMnPYm8Xf9yQnto1xrQVfkFleaS1fBdi4348RBEHe1HdBYM/Gv3YV9B4IbA8joLLCLAM
 9OeIsBiZxaJSGNrdIuTsmdQO0soQ6ogrAq0C1cvY7898UPRS5YsNS18Ewx6L4IUVLvJo5E
 lOsEVG4A4GjTza+uedsVfqECIcvazdCfw777TddU7wDv2pDUg2VqzLk8EXWN7VFmauOVt+
 ARm2ZKLnvhVmgbrR4NvLkDCyXpLrY1mKxhxy5AqoBDdJelgQyVLOmgojs5XmCjlfb2q/KD
 +/XWB1bq05tYHS+apcUWL2mZA19Y9kRngCqQ2jxVCw14fbXvB8RjPcsNxvsUxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UBJMnPYm
Subject: [Buildroot] [PATCH] package/gcc: add GCC patch to fix
 PowerPC64/musl build issue
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PowerPC64/musl toolchains currently fail to build with:

In file included from ../../../libquadmath/math/sqrtq.c:13:
../../../libquadmath/math/../../libgcc/soft-fp/quad.h:69:1: error: unable to emulate 'TF'
   69 | typedef float TFtype __attribute__ ((mode (TF)));
      | ^~~~~~~
make[4]: *** [Makefile:979: math/sqrtq.lo] Error 1

This issue has been reported upstream as
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116007, and has been
fixed as
https://gcc.gnu.org/g:3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b.

This commit simply backports the upstream GCC fix. This issue was new
with GCC 14.x, so only GCC 14.x needs to be fixed.

Fixes:

  http://autobuild.buildroot.org/results/529bec7ef338842030d3340d9b21d8fd16d8639d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...up-libquadmath-math-sqrtq.c-compilat.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch

diff --git a/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch b/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
new file mode 100644
index 0000000000..b6ed2ffed8
--- /dev/null
+++ b/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
@@ -0,0 +1,57 @@
+From ba9356565695728ce0c852f7de3de27f8745611d Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Sat, 3 Aug 2024 20:37:54 +0200
+Subject: [PATCH] libquadmath: Fix up libquadmath/math/sqrtq.c compilation in
+ some powerpc* configurations [PR116007]
+
+My PR114623 change started using soft-fp.h and quad.h for the sqrtq implementation.
+Unfortunately, that seems to fail building in some powerpc* configurations, where
+TFmode isn't available.
+quad.h has:
+ #ifndef TFtype
+ typedef float TFtype __attribute__ ((mode (TF)));
+ #endif
+and uses TFtype.  quad.h has:
+ /* Define the complex type corresponding to __float128
+    ("_Complex __float128" is not allowed) */
+ #if (!defined(_ARCH_PPC)) || defined(__LONG_DOUBLE_IEEE128__)
+ typedef _Complex float __attribute__((mode(TC))) __complex128;
+ #else
+ typedef _Complex float __attribute__((mode(KC))) __complex128;
+ #endif
+with the conditional and KCmode use added during porting of libquadmath
+to powerpc*, so I've just defined TFtype for powerpc when __LONG_DOUBLE_IEEE128__
+isn't defined; I could define it to float __attribute__ ((mode (KF))) but it
+seemed easier to just define it to __float128 which should do the same thing.
+
+2024-08-03  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/116007
+	* math/sqrtq.c (TFtype): For PowerPC without __LONG_DOUBLE_IEEE128__
+	define to __float128 before including soft-fp.h and quad.h.
+
+(cherry picked from commit 3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b)
+Upstream: https://gcc.gnu.org/g:3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b
+Upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116007
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libquadmath/math/sqrtq.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libquadmath/math/sqrtq.c b/libquadmath/math/sqrtq.c
+index 8ca2828d42c..a58998a0667 100644
+--- a/libquadmath/math/sqrtq.c
++++ b/libquadmath/math/sqrtq.c
+@@ -9,6 +9,9 @@
+     && defined(FE_TOWARDZERO) \
+     && defined(FE_INEXACT)
+ #define USE_SOFT_FP 1
++#if defined(_ARCH_PPC) && !defined(__LONG_DOUBLE_IEEE128__)
++#define TFtype __float128
++#endif
+ #include "../../libgcc/soft-fp/soft-fp.h"
+ #include "../../libgcc/soft-fp/quad.h"
+ #endif
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2838EC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C290E81378;
	Mon, 14 Nov 2022 22:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C290E81378
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKCHeiFZSw11; Mon, 14 Nov 2022 22:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0473C812D7;
	Mon, 14 Nov 2022 22:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0473C812D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF791BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76E1B606DC
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E1B606DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZxXyaLlzpFQ for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B42C60681
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B42C60681
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 803B683B85; Mon, 14 Nov 2022 22:25:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 21:25:54 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0446e276b4a105ff380bc89d756a07814783002d
X-Git-Newrev: b6bf83a79b08fe2fe029fcb203f5a91c456dd063
X-Patchwork-Hint: ignore
Message-Id: <20221114222534.803B683B85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zlib-ng: fix
 build without neon
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6bf83a79b08fe2fe029fcb203f5a91c456dd063
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure without NEON probably raised since bump
to version 1.9.9-b1 in commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14
and
https://github.com/zlib-ng/zlib-ng/commit/ec02ecf104e1d3f1836a908a359f20aa93494df5:

In file included from /home/autobuild/autobuild/instance-4/output-1/build/zlib-ng-2.0.6/arch/arm/adler32_neon.c:11:
/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8260762632cde9eb5bc2154084680b5bec034aa6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 88d2135a7ad7ed899ef1f2fec070407810f8055d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib-ng/zlib-ng.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 938acd4181..aa65d8437d 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -18,9 +18,15 @@ ZLIB_NG_CONF_OPTS += \
 	-DZLIB_COMPAT=1 \
 	-DZLIB_ENABLE_TESTS=OFF
 
-# Enable NEON and ACLE on ARM
+# Enable ACLE on ARM
 ifeq ($(BR2_arm),y)
-ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
+ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1
+endif
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
+ZLIB_NG_CONF_OPTS += -DWITH_NEON=ON
+else
+ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
 endif
 
 ifeq ($(BR2_powerpc_power8),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78420C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 14:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB8760888;
	Sun,  6 Nov 2022 14:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB8760888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWLohUgtG43M; Sun,  6 Nov 2022 14:09:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6152E607C0;
	Sun,  6 Nov 2022 14:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6152E607C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6CD1BF8C7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E2B404F8
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E2B404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWWJOUwwYycl for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 14:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A908404F5
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 14:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A908404F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3656788071; Sun,  6 Nov 2022 14:09:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 15:06:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de6820ab1bd2a695772adc7df44036baba62913a
X-Git-Newrev: 88d2135a7ad7ed899ef1f2fec070407810f8055d
X-Patchwork-Hint: ignore
Message-Id: <20221106140911.3656788071@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: fix build without neon
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

commit: https://git.buildroot.net/buildroot/commit/?id=88d2135a7ad7ed899ef1f2fec070407810f8055d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3A2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461BF41608;
	Tue, 11 Jan 2022 21:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuFU-IZgelhp; Tue, 11 Jan 2022 21:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E35C41606;
	Tue, 11 Jan 2022 21:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC2601BF20B
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9474415F9
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcmHfuFgJbeQ for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:59:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFE16415F7
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:59:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0FC89834E1; Tue, 11 Jan 2022 20:53:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:59:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7425450ba27ecd3dacf795e42bb70ef0c98684e8
X-Git-Newrev: 81945bde7c282d0ab5f304dc9795e2d68033cd98
X-Patchwork-Hint: ignore
Message-Id: <20220111205334.0FC89834E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptopp: disable neon if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=81945bde7c282d0ab5f304dc9795e2d68033cd98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

In file included from aria_simd.cpp:18:0:
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/lib/gcc/arm-none-linux-gnueabi/4.8.3/include/arm_neon.h:32:2: error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
 #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
  ^

Fixes:
 - http://autobuild.buildroot.org/results/e4fd947c118174a4fad62cbed18816f02d39ec25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptopp/cryptopp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 5e6eb9644d..4353e35e0a 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -47,6 +47,10 @@ ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
 CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
 endif
 
+ifneq ($(BR2_ARM_CPU_HAS_NEON),y)
+CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ARM_NEON
+endif
+
 CRYPTOPP_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	CXXFLAGS="$(CRYPTOPP_CXXFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

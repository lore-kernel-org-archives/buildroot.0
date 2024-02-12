Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A6CC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D756640753;
	Mon, 12 Feb 2024 22:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4levTHy2f0_L; Mon, 12 Feb 2024 22:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA6CA4079A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6CA4079A;
	Mon, 12 Feb 2024 22:03:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDDF81BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA88840609
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1pHlECKYVRX for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A51064012D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A51064012D
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:03:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80EB4878E1; Mon, 12 Feb 2024 22:03:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 23:02:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3404e90e7303a20e5d96a3fa2a29b197ea74847
X-Git-Newrev: 48c5053576334d9349180349e58240ea02753188
X-Patchwork-Hint: ignore
Message-Id: <20240212220300.80EB4878E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: disable neon with arm soft
 float
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48c5053576334d9349180349e58240ea02753188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable neon with soft float to fix the following build failure raised
at least since version 2.19.1:

In file included from build/include/botan/internal/simd_32.h:27,
                 from src/lib/block/aes/aes_vperm/aes_vperm.cpp:15:
/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/6b311e97484db2b0f8adbda140320d696713b1e0
 - http://autobuild.buildroot.org/results/c309940ea6db0845d8221fb51611d0254222c644

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index b933e99785..7c290f04ad 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -90,6 +90,10 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 BOTAN_CONF_OPTS += --disable-neon
 endif
 
+ifeq ($(BR2_SOFT_FLOAT),y)
+BOTAN_CONF_OPTS += --disable-neon
+endif
+
 define BOTAN_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure.py $(BOTAN_CONF_OPTS))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

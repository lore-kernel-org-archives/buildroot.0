Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ABAC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CE26FBB5;
	Tue, 21 Feb 2023 01:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72CE26FBB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn4Lhj-k5L3A; Tue, 21 Feb 2023 01:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79C867010A;
	Tue, 21 Feb 2023 01:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79C867010A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4AC21BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 002556FFFA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 002556FFFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnN7bsQYJrDt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C34D26FC2E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34D26FC2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B444B828C8; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:37:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 40866ae0ce6e71d01a132dfb7694daa2ec559184
X-Git-Newrev: 36b8c9494b56b877fea62f17926f747c7c7bfb8d
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.B444B828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wolfssl: disable
 broken asm implementations on 32-bit Arm
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

commit: https://git.buildroot.net/buildroot/commit/?id=36b8c9494b56b877fea62f17926f747c7c7bfb8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

wolfSSL has ARMv8-A assembly implementations of some functions for
both A64 and A32 ISAs.  However, some of the A32 versions use r11,
which is usually not allowed:

wolfcrypt/src/port/arm/armv8-aes.c: In function 'wc_AesCbcEncrypt':
wolfcrypt/src/port/arm/armv8-aes.c:3303:5: error: fp cannot be used in 'asm' here
 3303 |     }
      |     ^

That can be fixed by adding the compiler flag -fomit-frame-pointer,
but then there is another failure:

/tmp/ccV19DQV.s: Assembler messages:
/tmp/ccV19DQV.s:248: Error: first transfer register must be even -- `ldrd r11,r10,[r14,#4*14]'
make[3]: *** [Makefile:5858: wolfcrypt/src/port/arm/src_libwolfssl_la-armv8-chacha.lo] Error 1

This is definitely not a valid instruction in A32, which suggests that
this code isn't being tested at all upstream.  So disable it here.

Fixes:

  http://autobuild.buildroot.net/results/502/502a2b217845eb290c1961d4740b032462f8ae53/

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index cd3acd9411..f415e11bb5 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -33,14 +33,12 @@ WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
 # enable ARMv8 hardware acceleration
-ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+ifeq ($(BR2_aarch64),y)
 WOLFSSL_CONF_OPTS += --enable-armasm
 # the flag -mstrict-align is needed to prevent build errors caused by
 # some inline assembly in parts of the AES structure using the "m"
 # constraint
-ifeq ($(BR2_aarch64),y)
 WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"
-endif
 else
 WOLFSSL_CONF_OPTS += --disable-armasm
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

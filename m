Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB1AC04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 12:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7BE7832FF;
	Sun, 25 Sep 2022 12:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7BE7832FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fYKKCOTXb_SG; Sun, 25 Sep 2022 12:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7F481A6F;
	Sun, 25 Sep 2022 12:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA7F481A6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA641BF5A1
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65E6A40445
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E6A40445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id milW1PBzdIPP for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 12:06:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40DBC4038E
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 12:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40DBC4038E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CEC685FD5; Sun, 25 Sep 2022 12:06:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 14:06:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1facb09b94bf806b301868539185c0ff9ddffee2
X-Git-Newrev: 6211c9e38112c611b61f00787fd790a8612328a1
X-Patchwork-Hint: ignore
Message-Id: <20220925120630.2CEC685FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.arm: drop support for
 iwmmxt architecture variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=6211c9e38112c611b61f00787fd790a8612328a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This architecture variant is broken in GCC, causing build failures:

../../../libgcc/config/arm/unwind-arm.c:467:1: error: unrecognizable insn:
  467 | }
      | ^
(insn 2 4 3 2 (set (reg/v/f:SI 118 [ p ])
        (reg:SI 0 r0 [ p ])) "../../../libgcc/config/arm/unwind-arm.c":456:1 -1
     (nil))
during RTL pass: vregs
../../../libgcc/config/arm/unwind-arm.c:467:1: internal compiler error: in extract_insn, at recog.c:2770

Reported to the GCC developers, the feedback was "iwmmxt support is
definitely bitrotten and most likely should be removed from GCC.".

See:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106972#c1

So this commit simply drops support for iwmmxt, which anyway is
probably barely used nowadays: it's for old Marvell PXA cores that
implemented a special SIMD instruction set. The BR2_xscale option can
be used instead, it's just that it won't use this SIMD instruction
set.

Fixes:

  http://autobuild.buildroot.net/results/8e4c4512902c34d8ec0c6f8dfff92b7a198e4b4a/

and the numerous other build failures at:

  http://autobuild.buildroot.net/?reason=host-gcc-initial%&subarch=iwmmxt

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy         | 10 ++++++++++
 arch/Config.in.arm       |  5 -----
 package/pixman/pixman.mk |  9 ++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5f7274e84b..5892dfd44f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_iwmmxt
+	bool "ARM iwmmxt variant removed"
+	select BR2_LEGACY
+	help
+	  Support for the ARM iwmmxt architecture variant in GCC has
+	  bitroten and is no longer maintained. GCC maintainers
+	  recommend to no longer use it, and suggest to use "xscale"
+	  as a replacement architecture variant. See
+	  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106972
+
 config BR2_PACKAGE_GPSD_OLDSTYLE
 	bool "gpsd oldstyle removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c391d6c72b..78621e321c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -129,10 +129,6 @@ config BR2_arm926t
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
-config BR2_iwmmxt
-	bool "iwmmxt"
-	select BR2_ARM_CPU_HAS_ARM
-	select BR2_ARM_CPU_ARMV5
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
@@ -817,7 +813,6 @@ config BR2_GCC_TARGET_CPU
 	default "strongarm"	if BR2_strongarm
 	# armv5
 	default "arm926ej-s"	if BR2_arm926t
-	default "iwmmxt"	if BR2_iwmmxt
 	default "xscale"	if BR2_xscale
 	# armv6
 	default "arm1136j-s"	if BR2_arm1136j_s
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 64302fa49a..3f65f0484d 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -21,7 +21,8 @@ PIXMAN_AUTORECONF = YES
 # don't build gtk based demos
 PIXMAN_CONF_OPTS = \
 	--disable-gtk \
-	--disable-loongson-mmi
+	--disable-loongson-mmi \
+	--disable-arm-iwmmxt
 
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
@@ -40,12 +41,6 @@ else
 PIXMAN_CONF_OPTS += --disable-arm-neon
 endif
 
-# disable iwmmxt support for CPU's that don't have
-# this feature
-ifneq ($(BR2_iwmmxt),y)
-PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
-endif
-
 PIXMAN_CFLAGS = $(TARGET_CFLAGS)
 
 # toolchain gets confused about TLS access through GOT (PIC), so disable TLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

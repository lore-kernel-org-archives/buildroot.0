Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934CEC4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 21:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1400681F26;
	Fri, 11 Nov 2022 21:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1400681F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLADA0qcKudG; Fri, 11 Nov 2022 21:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37CC081F0F;
	Fri, 11 Nov 2022 21:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CC081F0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBF9D1BF966
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 21:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF54C40169
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 21:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF54C40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfJOLQndCIcS for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 21:58:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B25F400B8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B25F400B8
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 21:58:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id F249620005;
 Fri, 11 Nov 2022 21:58:02 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Fri, 11 Nov 2022 22:57:58 +0100
Message-Id: <20221111215759.358116-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668203883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ejLuZ7KIchcQbpOLkvTvn9ABL+Ek2Wz+8dCnofPhb5w=;
 b=nweWQxD1ItqE/UzRCVBvDeYXu9t/FLDRMzM1QnpP4fe0oJCzLUYEUdkxW7xCve0LSg2u3d
 ZOee/RMKcHZjER4eSLVOiBNUy2iCwd+iGoh2a4kZypBPXQrpJRxxzC5VY0PIiGFhdf/Ol9
 nFXHd6n5qmyLLWW9+gON4MXgd05AWLKQWZcSrAdq4b0+I8quYYe6//hPtsbIP6Y2y0Kirx
 OI6/kW67ahWWQFClmEcFAr0sAbkL2DhnTCUID+7diqr/o/RuGOrKXStHZe9ZfdNreZ9E1t
 Avb4UVAPLnjBu3mj4L4UT62qPHf5fWH1a+tPXhmdsXUIUAyUzhB2jHhMJFthVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nweWQxD1
Subject: [Buildroot] [PATCH 1/2] arch/arch.mk.xtensa: relax check on overlay
 file to apply only to internal toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4cbf7336914f25478aea943456ba7dc3c892c21a ("arch/xtensa: custom
configuration requires an overlay") added a check in
arch/arch.mk.xtensa to bail out if a custom Xtensa core is selected
but not overlay file is provided. While this is indeed a perfectly
valid check to make when building an internal toolchain, with an
external toolchain it's entirely possible to build with no overlay
file: the toolchain already exists, and there's no overlay to be
applied in the context of the Buildroot build.

And indeed commit 4cbf7336914f25478aea943456ba7dc3c892c21a broke some
of the runtime test cases that use a custom Xtensa core configuration,
with no overlay, to test the toolchains.bootlin.com Xtensa external
toolchain. By relaxing the check to only apply to internal toolchain
configurations, we fix those test cases.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261966
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261963

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/arch.mk.xtensa | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 7b6c59cecd..75145e725f 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -1,6 +1,6 @@
 BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 
-ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
+ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM)$(BR2_TOOLCHAIN_BUILDROOT):$(BR_ARCH_XTENSA_OVERLAY_FILE),yyy:)
 $(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
 endif
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

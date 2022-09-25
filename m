Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24DC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD9641813;
	Sun, 25 Sep 2022 09:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD9641813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnnhGlYA9Xy9; Sun, 25 Sep 2022 09:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB3E7417C3;
	Sun, 25 Sep 2022 09:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3E7417C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ADDE1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24411408A6
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24411408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3L1Mi8QpM3SR for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:09:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB76141756
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB76141756
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:09:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id CE82D1BF209;
 Sun, 25 Sep 2022 09:09:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 11:09:17 +0200
Message-Id: <20220925090920.1585682-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664096965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImiCOXA9DxDGDGj8+XIqGbeUomjA+fqgOTLcNzu5KHk=;
 b=mej+TwwkN9EJC7tm0xeIdpf/QqjButnaV7o1mKkMzt/VpHqOco+vc+kn1Jeuh/S3VTjYsZ
 fZvC86oFrTM5Cf9a4OAN71c2pkGfqzTaiUf3BEO/UA3JHWHdEawAZA26g7IhQJ/Xq/ywBY
 fyLahjbShaxm1/WkcjazG6OTrQvPUPh+fY6p1ERbw2kebwwzkKL9YrWqhCTleMf31sBwu7
 9XHDf6sRdzK3leSay/7fWAdZ3ZY5OV4cocMPFLw0Q9aDpOBrNBa/MBU+HYDaJtUp3CbEyu
 mOptz8Zkjm/a1VcVa69s/iPO86RuUbkp54x2fgQwdL7zQo11lwxMu99iCJ9pPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mej+Twwk
Subject: [Buildroot] [PATCH v2 2/5] Revert "arch/xtensa: custom
 configuration requires an overlay"
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 4cbf7336914f25478aea943456ba7dc3c892c21a.

This commit breaks the build of BR2_XTENSA_CUSTOM=y configurations
that use an external toolchain. In such configurations, having an
empty overlay is perfectly fine. For example, this commit broke the
following two runtime tests:

  tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge
  tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinXtensalx60UclibcStable

And in fact, having an empty overlay is even correct when building an
internal toolchain. The endianness issue that
4cbf7336914f25478aea943456ba7dc3c892c21a was attempting to fix has
been fixed in a better way by the previous commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/arch.mk.xtensa | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 7b6c59cecd..fd410f6bfa 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -1,9 +1,3 @@
-BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
-
-ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
-$(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
-endif
-
 ################################################################################
 # This variable can be used by packages that need to extract the overlay.
 #
@@ -15,6 +9,7 @@ endif
 #       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
 #   endif
 ################################################################################
+BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
 ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
 ARCH_XTENSA_OVERLAY_FILE = $($(PKG)_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC5FC07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EDAF4013A;
	Sat, 24 Sep 2022 20:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EDAF4013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfqiwaNC1MPH; Sat, 24 Sep 2022 20:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDCD640136;
	Sat, 24 Sep 2022 20:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDCD640136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 335FE1BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C70E81441
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C70E81441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59iGz359WB0Z for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 20:53:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08706813F2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08706813F2
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 20:53:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 087D6E0003;
 Sat, 24 Sep 2022 20:53:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>, Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 24 Sep 2022 22:53:24 +0200
Message-Id: <20220924205327.1489102-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
References: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664052823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImiCOXA9DxDGDGj8+XIqGbeUomjA+fqgOTLcNzu5KHk=;
 b=OBJx1neBLmI7cF7u9Oc38ITSv7Ty5s83Ipo3b8xAzFRNjgF4lbPcX3aEThp1yHI46Mb+aH
 2ixQpZWWas3kPsaorO5+kW5YlLMSWzFF14alLXEzUJjjF0UoGl+Hkld83FpSZb340jdd6l
 t9mFgQq8Atknr5Wy+hCdCBcjFGe2I1Qs4vOqTMUFBHjJUI9VCYEe3sYsBWoTGwYJBpB6F0
 0cHQ+faIMVieFlof638vXlZNvyL7eAS8hbB0Zt0asoKyieWewfS7f9nFzwb6hbH8eQwtWm
 DjH0NFI/vPphcr2o/jU+3lu6eJZd/BNOnCtBN4ZcvzR8TVflgCUYZ+cfUmCeqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OBJx1neB
Subject: [Buildroot] [PATCH 2/4] Revert "arch/xtensa: custom configuration
 requires an overlay"
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

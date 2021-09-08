Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E42AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CECF610FF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CECF610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3CD8613F0;
	Wed,  8 Sep 2021 21:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q34yXPo-ij3y; Wed,  8 Sep 2021 21:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C0B3613EE;
	Wed,  8 Sep 2021 21:57:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 446361BF427
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DE8E4048E
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kel_q5WpZOS4 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 21:57:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id D11E340466
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 21:57:42 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id O5ZdmROeHKBZzO5ZdmXW9I; Wed, 08 Sep 2021 23:57:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631138261; bh=L50neXgB1hnfaxvjmo7n7aSp9ALWiMmYrssUO/YXQ/g=;
 h=From:To:Subject:Date:MIME-Version;
 b=OyPdn2+99Tdk6MxBvHlRPE3b9P4KnrLTRwSY/KHMi2ZDFPEB41INum82R9JeAsSGE
 GN3hpsub/nDkwCq1BaVHiFJMkLQdlPQcYqFX6bMM6gZ7bYWXDK8WGR5KmK9u6d4YDC
 RyDbMgFBnBujY342vPgl1lA6EjCfN3sd1sHtc/FDqEpiauzpANHAhLKEPJBMnY+9qs
 OUar33sr79Qru1MIsJSC8TwtDhtqu+QRZt3BlE0BupA7PJbAZLCcdoMUukFsXRrguj
 taen/CvJvQUOsqxuZsj9LMqgkgC+izPE3bE4+bBksOAWMqONXPsezsOapg85N2gdjD
 MxosR8/cw1/zQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 23:57:40 +0200
Message-Id: <20210908215740.1569088-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBYZUdit4CEyLKe1XeNNQ9hm2IIbtV0Xbf71MCwHdeBoQS6EkkhW3M5QqguMR3/17M/BfbkZknLsmLJJ5N4KoAJFPOpTWsFnrhBLoAI4IUvOJyHHjyFs
 6Ab0WwCDInhq+1TKA1Q/ZzTFC2EpWm/IRu7O02ps+4os8TCiUJ6INDzAAbsKg/uEqregjAmZk9WtKdg8TSAENrGvXJ8pRCwbLRdhUXZVmq8z0Mq+FpUqfLxm
 UPM8ryaKtrfX62+DANGUsPUphRb8XmTlF+ciARyrhxw=
Subject: [Buildroot] [PATCH] package/harfbuzz: work around arc gcc10 bug
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

With BR2_GCC_VERSION_ARC=y(arc gcc10) harfbuzz package exhibits a gcc bug
that makes build to fail. This bug is found only in official arc gcc10
provided by Synopsis, so we can't use the BR2_TOOLCHAIN_HAS_GCC_BUG_
approach since bug can't be even filed in gcc bugzilla.
To work around this, if BR2_GCC_VERSION_ARC=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/e4d/e4da9ba40c8f4567601d404e20dd6a0b322210c2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index ccb0d940d1..bcf5bfb5af 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -94,5 +94,9 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
 endif
 
+ifeq ($(BR2_GCC_VERSION_ARC),y)
+HARFBUZZ_CXXFLAGS += -O0
+endif
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

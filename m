Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B8BC43334
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53FDF840BB;
	Thu, 30 Jun 2022 22:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53FDF840BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaogqfMPUjO7; Thu, 30 Jun 2022 22:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B93F84081;
	Thu, 30 Jun 2022 22:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B93F84081
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C37B91BF27C
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABA6A40B43
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA6A40B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMduEgDzPRdz for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 22:18:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B07E4402F7
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B07E4402F7
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 22:18:09 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o4so567644wrh.3
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 15:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7KIMy12LxLrIzFH/10tuvcc+LJXis0ePvY4MFCw4HQ=;
 b=rLHuDZqKDN4aS5uJ/li8+FXFDm5hjveX7Eq4iamxaZWywnafkSSaOQOgiSW3WFlwxy
 lsGZbf24evoYH92BzoBWbAwLevO0X+THRo0MepIaSjlrP7uTJarUGTABw4U36mqLERXW
 VNqybElpoU0Q1xd9Ahyz4eK4w8nCwwmXSVsuj+nv3z1l5DoqkNtxi+StnYb1i0/jLqo4
 i2W3kVnJjyVO5Qns4Y9jEAHm5UZZSH6VrG+OmuRYIlaXrZYMYNnE4the1dWiE5ZIHdJE
 74xQi7Zg1GEyxLeIZuNddCPyyMYmxoaAsZ+OdvrXRlOfOfYAfHmqDENlmGBjt2Yjwad1
 JLAg==
X-Gm-Message-State: AJIora9Q56rCXlUtbbufqd6MIv9ho7r0PnIPJhZIimzkdYdqBUzrUoE7
 AJeqSR77weRzcrHpwINUa90ieKiv2bY=
X-Google-Smtp-Source: AGRyM1tqaZVk9J4CaeDq3E+WYQez/ebplL9eUnMPcGhpke0atr71gUBJlv3b7gjPsE7FRnuTL8TsvQ==
X-Received: by 2002:adf:e8c7:0:b0:21d:1c7a:a45f with SMTP id
 k7-20020adfe8c7000000b0021d1c7aa45fmr10532844wrn.168.1656627487784; 
 Thu, 30 Jun 2022 15:18:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 190-20020a1c19c7000000b003a04912351fsm8410886wmz.17.2022.06.30.15.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 15:18:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Jul 2022 00:15:17 +0200
Message-Id: <20220630221517.801556-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7KIMy12LxLrIzFH/10tuvcc+LJXis0ePvY4MFCw4HQ=;
 b=pH4AAU7r/G3AlzzDQ85CR1npgsKhwkeRTMG/ErduJULdZgjC34/bfeikRAosOOVYf5
 g7VBdF5NB3x/XbcCg133NnFDLbom5qiMqQ7JwxioLWPp3HfO5pyrHbBBMHynrbpFD7LI
 Kt0iWuN+6e4BfqggohlnHxpKLVn3EvYzYXsuyCDPuNO7X4C1+Bsp4Kzgqk/PxLkoVpgl
 zvN5Y/M5vO6Aki90KSKpT2eYtoNQ/gmHmthhEqmubujDiAneEusaG9osV6gdqvBtP4ME
 HiaBWDvTqBUi4EROB4wg7TI5eZVGw/ibet/PdCIKymWxGJ8r34KDw5sLZD/wj01gzXIK
 3R8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pH4AAU7r
Subject: [Buildroot] [PATCH 1/1] package/inih: bump to version 55
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/benhoyt/inih/releases/tag/r54
https://github.com/benhoyt/inih/releases/tag/r55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index 21234e156d..af921b294d 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01b0366fdfdf6363efc070c2f856f1afa33e7a6546548bada5456ad94a516241  inih-53.tar.gz
+sha256  ba55f8ae2a8caf0653f30f48567241e14ea916acfc13481f502d8a9c8f507f68  inih-55.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index dec9465121..7f36175576 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 53
+INIH_VERSION = 55
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

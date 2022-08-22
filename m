Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F9DC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 18:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F90825B9;
	Mon, 22 Aug 2022 18:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77F90825B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e34JafGA9dXz; Mon, 22 Aug 2022 18:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA2D80B6B;
	Mon, 22 Aug 2022 18:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA2D80B6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FD341BF3E8
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E6C80B6B
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E6C80B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8a_TLNBIe2g for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 18:26:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8DB80B1D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A8DB80B1D
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 18:26:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso6484337wmb.2
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 11:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=RB1W3s+bNRjbwQETWL7vW1olUCzNPGJaEq7oJI10ESU=;
 b=LRYhhcZdj80UxexDHlMIs7/WFOdk+xy8Q5K7ikxMOjLvCriaaSTRd/3Un8e0WtSbme
 ui6GNrnU3ncrQBhD5lJk0kki13lSPk3JWJublQI9WjRO4Yux5+cHxF1IQ28Rr4rKkr/J
 4frbMlpW9QL6vLsaUViRONzdr/gbs+7XWQBwq2NSBWrHnpe1xIMDT6jZd7lJGU2/Kxs+
 2IN1u99bfW7aDpII63HXLEGd1yINqNAuXqDh61zC4vZXYtt7kwFlmyfbTaeCcE/H8UZP
 /UKFYtZ3oMXzLLfigNRPCVUrOersX0+qMKWfgbF7gcuhADy7fKkj0CtP3rpfoknYZxYq
 k7cg==
X-Gm-Message-State: ACgBeo2LN1B3WWWX71mxngrvClvrMpiRLQo1X+N4BDcZeOOxQdSs725s
 4LZlvuiej3hqgK9RsdxOd6pHNpu+r9I=
X-Google-Smtp-Source: AA6agR7HK3sEmvHRbkQCN9c52XYFew5JOyd5je0vKhB4rdjZRRMb5zXNOvXNZ6dxRcterCrpNf7WDA==
X-Received: by 2002:a05:600c:22c8:b0:3a5:c134:1f50 with SMTP id
 8-20020a05600c22c800b003a5c1341f50mr16604121wmg.55.1661192795340; 
 Mon, 22 Aug 2022 11:26:35 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b003a4c6e67f01sm21822163wmq.6.2022.08.22.11.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:26:30 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 22 Aug 2022 20:26:20 +0200
Message-Id: <20220822182621.1691304-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=RB1W3s+bNRjbwQETWL7vW1olUCzNPGJaEq7oJI10ESU=;
 b=E6Uqaz4HlKNxzfHtjCD1sms9ZLNYZUYa4xZ3vLQ+J+Pg2AdhyHa0s7cgc2snbTLhiW
 DPiA/a0reyW/9E+EFsTgX5B6i3/h7p95hcYvIy8qUBeTJxWQLRJr4uPgyYv2CDsP3fB1
 8+jyvgKUVbakbZyVnGYYCfVepSEQicC3+HM2Z29wF0BVJiwMOXwC7cinHhFxnIeseYTM
 L3iHwo5NqMkyl6ZkujMU66tCejjc1403HPFqlOj3+gxqXQxcxN/+wA6DpqJbpsIKloS+
 75xu1TZbIkgNjsgdf8fO97Sc7vws15h9i2grrLkwe2ayBWMZ5cAeefKOoizflRdUuE8c
 dHow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E6Uqaz4H
Subject: [Buildroot] [PATCH] package/ethtool: bump to version 5.19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 052a87d97..8a649876d 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  9577b2ffbce710b659fb239598ec92bced1ca400ca0f1286762bfa44e4784270  ethtool-5.18.tar.xz
+sha256  3b752a3329827907ac3812f2831dfecf51c8c41c55d2d69cfb9c53ca06449fc6  ethtool-5.19.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 9fd4c31c7..32bd5e7db 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.18
+ETHTOOL_VERSION = 5.19
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

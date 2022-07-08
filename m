Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539DEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 05:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DBC84662;
	Fri,  8 Jul 2022 05:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1DBC84662
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZdWOeRYKGr0; Fri,  8 Jul 2022 05:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE30C8465F;
	Fri,  8 Jul 2022 05:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE30C8465F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 614171BF44C
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6BA8465F
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6BA8465F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFpZy5Y_cWuq for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 05:50:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5AF8465B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B5AF8465B
 for <buildroot@busybox.net>; Fri,  8 Jul 2022 05:50:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d16so22738912wrv.10
 for <buildroot@busybox.net>; Thu, 07 Jul 2022 22:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdyaQb75cYDvCXpr5K+i15HRluf87R86oB8EwjW6ZOA=;
 b=Q6H9DUkWQx6yVBjMkg4dNYHrWOL5PTScjIBhgM9HN1Mdel88gQMj+6lrEVia0yJ7Qx
 lWuGbtPp60/ytNhRX9+yHoroC7/OB/OYWlldOQhz4RZclCIh2x9w3AnjTnbRE2Lnwd2y
 hJGKvAY6X2RYCx+KMFfOMV0/vZNz62PYeD5LqXrq01cHz0eb0Va7u1qAdCuLJ8fNxnny
 A/RvCkQkTn20ACJN/XPgmDYmldeLKgBS12CvrvcAqbrJrZs5QKeSxLJ+s+y3pHP8mx6v
 suyMObeeVGCYtLHbrA/FcxOd8gcXj1buvj09eBfHspcfdeHYR3tVxKGi//hwoBtwPRp0
 iAQg==
X-Gm-Message-State: AJIora+p+xc/ivxCEHIgq4uAqVon6qutSQ8J9sW7Y7aOZZIRzinYT8vF
 c5P8oPI3wtcor8RiHzfm9uQybmXXyOk=
X-Google-Smtp-Source: AGRyM1sTlYaFKGHdJFwi4K/jcaN1rn0ZI/fTz5jOk5+LbQCNmFQG+QO/0qxFqZZ/nWGRbQ/FYbKl5g==
X-Received: by 2002:adf:e0c9:0:b0:21b:8271:2348 with SMTP id
 m9-20020adfe0c9000000b0021b82712348mr1407200wri.222.1657259399443; 
 Thu, 07 Jul 2022 22:49:59 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c190900b0039db31f6372sm1058683wmq.2.2022.07.07.22.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 22:49:59 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Jul 2022 07:49:56 +0200
Message-Id: <20220708054956.2613095-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdyaQb75cYDvCXpr5K+i15HRluf87R86oB8EwjW6ZOA=;
 b=aUZCbpqhjGmY2apMaoNGGmn0NA17PXNhSXR/akTSXWnIKAWdGr1mm3oEkZCaoCFFsL
 ykqGQ0mxMphcLmq8OE8b8W5SkPIaI9odhl6t3SskhvJOKUnWJEvDuZzXqeFYv3ADg69d
 WsbB9lp29sehY+I74ohFQb/eeby6cBYH57H9YNlcPkb7F1u/G6q55RjYea8fIYO0Ysek
 4c8b/vRdfYpMOqT5Sp5SPFNehQepXtjbjL9bPjn8NtL0N1L5hZ0ZrOSC/VU81240S9bF
 t9WrJZBdsyRUHhWX/zsHcejov29qzcd96GxdWYoaK1Zmfe3eIFz3vIRddn/U2PT+QNu6
 A2qQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aUZCbpqh
Subject: [Buildroot] [PATCH] package/ethtool: bump to version 5.18
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
index f317a1fb1..052a87d97 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  64ab914b9c6b45047245d91f40b8760b2728992a9e5af22717c644238e889133  ethtool-5.17.tar.xz
+sha256  9577b2ffbce710b659fb239598ec92bced1ca400ca0f1286762bfa44e4784270  ethtool-5.18.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 10f0c802a..9fd4c31c7 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.17
+ETHTOOL_VERSION = 5.18
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

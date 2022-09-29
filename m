Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E0AC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 23:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAAF84112C;
	Thu, 29 Sep 2022 23:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAAF84112C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7Kjm3zbybN0; Thu, 29 Sep 2022 23:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC6E64016C;
	Thu, 29 Sep 2022 23:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC6E64016C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1431BF289
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 23:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9A2C8406D
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 23:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A2C8406D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6-2sxnM9wNV for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 23:34:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22ADC8403D
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22ADC8403D
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 23:34:48 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id s18so1472972ilj.5
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 16:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=t3uiusTfB5Zuxwmew3ZGHderYi3q2WrhJondZE2BtvE=;
 b=noyPLZL6bpO3Lk39G8SHZUVsByxoN1zkGUltTKU2qY5WnU3P5GuUfF0sEyCv0qNlV/
 YG04g1KbgXBIGVdPVgNQcU8RpplNMjGEw6w6eMAz4N/VW7Efv3x6upS5ih+9eMUXx/iJ
 CjGbupHMCk7iqtOUJKQ3PHWhZb3GixfcRsN9vH7GjfYde6RfqOLrSW++jG/2QTRhsNwP
 PmYI2FlRWSYvyvllThobDERcRF7vY1pGzuBaHZbyuHNEx10B4M4MAUe2CFJgQAYea03K
 4ibyzgOdsQ5GTtotpsUst/lFSXhZ3Q25JIqEBqI+SAcIH8CAzkc/BL03Gcq+d8RkRa5Y
 ymFQ==
X-Gm-Message-State: ACrzQf3+JotHMTNeNdGi9sY4Lf5AwRFSKY6qeS+nwEhQ6rKwpP0jdoos
 nuiDIsEhfm1XpME2DYp1+oVBsSlKGZHQfA==
X-Google-Smtp-Source: AMsMyM7eyUbYzboPg1i+epZQ8owr9eY7+0UY95ZZjdJUYZqoaC0c6yDrtfGj21iPEezE6CR+GVzTkw==
X-Received: by 2002:a05:6e02:6d1:b0:2f9:3901:933f with SMTP id
 p17-20020a056e0206d100b002f93901933fmr2099702ils.64.1664494486680; 
 Thu, 29 Sep 2022 16:34:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056e020f4500b002f1d7850037sm384472ilj.44.2022.09.29.16.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 16:34:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 17:34:43 -0600
Message-Id: <20220929233443.3353813-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=t3uiusTfB5Zuxwmew3ZGHderYi3q2WrhJondZE2BtvE=;
 b=p2pqp9C5pQcqyfHFNVyx4p/icpWnRDSZZsJtAFUaFwYsLwkhbORLCem041sgUgOHF8
 llJvpNFfCyKiwyFm50xcWSexacaVm+5a2KkfqQdvNRtW5U10q0gXtugJiPpMfkNlsXN5
 4n++7KvWuXhCEe88+OmUzqaTDcfEVTaR8GeNv7P7c4ou3en1f2DCdhEW6sy41pPc0AyU
 J7ed+0v2oQehJ3aWjXXHdt3nYkgaKSvzqLIa9KmEkI1QxDme6RZGOvE+Khml50yiuluO
 71LBtkY8T0etegt7z9RPgQ+R+7HYI0CSiVhvjtWIw1UEvpJT4Ft2bwWmA2Y9pxFz1onN
 Fyfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p2pqp9C5
Subject: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 1.0.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libbpf/libbpf.hash | 2 +-
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 23908ded7c..4305872d9f 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f4480242651a93c101ece320030f6b2b9b437f622f807719c13cb32569a6d65a  libbpf-0.8.0.tar.gz
+sha256  3d6afde67682c909e341bf194678a8969f17628705af25f900d5f68bd299cb03  libbpf-1.0.1.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 987d1145f1..820f1dc4bf 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 0.8.0
+LIBBPF_VERSION = 1.0.1
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

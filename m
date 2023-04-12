Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC4DC77B6C
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 22:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB54783CD4;
	Wed, 12 Apr 2023 22:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB54783CD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kezoj29bTrHe; Wed, 12 Apr 2023 22:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96A681FA8;
	Wed, 12 Apr 2023 22:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96A681FA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204B31C3D11
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE0E283C7B
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE0E283C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cf3JW1pcYzNx for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 22:26:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0989B81F96
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0989B81F96
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 22:26:07 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id lh8so20124plb.1
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 15:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681338367; x=1683930367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDh7f1dx6f0AAT9+pGd5dZQgCU2p4drIAYRn7oWZzeU=;
 b=gqHl3gkO8SxIyjG/XjJhsVLqNguspV59y9N39b9AEMgXWBYauF5TEnP2/xbs/TT/a+
 yg1U4e9HKsd3bEOgkOLKK0GMLYWnMBqB+HyQeaRNpK5JTJXp0TMyw/49MtxIrL0aGdBa
 S6lnwVavpIQT1N1LXfS7Ao/ByY5x+q4vlUR8VVouOwzFD/lqReUL6yWscVCumGZhy0TF
 aBIzQafMo+PpbSyDIRdbw8KvQhbWjOoYJb5iFMFk6RDqS1ug6zlXQ8mWpnjxsVA7KjQN
 Rr38tqwtUFcVP5bjwnyZ7ZmJr9a3VCHFZuWLpd0IuBX70yrvhIAPmYvD9G77eFPYCM9G
 3Mbg==
X-Gm-Message-State: AAQBX9fVmuJnzcsB6TKcaHyWBiL21MlK5SPJ+KjOzcBODJjbUms3mYFl
 y3GagQO1n19HALhhtId0sdG8IaaXD815RQ==
X-Google-Smtp-Source: AKy350Zo8zOxm4lzyw5ipo/3o4SNf66aTppv2+AOb3D/x45ZIUTx/Amf5dVinRpwmhzBOZL8dittUA==
X-Received: by 2002:a17:90b:4a8e:b0:23d:4e9d:2eb0 with SMTP id
 lp14-20020a17090b4a8e00b0023d4e9d2eb0mr21010391pjb.36.1681338367007; 
 Wed, 12 Apr 2023 15:26:07 -0700 (PDT)
Received: from adam-laptop.hsd1.wa.comcast.net ([2601:603:2180:ebe0::a8d0])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a17090ade9200b00246cf1a8d3dsm58155pjv.17.2023.04.12.15.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 15:26:06 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Apr 2023 15:26:01 -0700
Message-Id: <20230412222602.1975782-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412222602.1975782-1-aduskett@gmail.com>
References: <20230412222602.1975782-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681338367; x=1683930367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDh7f1dx6f0AAT9+pGd5dZQgCU2p4drIAYRn7oWZzeU=;
 b=XIyQVmN0lrvgIc7RTfcZxuRbpkEkL3LMzFnAxNn+qE1Bh7e7wvc9XznNR1gFcceEje
 MX98AQ7zOl89wfQuWoq9uSEh/nVrcCZNqXoLzH7dRf02cM8fIuPtnkIQ/KyKR2u4Dst8
 KpuezSNKqJ51UhM7HfKOhZQDhSgHuGLg0vLilo3D6K0I2B41cx0mve/VKRIStQV/K01S
 gizFjaN4rF5NPthwASvlvCXOY0OHKXAyWWAGR6O9OmrFd3oCUycyxdZgf0cwRmYXSxvc
 hSTCpdIsv9rNzhgBJDy4m7MmwxiA8KKIJlqW5Iy/mzWdSay2xAHRbIZFsExGWJThs1kE
 jIPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XIyQVmN0
Subject: [Buildroot] [PATCH 2/3] package/nftables: bump to version 1.0.7
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Other changes:
  - Switch to tar.xz as the package is not distributed as a .bz2 any longer.
  - Update the sha256sum of the license file, as it has been updated to
    include the following text:
    "Original author of nftables distributed the code under the terms of the
     GPL version 2 *only*. New code though is moving to GPL version 2 or any
     later which is the preferred license for this project these days."
    The author has also changed from Patrick McHardy <kaber@trash.net> to
    Pablo Neira Ayuso <pablo@netfilter.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nftables/nftables.hash | 4 ++--
 package/nftables/nftables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 5e5134b61d..7e1e856229 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  8d1b4b18393af43698d10baa25d2b9b6397969beecac7816c35dd0714e4de50a  nftables-1.0.5.tar.bz2
-sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
+sha256  c12ac941fff9adaedf17367d5ce213789b98a0d314277bc22b3d71e10891f412  nftables-1.0.7.tar.xz
+sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9d60736d7f..b0a14bd429 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.5
-NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
+NFTABLES_VERSION = 1.0.7
+NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

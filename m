Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1640C7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 05:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD8B417E3;
	Mon,  5 Jun 2023 05:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD8B417E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlBAY5kJ1ptt; Mon,  5 Jun 2023 05:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1BA417DA;
	Mon,  5 Jun 2023 05:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C1BA417DA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF3E81BF289
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 05:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80969417DA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 05:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80969417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nweVAnNx2y5a for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 05:47:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0CD417CA
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E0CD417CA
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 05:47:49 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b1c5a6129eso12262791fa.2
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 22:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685944067; x=1688536067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMd0+omubH1UHlfNRr++Yi8PizVxGRy0LsnQpG+EVB4=;
 b=IHmO+vallZVuoZevFpb16dlLqPGELp77Is8zPvSBFp4X74HJIrhDw9UTLal3oTigD4
 vsr57vwITX13CGJvcs82w0/p6TT81/fV4CsTXC8xkE9dB36LFuCVZCG+h6uRl79JIMdW
 TtSb857PAV0+zGFWtuEFYzd+VTO5Wcig828LKCLeeQ+fi9SUG/vGK4WcrCSblU4vmYzn
 dLrD8Wql+MOg545eGaNaUPuWcjjVBgo1bozf4bHNnfh6I4IABRynqSCAH1pq6isktdiW
 Xw4UUCJ/svnKbCrw7mPpiDEFEcIIhKamzomAkWBYqdws30v+jzGA4t0NUGME9c8alXS7
 NjfQ==
X-Gm-Message-State: AC+VfDyUbjbw3G8lIc3KC6G35kPc1oDvJRS8KeBsYOR+kc5K7Kaatr0k
 uCpvaUGaG618EAQ2p5O20fLiTiHNECQ=
X-Google-Smtp-Source: ACHHUZ4MGgv8hSO+YmcLFE8o4XKci4nFsK9iMsN3WWMrHcgXSRqXMth3uJGhDVrz4pS0/kCOPiprAg==
X-Received: by 2002:a2e:240f:0:b0:2b1:c751:e570 with SMTP id
 k15-20020a2e240f000000b002b1c751e570mr1347711ljk.16.1685944066553; 
 Sun, 04 Jun 2023 22:47:46 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 k9-20020a2e9209000000b002ac833114besm1298702ljg.47.2023.06.04.22.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 22:47:45 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 07:49:12 +0200
Message-Id: <20230605054912.2287333-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685944067; x=1688536067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sMd0+omubH1UHlfNRr++Yi8PizVxGRy0LsnQpG+EVB4=;
 b=mz/LLiuQNu3+NX0hFXI2WIOf1f056VAsLeWHhd+yNHIeFjx+dLxyWPxagfdHrH1wNw
 qSNgvNw6PKsyviJ+jVL8qBRxcVjmWtFOoTRwjKgDVVzo/PBbZM7ETQZFl/hJzBCekL59
 aMoZdzgwn/7Vuy045CD5qhfQLyzvbPuXjYemrsSxnkZRnieXe5O01kaMxuzaLtqLO45J
 j+kioxzyznK5OoW7auKjyMFmirEI9LjNzpVOLwmRzh7oo6TSLgl0j+R0JgnlGvgtABMf
 SDT2oGKhgg1s4upYyEwW88YiERSj/D5VREKvSo07Sh6aOam7WT3xz2FxakRu9bq7eMOj
 Tf/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mz/LLiuQ
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2023.3
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index db99b4b07b..088650a86f 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85  libostree-2023.2.tar.xz
+sha256  9c575a094da2c307769f0aee15de95470c3b5550cbff211fbbc4f6fc75f333b1  libostree-2023.3.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 367a833ac9..5c39090654 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2023.2
+LIBOSTREE_VERSION = 2023.3
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

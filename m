Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA629C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2C681F72;
	Tue, 25 Jul 2023 14:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2C681F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVRKyP5weySR; Tue, 25 Jul 2023 14:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9389181F26;
	Tue, 25 Jul 2023 14:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9389181F26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD8791BF588
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8551981F26
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8551981F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TP2bzUJPnYCa for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:43:03 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9818E81F18
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9818E81F18
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-78372b895d6so286833239f.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690296182; x=1690900982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87byX6akS/RfOGBQUNXZzWoov3GmRvptT1F8xrG5J1o=;
 b=CsLVt5ZZaycsMvFboOtjSnOCSIj6tyrIs+NbPb+gD8tUhBgRpsII6dBS+VpBJoeT8m
 04zgHAWorVy2BH180dyKLoW6eU4Q0gKYauXiqLrSKQl+biaZkhbq0JQ/lWj8zsT+Yrah
 L6q1pTdNJJWdc2r4nWAX0ucDCw7b0+THuYt7CDXQhaHUFMpF3Hyufo4kEhbQwerdPt4t
 n82kh/pz3SbU74E6lng02g0ZGDScL1B4HmgnsxGWF7YG29Hgo33ETSNozrrWmhxr272H
 4KMNwbzzHfsouIjg6LU6iY2mywOLVROyAS2kIjcEyhE2SLoyfNbR1f3S6pqyevCzaaYQ
 Ln1Q==
X-Gm-Message-State: ABy/qLYQxEjWUNSthRkxaXI/NRIBr/OZnKmX7H0VE23qpu/bFGpgnpoJ
 XXO5d+HEWfc2ak58oP4zdHBt+ME6rXU=
X-Google-Smtp-Source: APBJJlGDkIYt4J7tVclYZoVHcjcSSi9T1Y6f80l5zdZBUFP0MDqBW7k37Go40yf/AQEC4ZJqJ002Zw==
X-Received: by 2002:a05:6602:214b:b0:776:fd07:3c96 with SMTP id
 y11-20020a056602214b00b00776fd073c96mr3221537ioy.7.1690296182231; 
 Tue, 25 Jul 2023 07:43:02 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 ee21-20020a056638293500b0042b2f0b77aasm3603946jab.95.2023.07.25.07.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:43:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:43:00 -0600
Message-Id: <20230725144300.721378-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690296182; x=1690900982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87byX6akS/RfOGBQUNXZzWoov3GmRvptT1F8xrG5J1o=;
 b=ofywfaAhjyN14JSqoWA0Q/c72fmA84rhmflrI3edPdLbHyDCQj4FCFWn+zGeUzPUIQ
 v1I0UGpwATG+NJ3+uuZQUZnBZyd94Fz6G6UfvTVkDFaQBKhLuhC/eTTZlWJXyqKH2eLf
 ENpL1mIMOB1+O0wmVIPxF6VPdXCAKypRTz4/Dnnz7o/aMGNYdCOHbbq9JeyTX/70bqUf
 9igoBmpEPwb9dX+TwBX/2S75zBw34RGV28XZascG7KfzQ63Mp2nSdQpUtyfhCkAUZ9Lw
 gKjc4HjQs0kFG4x2Nbq+wlEDz6vFuZYMUh5owKzpsANd61pKzJw/+TStEkCktinKIKrL
 S46Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ofywfaAh
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to version
 1.32
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 45c62a396b..d039cd6fba 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042524.html
-sha256  a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238  wayland-protocols-1.31.tar.xz
-sha512  402ce1915300e29afe554d77965ee0a28a5f22fdb5b901c4c640e59b9f3a9c11094e1edae87eea1e76eea557f6faf0c34a0c28ee7f6babb4dc3719329c4e25bf  wayland-protocols-1.31.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-July/042836.html
+sha256  7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11  wayland-protocols-1.32.tar.xz
+sha512  90bbd52daf342b98823ddeed04e349ae242d2eaf925ab8d603cceb36c980c83b5681bb890961e0d49584cb5c2e60a33abf8821770c6ab87956383630bd5b7966  wayland-protocols-1.32.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 54f9ed8a3a..2cfaa830e5 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.31
+WAYLAND_PROTOCOLS_VERSION = 1.32
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

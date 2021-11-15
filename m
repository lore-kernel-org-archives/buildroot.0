Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5558C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 13:42:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB1A63223
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 13:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EB1A63223
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484FF607B7;
	Mon, 15 Nov 2021 13:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_iySotTJGWM; Mon, 15 Nov 2021 13:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6C8F607B1;
	Mon, 15 Nov 2021 13:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFB301BF301
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 13:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF1E980DB9
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 13:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u57I6GLwnS1y for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 13:42:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF95680DB1
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 13:42:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t26so2741383lfk.9
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=glJuofE0yUTAtdNKoIBB5FyweLKuc/YMIysG8DhclU8=;
 b=gRY1pnCGXWkduVwcLk3sQ0MqOhLRt1AMq6tkXFvwQmAJic0POkE0LXcGMJd0jX0pBd
 gqiXycagBIzWzZQZUPDviFcHHUvPVGH5zf7LkmUSXn3OMXJY30c5XHgiiupP7RIuH+15
 3BWjWkEXzZZnVwP3NmEBDO/5tI1cB0D6c7V2bmEdvJJNl5SspFtkO5ktU79d30vBiNFe
 8ossrHDmccR3izRfAy+KRQ5RJY8GFDCLeuJrpw87qNuwG7DbGtu9IYIfvZf/gL624mWH
 HCEWJz1bsAxi8WS/fB6zAEhvGdwfTUnRESj64AM1H/kXSWBeKI0y6ApGi1obN/dqF4NU
 fHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=glJuofE0yUTAtdNKoIBB5FyweLKuc/YMIysG8DhclU8=;
 b=HcEEzcW3VP+/YUbFZtFtCAgBLf4uD57rusv2M/er1QswmasBMnerqYVJzPrzKSGXmT
 0RYSWUG3k3d54xwF9lXrsxQ2Frc3dIvD4rAtQWstqXZoDeXGcxtr/BhRABCdqZe+HnsR
 IT24u5H+no0H82teq+pJO4epv31kl/lkZPekpAYi9u/HsmFKoKDnpW997yh2pCu7qymw
 pSLJXGZtxnIet7z4vZ54dzUuFKYGi1hChlX80rnFki8og/7UXVmQQGkLAsk3fcPohFPc
 RAV1rNk0xNJC9vTjURFL7BqfANsMzIZLk1GY0hbF8iEBM0OUp6uu7Ykrl1lqAehe4GlB
 043Q==
X-Gm-Message-State: AOAM530Z2xBynUguviqme/y+zZXc4OO3YCALrnI/pBAGJj98/m28IP8L
 Dp+WU0UVs+e3Vw4pY3c3eqQKjOynbPg=
X-Google-Smtp-Source: ABdhPJwToGqZoOeAtNgw2nb2Vdp8ySiihegguLsWKfMMd2eZ9egJU/DyVRgtAf+di5FY5YlXZLPM2Q==
X-Received: by 2002:a05:6512:3341:: with SMTP id
 y1mr14872219lfd.635.1636983749573; 
 Mon, 15 Nov 2021 05:42:29 -0800 (PST)
Received: from wbg.labs.westermo.se (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id e7sm1489818ljk.24.2021.11.15.05.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 05:42:28 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 14:42:05 +0100
Message-Id: <20211115134205.4176891-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump version to v5.15.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 2837edb09d..d8d619cbda 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4  iproute2-5.14.0.tar.xz
+sha256  38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff  iproute2-5.15.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index fdf442a429..4162e38eb7 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.14.0
+IPROUTE2_VERSION = 5.15.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

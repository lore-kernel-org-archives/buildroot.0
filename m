Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05C2C531CB
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 11:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE86440721;
	Thu, 23 Jul 2026 11:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boDX7PpreS5Z; Thu, 23 Jul 2026 11:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BBB405F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784807787;
	bh=a5JmiF/rULLeIE1TkHVYrhiDtinIeab/NJ1PoZoTZV8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GTNaaT4DMqIcIJeK5Otf6Kmjulh6du5+rgVc2FF1UskQnGvSdCyC2L/05WvTiILSO
	 6FJvD0u0SXHO7n1LYeR65oHouQ13OvRFX85NJI3pBO5GvGqkGIaCxVB0+7E1rp1vKW
	 tahLhjEL56mRcWGzRx6aYnLlTHx1u6bRk+nhr6UYCFAtNAtyB2Ke5XlXXvCehnNiGx
	 oYsosgHq1uKHWFtP4Q5iKh5sn5+HyYspgF5SvjL0aQeP7SHO31teAGROwRZm3ir3Eq
	 GhQLdWtaTUMF6FjnKtKgZV4ASIshbxW/ioowk0dLFcRP1tXNGDA7r1e9qTXV7m0uqk
	 aYmHr4on7EuZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27BBB405F4;
	Thu, 23 Jul 2026 11:56:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB6811B8
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 11:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD609405F4
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 11:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHKHLnzaQCxk for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 11:56:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20F48405D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F48405D6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20F48405D6
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 11:56:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4955484387cso4560495e9.1
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 04:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784807782; x=1785412582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3+svGz7higqRVPpSQ6ZgbJp5NoEd/vHCJdeVw4WIPGE=;
 b=KHdnaQmeW6Jy8QWruHFnsQ29osoW29mP2CGiaV/mnwuGQMHbhBhlUg2BmxETbgXT5k
 vI4hssJC0/WZSOuouLZzgQh07S3+vFwx+aMZBALmpPaYpdfKDy2BBseOcslelzJKFJUL
 Dl0WIH5tD7/VfnUStNL8z31hFA1PGMO8WAQFF17qs0PLIRpwa0Dc2qUiHP3x7ksxfrou
 8+6x1CNRKTt81SN5/rJK1Dl7B+EjUSM6tP63fOv3esqRqQr0AM8fKDlqELGrSbzZy6Ln
 7MNV7kTH1uifwPal1dkhvWFvArj4twGeiPOGGHyE+al1mfS3JT3hIjnz41ryuRzSmMku
 NWOg==
X-Gm-Message-State: AOJu0YybDj4Xs9EI2Ey9MpHldQ9t03/5lZFFDlDSTyXsjI3W3tmX6N+y
 4D9tOU023KLSVPS+sIFPDt1Eg4K+HfHmSyhyhP2cGnznvYXO/NQL5psuSWIWHHup
X-Gm-Gg: AR+sD13bGv8Nm2JUOIVjIUZi6aAfBcghQh76JAg0OpLMrj62UXeoYTkwB/YARQ7zS7u
 JjhrA3tJDJCqoFijxL0HCb2L/S3cpfFGNiCipSuwBDJQyQlet3MHLApYRLX07YTmcYwfTdS5ftO
 U6stdhyTts751VO91XAbxXP5f3YkjZTPupwB4igJc545VC0aauesXesqET3+RVzI4Pv96YL3hAE
 eVHo551d5ihjHUtAhrEtUD4GmSUz0QSgihP51kqkH1OPVAzC1Qx4KlK4nvH5uIKsRcg9exA+7K0
 aJZu+5C9YoFwcc9xE1kUhhzq29t1msrPdY7d71qD+bc23LlRRa0OIZars9TCGPoQIG3C4BoWhaC
 r1xFnveZx3fYe9/IEGHGuram6T0sZyyPAd/iLQskGxAe284g7BHLLcvzbCOayI7CCPE1ZxA8L1W
 L3BtEsWmTrJVU=
X-Received: by 2002:a05:600c:350a:b0:495:441a:39d2 with SMTP id
 5b1f17b1804b1-49573cd8932mr29905735e9.21.1784807781775; 
 Thu, 23 Jul 2026 04:56:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:6f:bdf0:7f2c:8921:1691:e459])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a63fa41sm159067685e9.14.2026.07.23.04.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 04:56:21 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
	Maxime Leroy <maxime@leroys.fr>
Date: Thu, 23 Jul 2026 13:56:18 +0200
Message-ID: <20260723115618.1882847-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784807782; x=1785412582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3+svGz7higqRVPpSQ6ZgbJp5NoEd/vHCJdeVw4WIPGE=;
 b=gqAw56Ut+7dIiLxS71VB/T5OnAUJyhLC4QY4LOK3m0hDSp3yqTum8U0hLO6hhdJcD4
 7lpo+WkAeU+tc+mfLvPfJbMABaNBV6nFO+3VkrfB+2ABPQ/60BK31aKFaIpNsGAjDv9M
 QCE+y4ZBkJCCWRAsb7tt/Ogg6zA8g+NI0pK6eiwEMBUkbknPvcBYoeSPhlCRTa1eOcay
 PZLqHMK+3oMsHp2w0kPLPAFyz1F/PtCMQtpv6PmCVnX7BPIp4R+BudXjZcLzTVCNzF+Z
 RFLSxaC2KrFbdCYYW5Xnvitk4hhLOniN1l5zGXFmayn6yEa+kblUvAnR23KmJSmnhubj
 jmvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gqAw56Ut
Subject: [Buildroot] [PATCH] package/frr: bump version to 10.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

For change logs, see:
https://github.com/FRRouting/frr/releases/tag/frr-10.6.0
https://github.com/FRRouting/frr/releases/tag/frr-10.6.1
https://github.com/FRRouting/frr/releases/tag/frr-10.7.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
CI: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2699663139
(all green except the two pre-existing, unrelated failures
br-test-pkg/bootlin-xtensa-uclibc and br-test-pkg/bootlin-arcle-hs38-uclibc)
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 043d890b23..151207d500 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1e8401e1bfcbb9b0dfefc9b335013733a3c77cdf85c79ff66d9e65167d9cfb1e  frr-10.5.4.tar.gz
+sha256  5c56b27756854b8d0a62b3e152d3f9ea08091851b2d686e140fdfb95cd88f612  frr-10.7.0.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 5138b34dca..0d922195af 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.5.4
+FRR_VERSION = 10.7.0
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

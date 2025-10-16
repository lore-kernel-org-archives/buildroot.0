Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCF4CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 17:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF79C4056F;
	Thu, 16 Oct 2025 17:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpKBX7dqLnem; Thu, 16 Oct 2025 17:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E1640571
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E1640571;
	Thu, 16 Oct 2025 17:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 932E8968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB37A40215
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5y1pFHBh4yYC for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 17:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2CF040206
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2CF040206
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2CF040206
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:51:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47112a73785so7457895e9.3
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 10:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637064; x=1761241864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RtJ6G7D2KRSx2MoBI5IdvxwzzvVrWrIT0wEDC+gV2+c=;
 b=Tm3YUSZXsj19E6TdGmRJaIeZ6n9GQ+4njDjedtAtEj11SRuGXSFh+hYmP9WF70Vdv5
 6NbgrQSyEVerlnhO92klVUQjavkanHiPgM3SsaISTQE1Y5Vkc6Uk+wpmOGPtXBircTmI
 puwKqks5efvoqlk4fqN+7b+dNM/XRwziaAzBBbXH5E2XbgdZPVzv3qkO2jK6QnGyA84H
 7D6ExVUD55PV5KCUurtBv3CgweuYOs14X/R3uVX5c7/KIPCibYZn+bAYijGzB3fCq2Ol
 vJ74BdYxZWr0HcFimYaKmA7a09BdbHIN2l/1fFa9o8pehpva7IqN0xgGAnMSxkI+OLuR
 d3+g==
X-Gm-Message-State: AOJu0Yw/l3sb6+yoJGt8OsCw0mn8S8Dfo+CPmsCcCQjqy9jYeKEi4J12
 RIcPzqRCK1gFNHsGKH/oSsVjiXxmlHKV/7MGQ4PAxSMu4UAUeXcGt9S3oWsCFy0dM62F9prQ3L4
 bflgCo4k=
X-Gm-Gg: ASbGncvuxsiuSI9wUPaSUwqz5vDeFhTYf4iVhOoHS8TuUjzU4ub9X773rOM/lf01fd2
 pfaGGeVyKvA0kA2pkl1en5yV9k3y2QtjFo/JrdFhYXobN3Ityf77oyfIfgfYGLMdCYFeyzP74Kl
 GR+1y8XXqPJdSD/plJ8Ohx46QW2pO46E4X8RE7OmFotH++KtvMYuyw0Ymyf76H4R41Z2OfY3mk0
 WWk3rjKc98Ip9lA0JheADTud++Ha7O/4I0gH2c8OTgGZTqRygtMqinhD+b0zLxtj0iuL7TFz9AH
 x8Mq9WCH/W2Bc84wP+kO0mUzi3vO0mW/LRUkz4ZPvzu4NqJp7jyn2FAz9NSWcuKcPB7vRrPwc7a
 K0gG635Gq+3ndxCSgsn0XvqaToixFfFjZmM1CHLGACPoGMN14/HdKm51KUIP4w0WRra9RwwLio0
 wtnzYCl69bTrr+i7ogVORl886DxLMymYQoZvXJ3tahG5Zw1ysMd/HPm3RVh4zW
X-Google-Smtp-Source: AGHT+IFUgmEk0cpX5aUfFbyklgU4U470g5Ec//EjMyg/22o/9ERKpKrZSXq3YunTIppwAYx59BKZeA==
X-Received: by 2002:a05:600c:3e07:b0:471:13fc:e356 with SMTP id
 5b1f17b1804b1-471178760f8mr6918695e9.3.1760637064493; 
 Thu, 16 Oct 2025 10:51:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.252])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144239bdsm60863255e9.3.2025.10.16.10.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:51:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 16 Oct 2025 19:51:01 +0200
Message-ID: <20251016175101.165492-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760637064; x=1761241864;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RtJ6G7D2KRSx2MoBI5IdvxwzzvVrWrIT0wEDC+gV2+c=;
 b=XXDdD0I5vZ5Gix66KUIfgjGsfepguEDp+rcVIVRyUUsWnP1DIlgtF8ta+X3TFMklSK
 +uKEEX80CPVw/lHivH/76uZ7E2Ztwf2na/CaaV00W+1CxkBpDOTa9A6CDDdZCyWl5PY+
 GYJjZjDKh0b2PdwUkboBvqX+gcGkb9+7HvS+4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XXDdD0I5
Subject: [Buildroot] [PATCH 1/1] package/iwd: bump to version 3.10
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

Release notes:
https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=3.10

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 22e5ac33359b..7ad2fb382d9e 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  0cd7dc9b32b9d6809a4a5e5d063b5c5fd279f5ad3a0bf03d7799da66df5cad45  iwd-3.9.tar.xz
+sha256  640bff22540e1714f71772a83123aff6f810b7eb9d7d6df1e10fb2695beb5115  iwd-3.10.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 138bc307dd11..a150a3048b36 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 3.9
+IWD_VERSION = 3.10
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

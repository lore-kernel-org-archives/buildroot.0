Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7E6C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E9E61169;
	Thu, 15 May 2025 12:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-SFRX2sx5Ps; Thu, 15 May 2025 12:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF556114C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF556114C;
	Thu, 15 May 2025 12:10:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29B6F119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F9F240608
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NBn1K4-fzqJ for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3A5340237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3A5340237
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3A5340237
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:36 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5fc003315dcso170455a12.3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311034; x=1747915834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1uSgcuAszIqqs8EeEZ0EgKoHU5ykFdl4nf2AYBy18XA=;
 b=wwV3mr+vhJapJ8iBFrs19BwfLOSB6MPYv9l3M0tZaNtMOqGX1f8l39nRnzfBdCEMWu
 cyvUpMj9HXrqDi3H+Pc2/QrCuWkdvmgHWg39KDzBCn7J5w6z8LugTA+5sapd7mPb+pSi
 S7kFKhuunqFDg1ogyUuZNb2/Yc51+prunDHDMD6ibwSnqO+p2RbsjC5tjLxMkpcHYZy8
 23Ow+fUUoTpAZE42K5SIEsFp8scZQfIhpiheWAxe+0BlZkGI6/ECcJaETnobzawQtrdw
 TMTcXKv8Br4MHRolD7R4D1B6FWQKAKPM4Ff52WvZpczVh69GOrv26cWWvGoXU/SZYEPS
 Dh5Q==
X-Gm-Message-State: AOJu0YwCq41SsUdDol/dwjgwcXqIIT6Uyt9gvINDSYKqS2HCrtwkAhrU
 tZAPrugK6u9r1duiB1PTPQ89FLQ4PIqYYTgCx2XkxxAtLxvfLJhwokKhHNidZ/N/YGSESWsXRI+
 q
X-Gm-Gg: ASbGncvQTnMeLYelQdqTQcXgPcJzyU4aPNLBkaL5ORls1Xq43R/XfNFIfQT+A7neaa0
 xid5sxfo2ExaLGVClkPiWFCqGx3PYpceq9uSMx1T0RK3nPSp8+SZnaSsKHc8DAmGe3fy7jXi3ko
 ObZkfozBu+p3IJ8rVtjLn1DANtn1ywGggk8NW6+VbKn+N44YGxCZHSi5qVc/3s9+7jxpNMx8hX1
 x/Wc0qsHz2uQ24wje1S0Uw1rje/I81bixJa0mTEV5d+CrVCbasppqAvKNi03y5KyiLFChCbEOrS
 ifbn1cHyN3UUNnUJ9hB+fHoXg+zuBszpyYm1P8BuNiIf0VmkuWMoA801ew/nKtY4uqlnIXpqnVD
 mr4XLH914HVKI9xKKcM0/fJMGiMvzIYk/KKmyUIN3eDoMJBC9USasusByon6OTvCid/HUXtAY6K
 Tzoe3YiaTmfNtUGuz0MM+99WQNXTEwnfg=
X-Google-Smtp-Source: AGHT+IFv3BVhE/L14XbLRMhhw2PhqKDkFoHV0CtITxiSO+ztQdbrz4UMgt4Hd/YGKjoUdNjd3XY4kw==
X-Received: by 2002:a05:6402:2813:b0:5fc:aa28:6dfb with SMTP id
 4fb4d7f45d1cf-5ff97e883afmr2432591a12.0.1747311034297; 
 Thu, 15 May 2025 05:10:34 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:33 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:20 +0200
Message-ID: <20250515121027.561571-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311034; x=1747915834;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uSgcuAszIqqs8EeEZ0EgKoHU5ykFdl4nf2AYBy18XA=;
 b=LrCSi4eSMqMyr8BmLZRCsmnJYf9VCWYZKvmemdrH0pv0K+oypnYt28Zi/RnYxedkZp
 a4S+GyXl0fqnW//HoIlqakarcHq95WBvxSowF91BLzvL183VNFPgvB+WrbJhRIhFMHQa
 nwPtQd6N4ObgZ3IMNXPvS7aIkewTGk9+a++9c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LrCSi4eS
Subject: [Buildroot] [PATCH 03/10] package/libsemanage: bump to version 3.8.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License sha change is due to white space cleanup on commit 5969e99.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libsemanage/libsemanage.hash | 4 ++--
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 4d1b2161da..78067b3ede 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  e166cae29a417dab008db9ca0874023f353a3017b07693a036ed97487eda35b1  libsemanage-3.7.tar.gz
+sha256  7b39127b219cc70bfd935a4af6b0f2ba83d4b35c916f253c7e942c23ab490f07  libsemanage-3.8.1.tar.gz
 
 # Hash for license file
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
+sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index cf9e9c46fa..21ca9fd3f9 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.7
+LIBSEMANAGE_VERSION = 3.8.1
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

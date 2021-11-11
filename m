Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB068C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 06:25:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AAC261268
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 06:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AAC261268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 965D381A39;
	Thu, 11 Nov 2021 06:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Seav_h0wMNr7; Thu, 11 Nov 2021 06:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D67819CC;
	Thu, 11 Nov 2021 06:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3A201BF285
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 06:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FCE5606B4
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 06:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBhz8q9ceZ_W for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 06:25:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE8CE60698
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 06:25:27 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id n12so2105505lfe.1
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 22:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3d9+mD+CoqbTzIsoDLnhIny165GInJMTB3ImhHqCTr0=;
 b=l+73d7milbanCxI2SssBmpZbyvsD805juAQ5/HdCIz4CqSx/QxsHp8RF4242QL15lv
 kqtLlpJzxN86b5nkUgSio1rilcCA8kfmj127Pqw0Jb4S7MrUTX0yLipd87AhY22Bfabw
 jE4Xx6nwQdZN7MIbPybKYKUJbINg4QqKgVm5EU8C9BAZA2FPO8qMDWjOyEO9V3GTQbKt
 6PDQU9DVYNNzTMK5tFY+NddUHbCOwoWz/XWYrK30NtBZk++8TBhAOeykpStlYRBYBGAm
 UIBd4pzkosTyrj6EOrudUPfVGP3m3/W69K3WZnQZw+BoTorGcyamXxGDKTHGTdgZIngt
 kZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3d9+mD+CoqbTzIsoDLnhIny165GInJMTB3ImhHqCTr0=;
 b=CmQ4DnGgYFDAdd+G5j4uIMa61gJOogWxntbhB3DWaUmCgtimy7ejB0hgMqliv6SjdR
 px1f0gTDJ/H0fp506hNu7XHgCB8C6bv5EakTzB79i6VjKVa5LIaWrUW27GB9UP5ddT7x
 tFknD5mtu2rRbRS8hXyemZJ1a4MclN6/RRQVixCbMf0mask3fu1QHPZW4MLgDtcf179K
 ciK7QoSfflvH8ZG+MFRtZB2hpi+7lZMwpYO9X1iu2z4643Xbe/EPufvMCMcDuruFhZA+
 tDySLsyD4bQJGPMEJ11b+PfiROwen2CdnFVigEf+TjaCgjRP8KVOrOeYEmPFulBuwR/9
 8GIQ==
X-Gm-Message-State: AOAM530B/gX19v5KS+At3xeKWSuLJrcam8OxN8VeFYrW0kcmWKjO3Z3T
 ZDCNMVb4ifzAIpv2VSXAdrat+fBhjrM=
X-Google-Smtp-Source: ABdhPJyRKRXS/6rNTgvwGgY8+3fiB5n1206OII8eom/v29hSt+X3PLxvyRPtKgmqIfrKgx3V65MCpg==
X-Received: by 2002:a19:c74a:: with SMTP id x71mr4631373lff.354.1636611925047; 
 Wed, 10 Nov 2021 22:25:25 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id t4sm216047lfe.220.2021.11.10.22.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 22:25:24 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 07:25:20 +0100
Message-Id: <20211111062521.2917469-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/globalscale_espressobin_defconfig:
 update defconfig to Linux 5.15.1
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
 configs/globalscale_espressobin_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
index 37d9c1859c..8d44b25ae7 100644
--- a/configs/globalscale_espressobin_defconfig
+++ b/configs/globalscale_espressobin_defconfig
@@ -2,13 +2,13 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 5.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.21"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

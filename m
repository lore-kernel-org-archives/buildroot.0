Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F0FF43685
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46DCC60E1B;
	Fri, 17 Apr 2026 09:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_NantLTqFqU; Fri, 17 Apr 2026 09:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCA5C60E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416413;
	bh=SK1zRgDOkPatxvNQQmyy+XaSAscrWR2cuk9rIOc4svI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XnqLr+RIT0THfAjjzo9MXEmhjSB82AzVPSauL9dvrf2tQdZcCsEMxUVwm/ldGEXFq
	 KhSIxTJX/VI3qJmOAkF+pBR169QcTvMPUtaEG0GhjT9R/f8a6y2v5wIEZKW+RHnuz9
	 DLTagax+3EDRpCG+HF+USs/sfvWEI3OoYDcdaaQFe5iLwigkChFskeEmPtNEfoSU+0
	 RVsgjWc5SGZCu8XzY2SRcGHrVAiYb16Ne/Nd8na+AWLlJOhmxH0XkJnoi7nO1WekL4
	 qZpfktZ9ch/rTBEklQw9Vz0RwGW5JGVjIpQoCJQONSgmDQCPezwK5/HKTajAQm9XzH
	 +4XFBJ5BUiZYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA5C60E1E;
	Fri, 17 Apr 2026 09:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54836396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39B9840015
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xv1_ytujlwwn for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43BF940578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43BF940578
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43BF940578
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ad135063so4238865e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416396; x=1777021196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HvYn9qSgqPS8PasbzooXo2DW+D+x+q80cN1AO83OQ1M=;
 b=eU5cqcISyRkHZFY0MVi6RJKR8Qb4DthR18E2f5MiABWN2Bmxbn79dDzSmKE7fNQ5iC
 8OJqc7k3I2xJCvod3J1GmltvXuk4He55nK7TT+b2CiNrxFb0RCfwXQs92Bc5dPh1U5L0
 wIDrci+y/Y8hORk9ybr0uzPBU5yk04y9O0E83NAljgDy0GpZLDGsVJr54rkH82l5vfiq
 UhRys90jjV9GRIZrkqu8qQC79qmKmMMQGnaZNpYkCvnWCwhcsWzQOQEHD1CZ+fVBe1kO
 l7jpapq0MTz/A7uZ7sKTWRrkVrOCY57YMPC7ih53y41ONEUnB8vl8NcYrsIA9VzNgjZB
 jZMg==
X-Gm-Message-State: AOJu0YyIy63yCFKN041feJz3z2UsIXLKsJssP1oXo/Go2qNCyiXOPIs9
 8P3EESV49dnTEjuhct9L4Fk1+WC6pYzuAPnXwAP2hu+eLnFHJyLrbgO3UzjbASN6rDxE4RwNqVu
 Co+nj8Lg=
X-Gm-Gg: AeBDieuh7d1BVSR02WOdkYD3AiFDNxpobO1x4qLiqfGDipRkts7ESxzvfhUUPCDWmSc
 3K7ztvkl4Eo23s7uyd5IEbxacu7iq+JvsCzEWXotv8VaUzEjl53D+knYtEeTGDxM89D3KBlti92
 /ISvz7Hhaju9A9gauEVswtwyflV10ddwYr/kMhXXIk711OcjLfu2rLVOP2kIWA0KSVZDjjtPdCn
 f1XdSFvzP43hvZlZYy96kqZ9duGX/3ncwj4jgeBKd1EWv6rSderWDp0QiAwHN5MxwZHs7+cDZ+L
 6w5gqLwh+Uj+LLiekimCeiTwMcQyg1+cl/z3uRhQIHJx2P/ITGrItDZ9ti7ZHhn9utZoEbL7BQF
 t3it8DwSbH0ji2AZfvB87PaPp+3vAVp4xK0+MTS1XtvGrABhiZ3Ny6892uEgp8IFlbkAcBQXuLd
 ULyxIhZb49wyBW/SX1LNgXV5tMVdPLzdkIUnDCOpeleD9Mc8DQYxdfE9NUwA58FfP/3ItZ99cll
 fcFPHuBWM1pZ1UP3q2tBJcqOQVQq4I=
X-Received: by 2002:a05:600c:3150:b0:485:3b00:f93b with SMTP id
 5b1f17b1804b1-488fb79df09mr27267615e9.31.1776416396030; 
 Fri, 17 Apr 2026 01:59:56 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:36 +0200
Message-ID: <20260417085936.200528-22-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416396; x=1777021196; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvYn9qSgqPS8PasbzooXo2DW+D+x+q80cN1AO83OQ1M=;
 b=i8pZpA79e0VEjD8+PFOr+z6sLejhkqc1aJOqlNlUj+pEIhjdJ1MhFuhRg17wNuSMPD
 w4b8ouGNpaxetZlBgonO2UpoQ0uIHzgI4s567ZwEOQmt6ZIw3E/MKE6o+7rQBvC8bU8p
 ziGw4AsXrDdFsWzxggQPRUy6LUyHAnIKxTiNQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=i8pZpA79
Subject: [Buildroot] [PATCH v1 21/21] support/testing : test_aarch64_64k :
 Bump kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/toolchain/test_aarch64_64k.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/toolchain/test_aarch64_64k.py b/support/testing/tests/toolchain/test_aarch64_64k.py
index c038e9960f..7cdbdb9faf 100644
--- a/support/testing/tests/toolchain/test_aarch64_64k.py
+++ b/support/testing/tests/toolchain/test_aarch64_64k.py
@@ -10,11 +10,11 @@ class TestAarch64Pages64kBase(infra.basetest.BRTest):
         """
         BR2_aarch64=y
         BR2_ARM64_PAGE_SIZE_64K=y
-        BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+        BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

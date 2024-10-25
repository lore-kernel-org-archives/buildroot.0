Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3228D0C5E6
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DC878133B;
	Fri, 25 Oct 2024 08:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhrMlaxCD8RA; Fri, 25 Oct 2024 08:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE0E81334
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE0E81334;
	Fri, 25 Oct 2024 08:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDA802318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 08:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBA9081336
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 08:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swUAhx4EBoEb for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 08:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFF0581334
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF0581334
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFF0581334
 for <buildroot@busybox.net>; Fri, 25 Oct 2024 08:52:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so17849245e9.2
 for <buildroot@busybox.net>; Fri, 25 Oct 2024 01:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729846341; x=1730451141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S5YG3s/8vNs4JQgnUGKTDxjNf6ZU0YcqxHyAAcLM60g=;
 b=N4fzcoyTIK3Z0otdAj7GefB8v1OQiVCZFp3ORpjlQzc8EkRc36aQyFIlRPtSz7e3kW
 L+l4+otFYFEHVmHE/n0wAKznGRR1BQ9Ryk9xyxHN3N/vraXqbfuRSIWrWy0Q8e+iIxJM
 K6zdsWxEgefvwBmYCBIxdRymmqaY/mQCS5OPl3EY70wY2s/7vM3fXdJm59Gmiew5KwMr
 LHwfe0EBiYkPqYRT2LzF1I90Tqg8lDpRYOUu1HW1tpxJCxGzD48rzXIR/4DV6JKAntWD
 SJbHkOulzdgbQEnmoE0CmhHCsA9bcskL+VI2tyM6g4xOcA8JO44bRIZeRHxII/KL1pHD
 Eqsg==
X-Gm-Message-State: AOJu0YxdgRbd6fgpqULyB6MjvoI1A9qkBa35cHkdtumu1xHj9bpsBi/O
 YTjqjiOMGDv7Q347+R+bGawrIIBgedymNNHDZo7aqgHx79WcMQF5ZX6dZhr9r9ajI388M/F7wzB
 Crw==
X-Google-Smtp-Source: AGHT+IGzIgo40kAvXx2Uozey8Sv/Yf1Z3xjejWFmep6LWUgVrM2J6t6gZ32xROkVStv0iyxZnOYyHw==
X-Received: by 2002:a05:600c:5011:b0:430:54a4:5b03 with SMTP id
 5b1f17b1804b1-4318c6e0175mr37832145e9.6.1729846340733; 
 Fri, 25 Oct 2024 01:52:20 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b54303fsm41660285e9.7.2024.10.25.01.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 01:52:19 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 25 Oct 2024 10:52:10 +0200
Message-ID: <20241025085211.615132-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729846341; x=1730451141; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S5YG3s/8vNs4JQgnUGKTDxjNf6ZU0YcqxHyAAcLM60g=;
 b=jzwwm/d9HXRqfsuxru3Y+tGgi+7cNL5h27bbwmTR20H3Ggal0qGr95H9Qp3G9AQcdQ
 QHf3OfVk7uVEoZj5tb2icveqvhCrmi/FNlHeJyDaWx20jEcmuw/vBRbRrMzWQgUVE9jd
 VuKColLnRfJrMDNzx4veCnVjtAcmESneajMZ3VUA03qcdvSoMHP92BJEHYXx3loo6wBb
 +61l2zpWqSgmX8b9Up4ihMlH5tOScioEEOOQg2d11LWTBYyXSoHjdUzo4yuVVR0GTfJ/
 UELxIcsZ+va5uh3zjdvGkRrn1GNyEGPFIJuEj0xVIU/i1Nua+d/9wA7HC9uPrOxchWbT
 l7gQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=jzwwm/d9
Subject: [Buildroot] [PATCH] package/lua-lsdbus: bump to version
 ae5e674e5e792dd72e4164c436ca7b064158e7c6
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index 93a086f16..43029f61e 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a967720736b0f6ff9b3f527846de28aaf74f58775af6358c13c31c0ac37b832  lua-lsdbus-ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe.tar.gz
+sha256  33d14d52df702dbb2b1e5b7770cb4e4efb11df2da0b743c5f9a19e16a09783fe  lua-lsdbus-ae5e674e5e792dd72e4164c436ca7b064158e7c6.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index 865a5f8f3..606fa16c5 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe
+LUA_LSDBUS_VERSION = ae5e674e5e792dd72e4164c436ca7b064158e7c6
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BEDC10F15
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 08:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52942407B7;
	Wed, 24 Apr 2024 08:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ow-1mbrLJ_SS; Wed, 24 Apr 2024 08:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74A6B407AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A6B407AE;
	Wed, 24 Apr 2024 08:32:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACD341BF47D
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A197181F12
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_LvY_X_3fFZ for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 08:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4868B81F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4868B81F05
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4868B81F05
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 08:31:53 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a519e1b0e2dso760313766b.2
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 01:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713947512; x=1714552312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vW5Q/iNnfkPnYvphjkKn8qrXPx1N3ciyGJFLciWklB8=;
 b=juWvY+Snzc7YiSP1QLh9pHlQ0V+nUoYjmIipwht2RCCYiWCON6qygPnSuAtqmHlGJa
 o7cPmRRO0Gcmwz2MtfYmN+PInh9k8ClZyHofalSOKHFnLKS4qKAVDX6Q0FFVEvXC6dXJ
 0GdY2x8xVQSvbN5UCB+p80jd1ADqK70l5zNIFXACZypIzm5PZKq0Zkrr3qdm4odK0BfC
 vCUzNJULqFkeFQYmQLGr3q2iucvyw/2kYzEmABRRSYmx6F9rNApwiMAhnfmunIKk0ivb
 zewKzxASZYQ5LQLaZYTELRmcTOaGrIvWjpFflb7RNiyZXgNPEWd16UsOMRPePsc/3/vX
 eRsA==
X-Gm-Message-State: AOJu0Yynsch+btf3DgO4rl1n0F/5QWIvZoOt+tCg8HHPK0chpxkiAArQ
 fB+vUkxS9hufxu6QW2DS0X2WvSfUMw3Rxj3lSO0FKvcezNYyLtVIAUWI3Fos6kLKcaF2j+fF5wS
 dfQ==
X-Google-Smtp-Source: AGHT+IFBsf2DdrYXY0tVJBUtphLblZdz3M/+aC0HmglUFk8rugsfoi7BkgVPuz2Qjn7VTjqJ0RmY0Q==
X-Received: by 2002:a17:907:11c2:b0:a58:748e:91eb with SMTP id
 va2-20020a17090711c200b00a58748e91ebmr1074732ejb.70.1713947511752; 
 Wed, 24 Apr 2024 01:31:51 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 lk11-20020a170906cb0b00b00a55b6e7e16fsm3434617ejb.0.2024.04.24.01.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:31:51 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Apr 2024 10:31:18 +0200
Message-Id: <20240424083121.2818-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1713947512; x=1714552312; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vW5Q/iNnfkPnYvphjkKn8qrXPx1N3ciyGJFLciWklB8=;
 b=E1UhDArequNRJ4qVPW8E3UXk7rhM8vFkqC1wsEVNGK1sW1Q8EokyLeSPmtNAEvJzL2
 UWwNJne3a/nFTglw3tsaO5SaSiswJcS1HO79o2E6d03Vk6KlVidUGkb6RJiQsCG49UzY
 Bhlb8ZXShGT19CJ6NRPf29TCIOTdXKnewd2uREF9QvzQWeiUpNYs/cvmIw1s/1H2CY/w
 7yieDvrIPigRe+UJoI6SJgD2nx45Uh2WV4AwOwfBPKbbrltlJDjkAQUqIRkAtj/KRwnH
 iiQ7SaCYq16TZrYG67rnG23eNscAUAXrCBaZPE2W3zNmAwR7X5ACl8Tkq0sTpNMM1SA8
 Fidw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=E1UhDAre
Subject: [Buildroot] [PATCH 1/4] package/lua-mqtt: bump to version 0.3.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
    -Copyright (C) 2022-2023 Francois Perrad.
    +Copyright (C) 2022-2024 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-mqtt/lua-mqtt.hash | 4 ++--
 package/lua-mqtt/lua-mqtt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
index fecd4dbbd..287a583f2 100644
--- a/package/lua-mqtt/lua-mqtt.hash
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  0444119ab5a1230e38e35f3948db19e8dc6310991b419ca75e6660588f2d95f7  lua-mqtt-0.3.1-1.src.rock
-sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.1/COPYRIGHT
+sha256  fe2dba2c6d99c0099f5dceeb8063e06348c3fc492e8d2f8f35d49197e8a36985  lua-mqtt-0.3.2-1.src.rock
+sha256  3db678c27de7ac8811e5e926b1d67923a07c2abe85a28387e6af96d0f654d0b5  lua-mqtt-0.3.2/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
index a000ffdb1..03d28853b 100644
--- a/package/lua-mqtt/lua-mqtt.mk
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MQTT_VERSION = 0.3.1-1
+LUA_MQTT_VERSION = 0.3.2-1
 LUA_MQTT_LICENSE = MIT
 LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

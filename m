Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04099C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91DE610B9;
	Mon, 11 Aug 2025 09:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZ97mOy7tkMF; Mon, 11 Aug 2025 09:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79CA61256
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79CA61256;
	Mon, 11 Aug 2025 09:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7D81138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEBD6610B9
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-Z30ZH8qwCl for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D86161275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D86161275
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D86161275
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:07:05 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so7575494a12.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 02:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754903223; x=1755508023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7bwsftO9rYqijYpUy6hMnvLpoR/VEQhysRG28ABSh44=;
 b=ikgoRVBIUHltvMEKdF2eYtnPfasztwdQbz/q5H5fAIfOc9KwI8hQVlQwsZSDyt4vvS
 1wKYGtBrxSNjYW7H/xg12Km3yyskjzwWKPZsqNt24T+iwblndGRAltOq6vKAH7hQbMjY
 uFHu6Ktk+TlS7TfaXy3so+XvImVLilZotN1pf5etyoMWNVUftuILqyv+GOSQhgHQ94x8
 U3P8qY52vT1dOh9SDPNn7GMOchTSXl/aK4tAUwaTi/DnpA+ah76goziBlsV9emwrT985
 PschrjFwPG/IRp+Eo2hGIdUAgruNH5g0bL/fPnIbhV8WMs1Q6I4fqXv/BmCEwUmnjz+E
 u3vA==
X-Gm-Message-State: AOJu0YxLF0j5gd58eIZKWBiiLUbX2DqmTmBpHkJvaaweD7CXPFGpitME
 VukhhvN2LCy1+QLmcj/nMcFS+f1htAd8YQEkGJxNb/AoeRGsFohxSGyX3ikb7rLN4IwaQ3vIUml
 7C84r
X-Gm-Gg: ASbGncsdtrRdL7WyknDifEcXDWkLdnlLVT0dgscFEFdY2xTAOi1MfbchlThEHBw0vMA
 F5Q2Qsi2vEFAnLGzur45vUgiWRy4WoB/IHPwcC1kAjyeyxmD6SFcr3ohgiGMGkmtWyes0CV7sas
 r0Qyd+tX2aIclHFZwvWIlmx52nF2F/tUI6YUuP4H11M0Cx3BxL6PA6+HnZW40TtW7If8lgaBdwi
 CHdgoECYzvsyyEFyRxqL8xcj6x99Qcidu71oNWquYIJagBeFJrBX30nPDaKsNAJ5rKZLHOfY7sk
 PagdHo0x9rbcfSEMxmOOZEudKGik/UZFyq6DIqVKtnHyLgVhtZsV9o0RxENcRlSSeav4ON0l/xt
 8T7dcUQEkHSAxETnw8F0fRh5T3QFbCf9pfNhbNA3VEueMUvBHjk1lYTdEWH+98oOJweVJYv6oS6
 VTixKXgXBbkjlsCRU=
X-Google-Smtp-Source: AGHT+IGLokF4BefPSVojOr3my2xYXS25DXsCETzvrfDsREgEGiehGio6QTMHYuhbG1x3CV40cv3hBA==
X-Received: by 2002:a05:6402:3492:b0:618:2257:7fcf with SMTP id
 4fb4d7f45d1cf-618225782a3mr3853854a12.18.1754903223424; 
 Mon, 11 Aug 2025 02:07:03 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ffa3c4sm18191412a12.46.2025.08.11.02.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 02:07:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Mon, 11 Aug 2025 11:07:00 +0200
Message-ID: <20250811090700.20714-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754903223; x=1755508023; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7bwsftO9rYqijYpUy6hMnvLpoR/VEQhysRG28ABSh44=;
 b=WGeuHY8vOogOXYR37rV/GE+ChdZwuyVaPklvmykMt2Au32yXLfahXWeQq7z8tVqSVS
 CirhcR1t8AQuji8momhi2VK9m6HsTquTvAHCKgUq+vCSVQuMxl6Q6nkydpRC4H0QuOHE
 Bqqjf1+OWkoL8n2s1AouX/LGAqZMb0RbesLio+110UCbGgxQIR2JpkStp7Sc7GPqCX2e
 34fBbGjfqlSNFoX5SRKhuecn3PZHooTG+4eMlKARg0RECYNqPN6qJLTmtj4DmMadyk36
 zoqUFI1xX8sO+IWVm9TqVXi8D2gpy5dkAswmwTG+NFI0bo+NOE4sj1ASVP5UzaPPTArr
 1+uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WGeuHY8v
Subject: [Buildroot] [PATCH] package/redis: bump to v8.2.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From the release notes:
(https://github.com/redis/redis/blob/8.2.0/00-RELEASENOTES)

===========================================================
8.2 GA (v8.2.0)    Released Mon 4 Aug 2025 15:00:00 IST
===========================================================

This is the General Availability release of Redis Open Source 8.2.

- Streams - new commands: `XDELEX` and `XACKDEL`; extension to `XADD` and `XTRIM`
- Bitmap - `BITOP`: new operators: `DIFF`, `DIFF1`, `ANDOR`, and `ONE`
- Query Engine - new SVS-VAMANA vector index type which supports vector compression
- More than 15 performance and resource utilization improvements
- New metrics: per-slot usage metrics, key size distributions for basic data types, and more

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index c66223f2da..41d2797cd0 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  redis-8.0.3.tar.gz
+sha256  ff95b83b7cf2f7a33af3be1e52fdf2e791c259f8272465c3b09f9e6bc901b604  redis-8.2.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 5ffb2a929f..8b5005ccda 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.3
+REDIS_VERSION = 8.2.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

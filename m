Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024EECCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 05:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80DE6072F;
	Tue, 21 Oct 2025 05:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Envfc_4_1eIG; Tue, 21 Oct 2025 05:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 040E7606CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040E7606CE;
	Tue, 21 Oct 2025 05:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 139C770A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05B56401C1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxq5b38tIOnh for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 05:59:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5911240199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5911240199
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5911240199
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:42 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-93e830d84d6so333803539f.3
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761026381; x=1761631181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dlP4Y7nfp2LB+6pLs4hxNOvCv0ql4YFgSthc93ULe30=;
 b=hM5fFlSlwc0mDhqDaPYUrNitU7TFfq0SnX3lhROz4/3a/5y/8JgqqZLWavbCrA4i7c
 8Y6PKAQGXpiL3xto8TeJ9jNCzd/I9neWJYdCcYIQ+Wrh/km8Nr0vq9hgiKTG4ZHoJbSI
 UwNCm5xtrdiUTuk+4emib43+a3rD4AwqTRPgSOsUNDvSvj6oI6WjKatHTr6YnKTnRZsZ
 mM8eefawcIenQNjGp62bAEaqAIV9J3jtuX61Lc4S054DDSmZ2qDYGxTHDDog6jMFkNue
 DHScO1iewkHmgjDFyGxdAgnpgLC4uEXHuIVtV2JOzCfW07H474pSxu1bTWf5B/nKaLGG
 fdRw==
X-Gm-Message-State: AOJu0Yw1tk6aCQYikrKtQJLVNGbekKaL1XsKOaDsThvK5tOQZEJHOQNW
 CFPWyDNMu+uNKV/x0kKO1ZmqOxvkbSUPLgX/0Tj0NpO//aydr/LA2mWHkU3PMAWuE1s=
X-Gm-Gg: ASbGnctH7uzI0g1s/UoWsabRVzN84/vUlcqr+OxhwOW5jXn8IoVnxT4eVB+zS1gJZUr
 AnVmefiX0HRYxoNYSnGwtSv4JdRkO9v1UQG8gbrl1QGIVNycU/goOe5W2IO3O7azXTcCRQhLjLk
 utsIu5crFBmUtNsfC6qA870kW9VnaFtfTl1pmZCvcMWXS/XeMxujzPJRNFK46vl7fKZbZs+9wXK
 Y1kTMo3yEpf85hQMetJoDPNXMYaWoCrjNIGBX5BUvG3qkqkU1FverTNMVnm1TwtkpmNoq1//9ll
 TmxU++Yejh8PzGmHF1tjfg2tFk5dX2gx7XunZL/RMFOulUHPx/wWKGpAQsGzgiLeLNBcI9rBOYd
 feUa42dWxJkvsPnaAJcfJeHLQHKDwqjwZU8HSUPwB3awz0XT04gzvjpZaJ1go18hSWUrsLb4t9c
 lLh217fLUx4AotKchX4NZgubLQXkR2uzRcoPpr/15ZQyviljdiAzmKKPZY0N6hFMIDJ8QsoHw=
X-Google-Smtp-Source: AGHT+IHzSg7lpUwcUi8wP+kNJULac/FLT1AzBpKbt6iMlWwm0DAVC3pF30ieAot1FfF2MjeOwCtUcg==
X-Received: by 2002:a05:6602:3fd3:b0:93e:8bec:6a87 with SMTP id
 ca18e2360f4ac-93e8bec7596mr524059739f.1.1761026380864; 
 Mon, 20 Oct 2025 22:59:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5a8a973ea52sm3727109173.41.2025.10.20.22.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 22:59:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 23:59:31 -0600
Message-ID: <20251021055931.532861-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021055931.532861-1-james.hilliard1@gmail.com>
References: <20251021055931.532861-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761026381; x=1761631181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dlP4Y7nfp2LB+6pLs4hxNOvCv0ql4YFgSthc93ULe30=;
 b=gIcu5LXr8ImQBq0o8gVrTXqQzAvZ7wIUp8laSUqGmETui9PzqVKukbdiALYuFJm6Kd
 Vw0ExBTGzlsDwDzIqs/d2M4jzflx4lHVBqPjrE8aGk7dDXg9o4HKfddNZXK338WTuaks
 ngnjBZeN/3mZajG5fgiqsNl4mfTGpkdFIq8CaF4J3/2noYnCCbwo8lQ9qVTqYhtVgNLg
 jFr0yD5q9poOIRHPQ9S/RGD1tPrsOnzpAFGzODZqSrvIGZCsPbusZpe1EiaggycK3/FQ
 6jLSj/ugUBnddnatB6B9o0mbqx/JEq81iAFyqDYD3LRXSFzAcL1Bt7vBCFiUttCLK2LZ
 qpdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gIcu5LXr
Subject: [Buildroot] [PATCH v3 3/3] package/tailscale: bump to version 1.88.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..444412f8f4 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
+sha256  98b51e95e84378ab280c5a8706508d493ab9152a0215f00f0f69e3ea2673ea0f  tailscale-1.88.3-go2.tar.gz
 sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 3c6c7bce1e..141a5b98d6 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.88.3
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

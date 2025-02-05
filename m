Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549E7C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 23:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FAA1406AD;
	Wed,  5 Feb 2025 23:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HonuBxRwVrl1; Wed,  5 Feb 2025 23:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CACF340890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CACF340890;
	Wed,  5 Feb 2025 23:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C7ECF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB6C83FFA
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkXpu7ssJiFE for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 23:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06CEA83FF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06CEA83FF8
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06CEA83FF8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:42:46 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2f9c3ef6849so486054a91.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 15:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738798966; x=1739403766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VqRhKyQXfa40t0Wpns9X2erhmoeJF8kUpP5EuNZwUCY=;
 b=YiP4i7eP95Z0KMdvmf+6GzPq7PfNXtMYYY6UVioUIGgcQzmvarIYkXwOrBjzJHOstE
 Luozl1QXFeEhMVWhlUN5GZPMEW+vXT6ywaICbLPbedWdSofgZsWMl2V8hw2c3Dw1VEGX
 s7mezUBmnW6tZwl/4V7HArFicz1ZaEypdZ4FLxHtidAeTemwyvR9QpR/qk9EuOFFlmJD
 JRZCXf+/cmQKazCqxbjLriVdTqWxayXGWinpkvCJ5STL7XoauqPkhke6PQV58odJsWeB
 sxFIM5geT5r4zumCQvRyuSjOyrjBwSs0HYG/h5S6iZcgA2ajvY5z9c5vHo3LLjPk0mw+
 903g==
X-Gm-Message-State: AOJu0YzDpNJz28rlWmHlHmlCwVUtPOIWQtaYDw8KprBqjvV6S7pHWId5
 DxqljoyHw2rYIj8JQSGw/Uf/KzI4zOhUz82drFWDz5BHIPtimhCJjpd+icEY2l55+qt1Fj5bv1E
 FOTb8Ig==
X-Gm-Gg: ASbGncsXs4NQsl8atrqkSLqFdmOck6Hqtf9e4vOPD7Kl4a09wIYoRIkmbGV1iIO9ld/
 sVS7t/GMlCbbhOT+BCDrwIGcwwMcGOrXtPsW/WMrlwk+rcXW1tykBsOQe9WxJAWGiKBgD/M2Rhl
 +R3KNpb9h9XxPpQhqVt10XNPc8JJHdgzoQNj1q0RGPV/GGqp6XpIotYJWT6sM0n6UIqsEanyVhO
 Yuf/fyMbXsdC6q0+VTMD+28qe5j08Q21eoDQay05dRb4Af0BPRZNTDfbst+ANeFMd2WA2bIG3bY
 PufCz2RBADsWDkZUz+tfMYaxeCKrnWUazR4U6OAUvQ==
X-Google-Smtp-Source: AGHT+IFFFg+3YgaWH6oN8amnLtqG2+wB7Q4EKWU+wCdP+vEikLVWpkj1sXZIZXme4BWmJkjuyFwvnw==
X-Received: by 2002:a05:6a00:4ac6:b0:71e:4cff:2654 with SMTP id
 d2e1a72fcca58-7303511b9c3mr8020212b3a.6.1738798966274; 
 Wed, 05 Feb 2025 15:42:46 -0800 (PST)
Received: from localhost.localdomain ([94.156.149.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16331sm14388b3a.128.2025.02.05.15.42.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Feb 2025 15:42:45 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 15:42:29 -0800
Message-ID: <20250205234229.76788-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738798966; x=1739403766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VqRhKyQXfa40t0Wpns9X2erhmoeJF8kUpP5EuNZwUCY=;
 b=lTlIzkuW9ahRQvLsXP4RHpYWpI5cT8zJp3CcqttqwromQdzJrZ0Q6C/iJkee5t8/1l
 QU6DLv5WMJyUbWqPhlTnKPtLqdRgnGqo2BAu6y25/LnkYuqBf/uVnjishxngzAHunQ/+
 BJW9s+Iz/3Oi435pJzldurohTuUt6mH9qfqN+Lvt8wv/LI6TXwePb7MxYNy7J/+4vget
 uVNLnifLCXdtoMpFxNt0pgv6p90Ja0cXCjNklc6WgShn/fplwbW0gFe2AULIM8yKZ9SL
 C432PegM0p3bbDWiq6jUrCZ9bm6OuipXBvLULc9sENLc5PfttFtLJ6JKK0C2AcCsg9WO
 B10w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=lTlIzkuW
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 v2.32.4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/compose/releases/tag/v2.32.4

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 0fb9767305..e36011e7a9 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  100a1c1522fc58658ce08ed4a6213ffb22f0bf5a728718e6e2b1181a127d321f  docker-compose-2.29.7-go2.tar.gz
+sha256  481fe93cc6bb76f62b9d2a10c0db67c662d0efad38c3a307b65dd250d8d6599a  docker-compose-2.32.4-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 26d90d303f..cc98e24133 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.29.7
+DOCKER_COMPOSE_VERSION = 2.32.4
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

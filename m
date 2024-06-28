Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CCBC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 906E641CA3;
	Fri, 28 Jun 2024 16:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0cJMG8rLMGm; Fri, 28 Jun 2024 16:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0962041CAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0962041CAF;
	Fri, 28 Jun 2024 16:09:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 447B51BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D92141955
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnsFfz1wvofY for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0F5941795
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F5941795
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0F5941795
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:09:37 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1faad409ca7so12828655ad.1
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719590977; x=1720195777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=60FMCxfl3XStLb/H+ygNox6s88y3c7FOdOQ8rHFpYFE=;
 b=sl97rLGGIt6UozY0uK0vH8j+iAoZUOWlgUabUIHBgwDkVl64fVJeq6uAeFUNZa9A3f
 oGfUiAjOobYtNqo4pbpaIloZr2rhBiSSL7G6Qr+cykpUgqzWsSTp7ylyjAgn/6QR6Atc
 l7JcU8aGwe9HcdV3Tzl485ChyysZgHE+VvuSsYy1c0ZQQfqeoHL/aeZ2hY0OtzfksWRa
 6yiVgeOnfnHS2ZoEoNqO4COoEo6I/QWVsiBBvqDDmKIXOpPTlUyjyyProAm8d3PZS/3C
 lTPU6FA+xwFDyxBXONLkaFKbwJZrbxg1o2avDNpD5QSKaW7jTgLQwoz0BW4kLhG2UofE
 8ZZQ==
X-Gm-Message-State: AOJu0Yw/LXOq2a1e0iuZ/oRiMnwNt2W2zfrLA/T8GQiNHHhNS+Mtf+W1
 SGe28Zc1pU43RKaQN+q4uh9MbE4oZxofnl2RiKooMVtloeVgn8SKkClB9AclXG69xVAExomfdHZ
 8kiefaYIQ
X-Google-Smtp-Source: AGHT+IGqFSe+9eq6PQjN6QDE4zv5i1NZLHpGzoE7Lp8GCnH5RBQUyWYKYoHRcyb0UhX4Lofd9ZyRNQ==
X-Received: by 2002:a17:902:db11:b0:1f9:e927:8b83 with SMTP id
 d9443c01a7336-1fac7e27e6cmr31730155ad.5.1719590976719; 
 Fri, 28 Jun 2024 09:09:36 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1face441a1dsm10220435ad.39.2024.06.28.09.09.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 28 Jun 2024 09:09:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 09:09:32 -0700
Message-ID: <20240628160933.50208-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1719590977; x=1720195777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=60FMCxfl3XStLb/H+ygNox6s88y3c7FOdOQ8rHFpYFE=;
 b=KRvhVidMmwEQS2IpxGG9BgTsOHk69gkHbQscrvYAFVHR5W8IawVrHQjepnI0Eiizi0
 d64b4NTDSVfE7XJSNMY8tIIfsQkcIitKy5vFLgXm27Lhyh4v60aq1m6dv3BzH15LJXGk
 GDk5UOYzRMp7vB1OTA4Z2P145tQDAMr7KEjbmDRLtWKxMBYu6DGWBofwMvymYj795hQm
 zsBUZc52A/4x2c9USXrIWj61P/jsl7cYXR3RbbOjoLQGnv6ekbaRD8D0QPrVec9IsCG6
 kVvRVHUBDSvw8rwtFscMwGNakcKBl3+OEaP57gdlqQybUd23U6EA7GKBm4hnAYO0Y9KE
 8a4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=KRvhVidM
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
 v27.0.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v27.0.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index e13527944e..86de5ca785 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1cf6a2e69607daa0e2ae9b5be752dc269ab30dee16f5f2180f7ff7f29270606  docker-engine-26.0.2-go2.tar.gz
+sha256  2705abdd7a8a47ec88c0d2f0f31eede01ba4aa5ae8b5ab0e2c4ee25e7c314521  docker-engine-27.0.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f8dc87050f..1de112e4de 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 26.0.2
+DOCKER_ENGINE_VERSION = 27.0.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

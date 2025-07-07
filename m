Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8250C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 08:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F69415AF;
	Mon,  7 Jul 2025 08:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a4iIOMt8KLN; Mon,  7 Jul 2025 08:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8AA841305
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8AA841305;
	Mon,  7 Jul 2025 08:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 510CF12E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 08:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42185400C7
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 08:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6YhF4Iy1Myn for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 08:10:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA507400AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA507400AA
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA507400AA
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 08:10:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so22056785e9.2
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 01:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751875854; x=1752480654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B9VVgksabxnqg9E+r0mA4/leBjjZ8cdR5vABy6kNXCA=;
 b=UGKNi9C4rz4DUKyrUtEp75j56m0gXZ/8/11NdNvKIE0L0N6cgjWGnDyQr9MXDSDhtj
 7NYJ75cjeRzJGiD8hnwOd9AOZi/a92UtQAGDUE9TuQQ51VWg0mi08xZbJnVaNeBmA06e
 d0FZbj5A5c8xAXPHXQGP+sBMfA2ByYqMNYzQcPmsZfNyguooMj8pj7rWyPrIj2oBuwXs
 S+2FTvPf5C2gcq51qbVrkG3VjV8zw+45nP8t8ICY6b50T2naIcBh2PIU8r/3VR2+XGMG
 PVZzmdB8a9E+/kOHxm4PIppGU4L9oE/jny1SaiIapRfcJ0SDcBL6Amg9Tspm0x6D2VYo
 jMxA==
X-Gm-Message-State: AOJu0Yyt+e23XskHW49RWuVRYQRcXgGTEyNqWzBKv9fOpaJD7a0l6yLe
 arxSPk4KjTh/SZ9gx1lpA8TMuJejrUaCY6WVsFR1nUkRr4CuAOSupHwhLi5O42gAkjejl5L8+uO
 zrPlz
X-Gm-Gg: ASbGncsCkSAMSnBQroLugSIbfCrwyTUXifWa4MfCd+nceFsQZJxHbt3ZkhqAUTlDFhB
 yAtanF2D2C3jNk47W+7Q+xDfnD+RK58+lt9B3qybq2xQopTgHmOrdzzqR/lHwFWcJhtOcnbNc8e
 L+YKTpb8RPLb+ms4p08QGMXDVBKvQTYy7fAyGsETVAh9Hl2aXaVrJ5xViA0DOgyi+WpIyZH8pWg
 +zRXJDI39vvyRnXBAOk5+c1N1LpE6RLeWsvNZFR3IDhWBgwm4gHLqqQ6B/Tb/Ipj/tuGeOgoHq0
 cqIOq+RyOZvXxSkbN8nUyJJYLY7eNPMfe25Wi+T/nDx8hfQdsahWGJ2wwa9M6Zv1rCzMyDLyjAf
 qTwfgD9mrXOFUSJgJcw==
X-Google-Smtp-Source: AGHT+IH7UmEetxy0ivAfRWnXG4vFH91JbZMKzT5nhxorJX5XjTsW1955fnaeaoGKDU/3jz8c6SrHww==
X-Received: by 2002:a05:600c:530e:b0:43d:b3:f95 with SMTP id
 5b1f17b1804b1-454b31878e0mr80349085e9.28.1751875854235; 
 Mon, 07 Jul 2025 01:10:54 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b96534sm9300664f8f.48.2025.07.07.01.10.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 01:10:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 10:10:50 +0200
Message-ID: <20250707081050.1996244-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751875854; x=1752480654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=B9VVgksabxnqg9E+r0mA4/leBjjZ8cdR5vABy6kNXCA=;
 b=iASOoMZaZewP//j50R8LOW2bPasy7vpn73bxlrAJ37zPhwkKFSOujgE3spEC3ZxWD+
 UH0R02ZC2xmwrnoyenMEZr7quqNZO3AIQ1nwHeztD6SBcT+sNMARCnghKbhYyMytyUb5
 hQBt41ZC9D9lsoXIOWt6qlqqT3CjIj6jTLiw6MixZSAjBfZi+Hh7RACCaGDL1ltR9cIo
 47G7H/+oamDG6I/CAnak9kUiJ6Tgszt2+gFD8vWL7SvyfQORHKdKVM9+CP2CJK4Kgdn8
 Vva4KHXn9BO7JDTgc1SfWHQHDQCPtEfzkpCAQn5JjCfaCAlaxZwcbN6/YxB0ZgdN6xgQ
 jRHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iASOoMZa
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.0.3
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

This fixes the following vulnerabilities:

- CVE-2025-32023:
    An authenticated user may use a specially crafted string to trigger a
    stack/heap out of bounds write on hyperloglog operations, potentially
    leading to remote code execution.
    https://github.com/redis/redis/security/advisories/GHSA-rp2m-q4j6-gr43

- CVE-2025-48367:
    An unauthenticated connection can cause repeated IP protocol errors,
    leading to client starvation and, ultimately, a denial of service.
    https://github.com/redis/redis/security/advisories/GHSA-4q32-c38c-pwgq

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 4dfe1543d4..c66223f2da 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  e9296b67b54c91befbcca046d67071c780a1f7c9f9e1ae5ed94773c3bb9b542f  redis-8.0.2.tar.gz
+sha256  33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  redis-8.0.3.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a4b6b4d652..5ffb2a929f 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.2
+REDIS_VERSION = 8.0.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

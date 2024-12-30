Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86479E7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CA3C810DC;
	Mon, 30 Dec 2024 11:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9PQTat0Ekfv; Mon, 30 Dec 2024 11:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DEDE80FF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DEDE80FF2;
	Mon, 30 Dec 2024 11:37:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72A7ECA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C90D407C5
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SP9E-I_XL74E for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:37:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1320407B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1320407B2
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1320407B2
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385e2880606so6740272f8f.3
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 03:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735558643; x=1736163443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=gdlZGaFkzNJyKZWlMyBPnaBF/jXTDEs3gukdGq08Vr6VlJ4JETjctxefw7DyKcL6eE
 77VhLg8viagiHjecg6nKeD2ZKJaE0LO6zufRLulAptxp08nB4T61uGsN279y8vMhittA
 g02P2A7SUdvjTWDnX9DYCeYuBLrYBwYzGvTIu0vTSxFHfmlvKvLs52MIfo/BAdb8LGzI
 9oT31AQG9pKwPpg2jp+6RLNv/Zd2UFNUhnVxSIsLdYZ/tZyBFY6AbmK3ZhMv+jmzdV7L
 eNmCDmm0W2JYOOaonoa3NFcwDrIBlDkLkriLL+qRtwjSYSBfdk8wOQbhvwtg6XdBI963
 wMAQ==
X-Gm-Message-State: AOJu0YxrqZc6EpRxg/h4qFohRWrHt3EUuGlZ06gXseKrkkdbXsHk0zHK
 NysyLNz4jJd4y2yaW5kLksLeO47SpHtKhYnFOHEzI02mnYtjBJwyFlQ4sQ==
X-Gm-Gg: ASbGnctFSP4sMlNS1Jjz8l6vaiMjeFy2XBqDCTo0g+SfabdLsn4jJeg2+FTtNq2HrtU
 IdbyltKApA0wnA+SuaXQ2ZV82O6ONaZskFl10mTGqQQjTTrisB57GU3rEhBeSM5VkIfmc2iCDb8
 NrfJGaYFW7XaNtuzYc1XgP7rFFbZY8JjGaWfhmH5Vw7quMTi2UNZDHjFk41nfZgeMmXsvVSg7gM
 AAErY+6OJ8z6D7MVwYnTYpiT3xJmMNVLLqKyeMPSh7zpRmldfC3lPQAnm1yLaN/9RyJL7Ei
X-Google-Smtp-Source: AGHT+IFR2KBrj45tdidP3g6gzLWuKJXFDVvIUKs6NC0mBiailEO9js6DozFxnd3LW2FrIZPsepi4SA==
X-Received: by 2002:a5d:6d06:0:b0:386:605:77e with SMTP id
 ffacd0b85a97d-38a223ff609mr28953181f8f.49.1735558643078; 
 Mon, 30 Dec 2024 03:37:23 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm1471216666b.103.2024.12.30.03.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:37:22 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 12:37:07 +0100
Message-Id: <20241230113710.679717-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230113710.679717-1-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735558643; x=1736163443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=W8KLPrerbb3HAF474ASGSkuXEvELcdmxeEM1wIRzhp9nytqzC0SFvV7I64aLhxSkSW
 k8cdbYxYxwCfqyjZtrMSenJIlS3iNofbzcEgSgMI4MVvZvnQOWYk2uRmSpEKUW7H+Ea9
 CMBQ5C46GTZDCEw9lM43uqLVTIfdlpa5BIVpXGxEHccCcpGm6dDgmlRb6LABoijMe0Gu
 nOICoEvlsGOzrW+VR4LDl1aW3iaOl2w2oJRLlYYwXG3lScK6u+ZsTH30NgPe8mLbIL03
 enu+HmW1qEtlvrUUovgYsxyvWpFZhnpTg5yufzFgiVG144mWhHCSf8nSoXSlIU14Aa7/
 TX6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W8KLPrer
Subject: [Buildroot] [PATCH v3 1/6] package/libyang: bump to version 3.4.2
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

The LICENSE hash has to be updated due to copyright year change.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index e03278adfd..eb8388166a 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
-sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
+sha256  2767902aeffc55c55767f4ecfe5371c422174794edd8aa2b02028d5fe3f8b82c  libyang-3.4.2.tar.gz
+sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index fca0cd63f8..2f095c7e9b 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.148
+LIBYANG_VERSION = 3.4.2
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

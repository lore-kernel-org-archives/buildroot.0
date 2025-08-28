Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1354FC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 12:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C81E960DBC;
	Thu, 28 Aug 2025 12:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkEBXGS4HWBs; Thu, 28 Aug 2025 12:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860DB60D7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860DB60D7B;
	Thu, 28 Aug 2025 12:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04F8C17D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 12:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBE9860D7B
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 12:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjbigwuB3eNu for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 12:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10FB660D78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FB660D78
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10FB660D78
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 12:41:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3c51f0158d8so868823f8f.1
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 05:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756384908; x=1756989708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v1UJa7hU1KhgjcksKpC5BfRldWbhyooEdQULPyx+46k=;
 b=vupWGkMIygYSIxrQKihRtAxC10rFi+skIFPeJyr4oi/Dx0sMfCXPz6aidBwKW1/0xd
 4kHA9GLeSK9ULUdtqkCMsLBe4+IZm9ytdVU0X6OE0wNsA5GMBPT/HAvdli3Wpvd6hu1N
 IjhU68scAB8g3wKS8WhoZviB3it41op23PagY8xFqKbHxrO2vuCoZbi8Nzv6f6hAQeyg
 Ae9EbOFtlccclsRyhuZHZ2FWAEKd9T75B8MRyJZNad2Jhu5j4/mVo7yhqEGuMy0QwNRR
 BLvEAGDTvaCtLMynsFMlNXGHJx9YtKnrGR2qMy93hnZLcCszTElsPevbIiElrP5afd/w
 7Lhg==
X-Gm-Message-State: AOJu0YzndRepdGFD/TlM8vBAYSzGZAZP6CnZewJpnqpNDWXhPl9NaTvi
 jciwfY3NkfgsUmXbRaD+9hM/IBMxzh7LYrrnMJlDIjF4jHG6FJ+1fENdsQEcTgHnDa0eZInR2c4
 2MD3x
X-Gm-Gg: ASbGnctt/1urv4gB4/ChmShKcemhGVLppp7BQb5r/HZR/tqQn3ZkrvCSwb4NN82tHck
 hnpFm4SIgQ515P4QKcoOXqb/RiJhNi1/alF9yiVToMJLlZuddVj30m6harPTh5pIJbGmF2DDZoR
 D//g0uHsz3mp4zdQqmZdT/4mOR472F4QvKUXr5znsLG9QjDteQTcHb+ICwF+E4EwCGbBMTDGFfg
 O6y1/AJOoUvZdU+FVfBeBTbpunpYr6E1JH4rCeAufpc9Xx0XhnuBeKTP+9faUvPlnL5ImfrjuS1
 OX/iP/ud33kfa6Dbyv5+7WjTfcMI+BstLVwOCMSV5vTQZfJB6v+gAOl92JDYbWUs8wFWJQirSNG
 FlpdXAK+KoAV/nfeiCszvu3EvxcmlM4hK1NGJghJlZ+PSCelgRdpVXgg6uXSN+EcbJCoQxLL9Nk
 JsFhMpf7mlkF0H1vRplYaiscaxwpQ=
X-Google-Smtp-Source: AGHT+IF0xoNn9wvvUm3Kn8a/hrq7D6oxmBClep8GJOleLyni7BcOUXVokdqjy4hvvIHr4MgkkF8eIw==
X-Received: by 2002:a05:6000:210d:b0:3c9:c3dd:768b with SMTP id
 ffacd0b85a97d-3c9c3dd7932mr7282706f8f.57.1756384907753; 
 Thu, 28 Aug 2025 05:41:47 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b797da187sm35798015e9.16.2025.08.28.05.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 05:41:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 28 Aug 2025 14:41:36 +0200
Message-ID: <20250828124136.369394-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756384908; x=1756989708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v1UJa7hU1KhgjcksKpC5BfRldWbhyooEdQULPyx+46k=;
 b=HoZbpXFgH8vNaSgvwsR11tazVKpKmQiv7+ks4YLX35WyrKdUTbZd8WFU1j2h+j5atN
 g7hUU9ifmF53ffYjUe/ZzCyQYxIRqjxofzhd94xWXEEuDkZ+cq8PNyz9B27pzCqvk9JV
 HMQ+4idFUa8bhjsqSex7UuuI+HyDYxCm+j8nE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=HoZbpXFg
Subject: [Buildroot] [PATCH v2] package/dust: bump version to 1.2.3
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Last time dust was updated, we could not go beyond 1.1.2 since
1.2.0 requires Rust edition 2024. Now that Rust 1.88 is available,
this condition is satisfied and we can bump to 1.2.3.

Release:
https://github.com/bootandy/dust/releases/tag/v1.2.3

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
V2: Better commit log
---
 package/dust/dust.hash | 2 +-
 package/dust/dust.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index a25176a9dd..83b01447b6 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06cb47200dce72a51ceebc5fb97094b20afacf6c303758540809808f24e59435  dust-1.1.2-cargo4.tar.gz
+sha256  275c2d7bd06205588b7e20e4b478e0df7213f426a1441923e3f2dfaa80cf4828  dust-1.2.3-cargo4.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
index a6b6f43c40..e83d15c95c 100644
--- a/package/dust/dust.mk
+++ b/package/dust/dust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUST_VERSION = 1.1.2
+DUST_VERSION = 1.2.3
 DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
 DUST_LICENSE = APACHE-2.0
 DUST_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

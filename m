Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5DCCCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 18:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4003961200;
	Fri, 17 Oct 2025 18:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duYiGMraMnN9; Fri, 17 Oct 2025 18:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5486611F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5486611F5;
	Fri, 17 Oct 2025 18:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C8D43F
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 18:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69470818E6
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 18:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMZdiNqMrCbA for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 18:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F103816F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F103816F8
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F103816F8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 18:19:53 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-63c11011e01so3363331a12.2
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 11:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760725191; x=1761329991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDRlPGXYRLApK6TwIcwEpYKKdXmwEOv80lAE3pnVx1I=;
 b=kZDb+gI4zBMzQr53DDNljKN5F8R8R9n5SjWj91+QIvhYZl0MMX4zpKknmTncsp4tRP
 OVgugqmlsUK+yjOxOBkfT6UOwhZqzQMn4Khr1XEswtwscvSsMSc/VGadb5liKkjXQZ7r
 Cej0ElLkTYbIoHTGq1ir+LiAdO2ZNlVrVv9+oTe3iCbqPQ4NhxMbJsF+Dd4qlIHJ/dTS
 L45i+njkjRo2dIsG3izIqjX+XBmjBsmEwA44bzAmbeqv0YMN3Yb/ZhtBNDxbEzpgTO2+
 9Wt2dytCp9reSDwDECLuF5NG6cuD1yjyJggDifLps29JoRugnBBRJm+iKOWBxgEHCOWQ
 ct5g==
X-Gm-Message-State: AOJu0Yzrke7UJWhpmCjuSZhokiDBKRPENPqiM6XltmBigOmjhYMp4sJ7
 Ou9w1RbcyQQ2ZiM4eVesJTpKytyLfMfABtaqQtrlSOJRHV9f3ra8xTHaavX43AyW
X-Gm-Gg: ASbGncthVvra6WE5M8sYT7urwdaLKIwkLyIdtED4nj6LSzvDQz+t+NJGVk1oRZB/uvN
 HEo1a2DPmpJuQ8pb1lkuRTDSEBzaGr6I6x19be/au8dtjP8OdhrHzE8JK7iV5Gr8YrCln/GJ72O
 /idXX0wtxbbGXR7lCGpiH40NfjrGWVvqIBzWJWxV3+N13Y+Ffe53c+PkT+Acu+6HSvBtUBkXJ3L
 6hbvhsPZ+sPqte002ah1raL6qHJhekLrcS6TiGeAl9zM83IcJKJ2235yTpuhk7yjPEi/XQ+BEwv
 R3+5jsQP5UBOL2swQEuMbNz+HB4SQDNswkffW/9vAVOgkRxPnIaRku7BoOA1m06q++KmQ0468Xx
 qbINFySrIYINIHSiRSOhj0nM/K+4an1TaM6OVMOAXn0pKRYDoyjfht7p6JTVC5CVILbRRNF8BBF
 Tw
X-Google-Smtp-Source: AGHT+IEQlsmKnFdZ7fVRzk1hNUm2Ik/ciHDXs+cbKxfTga2bNsDRiumwqWuzs5aL2sv1l0oHtkjkHA==
X-Received: by 2002:a05:6402:144e:b0:63c:2d6:f471 with SMTP id
 4fb4d7f45d1cf-63c1f6e047cmr4815382a12.26.1760725190932; 
 Fri, 17 Oct 2025 11:19:50 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945efebsm291455a12.32.2025.10.17.11.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 11:19:50 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 17 Oct 2025 20:18:05 +0000
Message-ID: <20251017201805.317401-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760725191; x=1761329991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eDRlPGXYRLApK6TwIcwEpYKKdXmwEOv80lAE3pnVx1I=;
 b=I7AdIzPG5FOvW/b4tPENy5Ofs24cRxJH5QOCrXj6T7qZo/ciThJ0Tl1xT4pZ6MbPes
 ua4TegQEBVy15/Wl2oS4Dq+bLX+jHMmdc0DBpeJTZCOeTsE/eJ/tratrJBTQ6VxHaS6g
 OLL77SKE/bbS0vjevcnwwasrClMWtrTn96m6Z7La6NvL82ouszizvdt2/OZINk8IpuhX
 CeNgxLaY3chgJ0UAUkBZ5CNIgsghFUui8L3dOHYcw7ilSwFX3qZgb5BFToifVJoa8Sq8
 FafeIFlL2Mt90x5OqrMXhme8a5pJ8zWH6tgsOGuZBZkHp/ivJ4QH2a4cNa85S0RtBbym
 YpgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I7AdIzPG
Subject: [Buildroot] [PATCH v1 1/1] package/cage: bump to version 0.2.1
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

Changelog:
https://github.com/cage-kiosk/cage/releases/tag/v0.2.1
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/cage/cage.hash | 2 +-
 package/cage/cage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 4d376c322d..018404a2c5 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6b72e034c78c55432ad815e651ead8bd732ccc2087b08c666a68b865ba72ceff  cage-v0.2.0-15-g2e593fe5a8a2186a558ceb414674775e4ba5d2b1-git4.tar.gz
+sha256  9603ba1a130696dd39793ffab68397db504b378a733c09c0b86a5ebe3d6fe58d  cage-v0.2.1-git4.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 7f8fff4833..9b5778449b 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAGE_VERSION = v0.2.0-15-g2e593fe5a8a2186a558ceb414674775e4ba5d2b1
+CAGE_VERSION = v0.2.1
 CAGE_SITE = https://github.com/cage-kiosk/cage.git
 CAGE_SITE_METHOD = git
 CAGE_LICENSE = MIT
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

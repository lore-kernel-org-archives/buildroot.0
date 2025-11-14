Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC33CEACD2
	for <buildroot@archiver.kernel.org>; Fri, 14 Nov 2025 20:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2EB280D63;
	Fri, 14 Nov 2025 20:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lL2Q-gO8PuTB; Fri, 14 Nov 2025 20:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087B480D81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 087B480D81;
	Fri, 14 Nov 2025 20:34:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A2A158
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 20:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5843840E55
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 20:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuw-A1D3GrCe for <buildroot@buildroot.org>;
 Fri, 14 Nov 2025 20:34:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.47;
 helo=mail-ed1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20BB140D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20BB140D9D
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20BB140D9D
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 20:34:35 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-64149f78c0dso3817898a12.3
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 12:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763152474; x=1763757274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cC4Zm3hC9+m6t4sAY2CAZC0KjQCy9I4DdW/Hj48Uf7c=;
 b=UHXHGYzV3Tfp1Bc2zqGCXECtUbbXh6xCu9Ic+6kkcxsuhyxqFEpbvchBndIM8SSwVc
 nJtrHNBYRHfYAIwqtuG9gvz7aZZDdTFhCz/RhsVDIqjyj52/rkT/hnqxGmWCBLn7Q8fR
 GtKEkoSs4Z+7umheFwwIdr7eBbnVs2Cw9FpcjT69ZkNPlr0LpFO5bZKldlwyQhdjCh3y
 f0y8fc8Vw067JNJtJyVn1tQGOtE5OFQFHDxRTmItwwLZntX9iwt3HVRgzJeR+cIZlzhB
 dTu4I/qSFKDZqjEzFT1Y2g1enkinnZcixAD3JlErFrBOVHQOlc1aPTFMKZ5Y0vGBWYmr
 kqWw==
X-Gm-Message-State: AOJu0YwsvS/NhtG8E/7nnNtmXfzHshY+pn0Bh9ArdtTeH0TiwRTd9ye2
 HBU6GkKnVhqvqQzdog6yDd6peVPLjkfR7EyTm9MQODcivYqajQDIiBEXQMqh8iXp
X-Gm-Gg: ASbGncsb2y/1YoyaD8CWbCp4Fg130vJoWsz629eyxN+KNoCHZrNgWiWRC1CgfsRknvl
 n09pT0rcE9yW2/GY3TFLRkUqJ2OgAizEI1rDH4zPDOYk7NUa33J3tC6BS38laQwDD8cgySy7Fvg
 5evvu9A/urrKyPG5mhIhmpRFL2ppflyJNuzQIUcr2IdN6Q8FvIBbOdwvsnfecKBxyJ9926dbU0r
 esnJeQzKYWHuTVHUIiGkPjhEPL1uynujjW2wts5F5jcfPXrsItSQCy5Hw0H/TtPYHGRo6djPTV3
 oBMJcTxF/iaISy2y8NdQKZyKs0952cYR01uzo7havOZy/8eVBMZLLzZWm7LusGas5h/g3z6ikR1
 SsM+jB6elNC5iCAiEOjBgskPsg85A19j+68zo5QCFt14DNejVfRFLz7flVfB9+9P772qAmcQa+0
 u7SEWplNr0b+1J9TZEWN4=
X-Google-Smtp-Source: AGHT+IHKbb+OQLjuumeLq/X2pFPbE+xEujQK/qknnD2DfMTa7PYGqdXz0lQrXxUlKfU/EO1mNpJlTw==
X-Received: by 2002:a17:907:7246:b0:b73:301c:b158 with SMTP id
 a640c23a62f3a-b73677ed40bmr473145166b.6.1763152473455; 
 Fri, 14 Nov 2025 12:34:33 -0800 (PST)
Received: from KORLIN44614.home ([2a02:a03f:eb6f:7900:5f3:8fe1:9928:1ef8])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b734ff75e4fsm454892766b.12.2025.11.14.12.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 12:34:33 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Fri, 14 Nov 2025 21:34:29 +0100
Message-ID: <20251114203429.569637-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.82
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

News:
- https://www.lighttpd.net/2025/9/12/1.4.82/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index a23af84c28..2a7c3c5e84 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha512sum
-sha512  10c24b1c1ce1aa1d826a426868223393eb81d7c0fbcc0b4f032b082a14593e0364228a5275e1440ed8782a2e78f0ded7cf72bc6642e5528bc82defcefab9301b  lighttpd-1.4.81.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha256sum
-sha256  d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840  lighttpd-1.4.81.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha512sum
+sha512  a8ced6e61b6768d31fb643c1f75af906ee975000286a9a522415571878c7979fd9e5e39f36871e8f34f6ca5d3702fa4b20a0c1203b57ba446dae2dbb6efa71b4  lighttpd-1.4.82.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha256sum
+sha256  abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962  lighttpd-1.4.82.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 71c860a31a..a126e96167 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).81
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).82
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

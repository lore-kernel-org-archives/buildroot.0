Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E211DCAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 19:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADB3415A1;
	Sat, 13 Sep 2025 19:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3ABMkZHdQer; Sat, 13 Sep 2025 19:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B20D641584
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20D641584;
	Sat, 13 Sep 2025 19:04:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B920A12D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF286077D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIw6itQ-iX7k for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 19:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.53;
 helo=mail-ej1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A55360777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A55360777
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A55360777
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:39 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b07d01fd4fbso219605766b.0
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 12:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757790278; x=1758395078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BmlTSLBk7lewTphsEpGv6iUn05dGYPlqIdj6l3Pb8zk=;
 b=WYHTQvIGNPG0un0uHcd59NJfOkug7xTt+nx1VpeNGBTzZ10tHSiTh6naafbai5I1D0
 l3R6CXXiqAj4lcY3oemIQjOP3ViSnggNAa/2MWbMNVkHt0waxew1QHsJkmY4NJPqKpoW
 8AKWkk6B3FY8vL5Ppxfgs66TeImDFamPtHP2etnAnM837breoJ8VxBnqpuru6f3iU61r
 GAkWrpu+C0RY5HrYf/DES+aMa6dMh8t23k8x0q/N5ju+SBi73aXanI+37BCcTLNqj/aI
 GYPELcYbF6r+h0POATK7x3m6L2/3Nu450hAnk8MLx7qB7BqQzgBwSTU+RqYrQhkYwRMD
 Uzow==
X-Gm-Message-State: AOJu0Yw/7lSc/LyEbZE7rvoKsj4PWJG6bpL1KT3rV66CjTwgZsL7/B/R
 mrtTo7KTZrjHAfpDvuUIYD+9pzVABMdLqDw0uZwQvp7aLGI4+lhGUpAnLnLJ2nno
X-Gm-Gg: ASbGncuXTPjltmO8Gmxiy87rbslhH2ZhJWzncdb4hoT8qlgbCooH1OykQ8FhvUaYmfR
 5O1oapj+AnOwq47eROyroX6sGbvNweADHfo0joDRMh+lxmuEA2ZFh3RWL+9AzPReyMCrY9gjFKA
 0sRBYZ6p40WH4Mw3a162530AXEVDhuNmIK3nkWaHHFB6KwfNG+7oqDhKRLPG5FvskZvba6Dj/dB
 hok5AqvrkfpvIxnL+ZCdalTusoZxhXXXAXZgnhmhC5Yd1XcPE+6OvIZA1PjRfTnRirsNWWup2Nb
 eJisUuIQigApJBkT7cSLQkCnyc/ile75RCSBRqthOsOx3Z6CFWI908TWPDfWKL4M0zbPVi8kMeC
 0lfQ3MoHvR9BixXOalaXE6WhiC0eEbaU3SEkcnw6zHk99DZHowPlSR7g7EyDh+ZywQgw4VDLIaO
 QOws+6V4tbnKVoW9n2cbuekJK/xNbcr4zE6P8=
X-Google-Smtp-Source: AGHT+IHuO6riHa778zo2+ugSXjWOfuoBglhsbiAHs+fNXWAW1N605a3PdFPmCrZ3Xmw9IcmrRk4k/g==
X-Received: by 2002:a17:907:6e87:b0:b04:a1a4:4be9 with SMTP id
 a640c23a62f3a-b07c351046fmr674555266b.28.1757790277582; 
 Sat, 13 Sep 2025 12:04:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:f67f:75ec:aef0:e4f5])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b07da7a8918sm243901366b.56.2025.09.13.12.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 12:04:37 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 21:04:30 +0200
Message-ID: <20250913190434.2224911-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/4] package/wayland-protocols: bump to 1.45
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - 1.43: http://lists.freedesktop.org/archives/wayland-devel/2025-April/044134.html
 - 1.44: http://lists.freedesktop.org/archives/wayland-devel/2025-April/044161.html
 - 1.45: https://lore.freedesktop.org/wayland-devel/aEw0AP7h6T8l11ug@gmail.com/T/#u

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index c6fca6cd25..f35c054dff 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2025-March/044027.html
-sha256  23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa  wayland-protocols-1.42.tar.xz
-sha512  ce85fecbe886264eaeb34c7992d4e493295f57f6213d5a2ec04b3471daee04a4225b1a7e77a27ccf39306074780553ec1383c55af30cc2c78942b40cc5777c1b  wayland-protocols-1.42.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/aEw0AP7h6T8l11ug@gmail.com/T/#u
+sha256  4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0  wayland-protocols-1.45.tar.xz
+sha512  d0557a75eb486fb824f182648bec346e270cb1ada8727613377ab95b0ccb595c516de242f486110c88b7009e98c87b071bf5b598f84466e5624aa1d81f19e195  wayland-protocols-1.45.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index b7c5b118e6..0cb23f8438 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.42
+WAYLAND_PROTOCOLS_VERSION = 1.45
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

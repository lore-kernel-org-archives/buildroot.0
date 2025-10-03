Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9885CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 17:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E8C60735;
	Fri,  3 Oct 2025 17:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElOT2kHmgUbt; Fri,  3 Oct 2025 17:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 982EC6075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 982EC6075D;
	Fri,  3 Oct 2025 17:33:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0294226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D179B8270B
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PMHObT2va4F for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 17:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBF2D826F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBF2D826F5
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBF2D826F5
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:33:18 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-634b774f135so4461102a12.2
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 10:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759512797; x=1760117597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gyD8jHlwY5ncZvWwtiS/f6UdgbQI7dKGUWtYWQ4z4jw=;
 b=ZM9n50dfm190ySfIZiIBnrVIBzN9C2/EvH3lU1rD6zNb0RlHwMNewmm/etRH+DNHbK
 /T1gdBoD/ZO975YgtgCsTf3y5/yQ+xS0wGW1+CO4m2nqbWIsTzte87DQY4K0d2bHZmMy
 IWWMKEmjv9AnI6jrTsJqEDpl64jgHGNmUMqsEqXSKdfHMSn8XMEf7Sq1mhGet2jBYoC2
 ZXJc4LWXMJS6yYfZ3Dpm4ZupDzIiNxQ+z0U+4EDV8ctX7YVJpHDkK0HNPVuOx2VRedNR
 RmcEBVQ2igLivyxL0a/f84nDRw+GC5vxz/YmqtsQZ9xaGdtWFtXpM6cJiRydS7rb3Yla
 QBMg==
X-Gm-Message-State: AOJu0Yy6w1P2ITdnnMyUP0/6PcG5t69K6moKfTS8/OTXRhIg8A+2Fj9l
 XYo7hChzl6zpn/8zM/ro8PyLZwEC8dMV4E8WqgRpYZscZRD+GJxhMQiDJX3Pti79H1Ub5pOE87H
 THocmsr0=
X-Gm-Gg: ASbGnctJQ0s+q0nGPcbfNrTlnEQy10uNOZ7YkLxlAVhLfUx/OZWfmBVpSAzfXqIdj5Y
 7TgmdL1otcK1zI6YJxYRsXSX1RO9ct82aqTLCeSvAxrGVCt5SY/7BmsJ1FgVk8sh+q7dW/gw4Rv
 48ciszscM4piXq0FCAH3UZkG7AZf3on8qBgUg2N67imXn7OIXKlf4RGn0N9HGxbXTIbRLRoYK4k
 O0/8SotT9PeJrofONoxpBtU3UYU4pyt+023CIUUTCg9uHoloxNvDL3Wdc+/CsgFpv7YJbaUWprT
 ZnIGQtqp1vX1n4/IZgVqRTuGTIqY464AhniSI4lWL8GG5zj4z0A33dsl5DB5GfdGuXSOfTgL3BO
 a+k5mxXA6bwzWXg0kexsBVvQ3XArgMca1WKkjb+OMTwFh6NAvU0EIPbJqKPiOUjf2LO57Ztco/O
 k+NxdBTo4bBfK2PJ5Eu4vZiKFWaaBfpqmTkyPfcSinMSE3TjY0g0HBcX0DVwr/HDAQTq4+7IIHq
 WuHfS+CruGGedGOglGAST7TPQ==
X-Google-Smtp-Source: AGHT+IG5E8//0fTuHQjw1Tz4aGX+lVuTTtsgeQdhFbURMCt+N548ZNPvQo2qpHTkSTnq1/vui3SZvA==
X-Received: by 2002:a17:907:7f8a:b0:b45:27e0:7f35 with SMTP id
 a640c23a62f3a-b49c43930a2mr534456766b.46.1759512796568; 
 Fri, 03 Oct 2025 10:33:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3ab232sm4489288a12.3.2025.10.03.10.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:33:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri,  3 Oct 2025 19:33:12 +0200
Message-ID: <20251003173312.1404088-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759512797; x=1760117597;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gyD8jHlwY5ncZvWwtiS/f6UdgbQI7dKGUWtYWQ4z4jw=;
 b=qm5EeiP4MEAiEtycOu+XayKGJaipi2n80L/c6fNG4XrMzlICc1rbV2X2IymJ1iSMwp
 d4ib2e6p0lge58u2coItNLvi0peOg3mvIT1cjZEHMBYnokaDPXyB5hFy50LlncaE2EPV
 tCSuM0ldD/1rbw1MS8SfneJRHAM/JuTbIRQh0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qm5EeiP4
Subject: [Buildroot] [PATCH v2 1/1] package/fakeroot: bump to version
 1.37.1.2
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

For change log, see:
https://salsa.debian.org/clint/fakeroot/-/blob/debian/1.37.1.2-1/debian/changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index e8506672d875..1f52d37f1a21 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.1-1.dsc
-sha1  baec51fadb0900cd4ed095c9efcff59699261623  fakeroot_1.37.1.1.orig.tar.gz
-sha256  86b0b75bf319ca42e525c098675b6ed10a06b76e69ec9ccf20ef5e03883b3a14  fakeroot_1.37.1.1.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.2-1.dsc
+sha1  925958f4730b172f4e1ae5dbeb9734f3da95da13  fakeroot_1.37.1.2.orig.tar.gz
+sha256  959496928c8a676ec8377f665ff6a19a707bfad693325f9cc4a4126642f53224  fakeroot_1.37.1.2.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 8f85fe16a648..ea0edb7665aa 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.1.1
+FAKEROOT_VERSION = 1.37.1.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250329T150348Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250513T025019Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F84CC36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 14:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8380F848A2;
	Tue,  1 Apr 2025 14:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKJGANHoLO8Z; Tue,  1 Apr 2025 14:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 940A380E27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 940A380E27;
	Tue,  1 Apr 2025 14:25:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC88121
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 14:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 350C741334
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 14:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGQfep77KrB3 for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 14:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25EE041396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25EE041396
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25EE041396
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 14:25:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso37073365e9.3
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 07:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743517545; x=1744122345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EEm9yh402ZsNnkzSWz3cKl1ffhDYF6GU27UM1Jzixcs=;
 b=XBpQWx23BtSrl39Amkhr15lFACY3767QzsK5lgql3VnScx6o/aXS76q/9A79mWk7D/
 olNji4hvr2eNJLtXjn2AmoOyKDLLqNSk3Zrhh6f5qysrnGfLG4ENJGsYr7Kq14pA/yLV
 XDeYJ4+SmYSf2QcBeTyCX5FffArc3TqHkZ4O9hoLDMn4Lta9b6GgcQgVG7RxTzwVX9XM
 cNnuYQi/sdl5L47aDRkEoLRRsjn5dkwfpp2knFR30zU1kf4g23GhK/L5ZM1TUsWre/5r
 84awWvwaBjWHh6utmxwljEsHpTSeFsnNoWBH7GF8PnfTSchAUZS1smCdmjOJjGKNDAgu
 3KZg==
X-Gm-Message-State: AOJu0YyGTZLqoimvDXNOfVmxjV9x5yIVhg8MH9tf2EsmtPcAHeCazdO0
 GDsDqBnSMLYBJm3tCG33NibKw06PQiny4HqgWeClXQlfM6thyKkOHbcwhHIzm+XZRSXXZzVf88N
 T
X-Gm-Gg: ASbGnct2ziS0g29zd/8popiL7cei+cfpHLA3B9X2s6pw9Xc4YLh27AGJ8kGVNs9Er7O
 5vcrzqvlkU7kAP/5HuqQ/AGzj+EjPHo2aqbSsVeneEepJ0d2YTqdgROPHwmA7j1AkxHmkhZffKh
 UyscXTGeE7MLLrW0rUgM8cl4xSwvENAG2yvx6J8o5L+r0aJKLTfqcJVIAFNCvlEoXQ9RQCNI5VG
 +7SGvIS3t7ogPAmvtgVBKG2OGkkzWcICReqoQxlkQsOgLulTe2/RpHofd/opADjp/sfHwqYJAO3
 iTm6w+G9aOtcGqW4U1PjjYPhO2KS7aUYgWaMLfG7w3D02k9hP74hilxmR5hYsvBvgzXNICIvITH
 v1mJvOuTA70wkMtaLH75b
X-Google-Smtp-Source: AGHT+IGdHO3EaPE94JiX7itBBUyOhlhUM/i4xCn5iFRCHic0HklpCCdG+K9TeacvSuDmszA7AsamyA==
X-Received: by 2002:a05:600c:6748:b0:43c:eea9:f438 with SMTP id
 5b1f17b1804b1-43db6247dd7mr145560775e9.15.1743517544904; 
 Tue, 01 Apr 2025 07:25:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeacasm201251735e9.23.2025.04.01.07.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 07:25:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 16:25:38 +0200
Message-ID: <20250401142539.4009844-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743517545; x=1744122345;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EEm9yh402ZsNnkzSWz3cKl1ffhDYF6GU27UM1Jzixcs=;
 b=RgDHCxpG7DZp0ncZwMXVwI61JvH++D+ViOITHcG4LnmntWKvRLYFt3TNhbRhGrclKb
 ufsFgOe21xp4M11fO5F2oktqyHogPfDRbgZaKX0wjMUlE+ZTYvQAYoTBLDrQynrjLMuU
 Uo0h1QPJE6uE47A2iivVEbB2J88OAK8w9Y5mQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RgDHCxpG
Subject: [Buildroot] [PATCH 1/2] package/linux-firmware: bump version to
 20250311
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.
Additionally, the files intel/vpu/{vpu_37xx_v1.bin,vpu_40xx_v1.bin} have
been added along with the corresponding license LICENSE.intel_vpu.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/linux-firmware/linux-firmware.hash | 5 +++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 637b06be92ce..df0888618c08 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d  linux-firmware-20250211.tar.xz
+sha256  b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d  linux-firmware-20250311.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -40,7 +40,8 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  93d681cbd8ef106f2c9470aa835aa4176bfb7010ba168e6b467db6a5b4dee024  WHENCE
+sha256  ed8d8c55a57ac653df71ed07c278b4ae2b82e39e4bbde548bb140fd663720cbe  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
+sha256  4a10165191a9ab82daf1539cab4242ac266eeaa1ad1d158d5d9699546966c139  LICENSE.intel_vpu
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e9c20339e17d..0c0a2d5c4eb3 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20250211
+LINUX_FIRMWARE_VERSION = 20250311
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

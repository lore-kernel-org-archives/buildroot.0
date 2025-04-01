Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C2FC36018
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 14:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A21760EC2;
	Tue,  1 Apr 2025 14:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjvI2l-XG1HX; Tue,  1 Apr 2025 14:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39AB960850
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39AB960850;
	Tue,  1 Apr 2025 14:25:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF63121
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 14:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E62B4173D
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 14:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0mdlCxBa1jS for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 14:25:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C5464013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C5464013C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C5464013C
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 14:25:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso61899455e9.3
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 07:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743517546; x=1744122346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bb69R/ldWliYyn2kizphTjjK8APWGBsIcmCjML4wrQ=;
 b=RIWlDM5XeBlHJUhUdlDBKQLfw270xeoz77NnPzYuiJLWvLxA9v/KRc05NIObDIuJ8f
 P0LM99YKPMBQxGlOUIpfNBbaU/G/MB2TUNXNzbYHwdN0ADBTdOlTLstIKSEhyY9LT8tT
 s+vBXmBLl0+Ht8q5jEOjw1+3AdLTc+Wiu5ZMRsf2OK5fVXFN6rxVMSLKeqX2L2TnNZsw
 RMUS2Yt/rgvjYM8JOmW1qPyYKWn/CcmuIQpbZK6GxJ60l/TdngMIRLoqg+B3MjmbOR76
 RkkhGJ3npiydvLceMFPoigd0trZ4ALTiLIqHlfNQH14xQgx/zFDmLdOp0Tdi+vjg4ytS
 vc3Q==
X-Gm-Message-State: AOJu0YzXnirjidPR/XMFbRQe+yayHvzgAf6iyexZSnXv0C28DDltJQgk
 TEBxhSOLM4davRJlRJGvEgqDT4j6tIO8xsZ96xRnhcZ6JtHS51f7t0eGV2cjyTzTmNPiM5BZRXx
 W
X-Gm-Gg: ASbGnctrhSP3vXEoTLjm3E15TD/jxik8A4nbpw/5aK8Q+IXzsRieyO9RdqUFhFhGfyA
 RACKzGwhCl74J/aTWBXGfK+ociVjkJXPyUoTqtF6pjmTfkgtRfhbaxLPGwXg+ce+oQ5hQeTTxi+
 72W+73E0xWPHiQEHP/t667AXaxHKkBM1LOwBBbiqpcALcs6fDE8eG0aXMcdCYR67I/RghrbPfRZ
 1Lq8mCQi38o1A+VF7qp/B9udZzgyX3uMzx8JqYNYYvY1XNrreQ4+kc6NLqbEqCpC2DDRo3B4uel
 xhlOcRRVVfSziPh2JhX3nuu++lIi3etEOve76I+DIvhVxl05lpLeThPV0HnjEk2xmoZ/oJW5+bn
 axyRkvlDyLQ==
X-Google-Smtp-Source: AGHT+IFRZEs8xZNFG5u0oeQN1HoyHKhH/eR95GYtiwzgDuYSA1ADPwuWHl0Cpw/0U13Q3Au1fopjJA==
X-Received: by 2002:a05:600c:3b29:b0:43d:4686:5cfb with SMTP id
 5b1f17b1804b1-43dbc6f7a2dmr107707115e9.27.1743517545925; 
 Tue, 01 Apr 2025 07:25:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeacasm201251735e9.23.2025.04.01.07.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 07:25:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 16:25:39 +0200
Message-ID: <20250401142539.4009844-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401142539.4009844-1-dario.binacchi@amarulasolutions.com>
References: <20250401142539.4009844-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743517546; x=1744122346;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bb69R/ldWliYyn2kizphTjjK8APWGBsIcmCjML4wrQ=;
 b=Ltx5IX8vcsUQBnL4oE9fkCHPbwlxo3Kg58Bt/j9HB8KlDMjltMNiGfhSx4N5oHcaYy
 cePbkPfdZ8pT5sOUvUhxCb+TWoRhXYbjUyPje1/uCmQBIq5j++uCkvHuPvSUseHiPAw6
 +LZ3POGJ172EFfSMNFYls2y7xN3Sct/IBViFc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ltx5IX8v
Subject: [Buildroot] [PATCH 2/2] package/linux-firmware: add option for
 Intel NPU firmware
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

Add an option to install the firmware files for Intel Neural Processing
Unit (NPU) device.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/linux-firmware/Config.in         | 13 +++++++++++++
 package/linux-firmware/linux-firmware.mk |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 2daeeb53b496..83da3676db11 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -732,4 +732,17 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RP2
 
 endmenu
 
+menu "NPU Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_NPU
+	bool "Intel NPU firmware"
+	help
+	  Firmware files for Intel NPU device. Intel NPU device is an
+	  AI inference accelerator integrated with Intel client CPUs.
+	  The full device name is Neural Processing Unit, but the
+	  Linux kernel driver uses the older name Versatile Processing
+	  Unit (VPU).
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0c0a2d5c4eb3..e5e1b32dfd84 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -932,6 +932,11 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
 LINUX_FIRMWARE_FILES += rp2.fw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_NPU),y)
+LINUX_FIRMWARE_FILES += intel/vpu/vpu_*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.intel_vpu
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

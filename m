Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A73E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 17:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB53403A8;
	Sat,  4 Jan 2025 17:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GubLoM6rAVmk; Sat,  4 Jan 2025 17:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368E440663
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368E440663;
	Sat,  4 Jan 2025 17:59:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B526BF27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A606074D
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVpFLnXTNYRs for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 17:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D7186058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D7186058B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D7186058B
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so94374655e9.0
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 09:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736013588; x=1736618388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A/Kt5vbJCxgt1ReXztb/qlLBYyYExl7frkpFxZoj+sA=;
 b=jojsIc+r3pxYuVmZ2/RLGvXEEHezUCu7NhNzsX4fSOF/biyBN1wNFMNxt1Ue19CIQi
 oTc7qKj7SL+yoFbcr+HcWT4dhx5AKDrFi4mksFjlFbM27Ql0/oaMBVpgTRgLW4JCH+Kg
 xdEVRzOMYr79Lepai13FjdrNU+xK2OmSCHAImrLgOGppe1hJQv5sIG5Kd9K0D6LvXfBj
 zVXSkD4xSLO0O8YOV40B48sJqzcOCU1n+hEmbYbErqOxb7DYfwb53keqz4+P0o7pVqmt
 +JLZ+pK5g+OfpAOxxABHG+C53DdbrS59xFrHtoVayrCkgZO1DIclcFxgTE7D+DGnV+TO
 ylyg==
X-Gm-Message-State: AOJu0YwNTXvl5acErsrpkMfGAKBW69WAA7k6l4m0lEd40v82LEno5Hrz
 EGpDwEkFcvplcDV2L+Gm/J+bqH+q6PprjZGOAvbbhtOC+qtuJUrosEPRebaJGU0pnwTMFkhM0Af
 E
X-Gm-Gg: ASbGncv93ZVMaU7knGCtZQ0mWOIVLphgitjChsNeyfSAqhRMdZiPua5R1oCvcu3XnU3
 4amPCQWM8lofk4VtpKaI5SG4QXxr0a5HFteN7tPh15B0xHbppkt+Y0zPmECod0pKORfApwWYkDM
 ipzBzxHKMkzy+dpEGvXpbes8v0J8ds2PuJepaIjSLGkwpJA6vUTJjS5n2soho562G3myQsLqZtN
 RDi0n9gbwim9NrkMj07RR4NqsBHXYUw9ADot/MSBKauP+y117OdW5rbZRH02re2k8xUrnAEFJ1V
 a1EZRitawClT/rWrwk+Vk/P/4h6s8rVM2oygEIBvz7iMaV1DaiGEbg==
X-Google-Smtp-Source: AGHT+IGjPYatfn+nzLEkJ6QoOkIzM8oodnRuMsU3SOh/dA9oA6IT+yQLbnK1FGjg/uflfb7caoVzWg==
X-Received: by 2002:a5d:584e:0:b0:385:e8dd:b143 with SMTP id
 ffacd0b85a97d-38a221eaf78mr48285182f8f.19.1736013588434; 
 Sat, 04 Jan 2025 09:59:48 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828bd3sm43030487f8f.10.2025.01.04.09.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 09:59:48 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Jan 2025 18:59:41 +0100
Message-ID: <20250104175945.916723-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736013588; x=1736618388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A/Kt5vbJCxgt1ReXztb/qlLBYyYExl7frkpFxZoj+sA=;
 b=hLd0MJEKsSyqH3tyFJhNeM6s11wZlD8M3RewEzO4eWLA3CzAfbjEikHMS6mlBY3QPg
 W5EBAK1LFpIJ0OhA542+UG7TA2IYBokcVRuqpE1Y96TaRCNX/P3aikPXWhy/gJjPHrty
 ORZ2atliuRC5gdUjTYeqO2yI/8OvppIT597Sc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=hLd0MJEK
Subject: [Buildroot] [PATCH 1/5] support/testing: test_fwts: bump ATF to 2.12
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since edk2-202408, ATF >= 2.12 is required for qemu aarch64 sbsa target
to support CPU topology information provided by edk2 firmware [1].

If ATF <= 2.11 is used, the boot will hand with the following error:

      sbsa_sip_smc_handler: unhandled SMC (0xc20000ca) (function id: 202)

In order to update edk2 package to a newer version, update ATF version
used by TestFwts to 2.12.

[1] https://github.com/ARM-software/arm-trusted-firmware/commit/c891b4d83578db25d24d2a8e3e7e419e65773ac8

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_fwts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 4df13b60f9..4a9c412d94 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -27,7 +27,7 @@ class TestFwts(infra.basetest.BRTest):
         BR2_TARGET_GRUB2_ARM64_EFI=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_PACKAGE_FWTS=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F38E77199
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 17:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9EA86058B;
	Sat,  4 Jan 2025 17:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxz2bx4se9QD; Sat,  4 Jan 2025 17:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA5346073E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA5346073E;
	Sat,  4 Jan 2025 17:59:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7831F2D
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3190810C7
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EpqjnPMM8Xj for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7414780EC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7414780EC3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7414780EC3
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3863703258fso8246394f8f.1
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 09:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736013589; x=1736618389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnShyQANfL0kCW/LTauDkavabSHtXPhm7mA3EZGqJW4=;
 b=WrHyut0H1dhL8NRH496tNKT7KcN53qxiMnFURLyPwb5sjKBvGBOKX0LcFwJGC+/wT7
 VSsIVAieCfrUkZtsh+w1d4ejZkjYk1LCc38Y+0UxW690De9DGwJs7QRMqzLTT2pVYtkC
 A278oXQesLsmP1efW4V/s+1hP8AoDLWiCqeFO5O+wh9RldPPjLAACltsjWYG7W+0afuo
 o4xDBrOgS8MsaRYqMXI+DW/vAJHixyrhxjVmd/5vAJq8IPSjwraQ22n90RTaCNLx7Gjc
 LRDfDGcSnbXhpgT7SLGj0dP7K1wNXZvIyRaD5f+DccaoE9TpShyMoSy8UmbtDdsghgks
 /TDQ==
X-Gm-Message-State: AOJu0YykmzSGDE+hwQkwoBsWReWTEmXZzkGv3SE1ffoIEXg2/54Wl7wZ
 vy4qc3piZtDYPeDDb9L3p00eJ7tWlHQAP30h79iI9TdQUgzWi03bGSzAKwxJITWRWHiALaEM6FO
 T
X-Gm-Gg: ASbGncvm/SEez65j7a3h7fDhdKEo0bOp256zLGTUTpLABDehAMwRG6Pz6ALFkN3/OES
 20ihyo+HTv1J7ZRnK/TOp0atj9xV2SMpAZvpJ5gunFE0vPoiHeRv7qyg88ESm2U+Dg4wPI+5lBP
 Nai1UBGAWKmGSaBWDXljldqnwqRgEAJ09siADzDxXvgG0hoiuyWp7mzBd/hRIRioC2zjviUo2Ey
 zLNa909QqmQpNXlYET1xl7QYTehtx9kPdAew+GHVz+d0LIWnWdRuqJqATAgJqDyjE/sjdAgPJr2
 PbCT45XzMGJxDwtY+ZcsLuUrUgdB/kc8olHyWNHd+lSYVfhBN+fFbA==
X-Google-Smtp-Source: AGHT+IEEKkLKHymQla+qEeL5Zy6+lbtHk3ku7G/N8aagRyrdJXKpRQJJRfnkiYixJN+OJBrzmuVxsQ==
X-Received: by 2002:a05:6000:2cc:b0:38a:6183:77b9 with SMTP id
 ffacd0b85a97d-38a6183805emr12618817f8f.6.1736013589045; 
 Sat, 04 Jan 2025 09:59:49 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828bd3sm43030487f8f.10.2025.01.04.09.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 09:59:48 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Jan 2025 18:59:42 +0100
Message-ID: <20250104175945.916723-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104175945.916723-1-romain.naour@smile.fr>
References: <20250104175945.916723-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736013589; x=1736618389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnShyQANfL0kCW/LTauDkavabSHtXPhm7mA3EZGqJW4=;
 b=3JJi4tGKZKw6nOFMeRh8vMhnmbSJnRc+xa/NUpNhdtmfVkcQrqRm+L8C8DvTz28xVV
 Gtk4hGTpe8XFbNQooNo72ea1fAom12Lna4IMDx3BUCKj0LlEai1C8/xhTN6x7xXY7TB1
 d4gpyHm9+VMnpm/rw3OjrStpZWAnkUQtij9G4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3JJi4tGK
Subject: [Buildroot] [PATCH 2/5] support/testing: test_edk2: bump ATF to 2.12
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
used by TestEdk2 to 2.12.

[1] https://github.com/ARM-software/arm-trusted-firmware/commit/c891b4d83578db25d24d2a8e3e7e419e65773ac8

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_edk2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 54a59089da..6403aaa653 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -26,7 +26,7 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_TARGET_GRUB2_ARM64_EFI=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

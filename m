Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F49DC3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95E982A8F;
	Sat, 10 May 2025 20:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00nyYsMIJ3O9; Sat, 10 May 2025 20:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CFA782ACD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CFA782ACD;
	Sat, 10 May 2025 20:50:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E877EE0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9EDD400FF
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-dbXVsVKry2 for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=johan.patrik.olsson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC06C400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC06C400E2
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC06C400E2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:50:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54fcb7e3474so1252725e87.2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 13:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746910239; x=1747515039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z+3N3AKIK3Ibz2dFX6UeT4SbN6+AwF8VNc5pxlBfNYA=;
 b=ZkWhMfi7Oj9q+DXK2fwF17/eo/LuJCqHw2ugpy2yIAa5wYD5QY71+tTmQ3j3wZJ+p/
 bz7wh7BHkQE5edpoGNJY+bAlXG4mchqZml/sJkqI7M2e+bMAlYRZu1k2Lm4Ugl5qbDdU
 6F0T6H8x4xYWotUL4z1mKrrfGfaP0tYhwAdpXh05n0BjE/FOlpRTzm/wLHd1EJU8TpI5
 GzicRcQ18sTodSmvZ0oAuxPxXwZhi74FWTJ+DczZ6P3RjCAYRF0lFBwBGQQBeXuer1Ig
 RAp2hnACVj02fdcVOSiiqI8jRO6gfutD9XTY0A0Z/pnKOoH58ApoCRGx6LTGd+KpkoLC
 kiSg==
X-Gm-Message-State: AOJu0Yy506dPMBUM23yoxiQfxqQY1GcDgKkCAc5yCwk6jLXkhYC0LD6B
 rw6NdB8rmMbew2PtAbkOIEGaMAxFhvpN8oYRGIs6ef6oq8q2odbgY6WZa0u7
X-Gm-Gg: ASbGncvrG5pOoCtzTmSOWAakatMkPUGnI3pQ87H8HGsZqYaoV2GCxHX0AuZN4KElzey
 p1/YqZWDV9QfFbuIsccOnmcvw9CHkELFKIgmiPrffHftbbf5/sI2TSntXAKSgSoCny8QEKMYW+D
 b7X+pn2F1uLzqwhEQ7KOB9UFZ96FwoHbdm6F4maFGdM2I+JDMsOTskv07/ps4GfSGLRnvkPXPQb
 hVH1y77U/gxYnfttylcgLMXWSs8jrbunY4T0oasroZoEpWGobFXJmLIVfLExRCcbjvuL5dYXR4v
 GOJgiZxE65YHBedqNNTB4g3wjGvXvNdSDIUzZrE0/bjWvX5HDAPKV0tTD9L6St1980gcejWDbDF
 5S5OE7KW30ftKJ1WKNFjLzTiK2WPMa9dj
X-Google-Smtp-Source: AGHT+IFOXjUK11DZ3/swIiYIWzC4UMtgfnlHeAOw3H9WLGqgWozCrs6uzBu5ibCVUs8My8Q3ToQqAg==
X-Received: by 2002:a05:6512:460d:b0:545:2335:6597 with SMTP id
 2adb3069b0e04-54fc67ec288mr2650792e87.50.1746910238870; 
 Sat, 10 May 2025 13:50:38 -0700 (PDT)
Received: from DESKTOP.localdomain (94-255-243-81.cust.bredband2.com.
 [94.255.243.81]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6b85sm817002e87.131.2025.05.10.13.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 13:50:38 -0700 (PDT)
From: Patrik Olsson <johan.patrik.olsson@gmail.com>
To: buildroot@buildroot.org
Cc: Patrik Olsson <johan.patrik.olsson@gmail.com>
Date: Sat, 10 May 2025 22:50:27 +0200
Message-ID: <20250510205029.456321-1-johan.patrik.olsson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746910239; x=1747515039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+3N3AKIK3Ibz2dFX6UeT4SbN6+AwF8VNc5pxlBfNYA=;
 b=mQbXH1ovvtOWXa/m6Ov54U8/NxSVkdZfZHMvm/QH9siIcQC8zeOlgl0Lr4QW9cmrpV
 jsmgkCIdQZF+rcp5VbLHe7OrHf5vmKREZLgKGuzDM7slx5CzT3B3NH+UW2+8UTcbEIsH
 /4wJt7zMhUZlkfq6zQkazLGAzKQHvvgLMP0EWUoxYCz1sbZaJ4txnwBnQXoCj38dAtj/
 4uE0tyy1caQ7KBjY2WmFl5wUWkOeMJ4qyqv8FWSKnR4n0NwpGORQ4cFVUMId4olRqyvn
 GhrcR0Umo4g52bKRsF3WGbIYN19pcnU0HKf6fxNVm5i1tzVgIdocPnca896T4+iWqH9c
 /iKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mQbXH1ov
Subject: [Buildroot] [PATCH 1/2] configs: rock4se: use Bootlin toolchain
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

This moves the defconfig to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
---
 configs/rock4se_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
index 31fc2c6ecb..a0fbf9b3d5 100644
--- a/configs/rock4se_defconfig
+++ b/configs/rock4se_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock4se/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rock-4se"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

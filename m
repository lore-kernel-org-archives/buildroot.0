Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB303C3ABA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 22:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF7E60F39;
	Tue, 29 Apr 2025 22:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyMi1flq6Ugl; Tue, 29 Apr 2025 22:22:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D65A60F3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D65A60F3B;
	Tue, 29 Apr 2025 22:22:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F413FE4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4E5C40939
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 22:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KAmgixwTdCk for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 22:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A436A40953
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A436A40953
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A436A40953
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 22:22:42 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso2849720a12.3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 15:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745965360; x=1746570160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=++D/65QPsOU/p0Mcf14vb6TotoLHiC0+8aYs7tTFxKo=;
 b=rQ5/XxKIj3G140qdjOniqfV+e23HIPzxa1i6DIw0m3crHOgSHfoapXECDxEQk+G08f
 Eh0vbWf9HpN9liI9TpG8LO8Ucu/TZV4H7otNom6R/MZO/h/j5tFZPOiGy9GwlkCpAKGX
 RBHF0Zf//NIXHxsXuAV6I9f66dGywGDUEZRMocfpnQ4iswZsweheooTrM3rXBPotzMMV
 /n9YCgip1u2TK8tyn9XrYTCSsJmXfdb8ORtU3VzEkzY15IRbeLAQ9e7Xze1lP/xv9c/f
 opALlwEG3/1LCiEWfvITeF66/9otUcpJT579LzUE2YsCCrS9WPmKI6Bb37Hr4EGh5fEl
 l44Q==
X-Gm-Message-State: AOJu0Yyz12jQn7PExGJfKuoaupZ/lkLalGEo3nhpWaj9X70ivhBuSMyO
 UsFZfnCQtNmoxoMpb314NeKTnBWYVFjOtHFc/GA2gfafkFOZe3Kp4smEVzwAw9ii9LEibd5Re31
 U
X-Gm-Gg: ASbGncuVaDf9UCUpJh0tP2i/8BbaRPXxOotcAlU3m++magQqaRq9fSpU+HS0VtC7jPX
 +gtCr4CuG0LVMh8vxZo300DceLHCSwZigyjwTVs7NIc3deHAV+KkZmcKD7YrQJXANfyDG9JGUyc
 Kq4tNythUImwKt3Aq1hNj6ZdWKoN7bN/tYXY14o/jCLZYGKQzOt5mLG/noWZE/Y2OwSv4Hu8Ss6
 CjijeQ5rMKs5IqacC9G/zeH9P8cB5ss/UllUm2gYaRqQ3jbjgAUFW1fj9NWRCBMdxOC7NTEAvsC
 atcfjE3Rd481gJuefONVQrKZxSx1jG8OFCFKsQnKNbmdhDZUleIoMgxmvRTT2frw2cneW5OI12v
 EuWoQmlsHQ52jv08lvkkxjCmW5a3dgxlwjZl1PcJT
X-Google-Smtp-Source: AGHT+IFfWeBccunyOXmPPjpLcGCaBSnl+nqx6ixQrPvlh0nqZ5putbUpG8O/sc50ZqHGVZ/VG8USmw==
X-Received: by 2002:a17:907:9349:b0:acb:8aa6:5455 with SMTP id
 a640c23a62f3a-acee21befdbmr21460166b.19.1745965360134; 
 Tue, 29 Apr 2025 15:22:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.22])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6eda7affsm841724766b.170.2025.04.29.15.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 15:22:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com
Date: Wed, 30 Apr 2025 00:22:36 +0200
Message-ID: <20250429222236.823478-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745965360; x=1746570160;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=++D/65QPsOU/p0Mcf14vb6TotoLHiC0+8aYs7tTFxKo=;
 b=i8R/I5trPrzmdyatBOJ4fxcwgJ+c9YUVZh6iuD5kbw2CJt8DhNHjpFhghsO+HmY+4D
 RKpaqFTFxcKXWcVxbsOWtD/oHdb73h1wRwXG+mc2cpyGlW5fGudddbHF4p/mUKNPYPsT
 4QE5aRkZmcErMFgRoquh8pGgqJq4D0i/UDDOg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=i8R/I5tr
Subject: [Buildroot] [PATCH 1/1] boot/ti-k3-boot-firmware: bump to version
 11.00.11
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

Release-notes:
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tag/?h=11.00.11

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index d9cb66cd6a27..571bbf121949 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  884c454b1a518e6d31304acb201493156685fb8ff111383c842bb292a1b35c9b  ti-linux-firmware-11.00.10.tar.xz
+sha256  f9e09b84e206d605a9fb5691a325dcd4a7d6a3e6bf70a69cbc169d1a5c617804  ti-linux-firmware-11.00.11.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index e04165edd1e0..117c0a9a5ade 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_K3_BOOT_FIRMWARE_VERSION = 11.00.10
+TI_K3_BOOT_FIRMWARE_VERSION = 11.00.11
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

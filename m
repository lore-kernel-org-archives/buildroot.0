Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD2C3ABAA
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8458660645;
	Tue, 29 Apr 2025 10:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-wpBrIJjX9G; Tue, 29 Apr 2025 10:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59DF60761
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59DF60761;
	Tue, 29 Apr 2025 10:16:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 666E0E4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63E7840504
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hs0TthHOlZqJ for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 10:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FCB640425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCB640425
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FCB640425
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-acb94bf7897so62064266b.3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 03:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745921769; x=1746526569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XvgH6VketGhIwxb+TU7WKM0IKt73oTmzBZxE5iTVWc=;
 b=tfoKuZTSsgcPRzNEgA60uSpmgMjaLNMuOPPEjVPKQMZqd0gRSv10bMcvQCp2kkiXpd
 dwM8zLg5t4T1GjDeFfHztrUMYvUXoyLaSxdIaw/RU55pdOGr0uv5XCiiIW7rQSDR2qcl
 2clnBpFeAPH6jpBCrsjMKVT+PXDbpJ6o7MjPqZRDl5HNR4GAVCrIrVnv2o9bkqC1eQo8
 nMfXCrafgsME64U4PpDUqim7gJcm4Tmab8yBQeJg2QEkBtMcusn9qh9neh0RjOJO6pA5
 KWKK2+pnVWNvuuyBL6T21mQVsHLcp152DxlgPYQCvvAoKWPJ9NDUI2abZMuHfmZWchQD
 du3g==
X-Gm-Message-State: AOJu0Yw0MeoyEhqUaZoTZSX1C2AHHDoAmmRCkJ7NA43i7laIwmbPwAjV
 JQiGoGbMOLdmVGfsTXfmyFFmF7xrLOAgnis8PtipPaLswa522Hq+3kcSwceej3QjxryEXPxiUGQ
 J
X-Gm-Gg: ASbGncscwvR8YLz6PN7cJbX03BmB7McmpxwQFDwHYUWMnyye2O41zqNf7F+5XkAb3xU
 P5phoH4k2tVVDTRNKfPUm9bmGbp9/ECiDfz9xYHud4aUEWR7VYu+iTmn6YCfeJMCeIc2QFefYIr
 5N9dzGtihHcpB0XkqyNsLq03oENsQcu4G3xhAOGt0XTSxbwAHTcG10SYcj+yq2PrtczVGr4Mm2N
 lfrjx0cvalxBLHGdGTm+hJaXHG8jwg+MkS9MD3zi0AJct2hIC4fCBwAWEa8hJYGo4LjQUciIwDi
 oLoXBcPoMfzQ/iFgaAlBKIfVGQo/dKUmrA6gahe3ZnNcSHioQjqWX1jowrSGKJOL0xh6hmqOKQH
 VKkdJOoz3usAioW9xhAxckWxuAs7TLiKDoXSUgxq23voWePYLj/+57iikB0OIeeYVsZrDI7bXtt
 MqBkB3
X-Google-Smtp-Source: AGHT+IH583AWhpqSXlsp5h0IoArFMblo7UPMk1qYm9xNk39EufeqwN3DCw1yMDym7mzEYxWp7bokXw==
X-Received: by 2002:a17:907:da17:b0:acb:583:c63a with SMTP id
 a640c23a62f3a-acec6d2e05fmr80362066b.15.1745921769539; 
 Tue, 29 Apr 2025 03:16:09 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2001-1c00-8182-4700-3d78-0c42-7f3a-1345.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:3d78:c42:7f3a:1345])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4f8835sm768254166b.67.2025.04.29.03.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:16:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 29 Apr 2025 12:16:05 +0200
Message-ID: <20250429101607.864604-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745921769; x=1746526569;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/XvgH6VketGhIwxb+TU7WKM0IKt73oTmzBZxE5iTVWc=;
 b=UvoTWnGUtvdKyhdEn0cdWEvM3XIFp5Ob4fx1Yz4tcH51l4o01XcNh8Mm7ydO/WVabr
 iv/UzwUM4S5b9ac41QaLdo4+hQOujvNLxXw12VUkA4pzzq1DQKdZ3cLnflIrHSg6rCUq
 n0iI0xJXapXsCfCiThrBSr6Ehp2Or41+zhrl4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UvoTWnGU
Subject: [Buildroot] [PATCH v2 1/3] configs/mender_x86_64_efi_defconfig:
 bump kernel to 6.12.25
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 configs/mender_x86_64_efi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index d0e0d8a364..2e124ba211 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.49"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.25"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

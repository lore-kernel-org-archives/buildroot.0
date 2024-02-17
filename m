Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230CAC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E986D83D5E;
	Sat, 17 Feb 2024 16:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BozlcQat8Kt; Sat, 17 Feb 2024 16:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09BB583E81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09BB583E81;
	Sat, 17 Feb 2024 16:03:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B175F1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0B360BB8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4VCDoCm3cvd for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8BA460BE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8BA460BE4
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8BA460BE4
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563fe793e1cso1740924a12.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185798; x=1708790598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SdofeQClaLH7s3qXb5EUxtzY+ahnuQaS1Z3lLU9iq+E=;
 b=LtIruN7yVbjZkxLmY0voYG7bpHOZzXRLzQIGEqL8QoRWa19x+qS3YtyPV3jBIfbsVD
 ONDaMQF3CoFRkUMaxD7x0WI7UfWBOInL3593Jqa7iRrkBZiEDjQGvHg1pQznsOLLzr6L
 PlnFNyNkM7ipE49Ni8wWeVpY6jNZkaGSvYc+UHLUxijG+exPuDbMNx2+Y157CBJtgMRQ
 d3eUD7anpj3q5SAyMq9yPhU+bwDdfwyyQFSZW1njya63J3s1O0FwFCwArq5H7YWErzgu
 kb5jdgVeCY08SL6NpgFHQymRCxv8EFSZPr32ZuXBMTvoFYmJdNNNmW+Vq9BaHhQH9NIH
 8MKg==
X-Gm-Message-State: AOJu0Yw2iqw5pQ271BubVHIeRV7flwu52hTy3dv+qOTiqqa/GUwZD3Ny
 ngH8w9euJXdZqPUVDkW4Eqhde9qTVnGEcNMILRHKtv3v8H9R5RYHGH+cNIGGOTBkOMzc0Pg1EUj
 bJ3A=
X-Google-Smtp-Source: AGHT+IFmr8qLzLt/I/RjF9w4wZCpf4m+7GeRaVSefLwwBp5ifRgk09NZsadwuGIAxIU0/ulEwNmMTA==
X-Received: by 2002:aa7:d812:0:b0:562:e26:90ae with SMTP id
 v18-20020aa7d812000000b005620e2690aemr5225254edq.6.1708185798753; 
 Sat, 17 Feb 2024 08:03:18 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:40 +0100
Message-ID: <20240217160244.1320482-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185798; x=1708790598;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdofeQClaLH7s3qXb5EUxtzY+ahnuQaS1Z3lLU9iq+E=;
 b=lS242yqogv9MSRugWw6NaX6ki+njUirc2yEqkj0/VL+Qb8ePD+CnOAkZVW4u4hlPbY
 vH9mbiC4i5JGxkD+sv03pchJOLX2/diYcnsBqWjwaCAQi6YIv1rq1bsariZ5Xfa4goPg
 UoCVcuKO42vJw/PYCPqQLYDniuqKK8ZxXVmiw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lS242yqo
Subject: [Buildroot] [PATCH v4 16/20] configs/ti_am62x_sk_defconfig: bump
 Linux version to 6.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4
- Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 to ti_am62x_sk_defconfig.

no changes since v1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 193301c8b941..4de39fb897fd 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

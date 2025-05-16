Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72137C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 12:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA5260E22;
	Fri, 16 May 2025 12:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aa0dWubmXdfr; Fri, 16 May 2025 12:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8514960E3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8514960E3C;
	Fri, 16 May 2025 12:53:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 796F61AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AFD283AD7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yn6Fj1w4Kvna for <buildroot@buildroot.org>;
 Fri, 16 May 2025 12:53:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78CBF83ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78CBF83ABC
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78CBF83ABC
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab7098af6fdso24960266b.2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 05:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747400015; x=1748004815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yE4mcIkDaOCM7eqQEgOCqF5TgSg/IymJKOpOSrcN2Qc=;
 b=f6ZYguZSTZ/y16YnEgYDdzJ8qLYu9CvU0GaBRhQG06LgjcX6dg1n5NFgeonTXJggzq
 56sWdotM9feBNNqRe1XhtejOkPEL2ZUQEZIo5jTnRzf48d8ccz8tuNDu1K+x/275pCYo
 KZ6syfIZfCClvObbDoMjldUjPLCNSv7viql4eQRxbqlJV4/WfNqmgCTaZX7f3XKgYwKZ
 ax6lCkftzraddFp6O9SJZQpgfZa1M8Di2zk8ZjL82j1z1Xj1702AiFK20kXmMppUQayK
 lLWNu1/uxaG2Cn9widXCW0QRgkG61ZueKPsYKFHRqeRi6jLdqStjPzS/Sisg2CQ1BhiW
 U9Kg==
X-Gm-Message-State: AOJu0YwqIyeDGBC5BiL/6JiETji5FraJVuVMk/urwSgqioG1gSexs/b9
 pQYrLStHMHvfjMJDCT1cAiztyDQCpdK4jnn/JQK2/nHr7EIvMWBv+U/CAdbMpqVG1PYjyfUXwUJ
 2xBdLZYM=
X-Gm-Gg: ASbGncu8qZNnW1JIS3Lv9WZ9B67t0CBjFt17VHiMwE3JSt6PyfAs3aEoSU7XWozkNiF
 BZM863uZeGfb4JrEzAHghxc8HosAdc/AwnDkWzKGI9DOAzJtmg5Bq9w0f36SAvzHXmMc6/PIG0Z
 mdV6+QVSDqakQySVT1DxUXVuyfY/bN0gcbz7voabdcWohA4vABE+ZFuJJatNp3N+QQdJB5DFeSr
 Z/6EyZCWp1IDZznXfc9VycVtMFQyCwwRNwIfHv1TfRNyfgyxiDfm4frnI2JWDt7pKqVrf02y24n
 yiiN+7gV5bPWnm+A1AvuDoUdLDXB///WzUrvphecFVv1zXtonhmpH0wTt8DXSH/ab4L3al+wdlB
 D930Z0wvDjP6my8NRodOY3m4u2bQ+RxlVFFa2FnpVO3hWQbcfLqpxUi2PFF88amX5KA8WZQydqc
 NsD3OChUih2Jvr6K/zdzgy
X-Google-Smtp-Source: AGHT+IGUAD2NwJwpH5Lgu3TppEw9+rr0tLpIVNHil7Qq4jsliGyWAC3fVXGHIUQdUGjs/jsyrmSGzg==
X-Received: by 2002:a17:907:28d1:b0:acb:7dde:d88f with SMTP id
 a640c23a62f3a-ad52d489a33mr100510366b.5.1747400014960; 
 Fri, 16 May 2025 05:53:34 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca5basm154206366b.161.2025.05.16.05.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 05:53:34 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 14:53:30 +0200
Message-ID: <20250516125333.3681798-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747400015; x=1748004815;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yE4mcIkDaOCM7eqQEgOCqF5TgSg/IymJKOpOSrcN2Qc=;
 b=XeKkhnU6KWfyJyWFfFquNCUJR5fJbl7iDLPjN5AmE0Tva+dBwTtVCJUu7wCUukT8f+
 7IuJXRM3bDL0kHopyh0Inld10b4Ov23n3agSjLiLJRXmIg/W7lhhcq2asatu785a1gvM
 0VsFnyn8hbj1YQRt95BUW9LXksK4pVnhBFIU8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XeKkhnU6
Subject: [Buildroot] [PATCH v3 1/3] package/mender_x86_64_efi_defconfig:
 bump kernel to 6.12.28
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

linux.conf does not change after manually checking the output of
`make savedefconfig` in the kernel source directory.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: fix custom headers version. Update to 6.12.28

 configs/mender_x86_64_efi_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index d0e0d8a364..219f02839c 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -1,5 +1,5 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_INIT_SYSV=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.49"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

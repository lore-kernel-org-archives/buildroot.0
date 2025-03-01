Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3CDC021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B7742F60;
	Sat,  1 Mar 2025 16:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmqpoZFaK-Cw; Sat,  1 Mar 2025 16:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9713242F66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9713242F66;
	Sat,  1 Mar 2025 16:42:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5248D182
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 16:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CE4E60A9F
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 16:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDbY56y_Jb0H for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 16:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A136A605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A136A605D0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A136A605D0
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 16:42:31 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22398e09e39so3213085ad.3
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 08:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740847350; x=1741452150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ycTSQbDoC7JOb0YPa1JUKgd46ZoKv424vnNSD7TLIhY=;
 b=GPJx+e/qJgxGP076PLyits4ZnCL4fxtb+Oq3Vf0tSzlULtNmEOfphUXjv/AQOZxvax
 XMo0Cf++KOjNBSu92CSWRQpO/Z3Xil1U8y2yh/CMxygPZ0qY6cviB4iQMbllOXDt0qsK
 PMCtM9ImtJgAscxCGpmwqVofrCPyhZDKDuNiWAmyz3C2hbk7enYHu9hicc8K6+btPllc
 j2O5EJP0i0j+z2VEqhPUpNea5Mj4zjLGvNc4FHDJ4GACl0IYr2isu5sMkZaj2uXTNRQk
 RsgEzpd8NzRktCP9MTqP1vpKbH2PNYvHNqr/RK9zWizx75Ik1TUI6hoCwVDkZtRUUElr
 66Cw==
X-Gm-Message-State: AOJu0YxYdFzM6G9W86+A244YsNWuE94/EHWNQmSJvc8fZ/PHklkxQLKX
 OcdJ/OrN/J8Keoh125Z0qAyzO5Ghc9OX51vgk1nUPmXaLALnt6pItcfMvw==
X-Gm-Gg: ASbGnct7ftAKFoc88DG0I1e6zmcA556ofw0SPDpjPutPkRPc0Mc1HCu6DJz7EVLorjb
 7XkwJQ5iLxfiD0VO8W1Qb/UOoNUun0nsYB5VS6kPou4VirsIZdt0ZvFBDRSEom8sbSp9iJIXXGI
 KVapVtz7LwvnoYrnwGVkzRdtp2OBWEt7xm+UwFtqqaCp6huGDh9v1JM5E3MWjluL893uybR2lX4
 z0HmIWQsmkXvCn6p0bDsC2SIGaXxRYpXKvYxJ5BQ4+BtjmDHFB6LzcY6dXkWuGjZjofS795raOp
 YTj+PFk97AWzEMzxYVd77cruyoKzZFv3s0fFWbC7a60WbDR5Ly4A4YaXqQ==
X-Google-Smtp-Source: AGHT+IEoFNjHm4s3UOJT4RNQIDtwuIgHWAdxR6H1aJVWepF1jjeJehOaxbYYrtSQBjY12XjhGxkeyw==
X-Received: by 2002:aa7:88ca:0:b0:732:288b:c049 with SMTP id
 d2e1a72fcca58-734ac3309a5mr10926123b3a.1.1740847349866; 
 Sat, 01 Mar 2025 08:42:29 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b45f:8385:7e56:7de])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736387b2c1dsm1469345b3a.64.2025.03.01.08.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 08:42:29 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Mar 2025 13:42:15 -0300
Message-Id: <20250301164215.623958-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740847350; x=1741452150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ycTSQbDoC7JOb0YPa1JUKgd46ZoKv424vnNSD7TLIhY=;
 b=KfOvLzNht8fBXoWJBMvVUectj2/fetJ+HTugTerqPZVJOXbO5w8kLK0dRQ/kY9qW6E
 j1kSgUGGeiZGj1VyXoARkg3QOFYqyuUhI6GQyLyT7LlSvUsboPpg/8+joa+i7n8a9qfi
 V4lpNHB0OA0A5WymIc7xzVfLqkboyBhbZS2fVYGuH72sc8DN7/PeaOOEGCzfXyO8+9UP
 ucUVK/itR2R1tnAH6//hEmwti+pwJAmCuBUqg4xtQf5S97kxz5RCB7Gl1YnOHZq1pxKO
 jjtUtqx4/k1g90Ql0Aewq1JO21dsde1/QGLK7jAulUvJy8LxrAeXIy9mZks+I2Bl6CYT
 /pLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KfOvLzNh
Subject: [Buildroot] [PATCH] package/freescale-imx: Forbid DDR selection for
 i.MX93
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DRAM controller on the i.MX93 does not support DDR3 nor DDR4 memories.

Forbid the selection of DDR3 and DDR4 firmwares on the i.MX93 case.

Fixes: 1ec956130d6f ("package/freescale-imx: Allow firmware installation on i.MX93")
Reported-by: Sebastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/freescale-imx/firmware-imx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 17c10039b2ce..0acc235e0a6a 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -77,6 +77,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
 	help
 	  Use LPDDR4 binaries (i.e.: lpddr4_pmu_train_*.bin)
 
+if !BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 config BR2_PACKAGE_FIRMWARE_IMX_DDR4
 	bool "DDR4"
 	help
@@ -87,6 +88,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR3
 	help
 	  Use DDR3 binaries (i.e.: ddr3_*_201810.bin).
 
+endif
 endchoice # DDR training FW
 
 config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

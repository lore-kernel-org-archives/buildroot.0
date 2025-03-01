Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E16C282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286A56088B;
	Sat,  1 Mar 2025 14:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pg4OYT5N4x9s; Sat,  1 Mar 2025 14:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3835D60AE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3835D60AE8;
	Sat,  1 Mar 2025 14:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB04E68
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7CEA4F03B
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4DjvWqBEi6f for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::930; helo=mail-ua1-x930.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FB4640C16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB4640C16
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FB4640C16
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:26:54 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-86b2d91997eso2594843241.2
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839213; x=1741444013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nnyne2dfhOqlPrR4b0vF/Bkq0WKQ823WPqN9MHDHR94=;
 b=L2koqrbdF/7jYJfLh9z7RkpMB03TItiS+UEPFBWjsqd2ejFGfBNEoh/sbhcOWiXuRB
 8vDZVWwjNuOjtVzrrUl7iLIy43dNRqvGFzJT+demsMBfSGeKXiO8a34Ft02zzUlrTkes
 44WMwI9a8kIYd+BqU/CWKhH2vMw14ZsEr6k5XSjDFncnUT6QYNvVj2nuu3Med/F2B3eD
 KVHRj306yUoA9T0FFNeXWvd+M4wgh0WcdhwEo7lYisxRktqrjJQ24AccBcOHEQk5LYNv
 XOQQ617CdnBB0WP3HY2HniF9kBPGNBdwTzUeGBo2+wVA/h2SgrRGd+b/Kr51E9pwdjTc
 SMew==
X-Gm-Message-State: AOJu0Yy0+bnV5iSaGmvAb929cPLM0BDCQmldITZy7lowVI6uSkycbaJr
 6nO1GyDZXSaj8BwCl/vu9ph4F8pw06xP7gCyuAdR6Gs0th5vGupsGun1UU/7Rio=
X-Gm-Gg: ASbGncur99drbRcBLToJUUlDqjBzvMYZlS/+7kXr16Fvo/2m1KJwzTqi+czgk5UYjgD
 qlOjewswxGA/SrNmIEcw+llsg6xBRF9lF/yZmtiWif8eyIBtBw6v2II0gLthqA+BXa02Zx5GEuN
 OYNDu2W+rJ5hWgaM+J1vb3cFi9uW2Mgnn5ruQTxwh8/QQYKyTQVpb/cZU7d4RsFTw3vgOpZcoSS
 sHSOFnk+s7FEu6Q7lhZKOM0pwjeM7ATl67JdalMGZmMsr07XbjADa4sxC1o4jXZLAsdQt+O1emL
 bP4nCUl0SEJj7fHR/jALOySzN9mMjfepHI1CwCXLFH0BIY0VG38Bjur5Ky13qJs3tA==
X-Google-Smtp-Source: AGHT+IEzSv/dCgbsWKs9bqExKYb2Vkl6deG94Qkfqs5LCqM6iqiMvOr/vW85Q24uxc5z0zhCGMjfVw==
X-Received: by 2002:a05:6102:5789:b0:4bb:c24b:b61a with SMTP id
 ada2fe7eead31-4c044d5c5edmr5540978137.19.1740839212790; 
 Sat, 01 Mar 2025 06:26:52 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:51 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:08 -0400
Message-ID: <20250301142619.72570-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839213; x=1741444013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nnyne2dfhOqlPrR4b0vF/Bkq0WKQ823WPqN9MHDHR94=;
 b=ilIh7KVQkVP2v2MyUkUkpKzeeenDMHaDjN/wVsnK3kEaTSA3iA+iqGfzUmBmAiTXGK
 KEMKj0ap+XziLh7mAHwAzA1JnFMzYQS8Un+VwaGjFzE4oCcYleJDb0wsKPV5mkXm9AUs
 cB2rg2p2yUCBZ3B8k6oUF/pZvD7IwThaRBPDr/6E2yQXCkOhKzh5Tj32y6SrDXSnHib6
 ljyghePvFoJliWZPAuKG1THQKyep6fJTb7QVe1PEU0nW+T3W2NFmLkFLUx4UJ/xb9FC8
 iXYANY9rGIkvprao+2QVptmsjLKc77YfZ2cgLH3Fs7ztZznzWL4yIn/apUimxpkStPuu
 JxIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ilIh7KVQ
Subject: [Buildroot] [PATCH 00/11] Bump freescale imx6, 7,
 8 and 9 components to lf-6.6.52-2.2.0
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

Bump freescale 6, 7, 8 and 9 boards to lf-6.6.52-2.2.0
(u-boot, ATF when applicable and Kernel)

Gilles Talis (11):
  configs/freescale_imx93evk: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx8qxpmek: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx8qmmek: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx8mqevk: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx8mpevk: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx8mnevk: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx8mmevk: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx8dxlevk: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx7dsabresd: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx6ullevk: bump BSP components to lf-6.6.52-2.2.0
  configs/freescale_imx6{dl, q, sx}*: bump BSP components to
    lf-6.6.52-2.2.0

 board/freescale/imx6sabre/patches/linux/linux.hash          | 2 +-
 board/freescale/imx6sabre/patches/uboot/uboot.hash          | 2 +-
 board/freescale/imx6ullevk/patches/linux/linux.hash         | 2 +-
 board/freescale/imx6ullevk/patches/uboot/uboot.hash         | 2 +-
 board/freescale/imx7dsdb/patches/linux/linux.hash           | 2 +-
 board/freescale/imx7dsdb/patches/uboot/uboot.hash           | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8dxlevk/patches/linux/linux.hash         | 2 +-
 board/freescale/imx8dxlevk/patches/uboot/uboot.hash         | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8mmevk/patches/linux/linux.hash          | 2 +-
 board/freescale/imx8mmevk/patches/uboot/uboot.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8mnevk/patches/linux/linux.hash          | 2 +-
 board/freescale/imx8mnevk/patches/uboot/uboot.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8mpevk/patches/linux/linux.hash          | 2 +-
 board/freescale/imx8mpevk/patches/uboot/uboot.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8mqevk/patches/linux/linux.hash          | 2 +-
 board/freescale/imx8mqevk/patches/uboot/uboot.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8qmmek/patches/linux/linux.hash          | 2 +-
 board/freescale/imx8qmmek/patches/uboot/uboot.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx8qxpmek/patches/linux/linux.hash         | 2 +-
 board/freescale/imx8qxpmek/patches/uboot/uboot.hash         | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx93evk/patches/linux/linux.hash           | 2 +-
 board/freescale/imx93evk/patches/uboot/uboot.hash           | 2 +-
 configs/freescale_imx6dlsabreauto_defconfig                 | 4 ++--
 configs/freescale_imx6dlsabresd_defconfig                   | 4 ++--
 configs/freescale_imx6qsabreauto_defconfig                  | 4 ++--
 configs/freescale_imx6qsabresd_defconfig                    | 4 ++--
 configs/freescale_imx6sxsabresd_defconfig                   | 4 ++--
 configs/freescale_imx6ullevk_defconfig                      | 4 ++--
 configs/freescale_imx7dsabresd_defconfig                    | 4 ++--
 configs/freescale_imx8dxlevk_defconfig                      | 6 +++---
 configs/freescale_imx8mmevk_defconfig                       | 6 +++---
 configs/freescale_imx8mnevk_defconfig                       | 6 +++---
 configs/freescale_imx8mpevk_defconfig                       | 6 +++---
 configs/freescale_imx8mqevk_defconfig                       | 6 +++---
 configs/freescale_imx8qmmek_defconfig                       | 6 +++---
 configs/freescale_imx8qxpmek_defconfig                      | 6 +++---
 configs/freescale_imx93evk_defconfig                        | 6 +++---
 45 files changed, 68 insertions(+), 68 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

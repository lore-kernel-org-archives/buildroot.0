Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5527BCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 049B540BF8;
	Tue, 19 Aug 2025 18:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWLfC2Ka8vXU; Tue, 19 Aug 2025 18:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A5240BB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A5240BB6;
	Tue, 19 Aug 2025 18:15:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2BC1E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8C3D80B10
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ev95R34U7qQm for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16C4080B05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C4080B05
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16C4080B05
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:14:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134533so1062939a12.3
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627296; x=1756232096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GFSdUTZhK90Rbiw6OqLqV3PxJ6uCYGIlH7XS+sWUsEg=;
 b=FhDS2v27zHqBIiFFMfchqQ9YyOywGaAsKLDjcVPCMtVpxU+0sVh8xtNhEsN0Hzp5vD
 7I8BMc16j4QNFVokAVAcVWvo2eBYwEjES0qPjBesH4M0Kd7dtw/bbNWbgFXBGNUR2BdW
 8RsYfG1DQ/r18ccDX0IZBJLBQ6sljFoeZNN5EGnv45geKdsxCSmRRedf3nOpvLLr5xuv
 0JiIev92dkcoG7eBb7ExU1bs+u8mYQloN93fdgGAPw1z+x3E87+PRXdKy0ACIzsLMvYi
 2Uf9TjkzFel2e8tdiW/koIv8DaK/9wVXvuGnZYWi/8Ji5ytklIJ3gNq6zFoMSScJgq9S
 3pRw==
X-Gm-Message-State: AOJu0YwQ3ztVx1tkrcXkOUIcyBBM6Dexx8DLWbhHvOy8xOy8OHOX5njX
 /uk7vJZNRCyMex7qaPk2ovzg7PpP3LgTcioFpvL4z/JG9q9XIpLWwb5jvUz3sOPvzaN+Xd2tBxa
 Z3tzq
X-Gm-Gg: ASbGncvZ9/BGnWa0GN8XySN6vS00HX/2lZy7whgPAn8G8DN1zw8+XE8IAEhsw3aJ7Wg
 VyVKexoHc/xcPRaaPDVO1pnrt5zLaQzz7QtFDVlhGHNKGeYzxov3QT5BbqFUHv4jBGZaxUPT0E/
 0XlZmzZ/N0UyP5k8ou7eAxyncpBReK+6TtRwaYDa6SSGgfAggMAGxXo4o2mWpQvrn+g1qorCyII
 arY0eqUquN7JYvcA4ebruzsYMRa3lGtASxXMgpG+5U/DJdoFuWGFr0TkZnVPBUHKByxg9QblbWN
 DWWAsSyUe5u+9wdP/2OWx+g51WN9IEAflbFEaY3yaojNoTDPCj0grep6GDsp65W3RY1KkJa5krI
 tMSyDjlpkpxDReaY3eOjWAnWwFHakoYCdUsJfNbqSGbCYcPKrOYyj5swz0fjQoljLvljqR1NPKy
 qZ7uLMU+Wmux00J99tKPNp
X-Google-Smtp-Source: AGHT+IG+/JM+ugi+BhUA4EzaESLl0F1oqkH1ZEDPcJL8Umh1yJLdV0NsogPh41kGB3qY/NkWOl/5iw==
X-Received: by 2002:a05:6402:2110:b0:615:684c:c2d6 with SMTP id
 4fb4d7f45d1cf-61a97627e08mr235250a12.22.1755627296509; 
 Tue, 19 Aug 2025 11:14:56 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (mob-31-158-159-104.net.vodafone.it. [31.158.159.104])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f876bsm2112245a12.13.2025.08.19.11.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:14:55 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:14:45 +0200
Message-ID: <20250819181451.3012126-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627296; x=1756232096;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GFSdUTZhK90Rbiw6OqLqV3PxJ6uCYGIlH7XS+sWUsEg=;
 b=UGswG1leZR/tNnoWJUayHPi9lTkcqnWAf8lzhP6NqUaPLVkCT+3KIDY4QgSEqWJIsq
 5UoknqYupj2EjoRDSI5B7hdhI55VhVtIDFKYyPunhLE4Vo+PeOiSa4DFdjcJrn3fjQ3U
 ca6IwLVytkvPrfzxO4xxEOsaE/QFIRxgyItbA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UGswG1le
Subject: [Buildroot] [PATCH 0/6] Update Engicam boards
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

Migrate all the engicam boards to newest kernel and uboot version.
This series should fix only the building issue and we plan to test
next week.

Michael Trimarchi (6):
  linux: add missing hash for linux 6.12.36
  configs/engicam_imx6qdl_icore_defconfig: bump Linux to 6.12.36 and
    U-Boot to 2025.07
  configs/engicam_imx6qdl_icore_qt5_defconfig: bump Linux to 6.12.36 and
    U-Boot to 2025.07
  configs/engicam_imx6qdl_icore_rqs_defconfig: bump Linux to 6.12.36 and
    U-Boot to 2025.07
  configs/engicam_imx6ul_geam_defconfig: bump Linux to 6.12.36 and
    U-Boot to 2025.07
  configs/engicam_imx6ul_isiot_defconfig: bump Linux to 6.12.36 and
    U-Boot to 2025.07

 board/engicam/icorem6/linux_qt5.fragment    |  4 ----
 configs/engicam_imx6qdl_icore_defconfig     | 14 ++++++++++----
 configs/engicam_imx6qdl_icore_qt5_defconfig | 16 ++++++++++------
 configs/engicam_imx6qdl_icore_rqs_defconfig | 14 ++++++++++----
 configs/engicam_imx6ul_geam_defconfig       | 20 ++++++++++++--------
 configs/engicam_imx6ul_isiot_defconfig      | 20 ++++++++++++--------
 linux/linux.hash                            |  2 ++
 7 files changed, 56 insertions(+), 34 deletions(-)
 delete mode 100644 board/engicam/icorem6/linux_qt5.fragment

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

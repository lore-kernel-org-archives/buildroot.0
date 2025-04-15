Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB1C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 14:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A90605D0;
	Tue, 15 Apr 2025 14:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3NQhcJKM-_k; Tue, 15 Apr 2025 14:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1753060767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1753060767;
	Tue, 15 Apr 2025 14:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BBC3200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CB6E61190
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kj_NMwNMvHck for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 14:05:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B157B605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B157B605D0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B157B605D0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:05:23 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22409077c06so73553865ad.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744725922; x=1745330722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZSXMLr3XCx2CLiKjaHLWat72ddvAMVURSnEArEHaSCQ=;
 b=sFzZQZllGZm2idhUDUQa9IK4DkXwA5rBy0VtSHF2RkqFVKwhLE8QEy46FUmAg0bez/
 eFPrPlpxoR8Wt630jlJGFzN42RLnqzeVTduVhaxTA5L0ThzXanqGZh2lI4cs5JTgABmB
 5VnJmC14PRgjkjF7drz/eICkUovoGaDRFBWYryixToThxrVnKWZLcyUUK71HOE8Tlldh
 rcTG0hUS5ePiYC/WhTw/k5epjgSYrTn2dCMv8xWMs95eW+Uf0DDqRbYRtZqAA8oQUQKU
 hBPzwieNWWqvFkeBzjiobY8raPN4U7kQ2zAf2tQIJ2MKh9xFktb8b71daYJP2i8l4huc
 Z/OA==
X-Gm-Message-State: AOJu0YwF2FVdGiPddrpAmd9Bc4GDA5xTStcyExL+JeKCNZCWrkR8+FMV
 aJcTN7/72eUHNGTfksgB1FF1CaJ7K8Iv6cyrgnYSpO+kp7NywjGz4oCUvg==
X-Gm-Gg: ASbGncvpVLN7aVlh5eCGgXHnxm9HzOSTXF1q5ICIAjpiH1nEqlnL2Ufo5dVAe3PBxvG
 OEtiuSoS0sPyrt+lLa/V4kOFLwP2p92pBTmq7pIEzDPNUdLKlM1ga/YwG/Que2yYHpp37Xj7d5I
 lr3VnHALJxlGMsBRaV+i/uWoOabEWKFkknn4i/AV8XTzRf9x6T+y2xirPwvykxeUBszDF0/5QzN
 ugWP3zNNFgn6LvqynVt9xJllxgnlB3sTfSor9pZHfW1XrEsPcMCJTfCl9uikLPl5egJaLl4EZr6
 YtVtjPmWEr9YqzMhoF5PyA==
X-Google-Smtp-Source: AGHT+IGpMRGPplXee5sYIwdI90qeL+lMQZT7RkEFQs2zYlkHrBcPQpPCyD/Y+TyRRV4C1zUE15P+mA==
X-Received: by 2002:a17:902:ea05:b0:223:f7ec:f834 with SMTP id
 d9443c01a7336-22bea4bd7damr242241995ad.31.1744725922434; 
 Tue, 15 Apr 2025 07:05:22 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c93ad2sm118043735ad.115.2025.04.15.07.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 07:05:21 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: Lance Fredrickson <lancethepants@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Dimitrios Siganos <dimitris@siganos.org>
Date: Tue, 15 Apr 2025 08:05:18 -0600
Message-Id: <20250415140519.1939298-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744725922; x=1745330722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSXMLr3XCx2CLiKjaHLWat72ddvAMVURSnEArEHaSCQ=;
 b=fj+IvDWHw/E/UgBiTJUyec+Iage5QSEbRbDhCfOsZ+csYt1vUXQfz2DvwH8HeM9JxS
 kgtXW8bv6x92Dh9sK1HbPcsOc9d5LMpZ0GAJX3+MzPZ9OhC0lbuCIR3+17HuCyOozxXi
 l1+hAZtTgi94zCYoWl8aWLPFEDiy312t54Bkbts0RrMuwODTdPZ0gZJIMg0v4Zu7karM
 POgRSH6OFMH4zlSolZm6mFsNo+IOGHlT5JSdDkASV4Zz1COw4OMG7y6wV8ByyONuKIgD
 kaBShgw57cb2RZzCBXlp5cw7wr6j5jtPxOvssIQn+GhHwI7hlCk7nXkapQ/N4+xQxLYB
 BuMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fj+IvDWH
Subject: [Buildroot] [PATCH] package/wireless-regdb: bump version to
 2025.02.20
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

From: Lance Fredrickson <lancethepants@gmail.com>

See release announce:
https://lists.infradead.org/pipermail/wireless-regdb/2025-February/001686.html

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index a3b5973bad..cb915c4415 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5  wireless-regdb-2024.10.07.tar.xz
+sha256  57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456  wireless-regdb-2025.02.20.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 2aec19c507..999a986de2 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2024.10.07
+WIRELESS_REGDB_VERSION = 2025.02.20
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

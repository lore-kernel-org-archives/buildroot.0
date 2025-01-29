Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84E3C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 19:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C5F610E1;
	Wed, 29 Jan 2025 19:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwT1ri0uFqAP; Wed, 29 Jan 2025 19:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10DBE610DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10DBE610DA;
	Wed, 29 Jan 2025 19:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56EC8712
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44949405F5
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 19:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S53DrtYXrrUA for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 19:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E52A3401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E52A3401B1
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E52A3401B1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 19:40:24 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216395e151bso15833525ad.0
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 11:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738179624; x=1738784424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lWkA6m3tlieRMZdqJUhmOq0RWSwIrxk96y1cRFW4fTM=;
 b=XThZ3Lu7Km8z8L9vrYqDdPRiRDXcRXiG3cs0c1XBMATAa5sZtf1iMOIL63hrJVunfz
 QHN2KJYi8VpNe2pEl+U2xU0zN/q+ax81ZK63/OYgDFE3v1YXL0oGBW8yGgslYXsqZRLR
 tpLnBcPnHsJSkBjbCgoRtLT4/rkv3/XSfSCApe64o6Du/ve+POGaRJEfMR30hFoHOo5Z
 +erFvT/Ih3537BnoQre4qT3bUn6X9bpFBgjKgW6TyWaYFO0RYMJ5RDN2rePq6WYzdXF8
 rBh3iqEmUbs4y57xgyz5YMQZNGBdXAaqBiDqahP4jY8fIcL8jcTqF9m+TBJw4uUCAztp
 S+Nw==
X-Gm-Message-State: AOJu0YwuB9WiA71tmFgWQp1jh9KjnjXNhwLWr55PaG+aulprX2RlS6Tq
 2enLmOiqUQxkD8NJYfNIhvwbYUS2j4HrpohIRWG5yaWWvWAL3tTppS0cHqJfd7uzRK7HjaY3sib
 uvpk=
X-Gm-Gg: ASbGncsy6QeamT02x5ECpKJzC4I1qd8Ozr6gNcAgIr2sz0g8vUbuo0kjL/0ef3+w6rf
 Yc9zMyEMgiWuBKMcaqAKk4jVeimnnglEiI8A/+y6wXTgnyUHB9dg0IAoo9LkL4W0gBPi55bG/Hs
 DZkDus3/H9kaTujvwoijOoWCcEtON3aMUx62BicZBX5SPHTOvcO/5But0cwu5MJtRf3mk6Gwm6Z
 vBLwplANpt/gLgpsbyNB0v/hNHJSK3WfyIJJEka9W+Nz5ud5XS6On8UHgDE7ENuNZAQgDud/Q7E
 D+xBMpqnj2Uf/d8PfU926D8c6HamJr3d4CUZQYe0gQ==
X-Google-Smtp-Source: AGHT+IFm+hH8SwQDzVjcRNbx0kfIIlw7UO4hC2s92/KDtYVg5GplXGXXld1dNy4FSu1Ip6zfus3kSw==
X-Received: by 2002:a17:902:f646:b0:216:6284:8a00 with SMTP id
 d9443c01a7336-21de18cf4efmr8700285ad.2.1738179623944; 
 Wed, 29 Jan 2025 11:40:23 -0800 (PST)
Received: from localhost.localdomain ([94.156.149.104])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141c4esm102378955ad.110.2025.01.29.11.40.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Jan 2025 11:40:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 29 Jan 2025 11:40:07 -0800
Message-ID: <20250129194007.60839-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738179624; x=1738784424; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lWkA6m3tlieRMZdqJUhmOq0RWSwIrxk96y1cRFW4fTM=;
 b=rShe/qp36QF1/52EKtHla114W7GbfrROV3cJMsORZCd8emIODNIhF5DZIFvOJMGLMW
 m/o4ExtjeiLHy749p2UJQ4I9nZSJ0Ldmh9XPLCVub28XdRx/YsWHaagmoEomDDfJhXlv
 /fGWp+DiWUBap25uOaWZzY3jY98EJONF/WTyMjgpb79k+JtxBZRVUkUHUtg6PEPI/Obe
 RCK3aMD1yidnyxH9Xo0TWJsr46deZ4FXurSbS6cw17K8juVS0V0xZE27gmTVHr/PmMF3
 xxWpVX3vBgcUhJ0W+bOfCcNJvJ3V7nP4E9H+ee3Tx82YRK2u0ClRRg1gyikOVGsFz11O
 O4Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=rShe/qp3
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.23.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.23.5 (released 2025-01-16) includes security fixes to the crypto/x509 and
net/http packages, as well as bug fixes to the compiler, the runtime, and the
net package.

https://go.dev/doc/devel/release#go1.23.5
https://github.com/golang/go/issues?q=milestone%3AGo1.23.5+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index 37e1db20a9..39e6491376 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
-sha256  4a4a0e7587ef8c8a326439b957027f2791795e2d29d4ae3885b4091a48f843bc  go1.23.4.linux-386.tar.gz
-sha256  6924efde5de86fe277676e929dc9917d466efa02fb934197bc2eba35d5680971  go1.23.4.linux-amd64.tar.gz
-sha256  16e5017863a7f6071363782b1b8042eb12c6ca4f4cd71528b2123f0a1275b13e  go1.23.4.linux-arm64.tar.gz
-sha256  1f1dda0dc7ce0b2295f57258ec5ef0803fd31b9ed0aa20e2e9222334e5755de1  go1.23.4.linux-armv6l.tar.gz
-sha256  65a303ef51e48ff77e004a6a5b4db6ce59495cd59c6af51b54bf4f786c01a1b9  go1.23.4.linux-ppc64le.tar.gz
-sha256  74aab82bf4eca7c26c830a5b0e2a31d193a4d5ba47045526b92473cc7188d7d7  go1.23.4.linux-s390x.tar.gz
+sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b  go1.23.5.src.tar.gz
+sha256  6ecf6a41d0925358905fa2641db0e1c9037aa5b5bcd26ca6734caf50d9196417  go1.23.5.linux-386.tar.gz
+sha256  cbcad4a6482107c7c7926df1608106c189417163428200ce357695cc7e01d091  go1.23.5.linux-amd64.tar.gz
+sha256  47c84d332123883653b70da2db7dd57d2a865921ba4724efcdf56b5da7021db0  go1.23.5.linux-arm64.tar.gz
+sha256  04e0b5cf5c216f0aa1bf8204d49312ad0845800ab0702dfe4357c0b1241027a3  go1.23.5.linux-armv6l.tar.gz
+sha256  db268bf5710b5b1b82ab38722ba6e4427d9e4942aed78c7d09195a9dff329613  go1.23.5.linux-ppc64le.tar.gz
+sha256  14924b917d35311eb130e263f34931043d4f9dc65f20684301bf8f60a72edcdf  go1.23.5.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 0b11d8d392..4c8ae3ca5e 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
+sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b  go1.23.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 91d9f8d1c1..3d1b42ee0e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.4
+GO_VERSION = 1.23.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

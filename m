Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BB8C3601E
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 03:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED7D8126E;
	Mon, 14 Apr 2025 03:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8PVvzwEwfop; Mon, 14 Apr 2025 03:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDCCC8106A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDCCC8106A;
	Mon, 14 Apr 2025 03:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F0EB250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 03:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3052F606CB
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 03:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMTdn-crKWCg for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 03:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61D8D6064D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D8D6064D
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61D8D6064D
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 03:54:53 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-227914acd20so38539715ad.1
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 20:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744602892; x=1745207692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hZb5nVThus8QmjdhF1tBjonOCFcjWXYkNQ6rhULcj9M=;
 b=G34+li/Yj+uoVp0yB2u0ILZBXthrCvaYSXAuMWKiiiQy5hw2duGk9xwwmVea9ys1zr
 dObLRQO+euWBsEjl+zziZv21IqGqV4SU5jf2rOiqyg0kWzRfW8MKi0natxNnJt2jnr3A
 ny9Pc3O7wBa07imHFghGOEksBtu9jANF9+ENQ3c9t/3TUfDPnCgUdEJn835xVGNncYQm
 6ecQ/13c/FLuEMZzyHub4LRmBs/mQyvcFI9pA1Q2KBnmEPRUuII7MgWcbaQw/ICEmexJ
 FLgWr8Osy7Y5l+n5RdFUEcqwzqpbmXsB0BhG+OU7vPvqK4Lq2VnKOqctssCmEBuj9aqp
 d38w==
X-Gm-Message-State: AOJu0YwGBnDc0BR2LyOVq1Y97AwxXYwHCcC6P1DFyIIKuiiKmzqzdjug
 CXDDmiJPh+ydwlRM90gj7/Sehq77aI6MCuTMd1tHllBNr8LohiVkApO/RQ==
X-Gm-Gg: ASbGncvq8kY7MWW+JsuvchR/xpDbyCinO+vV4gH4in2/H9jkef3ghUzQPEh8/n0SBj9
 JuQckPn3bOIHLUtnzUpvbxJNt851HytDdW2sPWsye5KZmbO5cV85xfaeOmt52SpiJYBVegAv1q/
 CN/MmjERlw9otnRan/IuMEv5a9Sv41gvhtGufa+XAfPYHDqO17AKRPJTmgh6gjk/kpu6HbWKJnB
 AKccKXilvxF0vQf/zQrhWlF6ruhjGVjXsEFImaHE2k8DCIbk2nHBKoJ0HnbmDx2QdXQ3LN/ddYY
 hKWypa7cIepu3n5hTKgIwj6XJKkucjHDBzTDTA==
X-Google-Smtp-Source: AGHT+IFn1AYWDteyN1KvZB8tbnU6xtnJ0DELw8+56JmKZ3746nJKWbqQYQl1Rp5Iq5AIe6ZZNNQu2A==
X-Received: by 2002:a17:902:ebcb:b0:21a:7e04:7021 with SMTP id
 d9443c01a7336-22bea0c6794mr161111445ad.24.1744602891980; 
 Sun, 13 Apr 2025 20:54:51 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c97298sm90368685ad.138.2025.04.13.20.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 20:54:51 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 14 Apr 2025 11:54:21 +0800
Message-ID: <20250414035423.1856226-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744602892; x=1745207692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hZb5nVThus8QmjdhF1tBjonOCFcjWXYkNQ6rhULcj9M=;
 b=A55/dxtG9QWnKlIF9HTzFTHmkVkz5kNdm5nFVqNMbhrmlcBRDW6fGphwCktFLXjyhz
 6Igqyls1XliElGuYy3+lb7vrLJQjNRRFbeRONcVdGGRIz9M4ArdawVqBLSyj2MAxB6as
 62ha/4JUWtTiBS5IXmQDseMAxN0/Y50WtRY4GfRJccoPwpspz7Z8SR2lzFJ6+vrg0kwt
 nG1O+uX0rKWdp8AaAtxXForQDAwrrARlLQm3wXXWEht4fYdsT4SrJ15sPpgyg63s3D09
 LUuabJihYt+xrO/Itoo3NvB4bt6zIx1h6rvxpNQu87dmvaIbywQly6Y1H5cDvcJ/7P8Q
 h4Mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A55/dxtG
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.2
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

Release notes: https://github.com/timescale/timescaledb/blob/2.19.2/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 4e4cb16858..bfef2757fa 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  783bfcb6513523827127304d3e51c27e95644f59446bef80d4a96d5de58ae5ee  timescaledb-2.19.0.tar.gz
+sha256  727e15da6dba48cdcc22df8af23ccc2c3a8e7def9e4575e478d03031f8f637ba  timescaledb-2.19.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 584c73925b..4be3508a5b 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.19.0
+TIMESCALEDB_VERSION = 2.19.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

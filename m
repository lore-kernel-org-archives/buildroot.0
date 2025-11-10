Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D1CCCFA1A
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 07:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA13813EE;
	Mon, 10 Nov 2025 07:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWfcN0uLOmnM; Mon, 10 Nov 2025 07:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 863BE813F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 863BE813F1;
	Mon, 10 Nov 2025 07:07:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00CE51CD
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 07:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD9E940459
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 07:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3C80e_UcSR0 for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 07:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 264C5400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 264C5400A0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 264C5400A0
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 07:07:39 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso3194734b3a.3
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 23:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762758459; x=1763363259;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zA22jxBYBwc4E44WaXwdr2JDLmecX2bqKbb46ET/1GI=;
 b=XBYrqQFK1OjqDgKiPEDUFs8uZIBjbprCmmVAai3zyR5U5o/dLzVBs+wSFTpxlR09pz
 a3vKnXxLjhG4dnOZtMpj49O85RqGvwNgAkXnoIzCw8kMe+I/287KRxPipKXskwoCW192
 C5VNfWbXCB99nTqhixRnkTRFmvr91/LAuRQAdzKUdF2puzIBewSGdzJVOYjSS7IgcNlK
 KrCvHne/bj1lbxNM8Ysoa2ndAOesbFvYTKjBeIWAwI6WonJKXjW9gzETVygqAeEXGZhh
 z5D4WTrDFTI3pfAQm2bFqgu2Hno5Uc3RVR8zYaRfcRvemXKQjAZnvCbCqfHf7MN3Ixez
 SY9w==
X-Gm-Message-State: AOJu0YyJpdNmyKwFbvcta62Le6vmbEYSzs/Naw/Vt3hEiShk4GfyfzE5
 Td60FhzMXovx9Rld1zxR6otRZIIsy6v4ZmkTwH3sqrneWLciJbkAufFXXZg6rhzv
X-Gm-Gg: ASbGncthBwsuEnJein2Q10if8Dk+U02A+gCl88lCFpYzY1Fpcc7vnhlo/zZylXsukyr
 SfS2Cv85DCl1/b9O9qpvMd5gRGNjlhQCy6YtjQ4G6Gg0VzxubcL8Sea3VzDUx6XGjKDx8AsYQvS
 g9uwEBDiQuqggotgIjy4y4vel4TpXZ9YIbbBHcxRQezN95YpRsI8W/ODBQfN0UeRKrp27o+62OO
 0qQav8fn2djORhAwgGC+ug/XBUb/1IXg3j6DcnfOAMinjTY+YyD62fkoZAUyI8oCbp41Alu8Jxk
 Vj6MSULD+A0eJP3PQXiNgR2ZW/OOsdZN4MIkAHU5VzDZ47tNwa089Iod5kNc9Sg7pBg/xVz3Nez
 jMEtgeRyp0EzUIntEgXJCx0jWH2sIh+FFqNHxU7OtBEdu8L213gQeuL+7XkSCZNhpaI0KqGj/qa
 Ha9gUZYYi9pOLK8HuTa+fZuaTaEDywOE0GDW7PvKbSS/ZrwrytvzL4bfEx9YM=
X-Google-Smtp-Source: AGHT+IF8cr5tP2GabL0UQUlf1BaZxE1QoEEVmLqbcrXrc4hM58E6rkb0LbkRGMT9RX+NOf51AvoMSg==
X-Received: by 2002:a05:6a00:2301:b0:7aa:3642:2173 with SMTP id
 d2e1a72fcca58-7b2273810c3mr10237947b3a.31.1762758459203; 
 Sun, 09 Nov 2025 23:07:39 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0c9c08e53sm10653415b3a.22.2025.11.09.23.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 23:07:38 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  9 Nov 2025 23:07:36 -0800
Message-Id: <20251110070736.390377-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762758459; x=1763363259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zA22jxBYBwc4E44WaXwdr2JDLmecX2bqKbb46ET/1GI=;
 b=Cjq06ih0Z8B5ZuaPTI5QHLHylSQ0ewL3xpEjnLVak+1/zXUeyc8j4FQ13SL3+N/Gko
 Wgy93gwEuuiGsSk8YLFn3F7D4iObB4FR2T2/HpaNKEJzvf2OEMS8OQ9Og1RGg0jI/EbY
 vZNun9yKtF4oY5rts+G62OEIIz9PGeflG4nDCE8CvwCGjuz5bAk3kTKTwYzSyjXO2kzv
 ux/ipEeETy9VqJfEs/6zjobOfKraTonRQyW5vrQj/3gwtkxuuoPjEjInyDjyeyUqyKT/
 Azd5id5Ty4ExqNWNAKwS34WqSeIpvRxRC89ktLDyqnhixoWig9FQEriad8CAmIFom3SY
 JSPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cjq06ih0
Subject: [Buildroot] [PATCH 1/1] package/usbutils: bump to version 019
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

Release announcement:
https://lwn.net/Articles/1042924/

Changelog:
https://github.com/gregkh/usbutils/compare/v018...v019

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/usbutils/usbutils.hash | 2 +-
 package/usbutils/usbutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index 7527b6e63a..3527d4e30d 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
-sha256  83f68b59b58547589c00266e82671864627593ab4362d8c807f50eea923cad93  usbutils-018.tar.xz
+sha256  659f40c440e31ba865c52c818a33d3ba6a97349e3353f8b1985179cb2aa71ec5  usbutils-019.tar.xz
 # Locally calculated
 sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
 sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 1093981360..5b6037afa2 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 018
+USBUTILS_VERSION = 019
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BAAC5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 18:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7ED409DE;
	Mon,  4 Mar 2024 18:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2WEezUb4hjI; Mon,  4 Mar 2024 18:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8DEB409E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DEB409E7;
	Mon,  4 Mar 2024 18:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8621BF29C
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 18:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED51781FFA
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YB6RqH3jIVFX for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 18:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA41C81FF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA41C81FF8
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA41C81FF8
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 18:20:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51327cd65beso1317258e87.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 10:20:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709576456; x=1710181256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=igyoITFT7uRP6O+0oC//GPSLSc/uHqTPotJ7Fv4qG/w=;
 b=ve9REmeRzjrEZA1bnU/2++sgHd0B+XvT2fUyPUlraFwCxjtkPj4t04IPUFVHEGtvrl
 FN8V0LAhqeQfrrq8sUgJdvwbsI8qXbznjuXjMiM/tsAm2UIRCshMcrXLmjhEHY9NfJ9Z
 LqnnR288Et/Isc2LNijE9oyigBAVh9DXzUGBZ9xYLdatUaHuroHnoszPOCqK+qZ9dZ9k
 rwHBnqTDTg3T6saQoYmC8DjpbT7Jw8abL782XLOJyrjBmP5lj+4A6DLtJUIYMS8rHtT7
 9E8Yfx+a5VvrgX6uDrdNV6gInpWRoXBZrnPUfPzxCUaMpwhxUErgFOEQjbqeNK7/F8at
 oFag==
X-Gm-Message-State: AOJu0YxRn/b/xFAzbXnFzWB9dbG8vVASCJckXCB+qDdB2Gj4Vr3sMb7f
 5BerVNGtq/nfsOmqGZSo1/7QU8tbiNSGCmimJD7CaR1SYt8ako+c7PJFtglV
X-Google-Smtp-Source: AGHT+IEEk7vJfSf8YFzZGyZA2xskzEG+H3PjwOXd37ZnbgxaxsE1yotgEHzdQ8X6fgrekvv7s7MEig==
X-Received: by 2002:a05:6512:4004:b0:513:4658:3abb with SMTP id
 br4-20020a056512400400b0051346583abbmr2699443lfb.2.1709576455725; 
 Mon, 04 Mar 2024 10:20:55 -0800 (PST)
Received: from localhost.localdomain (109-252-43-213.nat.spd-mgts.ru.
 [109.252.43.213]) by smtp.gmail.com with ESMTPSA id
 n28-20020ac2491c000000b00512a370b2b9sm1820735lfi.29.2024.03.04.10.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 10:20:55 -0800 (PST)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 21:18:55 +0300
Message-ID: <20240304181855.312609-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709576456; x=1710181256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=igyoITFT7uRP6O+0oC//GPSLSc/uHqTPotJ7Fv4qG/w=;
 b=h4zcq0GyP0lYJkfmaG5xHJXu52nshyIQUILK+vloN1xzKttculU7lwnhBVsiDpheIs
 5Xqz7cL5g0BZ4kaKpLKopVb1gLOUg5ACo8nI30TBidF1VApU3B2vpYfOF3EMJf0I8mpj
 Zo1piV+KNbXrUOVnamjIm7/2hkhvooui5wd+4QBBY9TxEB07IMIIecTZ/YvvZQeOR/z9
 Sqswndz83qFYAF5yoNNyRgSdxXj1Wg18KE3gH1dF/i+XHZL2YRpnPj7t+oV9Ny9BChBd
 kw8fuXDwTDopW2pn0ThR3BAkUL30HpotsxOjZWDbcXsf1ZFaIwnIVyCKHbWiUJ+6H/Ub
 YYyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h4zcq0Gy
Subject: [Buildroot] [PATCH] package/uclibc: update to 1.0.46
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc-ng-1.0.46 is the first uClibc-ng release
that solved the problem of year 2038 by supporting
*time64 system calls for various 32bit architectures:
ARM, PowerPC, MIPS, SPARC, Xtensa, ARC etc.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index ae1f3178d9..10790ecfd6 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.45.tar.xz.sha256
-sha256  c2f4c6b6e19d7c9c226992a3746efd7ab932040463c15ee0bc8f4132b5777ac4  uClibc-ng-1.0.45.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.46/uClibc-ng-1.0.46.tar.xz.sha256
+sha256  d6eb01fced11c5e3b319bf4132d67685b1c33494426e9426032e31979d7d8ad7  uClibc-ng-1.0.46.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 88623840bf..8b40cc65c9 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.45
+UCLIBC_VERSION = 1.0.46
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

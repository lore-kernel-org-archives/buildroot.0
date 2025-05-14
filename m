Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71148C3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43A2861049;
	Wed, 14 May 2025 16:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOYHeyTkebTx; Wed, 14 May 2025 16:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D5E6105F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D5E6105F;
	Wed, 14 May 2025 16:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F174153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2571341215
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xa228wdLgZbR for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 584964150E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584964150E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 584964150E
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-442ec3ce724so509685e9.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241913; x=1747846713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ELhAVxcqIw/GGaBY9qsJYLRLMEoRyMizbEd4nXRRXKw=;
 b=kxMfB5sTv1qOoWW5IKRVdeNdfKI+pq3MDi1FdIBqDVy8bUsUzanM9WeP1Rw0zohtUd
 xf10I4Rg6OUM8/nDiPOrf0R+uNIm+i8PG8B4IRqJ3t1ZnyaEo7DV/IZjiE6t1C8cvvu6
 gyNDwuLpCBljfNhaEGaAtVoFFgl6AsqDI/8gW6S9bkPQomOEyggg/Sqji0fzETZDFT2r
 kJYSztoo2Ou9qxxRIMV0BKZTqThvqj4WpOJlSikvdXuiNRPkhpLL6r1xzRMkkWKEe200
 geSS1Ej5cwBNrHvuh9G44YRbu0+nv+5BJzC6BidZWGMhodbUK+kuQm80TmKqR9I+7CwE
 6RFw==
X-Gm-Message-State: AOJu0Yw8icQdMDPPXKl+rC0IV/mcEXzVRBLro4P1zC7s53at0JBOLho9
 HFjAG39oG7go31PY7Z/Xi5Xgrg5TXGXVmyZFTJiYnmG5CGt1XJI+zg6T4w==
X-Gm-Gg: ASbGncuWY1nccO6OnYc84JF/KHr3IcihuOsZulAkr1spiCtMnujc6+1rF4qj5IktLc/
 mU+s4cEuoW5gtYWTL++BWa5GvTd5WdcrnNQ5pzzuCRqIgI8uT7etgOaabjJJiJFMPRc2Pu2mI4E
 HrUWrjObEENoXkeU4pzWQxP5Xh7MUHiwxNgbJmvCDyegZXYoetKsnOfd6jvx2YwrLZ4cIjZwjyl
 Qzz78FdlBqoadWhtdg0bcI2zHZRh9+MgqboiS1TcQ+S6FRdqKPUsXwotq1YdBOSm+Ef/aR2WHvY
 onDS/naoN1MSTTtuX64Ij4tL4r3SwiDqnL2Lhaa0Qlj7QBFyrQRvFoHPQOD0B5ewmyOnUU/1
X-Google-Smtp-Source: AGHT+IGYEOAa30nFiNcNZCU4Qq2KXK9VlnlCVNQOiw2PVCwwHO4pLaqE1AhkBtAWMtmYXzbjcmDCUg==
X-Received: by 2002:a05:600c:3b02:b0:441:d437:ed19 with SMTP id
 5b1f17b1804b1-442f20e7a40mr31892415e9.11.1747241913286; 
 Wed, 14 May 2025 09:58:33 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:33 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:24 +0200
Message-ID: <723f967824412ba97dbf091b4c13362e289faad3.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241913; x=1747846713; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELhAVxcqIw/GGaBY9qsJYLRLMEoRyMizbEd4nXRRXKw=;
 b=K9TZovVowcRGQBqVUMoRq0kjhN3ZAGiYTcyqlq80XIjDjA+q65hbKXNTxWvcDeuePu
 cNsy4GMQPUcWh2EzJ+duKptOPbSAZprS6iyNE/RwlwfNbh47wx+ZlgVBqrz68aYJXapp
 AvdtMqp7KYWBoQq/GTfQzP1wQ4ony1vtvqjWzcRMQJAAV+aj0E90HHnhWeOJSNJR+rOE
 32QdrtY/bqQC1m6/FCCl1MqItbq1K4QFobdaMoG7uD+ZrXn07xtPnq0xQ/Udjsc+iKap
 txhVGL0Z979uVmFFHpzv5wNAqvxFLTsPPHf/pTbLeiM85VffIwhXDVxxPs1iwXS9jnDA
 ncMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K9TZovVo
Subject: [Buildroot] [PATCH 12/13] package/util-linux: adjust paths for
 merged-bin
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/util-linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ed30c0b107..ba3474b99f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -74,7 +74,13 @@ endif
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
 # the same when merged usr is in use.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --libdir=/usr/lib
+# Ditto for /usr/sbin and /usr/bin when merge sbin is in use
+ifeq ($(BR2_ROOTFS_MERGED_SBIN),y)
+UTIL_LINUX_CONF_OPTS += --sbindir=/usr/bin
+else
+UTIL_LINUX_CONF_OPTS += --sbindir=/usr/sbin
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

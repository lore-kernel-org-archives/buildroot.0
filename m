Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE91BC83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 09:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3692A6141F;
	Mon, 14 Jul 2025 09:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giWFm-KNA-DR; Mon, 14 Jul 2025 09:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 638D861355
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 638D861355;
	Mon, 14 Jul 2025 09:28:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D77BDF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3363A412A0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1v2uHOFpgVpN for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 09:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=konstantin.menyaev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77326410E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77326410E7
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77326410E7
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:28:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-555024588b1so4633692e87.1
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 02:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752485311; x=1753090111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4biFIwTZ63WZ+YzW04G+9rYT/CPehT2bzh2+cUhvRhI=;
 b=QkQ0aFjsMPiuPJWxHPk4KdED83+/4F9ckHqkXlXxS6VncaVwJFyg3mtFNHrqJVU4fT
 5zLgcdD6+wL4pPh9pB7MbvNiG9+SGpwFtq3Bp9un9wZ8f4hMtxtE8Vhp+wlTMesT4hRM
 l+9/BIcXa6pWo/t9qY7xE3DWE0AbNPl6mJGgVz8GGgDnwrwx8yesljly1AHHTpExLBuU
 ITIacj3xaG4FzQWRypCHyFXb6Du5oZIsa0g6Fe61zFiEzHPmozr+UNDOglanqp6n/b6c
 TwiXaDKgv84UMnCM79jbGES9aRmEclGVpKdlWYq9CXz7oF6O6ZfSJuaH/blXqhLWcE6h
 gZYw==
X-Gm-Message-State: AOJu0YyMGTtHmPlhmJ1NjtT1Lfyo3mFL9ZNy474nebJa3z5Y9k4Z8qE2
 iQf5pueUNEp6vHCzKgaJo1r0WX2zkE6dZD+c+VGEcc0LrbVIGwtVUkrLu+e/dA==
X-Gm-Gg: ASbGncttyT0n7Ok5j14X76r5aRZrxsBZsN+LQX9duFwFj0AEZFlbFV3L7C4IJxxlzVv
 Nw5E4mHPnGmNLEqaRonrS3Jqp8sfZZ0tIK37HYENw598y5AQOdzfI30tOGMavuucL3g4oLuJy2U
 3TcBm8LkK+NVX/TGvoBiR56LqEChBAIlWMDDhF1HD4xKO1niZZFN9PdokFpZxMcTLR7FZHlOj5e
 O3plUwggt98434W141mdQCPZMIL7ETh+wQY1wXqTnX7Rmz3i41A9MVocqDJavZdEdyEKAByshpS
 R2MKCYHQCpQJgw5a+4WdRRlbSlodKAMyaN162sf17vtSctpqqdNauAG4a3t/QOUfI+Dksr1+cRF
 sKmf5Pqgo36Ul+BkWmoTxh+jbkjvGNBQPHDWCl3I=
X-Google-Smtp-Source: AGHT+IE0AzDoM5610w3RP9TVaaI8sOfQGY2aTVJT7BCQu+v2iznpHJMssKvbBYcr52AG2fn1ablU+g==
X-Received: by 2002:a05:6512:68b:b0:553:3770:c907 with SMTP id
 2adb3069b0e04-55a044af1c9mr3338271e87.10.1752485310156; 
 Mon, 14 Jul 2025 02:28:30 -0700 (PDT)
Received: from viper-manjaro ([2a00:1370:819c:1a7c:f8a4:1b13:b5ca:4ee8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b7a6f2sm1880732e87.235.2025.07.14.02.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 02:28:29 -0700 (PDT)
From: konstantin.menyaev@gmail.com
To: buildroot@buildroot.org
Cc: Konstantin Menyaev <konstantin.menyaev@gmail.com>
Date: Mon, 14 Jul 2025 12:28:26 +0300
Message-ID: <20250714092826.314533-1-konstantin.menyaev@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752485311; x=1753090111; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4biFIwTZ63WZ+YzW04G+9rYT/CPehT2bzh2+cUhvRhI=;
 b=TK+iNEi5tGKV9yT74TPvi+tMqzHycvTZXgc24s7lJ2Rz35C/vdEJWjMhOclTUBhgmN
 vSzv02qc79EeEphbOsAyDfRagIxgibUWI0vanfBiL+Mg4/QFy0PLp1ny55nsCD/z+fe4
 Mrf/qepOuXbKq65LIXOjCn9pyTGPtiVOUanVYmqqxGcbTH4sInJo7bLPKusop0KMLFhL
 sklN3uw8B6RxQmAl2aH57LZc4SwvSBHxMR84iTBJOEpDZhlFgGwZ8v2RAeUXoN7dBuBy
 Y0T1XPKojd0BuawSk7WtQgiGOP/LVIFzf9t5b2ZiERiyBRiBK8OE/Z9l3SY4UZHTEiok
 D5Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TK+iNEi5
Subject: [Buildroot] [PATCH 1/1] package/mtd: build package with fPIC
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

From: Konstantin Menyaev <konstantin.menyaev@gmail.com>

mtd-utils provides static libmtd && libubi libraries,
which can be used as shared library dependency,
what leads to error:

relocation R_ARM_THM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Konstantin Menyaev <konstantin.menyaev@gmail.com>
---
 package/mtd/mtd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40..1be627c0fb 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -13,6 +13,7 @@ MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
 
+MTD_CFLAGS = $(TARGET_CFLAGS) -fPIC
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
@@ -34,7 +35,7 @@ else
 MTD_CONF_OPTS += --without-zlib
 endif
 
-MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
+MTD_CONF_ENV += CFLAGS="$(MTD_CFLAGS)" LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
 MTD_CONF_OPTS += --with-jffs
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

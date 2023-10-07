Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24213E95A63
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 16:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97E0B61030;
	Sat,  7 Oct 2023 16:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97E0B61030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ek1Jmj8liACq; Sat,  7 Oct 2023 16:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D714560FAE;
	Sat,  7 Oct 2023 16:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D714560FAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E6701BF31B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 16:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64CF582D14
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 16:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CF582D14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4rHgssgQT_H for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 16:06:51 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E738382312
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 16:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E738382312
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4066692ad35so28357315e9.1
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 09:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696694808; x=1697299608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HVlYM2+Shu6xtDIXBSAyT6OGAb5YwaOA71lg7Khb198=;
 b=KWQIasl+VsSkH3jujDvlWZMC+KjZTwi+vgzfFpy584Y0LqaDwGRds0HTPJpd/xjjmw
 3Msi2L7dMsSfqyqZD/MAmn6uFfjngnITR393rrWEcLdmEBBZYn4EJ9DuyCoNrJJcumjz
 wKo1CeeoBuhPtQ/hSjI85wtlBf6ZU6HjthSSbVYI5dPCXQgFM46nVFJUBBVV8M2SQbTm
 YyI0pMYcA9IzIuvbOgpysahWgcj7bzmsL8s8MijUSCPy68XtCe6mkPUeYsteKhUGQQDJ
 2YvVemKzJx9n5jeFS11BXpn0hB0w4qG/svBLcVxxueNl8STNCNVjzz+EGeP3aJ+qiZ5y
 MsSg==
X-Gm-Message-State: AOJu0YyIGW+U3amTmBnhpKR5tnAcihDlRUVu7nULTFrxDEld6ba8c7i0
 7I+0PaAvD17PMIqR8nfaNPHKbyLg+v7WOA4gn4C7og==
X-Google-Smtp-Source: AGHT+IHv2egOoif5QBx+beKxYfFxxDKEP6QKJZhM/c6he/c4OXV+0T2Pa/2uY4BJ51A6yKY/hWw3VQ==
X-Received: by 2002:adf:e383:0:b0:314:3e77:f210 with SMTP id
 e3-20020adfe383000000b003143e77f210mr9915467wrm.59.1696694808374; 
 Sat, 07 Oct 2023 09:06:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a5d66c7000000b0031fd849e797sm4585237wrw.105.2023.10.07.09.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 09:06:48 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 18:06:37 +0200
Message-ID: <20231007160637.97022-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696694808; x=1697299608;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HVlYM2+Shu6xtDIXBSAyT6OGAb5YwaOA71lg7Khb198=;
 b=lqUhpMQB/r/9riQ2fMmb3gdqOvWa4Qn6Xly+0Islb8v4dkADTGTB+8gIAXKkJ6K3Ww
 SM2sSJ5cBM3uBMe1o1PP0ZoVqUqsN+lRETN4roBoRLpc2BO2zjx0fTN+D4KIozg3VIdE
 H5NCIyz6hl/bKRJcSleffnrbC1doHinNo/N1g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lqUhpMQB
Subject: [Buildroot] [PATCH 1/1] board/ti/am62x-sk/readme.txt: fix defconfig
 target
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

am62x_sk_defconfig should be ti_am62x_sk_defconfig

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/ti/am62x-sk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/ti/am62x-sk/readme.txt b/board/ti/am62x-sk/readme.txt
index f6251ea04a..5af1c59c2d 100644
--- a/board/ti/am62x-sk/readme.txt
+++ b/board/ti/am62x-sk/readme.txt
@@ -11,7 +11,7 @@ How to Build
 
 Select the default configuration for the target:
 
-$ make am62x_sk_defconfig
+$ make ti_am62x_sk_defconfig
 
 Optional: modify the configuration:
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

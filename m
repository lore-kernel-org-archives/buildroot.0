Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A718BC4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 19:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EDFF60C19;
	Wed, 24 Apr 2024 19:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-TtvEV1H-wg; Wed, 24 Apr 2024 19:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D98360C1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D98360C1C;
	Wed, 24 Apr 2024 19:59:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E67931BF27A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D28FC41558
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtohhFt6EcdI for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 19:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49DEF414FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DEF414FD
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49DEF414FD
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 19:59:47 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41b3d2cbc90so258415e9.3
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 12:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713988786; x=1714593586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDFbv/o0ZkdSIWaTDI9DU5zruSEcKadLZCo/e654m60=;
 b=EvPQwUAbHMO7Femj/15+pXlFEn6a0PwX260Dp+ioADVYDTjSioXwe833DEMR7ke/ac
 5PkcG0eGmqKaQEfVNLonLBr0xqtSSeOwNH6MLe96ugVLWnqWb1cCm0yjjS52UY5XqbOC
 7yJ/bR6Or2T2JWlgrWxL65RkqyQPxgIAEKfEc8TDCilDjA+PRF2406Z25bF4ikhT61yk
 fwIQm3pHmolA9v40PjWJ6e+gs+VjUkD2a6dK7ThL9HVgMYXAqEqGcqgyaBji+yY5yqBH
 8EEWb+K76u2QL+9rwNY0J3aXvtIl6ZiLSxoSNkqg8n0hAC01+T9mtB8cFzx5Jsw2OAth
 gdzA==
X-Gm-Message-State: AOJu0Yy6xku7gAdb/yhYQtoEw9+QvWCuHa3LLxjBGdA44TaTJl2rMyC8
 huRwbW+daMYG3eTJSufUQ+UPrNUY8WXT+U21IB4Y1gSSURjtv5LYpSHQdzqvRrRWqNfYC77VSa3
 /
X-Google-Smtp-Source: AGHT+IEpySMj0Q8oGn7TYLhtyWiw/VltiwASqF9N8k4j7S+Ms//RTFMFUNZiA6Qp9Erj9P2BCKV23g==
X-Received: by 2002:a05:600c:4f82:b0:418:fe93:22d0 with SMTP id
 n2-20020a05600c4f8200b00418fe9322d0mr2346235wmq.11.1713988786073; 
 Wed, 24 Apr 2024 12:59:46 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0034bfc32a4f6sm212561wrs.48.2024.04.24.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 12:59:45 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 21:59:43 +0200
Message-ID: <20240424195943.527542-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713988786; x=1714593586;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iDFbv/o0ZkdSIWaTDI9DU5zruSEcKadLZCo/e654m60=;
 b=ZuoipeokNZ9+6rDa4t3yaIm97hBnb9eOE9Luq9JocaNFpM+eTLWRElz2+oYorIBVMx
 wqCvfmTTFcZjH/pY7HW2xNT2cyNfAXrCCcXhUZkD+99lkwA9Ugo3igsriS9Jwv7Rzo5l
 PGV4g8apCdk1e9qs9fhocumScqRSY81QYm8IOz5brGWAAAWGj5lQvoyDv1v/hfoq35hW
 R6TQ88lAr8xSBostS7HtAzibqu+V4PZPOy2U8LVRiNwbsoA9uoYATsWP0wMjBFqTtlRV
 042BgFVG9xiy5pcZ12a0l9bQ2mIH87lfw9ExgEbpvQ1U0l4uZLsBuwaX3FDUcFu90Swu
 Ka5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Zuoipeok
Subject: [Buildroot] [PATCH] support/testing: TestATFAllwinner: add missing
 openssl dependency
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit [1] updated the u-boot version with the one used by
orangepi_zero_plus2_defconfig but the dependency on openssl
was forgotten.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6703221868

[1] eb16148dddc6be39b0d850181c2461fdaba1ee6f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_atf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 352725e721..b0e7696e86 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -19,6 +19,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
+        BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
         BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

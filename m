Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196C9C83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA5F82302;
	Mon, 14 Jul 2025 20:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKAPmEsGbU73; Mon, 14 Jul 2025 20:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C29E8215B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C29E8215B;
	Mon, 14 Jul 2025 20:26:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 661385E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AAC782142;
 Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FakvQsiw-aLU; Mon, 14 Jul 2025 20:26:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B75DE820DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B75DE820DA
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B75DE820DA
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3414672f8f.0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524776; x=1753129576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rT7v4vP6TR8zWkkQg4/DnbH7votI8qpmOPCzbjpC9BU=;
 b=Y5S2EPHM1227FSisB818HXzRrGMN3BVUWKY/Iu+CrTRuvgDx5TDzn7UBp49yl984cx
 vwqSfxqU6A3zi/rh2NAOjhsA7mK8NNPvyfUA+EsEiSzZwDHp+Q9ho+7aX3F8tjr9i8+G
 T4qANRNaymVQKsZfqc616/PFGnxBwNCieuYczscflR6Lm5nRkj9pS3+MM+eT1jKlOQS4
 kHxp/C+IkLH9fLyHiU6u4nD1gHwa/G3hhpo6RQ/SdRlbk+4YX0IL80CUKGGCnIsfiK5Q
 ZINV3jDFgbURHPO1V3o2ZfXzCYb6h+jRdhVvhsxMrwt1ULSFkDJz7UjArEP0ZtkUvUUG
 nh6A==
X-Gm-Message-State: AOJu0YxJtKm4Z0vKM674zHcsme6amN+fW6IVZ8bz33HB5kCsfrnWK/V9
 /4PUkGjzFL1oDsrMZ5WXx3rYdJHvOGX08jHWfQ4ppBRQShiogIN1TGoD2TwoGQ==
X-Gm-Gg: ASbGnctxZIry4kQYR/8LKnkUk+nlxNCViOFJFWzDqTkUE76c92kdJWIWtSE2mGEG4G3
 Vcm9CdffSbMcKi/Ec7JLJJy297csUK0waz94L5S2GBz6Ck/YJuardzN/DVm6FpS2M6X9JoLjulo
 A1YhzpsbuP6zc2fgohA9LfBhfYl1gAOqFS94jxwJwu8lLoWOhlUJv2CiZBekzhNx7pk56A6qSdF
 ybZLqA9yFfMiCANIvacyD/2tbUTHRN0YbUEI/c9MbvUKkRYk/vDLyoq1lHHhn2e6Cz2pG2jh2Wl
 ukF8owyOtKJHoTTggdGFlUHtjPGfD1Xe6qebmv2Wz7wjWtIW6Vm+J9mR02KKvONNP/X8S7CyfGx
 fZMd9FyQVe/s35G2EyyUBeHRZNOD6Whyk
X-Google-Smtp-Source: AGHT+IHDSNKA/kDgMPBU9k6XXcQLsdYJuFFF1PIu0IbcG51iAPHSaell1krolet6YwTY6MxyDk/Zcg==
X-Received: by 2002:a05:6000:4025:b0:3a4:f8e9:cef2 with SMTP id
 ffacd0b85a97d-3b5f2e1b641mr11669093f8f.36.1752524775633; 
 Mon, 14 Jul 2025 13:26:15 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2025 22:26:04 +0200
Message-ID: <d215917d0d54be8f400744e71f4455a8be291491.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524776; x=1753129576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rT7v4vP6TR8zWkkQg4/DnbH7votI8qpmOPCzbjpC9BU=;
 b=Gd/OGGxwo4qsr2oo3HBl00ZD8YojdQ8MLcl3zI4QRalXpeXk4TnHzsmFw7xF3rIhAq
 ubedHkqqLaLJnzgv8tWW7IqQfmPXCqq2PZrYMdelq6Yailn67GQCs+eGFsDjVU3sNqrG
 VdPRjISVD9tU4op9yCfVIIp5dRE40ZtqiipSolrV4sKmqVfGhiqJZQluoGJNEDmGDoT2
 DW5Ddk7Dt4uma7enG79u89kJN2xugD/cTnqH+Yiz58SyfZtlvKk7yfaUGSJmgNga/tff
 WXk/uXz/FHqo3F/AP9VctE9ZPc8NPiPI1xqSw6o+K7ZYDsfusOUKru5DnIn6R2hPSM5c
 Ob3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gd/OGGxw
Subject: [Buildroot] [PATCH 10/13] package/passt: bumpt to version 2025.06.11
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/passt/passt.hash | 2 +-
 package/passt/passt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/passt/passt.hash b/package/passt/passt.hash
index 011ba84b89..af55658594 100644
--- a/package/passt/passt.hash
+++ b/package/passt/passt.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f76c12e0535b9f6af59ee747d8ed7a8f691bb1ac7429225484788f0bc6e23dac  passt-2025_02_17.a1e48a0-git4.tar.gz
+sha256  ac2562e4b589c518b6e30101daaa430691da2605ccc2988d0b704079c2aea4f3  passt-2025_06_11.0293c6f-git4.tar.gz
 sha256  32dfe03d9985f5feb581da26a2fe6c84530cccb6b53ede0d8dab075cd048ac5b  LICENSES/BSD-3-Clause.txt
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/passt/passt.mk b/package/passt/passt.mk
index 5b9fcd831f..8f9ab937b1 100644
--- a/package/passt/passt.mk
+++ b/package/passt/passt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PASST_VERSION = 2025_02_17.a1e48a0
+PASST_VERSION = 2025_06_11.0293c6f
 PASST_SITE = https://passt.top/passt
 PASST_SITE_METHOD = git
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

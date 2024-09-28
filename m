Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56327CF6496
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 21:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA243605D4;
	Sat, 28 Sep 2024 21:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYI0wn_HXwp6; Sat, 28 Sep 2024 21:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0976960688
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0976960688;
	Sat, 28 Sep 2024 21:48:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D51B1BF580
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89FF8404A8
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 21:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7wFaUrgJ7Ei for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 21:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B8DF4047E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B8DF4047E
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B8DF4047E
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 21:48:38 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a275a7649dso12013735ab.2
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 14:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727560117; x=1728164917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mwfx9uDsqZOOdZfbf6cnbl88ZI2/p5tKfZmIW+LKfvk=;
 b=IHP1OqYooHVG1NqW93U1Nnz11h3pO1Wq9s9SrUa6Q895YB/rqa7a0ZvUDzjWh/0MAR
 rrH52KBxAQshXHxJQ4jaLzzmAkFMfLKDqMNSm2E63lvu9Gu8S3lnbp4HrtpULaKwdw4+
 ZLxphYILmpn0TVYV99dDF1uaGqu8NNcXI6Ktqbxx4vMYOVpRKtl0kwTyLeWLec5IC5tJ
 Qu7Hn+gvn+JJ77qNURD3iVjygf2qnY8U1ZRhHrKN+gJuvkjucrV8m55+lPs522bnII1S
 sNW1bZpOfooZiscJDXvw+IATb93SQxvDTF5ZjjdMudyi9+Z4nNa6LfmMwa04mw6PcCsl
 G2JA==
X-Gm-Message-State: AOJu0YzWVW12BCivUqKFp4Pxx8VCxBcGi8troebkWVUujwKshIU0CAQ4
 bNaG9tnBs8aI+1ib0Oolu0Y3jKuxbo5oRsiY2zrAFvjzxA6QIjwHeFNn0w==
X-Google-Smtp-Source: AGHT+IEheCcUO7d1py/0BT/298jKN6VjV7CTJ0No55ze7Sma62OGVNQAV9+PCRRC6DIGrTLM0NpDUA==
X-Received: by 2002:a05:6e02:2188:b0:3a0:9088:e2a4 with SMTP id
 e9e14a558f8ab-3a3452bee09mr54189495ab.21.1727560117076; 
 Sat, 28 Sep 2024 14:48:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d888849fbesm1267683173.63.2024.09.28.14.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Sep 2024 14:48:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Sep 2024 15:48:34 -0600
Message-Id: <20240928214834.3357300-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727560117; x=1728164917; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mwfx9uDsqZOOdZfbf6cnbl88ZI2/p5tKfZmIW+LKfvk=;
 b=j60LwxMHHzhEy+8xSZB5F9SBob/nZYSEUkxsuWld4LNamAsngspuLydt1l2rpuN5oS
 vi1wA/UowYGK9uEycFeKQEyijLryRqOrXEZGEdaV7jq5rkCkd8E94NfAJJJsx19cpZwI
 VMab/oDqLJT6BA/Joj+HG7/6yPjtbeLgV3rypIchLpBn/ujeGGRFIVH5EnsLIO+8DLw8
 UZh1tOFZ+EZcI+WJ8WecJUjfyAp6eEEua8NbgxGI5+KPe+yySvQF25H5HqSh4GDqZFQI
 qdfLriRNiYYaGoPdZ+fqgBwj7UgYMaAq4eknh76RAjmyqav9xnHr162DtawPEzVHO59n
 Q7uA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j60LwxMH
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: bump to version 5.78
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bluez5_utils/bluez5_utils.hash | 2 +-
 package/bluez5_utils/bluez5_utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 1b10bfbf64..41e39e0b5c 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f689bc00e1d150812  bluez-5.77.tar.xz
+sha256  830fed1915c5d375b8de0f5e6f45fcdea0dcc5ff5ffb3d31db6ed0f00d73c5e3  bluez-5.78.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 59eb68de61..13a8ce2f0b 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.77
+BLUEZ5_UTILS_VERSION = 5.78
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

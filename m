Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C802CE77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C4634036F;
	Sat, 30 Sep 2023 13:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4634036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FKmpQqPazux; Sat, 30 Sep 2023 13:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9839B408B0;
	Sat, 30 Sep 2023 13:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9839B408B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65B2B1BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B60F417C0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B60F417C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJO2HWBQSkLi for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:30:30 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CD11417B7
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD11417B7
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so132921025e9.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696080628; x=1696685428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2S97l3/YXsx/ykuXx6wLFEAboNXqD+F9cabPZAYwkCU=;
 b=rbDvQ8c7wyGuoe65Uljxb3j7WPL/ZWAQPh40UyRQsxa3ABNR/+hmk8BVkgu9fLuz4g
 CKSecRq24W8qwrvcaZMDeO3D2Z+J3s0yeRRfPnr+FhZ5zSzUqxOpvQgNDerahVjoigOc
 tt0hW+/JCC8IG4i1VsWquYNCElT18PmvVvzSfdlXE3By4KytdxGKOj0pK6pH3+raD43K
 yCTJvkaZmYOnxrslZZ9IknJtOL7v9RFRpCl/mS4ZL6QQ541mbd/nLsHl6P2kDNVETA3A
 XEiwUaaQ9sq/0/YzQ67qhPPUm8/u0WXhZ4rEPhUKNONCbTJin1LMAZfynHm6NP+DmZr3
 o54w==
X-Gm-Message-State: AOJu0YzrWtELuHeJwSKa4bpyEu3uhO4dB19rYYeFMqKXOYhpwsw3qcQI
 uoBZ+JTnSZQoBrOkeL9J+JtEadDRJtg=
X-Google-Smtp-Source: AGHT+IHev47HoqZatbFhdGgAN1aOJfGx/4+TwvoWP9dNRMwpQQc1YWeRJ6G+XQFtHulkbFf/nTRmnQ==
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id
 q9-20020a7bce89000000b00402f07c4b48mr5540668wmj.28.1696080627412; 
 Sat, 30 Sep 2023 06:30:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020a7bc3c9000000b003feae747ff2sm3389047wmj.35.2023.09.30.06.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:30:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:30:23 +0200
Message-Id: <20230930133023.438173-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696080628; x=1696685428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2S97l3/YXsx/ykuXx6wLFEAboNXqD+F9cabPZAYwkCU=;
 b=FtJVD+L+lP4YM3sKeeVf8qZdWgRAclOzbX73B097FFEgHBgGr681uf2yOIK/nMZnGr
 RxkhwVw9ghUogfmIzdgKAW5aTTQ4oN+IL2qJVjKrntE+coNk7ooM85pf/LvRuixT0tuS
 RVNf246JVtK0OI5fMwjj+93DIP1W8GJwtHvGhNIn6MJEealA8VOqzgJSjwgZFKk2RWBY
 /o7skE0qpXi8Mwok1DWTyLTA57DRvXZ5gWhkq127myexi3JD/21H0q6YAXlKnQc2qAZH
 73DrNiMMilhGLGsOfgUH5Lk7okI8HFgAXWxvqKFVO9z3XbtL2PoYZ2q8IEJDDqyK9ckb
 82qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FtJVD+L+
Subject: [Buildroot] [PATCH 1/1] package/kmod: bump to version 31
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index b181f73e9b..f4b01b20a2 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  f897dd72698dc6ac1ef03255cd0a5734ad932318e4adbaebc7338ef2f5202f9f  kmod-30.tar.xz
+sha256  f5a6949043cc72c001b728d8c218609c5a15f3c33d75614b78c79418fcf00d80  kmod-31.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 5d6d4408f9..dae84611fe 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 30
+KMOD_VERSION = 31
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

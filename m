Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B398E95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8BF861142;
	Mon,  9 Oct 2023 14:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8BF861142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7NMJIfz6JMF; Mon,  9 Oct 2023 14:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E55BC61156;
	Mon,  9 Oct 2023 14:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E55BC61156
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16D401BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4A1741524
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A1741524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgScRWCvbB4z for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:31:55 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2207F40C07
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2207F40C07
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3248aa5cf4eso4578075f8f.1
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861913; x=1697466713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f67z6qZyMyrN+X28YII1+FKWCy+JH5hpdGkAkzYWftg=;
 b=ZfnHzLrBMcQjOMWH6lmf2v3en1yxBQxqbiJ0u0YrYILT/4b5+dxtlYq3fO9n68yPQ9
 FXeHKffqfOHU478Uz09kXcmTrnhfDt/2Cowu7oPyEBB6Q5+XwrroP8T4uC7i9EhK5juV
 ifgfg88+k95mLAtupDAARFzIYK0WHkF6oMstaB7btV36zQBKvRG9A8eRhSqa9/Ntbo2S
 Qq4S7Lpe0xmvlzdrZV1wJBW66aPn1dHKP626IYiZEy6U3eBNVWncrwDq2NhX0d0lTJ13
 SxBNLs4JWfT0KVnqApNyDkxy42JH25Iaq0maWT/VCQA6V77Gs968fVTCdA5J8togYwWc
 WLSg==
X-Gm-Message-State: AOJu0Yz06geVVVA8jJi8uo1kW3kpDo0Jvzlsfyvd51GAiSdjKn/DyeHB
 sBDvT5KhfReqT5VbllZ4f9K8VtdKwp3uA5o3UI+vHw==
X-Google-Smtp-Source: AGHT+IF+wmColotKxuyd81kjG0sCgQLGcJ7aGiNefYWaNIuVw7rIEB9YA6hUQvyx+Y29RotTQ2cunA==
X-Received: by 2002:a05:6402:1608:b0:52b:c8d9:1d66 with SMTP id
 f8-20020a056402160800b0052bc8d91d66mr11566149edv.42.1696861892428; 
 Mon, 09 Oct 2023 07:31:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 x19-20020aa7d393000000b005330b2d1904sm6220388edq.71.2023.10.09.07.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:31:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:31:21 +0200
Message-ID: <20231009143122.1775787-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696861913; x=1697466713;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f67z6qZyMyrN+X28YII1+FKWCy+JH5hpdGkAkzYWftg=;
 b=TzsBsAlyrHekdKHbQgzMUpUTxZ6cbehfg6L9Fa41VGWwbBlGkVVmHZ0fOSE0sqgVsd
 sOw09+0ir9AAMiLCuloPuyWRd5Zq/GmKfsZA7Cn+WYjXSEoD6plb9R6Y6spSjOgfz3qW
 d/Ef8PlRTh9/V+zcLn3jyEIKOBepo2s/2JVlc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TzsBsAly
Subject: [Buildroot] [PATCH 1/2] package/firewalld: bump version to 2.0.1
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/firewalld/firewalld.hash | 2 +-
 package/firewalld/firewalld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index d8be3f7ba0..53bfed0347 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3be5a3caa36d1026c5b72d3f61dd963dccd953791b04af03d9946b24bef8391e  firewalld-1.3.2.tar.gz
+sha256  61022eec66fa7ea0561924dfe65d17bab5ec512b3559198a05048a32264612d1  firewalld-2.0.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 13edba6d24..6b2813e54d 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 1.3.2
+FIREWALLD_VERSION = 2.0.1
 FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

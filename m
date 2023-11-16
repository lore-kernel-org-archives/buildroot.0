Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0218C197A0
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 19:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A3D340132;
	Thu, 16 Nov 2023 19:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A3D340132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSbKDOQXB-d6; Thu, 16 Nov 2023 19:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A39464144F;
	Thu, 16 Nov 2023 19:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A39464144F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 854A51BF387
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 19:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D72B82AED
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 19:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D72B82AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id od-pAOdgQMdz for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 19:33:19 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A35081E72
 for <buildroot@busybox.net>; Thu, 16 Nov 2023 19:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A35081E72
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40a4d04af5cso8799285e9.0
 for <buildroot@busybox.net>; Thu, 16 Nov 2023 11:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700163197; x=1700767997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXLA78Hk67mZwDsLvT2Af/FEef2q6FKkRCxywFm7Jk0=;
 b=c+5oBAB6E0EgJWozrukT30G/7MiUvA19Y/nK1LOM8u5eRP7NuBkRvNy09XmZ1y371t
 MzbDdfqjnDWYjg8FPyUAfPTZS8jDU91wt44LZ8vAJGjS7y/EJbYb2IKo9voUwKDkofZF
 bL11ospnY05PYICELRmTrQ0V6sk0Cnmcu/4Oo1hOQ+V0RwWK4NL2CclKxjcz3U1O6ujQ
 27tXF0InA0PyynHj46+FAYnfFMnrRyMyAj7CsKVDDMA4TIHCjGLeB4Xp4Ln6ymfCtlm4
 iCCfL3/JJuHOeEuVC9pp2VDRi16R7GC8ataEDV+TjVxwK2StHbjwLEyqL1Uya7cZlu0s
 2P7A==
X-Gm-Message-State: AOJu0Yzt0tRwB0RiUvGOpDaBGqi3cFYOMAX6M5MjRPIL4TgvK8YnnlOT
 G6IfVhg5uh3DcJhO5oCgkjO/GQ2vxpo=
X-Google-Smtp-Source: AGHT+IFrVUEpQls9dJaUh4kS3iWuDDVpBl3WmfVrqA62qwgsGBYAMW/D3dpkpgFXpOr4I+A7z+1TVg==
X-Received: by 2002:a7b:c057:0:b0:408:53d6:10b3 with SMTP id
 u23-20020a7bc057000000b0040853d610b3mr13768665wmc.22.1700163196911; 
 Thu, 16 Nov 2023 11:33:16 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c05d300b004081a011c0esm4509212wmd.12.2023.11.16.11.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 11:33:16 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 16 Nov 2023 20:33:11 +0100
Message-Id: <20231116193311.449783-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700163197; x=1700767997; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dXLA78Hk67mZwDsLvT2Af/FEef2q6FKkRCxywFm7Jk0=;
 b=Kr0jAACHCyN4WJW725dtWO1fPRRu+KUO72yJYcF7w8xJy9qUyli/gPcmW0f/jWRX2x
 AlFBxcswoa3YqVxB8XGeB1rcmRW5RAefK68hl3yIDXyDhU2gotIiW+ELJLZzvDBXP7MM
 0p9c7lbB8bpERE7OHTuOKQiMV7I0VkptnKxwU+TgrBki4mwy9fJA9u6zU+g/q1r64YSf
 f2v3yTfsWzuDURhKG1zahmqkoG9gyl0qUZbHRW8EqfNHoGeL0Foscq5qRzXn+0aPciJJ
 2QRsk9zlKQiMqkPmYCVAGi/ZQhgjuO1vElN+vDyaHl8JwzJvCfR4tJ5ROsObq2+gIsVN
 UGvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kr0jAACH
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 941aadf4e..3508cbb14 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  410603b0e567970d7148c6e9c91ccabeedeb4f32780be859cd2a4aac08cb5b9e  open62541-v1.3.7-br1.tar.gz
+sha256  41e82d81d2fc9449028dab31fd460df1da29130bcb7388222842e778cf34625c  open62541-v1.3.8-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 43e1ad6b6..16ef51ed3 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.7
+OPEN62541_VERSION = v1.3.8
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

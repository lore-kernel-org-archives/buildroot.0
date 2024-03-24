Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E88C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C358D81C6E;
	Sun, 24 Mar 2024 21:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZH1BB8Rt0tU; Sun, 24 Mar 2024 21:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734FE81DE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 734FE81DE3;
	Sun, 24 Mar 2024 21:25:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF591BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C2BE403A5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcNMwX1oq6q5 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:24:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66AFD400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66AFD400D7
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66AFD400D7
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:24:59 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6e6a9e2e2b6so2108159a34.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315497; x=1711920297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5Lv48PCD4bjXD2vY4uTvVcmGAI1RocIwBWZscbUC5I=;
 b=dqN3ohG7bu9tjkwaxBFjopTZczKEo/fbA003QFCdGS5SKyzB3R4lkgu1JZJGmz9vKC
 OAhmYTa3AHelDoHTtlmnVQ7vTCj4FggBI3HUA0rnnby9vhqM2GME1ybAf+cr++3dJIjV
 cp7zXZqmLFvkpwH5HbabLZpCjMxKX4xlFXb7UFLBVfuMFbD8sd2PXdYZu4Dui9wkT8SA
 CQH0Z03fOYCgS9j6X+8E+Of9Nbf+/EBZxax8KmL93WgeZs8zuwlOh1xJn9/Rv1ZA6fNq
 wDbvqIeBfGLvem8xVyDNREhgMEFJZfqPsPG1pgnnL/H+maY6TXhKvTrg+fJrmcK+yoIy
 N6cA==
X-Gm-Message-State: AOJu0Yxhb6nz6vYCpzwzBRnq7yGRHyutmAClZewpae4R94xnwZNJTNzM
 9pey3oQWU86zSjW9VZISxU5ytRO+hXgiY12L9XmL8GsAbu1ekSRWzqsk1MpMy2bkYIUySy2/eVM
 e
X-Google-Smtp-Source: AGHT+IF6GUEFImPh52+l5ZWrHk7HmcIiKVTmn4gsPkptFEKjQg51QWj9DpqhmyM/deQ37FtPNDQlSg==
X-Received: by 2002:a05:6358:2490:b0:17b:db48:9349 with SMTP id
 m16-20020a056358249000b0017bdb489349mr6179412rwc.2.1711315497573; 
 Sun, 24 Mar 2024 14:24:57 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:56 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:38 -0600
Message-ID: <20240324212441.526544-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315497; x=1711920297;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5Lv48PCD4bjXD2vY4uTvVcmGAI1RocIwBWZscbUC5I=;
 b=LqssyhW9+jlzSNLA1HS67b1KjbMqPJh4o37Y94x0ehRg/fHtiKaufB1ahk4eCoBD2C
 qc17VGt5/X5QN2fuab8478Xd7lIXrrZbvOt497OJlqBNOzIIMJZd458E4RBPEM6dIAGf
 Ge2BJ/oKpYFXtHfZlUf/RcElKqc54JYzd4Y8c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LqssyhW9
Subject: [Buildroot] [PATCH v2 7/9] package/semodule-utils: bump version to
 3.6
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
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index ac3357d3fa..5e7d698f3b 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  c9a550a737051ebaf2c102f665c7ec2f85e7232870980aa0067998459b414283  semodule-utils-3.5.tar.gz
+sha256  eedb88f2b2124e538f2d614be063c0d9ac3eacc0c51a4da44500ca1ed1ba16f4  semodule-utils-3.6.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 9a0f084128..b58f7535f1 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.5
+SEMODULE_UTILS_VERSION = 3.6
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170C2C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D61F560A7B;
	Mon, 25 Mar 2024 22:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tluaTWDUz0P; Mon, 25 Mar 2024 22:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9885160A88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9885160A88;
	Mon, 25 Mar 2024 22:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5651BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A5D340721
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4VUnxlcn3mX for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B5CB40551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B5CB40551
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B5CB40551
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:49 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1deffa23bb9so36425265ad.2
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406088; x=1712010888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1tJQM6GIB9F600xF2eQcgIdCcMdUuhfL45dfU4lMgBE=;
 b=jXzvthEDVQZ/PoBm7uZWt++Ax4LyhOgDjpPwXNhW7xOu93Ncjo3QpL+zqJt1ZXd/pJ
 ra3hztQIiCm7RG9BK7FrPdmx4lpiPA8gnUqjstr7piczEAPkRUcFn2oCoDXmM/u6QXIQ
 m2RWtgmcbd/CpcE5nJJO9ZtJrGQLtxA5VUHvmxoSNSaHxmXOGCk/fZYGPPnSeBGMKAi9
 FSQnk7y6UUx+nCs3b/Mnji0We9dK0iGGHBFpk+Vi9anTcBM9WNIhTtZGFxksaPqoQLIj
 ONVxST36uUu4FgI+Kd3WUlUlPZ+baIxVG9UFlj8qH3lolaFRnCWJlQMlR/7/IOQDxakv
 DQCA==
X-Gm-Message-State: AOJu0Yw/gp1FWdCOD37UJlwJczxjcu5Pqi7UROsf8Qi4//G/pKvparye
 /p6FrYbYmitmJ6NC3aM+z+HUthBNTgKYvLCj+5M1UVZWyl7mgXosvK/JaEWfXVzmTz69ZH9CNTA
 X
X-Google-Smtp-Source: AGHT+IHpc3G9USryeCbnbMEpwCMLmCah1/EnHrUeyffQOF8VEWaatGrQ4NT4/vovfVCm622BwKop+g==
X-Received: by 2002:a17:903:298c:b0:1dd:6263:62d4 with SMTP id
 lm12-20020a170903298c00b001dd626362d4mr10531460plb.3.1711406087988; 
 Mon, 25 Mar 2024 15:34:47 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:47 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:24 -0600
Message-ID: <20240325223424.108702-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406088; x=1712010888;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1tJQM6GIB9F600xF2eQcgIdCcMdUuhfL45dfU4lMgBE=;
 b=BR6914oaoxKQFssUqLEqbPR7IlYYDu9KctEHqDgLB7qSpMtlRpnne7DmbgYpaKCPnS
 X7D/0is96wtR1qjknlZlF2DyhQPgjAe3agU9CIAB1raHJbLiIgFOimpW0y6WfB7ZQNVu
 L70DCSACcvzD+t0Ic7g2jGMX3MUkY5/ZHOEts=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BR6914oa
Subject: [Buildroot] [PATCH v2 13/13] package/flutter-packages: bump version
 to 611aea1657fbfc0d2564a14b08e12dffc70189bb
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

Now that flutter-engine is 3.19.x, it is safe to bump flutter-packages to
the latest commit.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 994434e25c..eac58e608f 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
+sha256  a42e39a920d72183119b0e0bb7399513369a2aa7472f25da57ae95aad32e022b  flutter-packages-611aea1657fbfc0d2564a14b08e12dffc70189bb-br1.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 4beaa39325..ef29e0aa98 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
+FLUTTER_PACKAGES_VERSION = 611aea1657fbfc0d2564a14b08e12dffc70189bb
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D71C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 17:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C968200A;
	Tue, 26 Mar 2024 17:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgwRVJe6mVdf; Tue, 26 Mar 2024 17:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E233F8201D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E233F8201D;
	Tue, 26 Mar 2024 17:41:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 444891BF37B
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 17:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C216401C9
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 17:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmSHhoA73yDx for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 17:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F50940187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F50940187
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F50940187
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 17:41:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-29ddfada0d0so3188938a91.3
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 10:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474862; x=1712079662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SKQlBLTy5T4YV8y3GaWDZP4EAjfsIUoRv4LbbxP1m9w=;
 b=Ts2SkOoBKKkF0os7kKIjJOjurciA6Pd+Lj2vFGL3LPDHbUULzZCWWkbq7gkg/XjvBq
 VsLub0cPCWmNsrCW1iM1yx466upK+O0VUVAWB+0+rwLwFa2MXOL/U0pPSpAmwcU3kyU4
 +vzdJLP537rs+JKZgEGzmwHxC4BYIsJaQSxh+Zx2xj9phvlaGwqOpFhV9Dy+3LI5hGPp
 M/xwLd1owwU3PuE/IG0JxFeeW+78ojoBSxSdXNDgBDT+wlbNvCWRTW3zOkZ0kfDl9gYI
 1Ca6/ftdOre1uXxqzqO1gqO66ReLUNpOcDhqKA8DDa+DHQMyCNIw0Gv3c9kMPIxrG0bq
 4yWA==
X-Gm-Message-State: AOJu0YyLJ1uzaeaZpv6NvC7xm7JjUjols0CxRW/AtLcrk3clmPG8hPrQ
 EAnnXJrU2q3WXrLQHUtiFPIFX9C4MB2mUP0vlQBkj71Yid/qKUAHxPwjmG3B5Yf1yGp2/Ca5AYK
 L
X-Google-Smtp-Source: AGHT+IFcNDd8odqd9DpaRAYPx0uk/zzFfqOFSHRdJ65DnJz2rk1TOsuHz9ucK3UH5Hj8RDxw+LaGKg==
X-Received: by 2002:a17:90a:ab03:b0:2a0:97f0:955e with SMTP id
 m3-20020a17090aab0300b002a097f0955emr15134pjq.37.1711474861653; 
 Tue, 26 Mar 2024 10:41:01 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a17090b004c00b002a076b6cc69sm3219748pjt.23.2024.03.26.10.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 10:41:01 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 11:40:59 -0600
Message-ID: <20240326174059.499034-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711474862; x=1712079662;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SKQlBLTy5T4YV8y3GaWDZP4EAjfsIUoRv4LbbxP1m9w=;
 b=kh5bnetu9bKIyhNWWbme822JeDWtyojDKCH/tCvg9muAo/5NdvTOe5hrGHYJI3kpFP
 zD+vz/DStEMZL/Ga/5kLXZLbFzSVDxP7wghT/WX/L7m+Q0GFVrLV4F7zeoHu2+oBuCtw
 eyRR11rC1Qasrn62RVh2i9YQHb2pIsooDC8SI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kh5bnetu
Subject: [Buildroot] [PATCH] package/flutter-packages: bump version to
 ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
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
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 994434e25c..f124302a02 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
+sha256  2e1e19713ac74b6e00a6f5ec516e8ccda5e5ba1fc8b249d40abcfe4cb50dff87  flutter-packages-ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3-br1.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 4beaa39325..c1e7a14f85 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
+FLUTTER_PACKAGES_VERSION = ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

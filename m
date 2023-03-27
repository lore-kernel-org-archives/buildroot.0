Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09284C761A6
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 20:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C69F80D20;
	Mon, 27 Mar 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C69F80D20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 606aHaN0ncrF; Mon, 27 Mar 2023 20:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E936780C17;
	Mon, 27 Mar 2023 20:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E936780C17
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF8061BF371
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 20:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8B5181E91
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 20:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8B5181E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jTjwrzSg7Ov for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 20:13:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C41581E85
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C41581E85
 for <buildroot@busybox.net>; Mon, 27 Mar 2023 20:13:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so6069997wms.2
 for <buildroot@busybox.net>; Mon, 27 Mar 2023 13:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679947996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CkiDm4zm+RMFEFak8oFquiZi/xs7rpx6gmnT2cTc0xU=;
 b=082kgy9Vcsbv/T2/MXXGyL/3R4IHo5QyAzX0ylUqaqjb3A56BSEuAmGx3ZkAIdT7B8
 mz7XpSsZMQUX4KluVBsc5bfnZDBQYlEgSZPPcxSdtZxDEPWnAKfRZmdNHwyap6u79/0F
 HL62FmsAG2FuXlE5YLVk0O3AQ8myz80vvnETQyd21I0SU2F1lIy0ZhRKcMizqlWTR2DD
 DxD/PjU6GoGaUQ8X05tC/rx8mrpbM8tW9YkbKfYPt6ksN07p7vPrXf8CBtHgk1aX0OCa
 J5741evIqa8HKf3fVPGulTo0nGYYo94HpztfbZ2faKml/1+ifJRWkdDKV979slc+8eA3
 MO3g==
X-Gm-Message-State: AO0yUKUOtPdhfBx0IYocn1CYJ43kdgQv+H9vF5UQ+oE9578b9cqlVh9X
 YzBz7yMz6lDuu27hmr4BldZzC5OXeWI=
X-Google-Smtp-Source: AK7set9MvToRKxzw6mznGwYOkIKZqNM4WnHXb6/K+0R3h9cNLBldvIehhP25e/qVm9lOBtClgeCeIg==
X-Received: by 2002:a7b:ce08:0:b0:3ee:da1:135f with SMTP id
 m8-20020a7bce08000000b003ee0da1135fmr10205373wmc.7.1679947996075; 
 Mon, 27 Mar 2023 13:13:16 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c469300b003ee9f396dcesm9914870wmo.30.2023.03.27.13.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:13:15 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Mar 2023 22:13:11 +0200
Message-Id: <20230327201311.1483161-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679947996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CkiDm4zm+RMFEFak8oFquiZi/xs7rpx6gmnT2cTc0xU=;
 b=jSpMxeP+hU7+5GBSZh61BdZ+HqSqtBxB/SJxFJArAh+mJj6n1igryPp2OYLFeB/aG7
 bh5NoKzATwwahn+6CUy/1UxthbHCte8n6UPAIHKbc/6aTWvi+rVWZaRE+hdwi+iQZ41G
 lQhfzgl6d7zYuKw8FOara5iAfiwDsH6Ig1O9aT9ZRmKLKB/GX4jtqgC+0WjTMzr6Rxnx
 E+buXRHVrTaJfBuKZ1TZACC7ABIBXBnnAZ449ggFa3Qf6AhLJASa/s7UXOrLw2EWLnuF
 1oioDqtYCNM+VA0uKIUsp3U7r5FwqHlI8T44EOLYiPbSdZe9XZphwjohXAmbS5NYUpSH
 IwHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jSpMxeP+
Subject: [Buildroot] [PATCH] package/squashfs: bump to version 4.6.1
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
 package/squashfs/squashfs.hash | 2 +-
 package/squashfs/squashfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 13d5aed71..bc45b4ab5 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  277b6e7f75a4a57f72191295ae62766a10d627a4f5e5f19eadfbc861378deea7  squashfs-4.5.1.tar.gz
+sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-4.6.1.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 323908d94..082104b6d 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.5.1
+SQUASHFS_VERSION = 4.6.1
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

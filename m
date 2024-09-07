Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16229E6FE47
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 19:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80F084026F;
	Sat,  7 Sep 2024 19:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgPgtfw_lCqt; Sat,  7 Sep 2024 19:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4569C40373
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4569C40373;
	Sat,  7 Sep 2024 19:05:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 463581BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32D54405A1
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tX-k5I-KXbT for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 19:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C27E40597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C27E40597
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C27E40597
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 19:05:48 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82aac438539so24002839f.1
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 12:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725735948; x=1726340748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HmIP5QK7Y8nBCA8BnAMmGHCJGfNEhyEoV6EtaDGQfjQ=;
 b=D3CIyGbtWrFtlWiJTAiF6fARgz4eksxliEOsm0W0jYDgZdG93bDIhAbh5oz8wqxVCr
 W0IpvgjJMIed9/zTUm46yvduk0964Ro1AqN6c/c0spLUjBiNJ1R1IKxScZZsFprGHIu6
 EguPAWr1UQsIAy8p4b61872zsM2kMHRBsn9wbx/WrQojq6pwtDdbaAjIUaNS9nXqIquI
 Pc/sX6sDAAp9IFABinfKv5he3bRczKDlQDZQfKGJdXiPeA9KZkcvkJRpAyIyPQqOxUTF
 +pzTMzDbXwE1oRsI5LI1ylx7nNbFvWXdYzS1ACf/+Ntbk4cYGvZNfdwyAtVXCOZiOWR/
 32ug==
X-Gm-Message-State: AOJu0YzagWPjaFb7aVHR1Z1PEy2CcHcaRC5S6u73zipDZC442pFaoDKu
 N5nGp1u1KbNjMjG9VAzZib+E0sRkj5h5hQ8EpEtmd+aqbDG5XfvV61iOvA==
X-Google-Smtp-Source: AGHT+IHdAUQwqcLi0a7tMaEZlm8IpnSFacuz2qFqzYjNIU3pnw34YhVwO0wmWyC0JDzkM2svCnMItA==
X-Received: by 2002:a05:6e02:b2f:b0:39f:709d:72b5 with SMTP id
 e9e14a558f8ab-3a04f09a1ebmr78598765ab.10.1725735947652; 
 Sat, 07 Sep 2024 12:05:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a058fe5598sm4534475ab.38.2024.09.07.12.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 12:05:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Sep 2024 13:05:42 -0600
Message-Id: <20240907190542.879982-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907190542.879982-1-james.hilliard1@gmail.com>
References: <20240907190542.879982-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725735948; x=1726340748; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmIP5QK7Y8nBCA8BnAMmGHCJGfNEhyEoV6EtaDGQfjQ=;
 b=Mk8rQIeCR7J07A4VLwhyR6diuo4hLbsLeTRD5w3z31bwxNSGIWCJsLQHhuzckqnqgI
 8RC8qLAR/RdNdG90LP7xmopa2LMSJHcqQ/01yTuSLfVBUUsvsGlANL6kygbRmFGPA1JP
 OEQulW6wN/a+Mgzh7+XkOQ9Ii99iyEIhQSHnXC6KGBEASADjjhzYlaMgx8vx29qs2EQ6
 Q1SvQTFMvXApCr0kp6DCeN748ek6U9VJ95dMhRoCbNw59H68nLhy7NyjTTo0JpaVrtHK
 T6OsddT4uI9WlRohtaKS8SlqzSkGSdZ13O9ARE68t+4BN4+AhkjEftbYgcNE3bP8LGRu
 Nztw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mk8rQIeC
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump to version 2.20
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index b8c4cc5c4e..e05bf6fad7 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  9d0b934e51580316919796aa0357590971fc0df244b273fa10e154c268374f91  iwd-2.19.tar.xz
+sha256  86827b97cb5b19ddecce36568c59378da2fae8cf37a0e2b9eacd1269f24c6f8e  iwd-2.20.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index e86ffacdeb..47020624ea 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 2.19
+IWD_VERSION = 2.20
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

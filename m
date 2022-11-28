Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D85C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 09:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 169D581DE5;
	Mon, 28 Nov 2022 09:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 169D581DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dw3UvLIPlW85; Mon, 28 Nov 2022 09:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40DD981DE6;
	Mon, 28 Nov 2022 09:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40DD981DE6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF8A1BF3C8
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73DD34161A
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73DD34161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9deTsm4GJlP for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 09:12:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8547415C9
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8547415C9
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:12:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f13so16327982lfa.6
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 01:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wd24cU493J8S8mudTmbmEQP2eTc1LwAljjMFUAg5f+0=;
 b=RRzpzQNH9E5J1wmZpz03twmtvOtg4DomvZMuQRfiahkZsWJxh2j/x1d+0iwkQG2NxB
 pYG7RRDq1XGnC8XqURgDNwXToxVcdkP5H4pyP2s5FjxLGeQPwsBP2WwMN6QvpgbBTdOc
 BCh75d6NJa9biwlwB2AM76RdEKUsglek3bpQwSB1GvFvCq5iJ1t7wI1qNhIWxb6Cg2SO
 m8ePVyaLOS4ShE3TGrqT8AHpfCZZE1I1f9rQt8Z/RAYs9JHWhaHHu7p8AexmNp6xpe5h
 GXX4sdjcsyHZFa2rKfUIbgcdW2BEzfewEId+Q3bmwzioIE7tUtu5DE3GKivDdmKl4aw+
 Y/NQ==
X-Gm-Message-State: ANoB5pldph+kSPmOlHo9oO15orPCRFVJYjiTuZXGXujZc7Hat5nlxnD9
 ER7SA5WjTm5pr8po6x7WxhZN276YPlA=
X-Google-Smtp-Source: AA0mqf7yhwJ2GgLjyC8+vMBo1x9wOsnE8YtMMTb8EIJ0AE/IKk5EPZhl6+JbVd04tU78YxZhMn8xrQ==
X-Received: by 2002:a05:6512:36d3:b0:4a6:4e24:b2dc with SMTP id
 e19-20020a05651236d300b004a64e24b2dcmr19256750lfs.456.1669626730224; 
 Mon, 28 Nov 2022 01:12:10 -0800 (PST)
Received: from localhost.localdomain (83-233-52-190.cust.bredband2.com.
 [83.233.52.190]) by smtp.gmail.com with ESMTPSA id
 m30-20020ac24ade000000b004947f8b6266sm1649709lfp.203.2022.11.28.01.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 01:12:08 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:11:58 +0100
Message-Id: <20221128091158.5049-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wd24cU493J8S8mudTmbmEQP2eTc1LwAljjMFUAg5f+0=;
 b=YWscz3Ap4Uz0quQmaL8z8P7QovlmFZyNzLYQJPSqUQOF+veEdHG/HYtXfJ5xctmIT4
 lCugWaN1ICweAY+IE0zLjz18dqt9spgQYtm4rvjdvO1mfOCkE/pVxfpZtK+5NVzakh8s
 I/LSJJeCJJAPzvtAGG32rymc/yZ44ekV06aFXliF3Iqw44mHe8VZdnkhgRFG49o3C9rj
 CrG9EpxzyXulPEPZToTxxLYpildzLPNT+vSOB6hnXurg4DVliZrxofRr5sAoUGpZkeIP
 v7dzMlvyOfqWu9rGsA5/azPb1e1n9kibezX8wAY8ZpzuewVSWzNjV5BLcJvRjH8Yvd/c
 2+eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YWscz3Ap
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2022.7
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 582af4b7b9..ed31109fdb 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  835ef47d9a0b35a10c77ffd7f0fbd2e2b87f7cccb588da27442a05ff71ffad8c  libostree-2022.6.tar.xz
+sha256  8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b822411f  libostree-2022.7.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index e99da9d2cb..8e8ec63213 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.6
+LIBOSTREE_VERSION = 2022.7
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

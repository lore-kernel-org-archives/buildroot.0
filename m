Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0CC76195
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 01:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61F741F8F;
	Sat, 25 Mar 2023 01:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A61F741F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUUra5YNXakX; Sat, 25 Mar 2023 01:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B262341F1E;
	Sat, 25 Mar 2023 01:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B262341F1E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD4591BF2F2
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 01:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9536741F1E
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 01:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9536741F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWpAm1KE2IOs for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 01:24:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D096741DE8
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D096741DE8
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 01:24:11 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so6700739pjt.2
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 18:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679707450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UWM9Sq/oD3QAUxfIiSolpyj4XouzzxVUO+woNQTgfVE=;
 b=myL2pkb9OVbD7v4GFL7gCbt5t+Pq4W+TOB8RKqtzeYybAEJj/Q0ISz8k/m/7kukupb
 oLuro4h5WHDZLFb7AdGC9Da/Sj7EXyUgUj8EOM7cE/3ueE/RNU+p6enQMYQhIBeHYlwB
 +pw/X3CW0B44jFaFbLiDkDpBt68nesbI2DmwUpHUdBDtrZlZYuYiUtN1QnvEN5xW4tKo
 KDuZK3KfUnwbOv2jDh3a+VtsCKpE3d0yWUK9I8EyPuhAITv/80+U/Zia2WSrJ1w+w7nX
 wkPlv/eap+i0l3Di4KdPE9G0xxhFuYNeHDOLbCPo41QPknhZsc5hrehFD89BTBSZO3H0
 UyQQ==
X-Gm-Message-State: AAQBX9dYJOLs4zZJ+IVnugiUEuF3hk5BlA0uZRJ0yz7ZWnPwDHRSaA6o
 3PB/G9OqAQ6a+PosOyQDE13bu7KzlF4=
X-Google-Smtp-Source: AKy350Y29tddffYbdsslLlXGeYeNPckG6whHs9GCixpvUVgFer6ZT/bAxEjKrSLOeDRjgI3DLXAV3A==
X-Received: by 2002:a17:903:24d:b0:19e:ecaf:c4b4 with SMTP id
 j13-20020a170903024d00b0019eecafc4b4mr5463892plh.4.1679707450507; 
 Fri, 24 Mar 2023 18:24:10 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p8-20020a1709028a8800b001a1d553de0fsm9710240plo.271.2023.03.24.18.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 18:24:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 24 Mar 2023 18:24:07 -0700
Message-Id: <20230325012407.3785883-1-christian@paral.in>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump to LTS release
 1.6.19
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Tian Yuanhao <tianyuanhao3@163.com>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

containerd 1.7.0 has been released as the final release before containerd 2.x,
however, 1.6.x remains active as an LTS release series.

Update to the most recent 1.6.x LTS release 1.6.19.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 16474089d1..25713d054e 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  e0a893cf67df9dfaecbcde2ba4e896efb3a86ffe48dcfe0d2b26f7cf19b5af3a  containerd-1.6.16.tar.gz
+sha256  7a90dc72f44e230eb5228ebac23b37e91f7d26d175d563099a8e1c0592047a28  containerd-1.6.19.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 4a0d6ec38b..ddb042b685 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.16
+CONTAINERD_VERSION = 1.6.19
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

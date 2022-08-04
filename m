Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A4AC00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 05:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD2B641726;
	Thu,  4 Aug 2022 05:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD2B641726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxyXUEsj_GdL; Thu,  4 Aug 2022 05:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB3C5410D3;
	Thu,  4 Aug 2022 05:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB3C5410D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 658CC1BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E2F44059D
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2F44059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diGAa8qK9JAu for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 05:47:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7543540584
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7543540584
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 05:47:40 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id w185so18445085pfb.4
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 22:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o6zTLlULrettWEfMRbfqzcJKUdR52/FKilO1CDKEuI8=;
 b=vChxO81bfOX6eGyMmgqgEndSgiCJOoT1egTuzkljy86mgf2EzLXiF3s0aQIMpk1tVJ
 gT+KHgmPwo/xx2RO5SBlyUB9/8yMF2FD9VznWGQ3ds6laxfywqR2s+JRayVzt7PJ0kDA
 8q0ZkpGgp0ueIOU3r+Ewl7paDZM2I0J3c5p9HesLKufrLhls0eIhvym9jSMlHwlxqcLd
 yF9Cfw5j5p4TU5IyjKiXnHUO94llZl1L15MJ27cjQHVeqW8zOYwjTw7pBck5+XWpUvOq
 ah9uLbnCtPpFf1sI9leXTYlo8TrUAp4ohzmgjAHatE/Vkfps66YaADNID4/zG80p+eVn
 L6kw==
X-Gm-Message-State: ACgBeo1vLGB0EshCA2aLz697wYXNvolaIXO753YtQbjlPrQQd6wpRcjt
 ZOn3qtuHftI7BNtNeWShKlmdl0licfHCug==
X-Google-Smtp-Source: AA6agR6pAfwv4dlapQ0nfPQSi4dU1MP9mQC7lCsjxl2t4S4uHHmBcL5Tf/mijgVA9HTKDrVN0ARnDA==
X-Received: by 2002:a63:10c:0:b0:41b:b4ba:d5da with SMTP id
 12-20020a63010c000000b0041bb4bad5damr335964pgb.322.1659592059447; 
 Wed, 03 Aug 2022 22:47:39 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y19-20020a1709027c9300b0016d62ba5665sm2947526pll.254.2022.08.03.22.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 22:47:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 22:47:36 -0700
Message-Id: <20220804054736.3221427-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/containerd: security bump to 1.6.6
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1.6.2 -> v1.6.6:

The third patch release for containerd 1.6 includes various fixes and updates.

https://github.com/containerd/containerd/releases/tag/v1.6.3

The fourth patch release for containerd 1.6 includes two fixes for CNI and SELinux.

https://github.com/containerd/containerd/releases/tag/v1.6.4

The fifth patch release for containerd 1.6 includes a few fixes.

https://github.com/containerd/containerd/releases/tag/v1.6.5

The sixth patch release for containerd 1.6 includes a fix for
CVE-2022-31030.

https://github.com/containerd/containerd/releases/tag/v1.6.6

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index eb9f2894a9..c0c926f2e4 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  4ea21a6b4649512366e7c31ae547ad89c6a69c6586a6d8565cff07898de344b0  containerd-1.6.2.tar.gz
+sha256  27afb673c20d53aa5c31aec07b38eb7e4dc911e7e1f0c76fac9513bbf070bd24  containerd-1.6.6.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 36f2db4125..80952914e6 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.2
+CONTAINERD_VERSION = 1.6.6
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

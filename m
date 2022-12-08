Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C45C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89EF4403CC;
	Thu,  8 Dec 2022 22:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89EF4403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKKfiqhllzVS; Thu,  8 Dec 2022 22:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FEB40382;
	Thu,  8 Dec 2022 22:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FEB40382
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C86A1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03687402E8
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03687402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dpjkcx2UwAq for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:04:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CADC402AF
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CADC402AF
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:04:54 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id s7so2897467plk.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 14:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrOfafu4xPa4MK+q+CTfnfBtrdvUMfV2QdZ42FvJa2U=;
 b=Ye2H+dyATurDCKyTTX5MDE0AP+4/khlvNVBghQ2kHOnhpRJi9RHSwlzLE+sSSkqotO
 0I3rtZAYuQ5HlMz2/pu+l1sPnkdckXRhdVcCWFVT5VbPFL52NS7dR9HG7VusTneexMh+
 58kpSkJ7gdbyNRXzNnMLSU3SPscQ/AUHA37ypwsiJjXet2MDptKHZHhM1lzYVeVVjVc6
 JVLfNmMIM9elkF9QqpNRgl06sFA3YEQrf3yYMSdrG8Uo4ZJZxGL9pfzawszdEsJzGtiy
 3pz8m79Y8ZH49+VB258LMsxXzOrtw7peE6/Nm2jdhBgu3zmSnH4Fi3DSZQ6RVqiNkqiM
 SVmw==
X-Gm-Message-State: ANoB5pmKGvyS6niYYmqvJouiJ2Rg8TCeparxMyCnt3lEBf0PRmE7mFAL
 HqnZsuauLEi/mKNiPA9hEK77QNMdT2A=
X-Google-Smtp-Source: AA0mqf7ydrMrMiNVOWL82EpmFUlr0Kny1o39NGiSA9UBegTjGDzt9f5M25jO9t+q0zlAFzOCvK5D/A==
X-Received: by 2002:a05:6a20:7f89:b0:9d:efbf:6622 with SMTP id
 d9-20020a056a207f8900b0009defbf6622mr6862298pzj.48.1670537094134; 
 Thu, 08 Dec 2022 14:04:54 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 a14-20020aa794ae000000b005774f19b41csm5091734pfl.88.2022.12.08.14.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 14:04:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 14:04:51 -0800
Message-Id: <20221208220451.4168829-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fuse-overlayfs: bump to version 1.10
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

Contains various bugfixes.

https://github.com/containers/fuse-overlayfs/releases/tag/v1.10

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index f9473c154a..aa5438755e 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6c81b65b71067b303aaa9871f512c2cabc23e2b793f19c6c854d01a492b5a923  fuse-overlayfs-1.5.0.tar.gz
+sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 0ad7dbc51d..1633d3bd41 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.5.0
+FUSE_OVERLAYFS_VERSION = 1.10
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

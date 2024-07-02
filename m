Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C63C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 23:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A537F40710;
	Tue,  2 Jul 2024 23:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8p9iwYGT5ni; Tue,  2 Jul 2024 23:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7635C4071A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7635C4071A;
	Tue,  2 Jul 2024 23:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 145FA1BF31E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 23:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F01660C03
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 23:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x52_aOFd_oIB for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 23:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 409E160C01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 409E160C01
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 409E160C01
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 23:19:53 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7f649f7868dso116958139f.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 16:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719962392; x=1720567192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5mqTMaOX6BsfOahmefcC4vNEDHaaScnRmcD6dAk/N0=;
 b=P1wZXilek0VJLSP55U/DhTw9ewKXTkPg4i89Wmfg/JwgugLHhOQNhWkVRcK8KkRugx
 PtXUOdKXpLz/hrY0PT9N42L++FcKV1EWwui7L32yy8FoBPYTXFUHxeXt/Ps1GOJS2k1A
 mQeAw2qEqNlUQTwyZIMD83cfbZQ5mdtwfolWBFz51Rv4uuvBFKeOjyug9s66dOXhsPeO
 /tof7GFEGEVJF+JXj4vazGuLlyigciOHehYVTOdalrtxnk9EuWVHEIsVds20LoBkwpGX
 gzY3FX1ECL7nSddVioB0Vc75aKVYNmKvX1NprI2Hyj5vL6JTfBdXD5GHbalM7tYE6ap2
 ySVw==
X-Gm-Message-State: AOJu0Yxaopoub6+orXu0bUnEatNNS/fddEBFSA/VMcVoBLdpUXmFDd+e
 2eSGg22R7zlzdcL1bMy4s5yXTr9yFTV322swlR82nUXZvBuCKfI40WGkzw==
X-Google-Smtp-Source: AGHT+IHVIpcTViVdLNc3jqThKDfILQL6w+QniKU1DZ0t1rE+YNNNv/77jyvYIEqYHNfaQr3JyGN/Bw==
X-Received: by 2002:a05:6602:98:b0:7eb:8cbd:16a8 with SMTP id
 ca18e2360f4ac-7f62ee168demr1148778239f.10.1719962391786; 
 Tue, 02 Jul 2024 16:19:51 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73fa17cdsm2997877173.119.2024.07.02.16.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 16:19:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 17:19:47 -0600
Message-Id: <20240702231947.279854-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719962392; x=1720567192; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z5mqTMaOX6BsfOahmefcC4vNEDHaaScnRmcD6dAk/N0=;
 b=Yq7pyWV4n2BcPbmlO2cbXVdlKFJ3vVku/OgvwlRpvoFZabHHpTtP1owCA0kazG68in
 dkdfU8aQi2BLwSs88RAX/aCjgXQddNhmy8tmTHnEeMb7uv5ReIkPLyZPkiCyoejTKi3H
 6XldmlMqXKrkIVUV0gFdoO6nWFKHLC9dep8WaeQxJt6Z4oGrH2Rl0NdZzcc0G48j3JQ2
 S7zuPGoyPO/PhdUK+Qs7e+5TLGKpgpIfg1sck/aT9DQJ7s1B9+Z7xXZmBSakSsuJbUUT
 OTpxQhLIu3UrbKz4g6YGsOIZ4MnSOsjIonBPblyc8YnwAQ8ey1L+Xb7ad68I9F3dGWbY
 oEsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yq7pyWV4
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version 2024.05.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 13964351f6..ac28acb1f4 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c8af1e964d0123a7d4bbba981170eff723db87dcd37e5881c584ffee54194d1a  swupdate-2024.05.tar.gz
+sha256  2736045e885ad6c5dcba8dcc6c7582d0b76ef29a3d6ab7c4080908356e35e3b2  swupdate-2024.05.2.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b36aabb1e7..75e4af5db4 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2024.05
+SWUPDATE_VERSION = 2024.05.2
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

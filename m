Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B7DC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 22:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1716C41588;
	Sun, 17 Jul 2022 22:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1716C41588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjg8ujt_WQkW; Sun, 17 Jul 2022 22:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8A5241581;
	Sun, 17 Jul 2022 22:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8A5241581
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2CF1BF59E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 150AA60F53
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 150AA60F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRLQNYhCgRvp for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 22:25:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089C36080A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 089C36080A
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 22:25:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id p4so6177795wms.0
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 15:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y9uPmK8x+fIDyiJLrpB2yaeUPC5EJsMSh51y1Vmj704=;
 b=Mg8xy1CCZL5Nh/qsGBbGpoc6DnQtaLBL+8Fi/tANFgdlyuNaIRe0EtKUdJka9T6uBd
 OhAqFKu8IApfFL5VU5ajrInA9lX7mTROvoAH2wsoYN8jXjiTktVa6oTa7NSpmoArYTSQ
 X4sxTYP4nsd2RlktjIE4b5lf+IJCeWKDXXnmk1aZQtN8WSZtMQdEWywcrI6OZouSsY6W
 5NPkNmMyrkfRQl2MmR/kj+jGvfB7B+j0YjTS2sHBLE/yYAiJ6PkX169lc33ngmG7PQU8
 etquFvhFsH774ojstHvb0Pg7Sn5Rrb9ulbC+vHPHqWO/t8aZYMsYCttMhYU8lihYwcRE
 HI1Q==
X-Gm-Message-State: AJIora8OsSLfPHd+8nCh1SDyeBVxRofyHi5XWwlkJqggNTIWqxbaYDjH
 0qxVxSsIesnMloAi6LcbsGWUEz1MLnQ=
X-Google-Smtp-Source: AGRyM1uTUOzfB5qEM+PKxM8cb2Ogx2Xpe4A7qj5JjcHGIEv6GmEN3GEJzmXIgFxa88fnMjnUPvIzQQ==
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id
 x22-20020a1c7c16000000b003a04c5fce13mr23578928wmc.73.1658096737750; 
 Sun, 17 Jul 2022 15:25:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h17-20020adffd51000000b0021d746d4820sm9005594wrs.37.2022.07.17.15.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 15:25:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 00:22:33 +0200
Message-Id: <20220717222233.2926672-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y9uPmK8x+fIDyiJLrpB2yaeUPC5EJsMSh51y1Vmj704=;
 b=eXW5Qo+s3+0x+0qm4vOekrTX56GdcP9G3+SIQ4GQCZc3uHHnhvdBWCdB+/XhyJ0sHe
 sjK6zaXflQ5am2Sl+Mt3XeGSZyjVHL8GXiJFoUHINIPSZPx9mfUHVgLr10LhsKcdw9Wj
 ScMcBAwSrggDRHbCA5r1KQIHBPvw+aKoDgJF58mRwvHP3ckidrxPYzE+TXHFCFwIItgC
 8Fl+5V67KT1GDr6vojs6gqazDfCy4ha6bA4Zls6tpjmLOONQ7t8smz7bUhhsIPZmtiM0
 Qmgr+9MUTIL3IBZhgTzsdgWmQO9t5AGCotFo3cnznxTlw7XMfBcSNU2WQIYN+mpzm4Da
 Og+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eXW5Qo+s
Subject: [Buildroot] [PATCH 1/1] package/crucible: fix CRUCIBLE_VERSION
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make CRUCIBLE_VERSION compatible with https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index ad8a2cb35c..d0a2a63fab 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  51e911ce5e2a9f182a737b71f6e2bbf46fb80bb3252220cd99ffaf54d38e6c64  crucible-v2022.05.25.tar.gz
+sha256  1229c7d1587a97e9f3d456392e06c7be288bacf6ffb68c940d497bf55edab20b  crucible-2022.05.25.tar.gz
 sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index e9038f8cff..fdad709dde 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRUCIBLE_VERSION = v2022.05.25
-CRUCIBLE_SITE = $(call github,usbarmory,crucible,$(CRUCIBLE_VERSION))
+CRUCIBLE_VERSION = 2022.05.25
+CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = GPL-3.0
 CRUCIBLE_LICENSE_FILES = LICENSE
 CRUCIBLE_GOMOD = ./cmd/crucible
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

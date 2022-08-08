Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CE3C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8D060BF3;
	Mon,  8 Aug 2022 15:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8D060BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UpbAijvRxux; Mon,  8 Aug 2022 15:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36E6606FF;
	Mon,  8 Aug 2022 15:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36E6606FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 265751BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D9134026C
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D9134026C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cg024oprppF2 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F7140266
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7F7140266
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:48:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id c22so5012877wmr.2
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 08:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JkyxYDqzdkOHIvCCOB0L5Gyq6InsUw2KnXtxweBwwac=;
 b=eFlSeQULJVxyrEFzXMoDI1AHblRODpcneKDQtaSgn3NIGO/XuT+sR3X71F2RswZnIl
 8yapz+WabSdOmnaTpGTJNOLMoCeCwLzfqBzqnkW15iYyiFKSyZ4TsgrPbK6uSwhEyzF9
 LDUYiRRNLNqEJEaBXcqBHBi4ScW3bK4PNIN1ogQdgD5hn/rE7lZ+fcjNzO+Ei+fVLiSc
 G3Nod/o0p4OL2+OX7zpwn48TS4HqN6TsUaxZyqqVkDy7Fa7LHK3yRp0IuROHLSyCMQN2
 KjDw7nsV54BfxNuDN/LqZ8UB00x0IsWjCHaZZKg7cXREiL/PNoNzbSw+m1WgQZwHe96m
 8Vxg==
X-Gm-Message-State: ACgBeo23ar5SJrfw3PnCqDM/b7LQj+YmUWedEiA3nrelmT566yVz/h49
 Obev9+blI2rvZ+ApM6lL1V2UgDOp3pg=
X-Google-Smtp-Source: AA6agR5kVIc7DUDUJjkekybJYH7wWrp0l6Xq3y3zS6euvlADHRsNuh2kVJIosQCj03mDfinATFctlQ==
X-Received: by 2002:a05:600c:240c:b0:3a5:3e31:5a6b with SMTP id
 12-20020a05600c240c00b003a53e315a6bmr4101150wmp.201.1659973700727; 
 Mon, 08 Aug 2022 08:48:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bg40-20020a05600c3ca800b003a2ed2a40e4sm21792228wmb.17.2022.08.08.08.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 08:48:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 17:48:17 +0200
Message-Id: <20220808154817.1712207-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JkyxYDqzdkOHIvCCOB0L5Gyq6InsUw2KnXtxweBwwac=;
 b=XR+siKz27K4FygmJQ7N0hej+yvNCq2w38DqIOXenC/JYWF0AhccdfLgS1CEantKrxe
 6zlmoc7yZf3kITEpOHYlp22bRZuD6ewhpdwWYSLgHNd9hMbDxUaVsolM/ApwqAJaF3/4
 TwV3x3dvLVQyKPnKZ5LavsVyr6WNpZrqTzi+ik06hTwuDpsSM+OZ/5BEqPC/VrXCYH67
 XAQS31IFSrdV+ibmBh2yRwL32gl2iF1JPl2HV5pLryOFjCNfpVf194IpmrmClXrOWcAg
 qi6NBqkLMKSkO+4ShqHtPPVYqq1+6n2Bt4tu+rL7j+F89I88l9PBPwjcxcw9Svj4v3O8
 D/xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XR+siKz2
Subject: [Buildroot] [PATCH 1/1] package/gauche: bump to version 0.9.12
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
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site to get latest release
- Update hash of COPYING (update in year with
  https://github.com/shirok/Gauche/commit/09a3d4f9da52d8b3d9bc28a0ff2aa9c02e99190a
  https://github.com/shirok/Gauche/commit/2a4146798cdaceaf43764e1bf7b959b4a31bf995)

https://github.com/shirok/Gauche/blob/release0_9_12/ChangeLog
https://practical-scheme.net/gauche/gmemo/index.cgi?Release%200.9.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gauche/gauche.hash | 10 +++++-----
 package/gauche/gauche.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
index dea23c1e33..65e7da9ee1 100644
--- a/package/gauche/gauche.hash
+++ b/package/gauche/gauche.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gauche/files/Gauche/
-sha1  ad5e15021764b733ec913cca8b77c9a53d4ee997  Gauche-0.9.9.tgz
-md5  20d8ed835ae0bc97cceed78a71f9857b  Gauche-0.9.9.tgz
+# Locally calculated after checking signature
+# https://github.com/shirok/Gauche/releases/download/release0_9_12/Gauche-0.9.12.tgz.asc
+sha256  b4ae64921b07a96661695ebd5aac0dec813d1a68e546a61609113d7843f5b617  Gauche-0.9.12.tgz
+
 # Locally calculated
-sha256  4ca9325322a7efadb9680d156eb7b53521321c9ca4955c4cbe738bc2e1d7f7fb  Gauche-0.9.9.tgz
-sha256  13cb582677dbcdc5b34313c59b4a014e74ef2f5fd80e514a0bd98fd8a4e45bed  COPYING
+sha256  bc09c643a05e14d7ea8264aa737c5c14d60a20911a0309e7b27da231bbb4525d  COPYING
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index fe0a613a9d..7c43bd4573 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GAUCHE_VERSION = 0.9.9
+GAUCHE_VERSION = 0.9.12
 GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
-GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
+GAUCHE_SITE = https://github.com/shirok/Gauche/releases/download/release$(subst .,_,$(GAUCHE_VERSION))
 GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

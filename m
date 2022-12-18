Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D32C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 22:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F1B408A6;
	Sun, 18 Dec 2022 22:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F1B408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqc_ryXbSqEx; Sun, 18 Dec 2022 22:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77F74035A;
	Sun, 18 Dec 2022 22:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77F74035A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10BD01BF286
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED60F60615
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED60F60615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AP0GBa1pc-GZ for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 22:08:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA9FD60601
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA9FD60601
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 22:08:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a17so5898135wrt.11
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNEhpjFjPAWn0jl66rFLZ4YiH9vWN8Q0FIPLhZ0EsaM=;
 b=5bPpQMGLLtCEEyI5eyv5YUnigosnZ6yuXRclG7B7ueWKbBW5R82iiey7sWqpPCQ1U2
 sQloELA7uKZidE0c97w4tRl9uSbsVnyV/pk3rV4l8EAXib6gUEgvpRunPwQRuaKhc6Gb
 XUmRl+yYI6PndHk+q/htPFAd7nFso+6MGcF9NQOb477aN0bxq7kaF9aEiTSSL/wnNvKT
 BH6kQDQ8FfO+Y7FiJZY6n96osD0KVXMGOIEGzgpkef404L9mnxWGqz5jVcpO1eZ+fxfq
 8xxQ4jRtp1lq/meacsMywPPD5pavY3xnNloSgi7ykKtbX/d/ms13xB9knkrGzUaC8U2I
 s0gw==
X-Gm-Message-State: ANoB5plRD65yOgxxKx/NXXmOPp/lPPRrjXVVvQ6eKETrTQb1+dlpKRAl
 mo0F5n9EM5t1cZ3lm+Bifly+nxTEydU=
X-Google-Smtp-Source: AA0mqf5HNiq69hS/XyXNOwxZ/E20GYkXMcNRviw69VLr66HyILxrUSviqx44XpLRSEshRF8w7okCtw==
X-Received: by 2002:a5d:55c7:0:b0:242:bef:809e with SMTP id
 i7-20020a5d55c7000000b002420bef809emr23163945wrw.1.1671401289500; 
 Sun, 18 Dec 2022 14:08:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 w12-20020adff9cc000000b0023c8026841csm8246111wrr.23.2022.12.18.14.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 14:08:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 23:08:06 +0100
Message-Id: <20221218220806.39245-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YNEhpjFjPAWn0jl66rFLZ4YiH9vWN8Q0FIPLhZ0EsaM=;
 b=gOLRs7TI2R5s2WdMigbeCICeEsGDaCw5NMIwzDYUGgTbDyhIf3w5UMZFPj7zvCrILd
 ToDhjsNg+EYahC5pVUN2AqxyJh8on0pbSUYFpQHHbKTyyUkYp1JJXn1D47QWfCG0KfhQ
 rJL0cN4WvRFJse541okqBttKWVrxp6fUo2DgyGLsusBcEa+QlWXAFKH9e84d1xEWk0vM
 1NAV7WSReR/WcHwehKGiV40KkTXSy+S870IE78i+7mSAp8PJTWiKnkym2uCkci4edNEg
 ZtPBbn3omxCzxNA24X5v5PlTdvqHQFYs7qX09fUExMyL1fvceFJ++KJgdk4Vp+xZ0ANh
 Nzyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gOLRs7TI
Subject: [Buildroot] [PATCH 1/1] package/ipcalc: bump to version 1.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/ipcalc/ipcalc/-/blob/1.0.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipcalc/ipcalc.hash | 2 +-
 package/ipcalc/ipcalc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ipcalc/ipcalc.hash b/package/ipcalc/ipcalc.hash
index bf9b34a610..50d08239fa 100644
--- a/package/ipcalc/ipcalc.hash
+++ b/package/ipcalc/ipcalc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dac080c0773cc14c1d6f818899351d2286cace85751dd9dc704944e54c2c3565  ipcalc-1.0.1.tar.bz2
+sha256  47c866941916800270fca23496acc9976ca9488ce9053aeaedc5f47c5929b772  ipcalc-1.0.2.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index dfe35e2cdc..e63e174ce2 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPCALC_VERSION = 1.0.1
+IPCALC_VERSION = 1.0.2
 IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

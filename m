Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACBCC4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 23:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3ADA60BBD;
	Mon, 26 Dec 2022 23:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3ADA60BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjlggPaPVfjm; Mon, 26 Dec 2022 23:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1852E60BBA;
	Mon, 26 Dec 2022 23:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1852E60BBA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFFD11BF34F
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 23:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B74860BBA
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 23:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B74860BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09cAkNrHG2fK for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 23:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D45660BA2
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D45660BA2
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 23:07:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d4so3066816wrw.6
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 15:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PcXLYkrE4s6ch5SjY/Q19VSq/7D5/yj/DRRQCpYcLVw=;
 b=LkMqd7UEMf1YlTVJ0QGw7UFJ2LddCWfm5cdEIp/1bxymxXBBFBL3Z/MzVPNq8xg2Fn
 NHCfiGrCmIBl6H9HkNnuZHXn/HCufNRVL9QH/25YjSPXZDlR6RaaY7qR9FSll9OhMqIP
 Oucsxi9ZXAd3v5XoQD0a1LE2RRJXppri1c6xrPbX69S78R08VkLNRWDgiWgT1AIk3z5j
 /Eh9aZdDete55SfvHQER5SqWdIIUSb/4deA/ObhK4HgYl/Mei8/9QQfV6Pk6np1/vR4v
 +ncPeSi2UljkrVw+GbDK/ae6EGcbD4+zlhL0RTJ45GxF6U/mnwOqZ5p4yJiKaNlAehrS
 klbw==
X-Gm-Message-State: AFqh2kpgKu7uwFxEpkesaNkX/ca5tFrPueHQq6Ixe73DY1CRWeyCsrcW
 bIhyapxy0KeDNcJjiWYI/xdcC9ULW5c=
X-Google-Smtp-Source: AMrXdXtIkjhYakPnrl4nJXqgT53G2EpJ7BXj7u5APXgGC76UAxx0g9sV5u/AJGEJn1h333O/LMijZA==
X-Received: by 2002:a05:6000:807:b0:242:763:34a5 with SMTP id
 bt7-20020a056000080700b00242076334a5mr14006114wrb.2.1672096057893; 
 Mon, 26 Dec 2022 15:07:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q1-20020adffec1000000b00281b594c725sm1407182wrs.38.2022.12.26.15.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 15:07:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 00:07:33 +0100
Message-Id: <20221226230733.837698-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PcXLYkrE4s6ch5SjY/Q19VSq/7D5/yj/DRRQCpYcLVw=;
 b=qNWxMiZalpORWi8RxxHiix67TZgc0VdRtso/3e9yWa1HkuChRkUEp1hBZF5W+tq2Nq
 9qKhMSPuohYhQM7n3gGiyinpPi+Ph8dLbkNiLwSsVV1mHyI7q1gxaVa3YdCOZEGF2nTa
 En/fDG2HxRXq1aPxG45v/iRZBI9OImyFLI8Cr4CZLTxc2RSMcJHsf6T/9yy8kf5EXT44
 SuxFCA+8skgvzEyKPj1IRjeS2h+K8/NzuvT0nTl9LEC6xXQ9ao8XxBPRyXUKQNBM9dMp
 nWumU075mg7ffBvS3sWuYD6aDbuGA9sz6J5tYsmoao5bK6vXLBCU8XM7NdT+3/fiYGXK
 5JRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qNWxMiZa
Subject: [Buildroot] [PATCH v2, 1/1] package/haveged: bump to version 1.9.18
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jirka-h/haveged/blob/v1.9.18/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix tarball hash

 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 8c62ead7c3..61bf6cc9a1 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.15.tar.gz
+sha256  b835fa02b52ee7d06276e028571cadcb14d08f5e5a4b5767adf81451f70561c7  haveged-1.9.18.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 7035142aee..fbf72a96ad 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.15
+HAVEGED_VERSION = 1.9.18
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E9C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 09:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1950403A8;
	Sun, 30 Oct 2022 09:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1950403A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTN133C11Bom; Sun, 30 Oct 2022 09:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93741403C8;
	Sun, 30 Oct 2022 09:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93741403C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03FF81BF336
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD6A460A72
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD6A460A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5U0qkx-4G1S for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 09:28:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67FB8600CB
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67FB8600CB
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 09:28:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so6374113wmq.4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 02:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J68OWsogsUKqA4o4FbBTQk1Ex1+khTuEJ9qkSljSZWg=;
 b=NFfBM6OCzZhprbcUntSQIH0MYH1WV7m6A1jQwX185hPHtmDu+sDVXz7sEV6HJSM+eL
 oL1Oc7MkxgHmHzt1MHLRyOwTRhEjpvQcghbDH/7zP/sO/LrTj/3ImSJ2F6024Haehdqo
 v0PQj6KdUKWxTUyCSljzLGENxr5nzUpe6qOULo09aILesLFeozjdbtOrkHYMT74N7u+p
 EIS7BtVDww4Pv3fdAAomdWDjG8IiP78R3K6p1PDNcTRJRERZul0IT27WdWYpo3tXEmR0
 vW2njfQMkOg7iCpD9i5TiFBorhffo+i+OCll/tfhAXkWJyn3AFlEyVsi4Ud1esLAu8gq
 T/YA==
X-Gm-Message-State: ACrzQf1EtjKCOadVnu7gYiZv0S3nHTkceG49aZFoPrzHG5SAmiNk1v0P
 Ry6mYNMa/nHveZTXSH5a5OsKzeSu1Tw=
X-Google-Smtp-Source: AMsMyM76nD3IjdzNaPncqqHRd3zddAO9q5feOtHTO4+Sd6bs6IwtXpGxJiEkd/GS6GS/GloFTpQZIA==
X-Received: by 2002:a05:600c:4e86:b0:3cf:5ec5:d3fd with SMTP id
 f6-20020a05600c4e8600b003cf5ec5d3fdmr7339289wmq.32.1667122077979; 
 Sun, 30 Oct 2022 02:27:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bk17-20020a0560001d9100b0022cdb687bf9sm4521756wrb.0.2022.10.30.02.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 02:27:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 10:27:49 +0100
Message-Id: <20221030092749.43292-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J68OWsogsUKqA4o4FbBTQk1Ex1+khTuEJ9qkSljSZWg=;
 b=cx6A9q+KsFgDCJUeIufeffKGLgtJtr6vjuk7tHTie3M6pZXQ9QE+0232OFV1OWxspA
 /rYtLp81DdIYH9bpp6xbV/wTJnYQkgOHtZqLtTXqaArkmSquLTQSrJ9WlaPVetml4IVr
 cbxe91v3U8vLrLJdX5uuec+50VrRui6lZrpsagVPR1bIRsi7Zua96RWrN6sLsWfJXIl3
 VpJ9JUxPN5VOwfUEnt5UgQVpv1KD2tDEvEpMa/E4lXHDpnwQ1ib04vsz6spK4D1vCnqY
 QQZIEo/BsMwzaz33xnZT9pp6qLEPs5QBAZhoIzfWROhpyhoRYFUNceZsgMdcLxGmN3V+
 Bp3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cx6A9q+K
Subject: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.21
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jackaudio/jack2/releases/tag/v1.9.21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/jack2.hash | 2 +-
 package/jack2/jack2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index 6361473cf7..c98971ca1c 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  915ad2900992159bdb729b9fc4ea134b962ce32b2df0b384fee40a2c5808835d  jack2-1.9.20.tar.gz
+sha256  8b044a40ba5393b47605a920ba30744fdf8bf77d210eca90d39c8637fe6bc65d  jack2-1.9.21.tar.gz
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 9d6a3b6479..f7683304a6 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = 1.9.20
+JACK2_VERSION = 1.9.21
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

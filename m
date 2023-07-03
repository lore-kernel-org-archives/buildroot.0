Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5549FC0015E
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 14:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8238186B;
	Mon,  3 Jul 2023 14:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8238186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXVVjXWNh_WW; Mon,  3 Jul 2023 14:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BDB8199D;
	Mon,  3 Jul 2023 14:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BDB8199D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F78A1BF5A9
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 14:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35AC68199D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 14:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35AC68199D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2sGTEREU_cQy for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 14:39:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F09378186B
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F09378186B
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 14:39:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d805cb33aso5741332a12.3
 for <buildroot@buildroot.org>; Mon, 03 Jul 2023 07:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688395175; x=1690987175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OjTIxziakMGpcbKRDOhcD7tvB4coI8aZwmeiG0CxFiw=;
 b=FUwnuVItLVdoVVE+Pw5k9+U/gnHRuAHCG56D9CE+OiWH+bTZbRcLvMQl9SlgRYDqZI
 K2wnFHAhX90KiMWrZtPHVlae4PFgpB5Km4v+hwS4KAaSNfcrZZyfWsN+qZS91+zdYF4t
 Tq94uJ8YYvQvQzTg1cJBmbkvLNaeTsBuLYXkL8JqeeJawuyKuAxYoBzjicRJgiyIFGOx
 bQ+lnhj07dHRh7QVznEmx0XWY3XkDzZTDTT7RFc+PghpCViwGENB9iJuNszmb+UPNMB+
 M8F42bBT1DdUQnxEYiidMjJGuFjxYJW8sj0WZ75irXmAvLCeYGlBJdLrqYZcnT+jiv3H
 7UCA==
X-Gm-Message-State: ABy/qLaqT02EEoLRwu8fgyCgky5aUN+jy7JheoJPqs3wAIqcKClbEUtu
 BYc1wexziWjxtRzQ/ENHjuuoz1Tgor6RIci6y9Y=
X-Google-Smtp-Source: APBJJlE7qwdIMMi34uVPo2amvvrUE4sqtZxNzd8elloFCvAtUqcFPMNgtowHi4DpnWMRMAP4jNTo6A==
X-Received: by 2002:aa7:c989:0:b0:51e:12b:b989 with SMTP id
 c9-20020aa7c989000000b0051e012bb989mr5003965edt.20.1688395174852; 
 Mon, 03 Jul 2023 07:39:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020aa7cd69000000b0051dad094faasm7229141edb.36.2023.07.03.07.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 07:39:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 16:39:31 +0200
Message-Id: <20230703143931.1825624-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688395175; x=1690987175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OjTIxziakMGpcbKRDOhcD7tvB4coI8aZwmeiG0CxFiw=;
 b=brFnJg9KnkKisA2GQcQjjeHV0TBUlwl54WomOaLoVYpz5k4ZfLPhYbt1WFQ5C+7jFd
 gMxfeT7kFxLvA3mPbOPIXpzjvaSeePcrt2x8MQ2Ak7vJOThwcVVe0F9KH6aDKuA4005R
 9LhmZB8qKW6cOHb4dSpoEBwlmw1+EOkfztzHQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=brFnJg9K
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.109
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.109

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index a35970c54fda..f42e92a3793b 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  f95ef6e5f4feb8b3e8d2c1163c35415263c82ac4ba3a51bcf4e3d59d3eebd063  uuu_source-uuu_1.5.104.tar.gz
+sha256  6c99b82c55202f43583dc41198225dea7d5b050e33e13946751911e473aed4a5  uuu_source-uuu_1.5.109.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  f68fb8c8002c797a14e63f91963ac247034fdfd44275e4f4a3226111cd0423db  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 07dd6ce5b345..14a8a5ef025d 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.104
+UUU_VERSION = 1.5.109
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

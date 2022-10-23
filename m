Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A5BC433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 11:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9ADC817AC;
	Sun, 23 Oct 2022 11:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9ADC817AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zc3Z_SLK2Z2Z; Sun, 23 Oct 2022 11:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2715781772;
	Sun, 23 Oct 2022 11:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2715781772
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42F961BF951
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 11:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BE6381772
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 11:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE6381772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_J3eLXNO3uJ for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 11:49:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D33C681771
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D33C681771
 for <buildroot@busybox.net>; Sun, 23 Oct 2022 11:49:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so4886655wmb.2
 for <buildroot@busybox.net>; Sun, 23 Oct 2022 04:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p6exrdu4i50N7y19g5eT1h2/FszVWB3zlHP9nJqOkE0=;
 b=4zcRR4q5BOPxfXgMH9Xjtl7d+C4mkPFyOaiD4JItLX2HW6snbXaSXh770ohFm1R4Ek
 WCyaD8+nNVcSk7nAKDRHk279viH5A6m0hz3FHzFn+6egx0DXXmluZbSJfB6ZHHN2gAra
 vuo7ehrjrxpklfnRwHU6tCIeQFpYmx8Xcti+LN5swGfA/X8/BvOgGThWQPZESIRSK5I/
 NypaJP08h5z54LwUo3xgUpNBxB0aPlUTkWU706pkctTxHpDlNBwQY+FDqCXFan6gZXMI
 ZEjuTh9XxdaUe46K4Znaxx/t4aD1O1b/1TmNCi4rJMk+h8GYdxKDpNp4pSKnWajGDB4N
 loqQ==
X-Gm-Message-State: ACrzQf2254C3U5mf+IQlEvqblcUvodGKmymA3bZh76PQRg8CtIPAI8Z2
 3MJfpKzvCQiYcIzpnhSBF+lFVhnsbqo=
X-Google-Smtp-Source: AMsMyM70UeSFIHL6xyDqKZIYrHAqhoqYaVX2QAR7p60IdCkAdKE8cheg6wYiNkBthj0iusgSG7I7qg==
X-Received: by 2002:a7b:c7d5:0:b0:3c6:b874:a0d9 with SMTP id
 z21-20020a7bc7d5000000b003c6b874a0d9mr18785944wmk.157.1666525740642; 
 Sun, 23 Oct 2022 04:49:00 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056000136a00b002366c3eefccsm1279553wrz.109.2022.10.23.04.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 04:49:00 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 23 Oct 2022 13:48:41 +0200
Message-Id: <20221023114841.505480-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p6exrdu4i50N7y19g5eT1h2/FszVWB3zlHP9nJqOkE0=;
 b=j/43glCPA/twCtgMKQMZux7jKqukT8s0S0Jj5EeoVd28WcossTQxGHayLTmqQPHcv+
 3diddnQnmAie+cvcbPLowL7V15WSdlkHk55NJ11zSwL+EMKiD33JTNn+bjYUOcRWRuHf
 RPlkVjZZP9DKJKuFel+IbjFkFta4vPBnDrXtbEGM51GGkUvf5YN7InLn3xGyU+ozI33d
 HHtSVZhC78pqSkg5rH5KtAhI1dIOHx0Rt+rvDvx90uWR8a/Vi+wvJPDIs+PuHsqibwNZ
 Le21RqlKXqUuQYWB9VxsTrxCV9MhOwj8DE/4I/+rS/DsTDefBy+OOJP+qTQUjqqwEMHi
 N48w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j/43glCP
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.25.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 473955e39..5cd3db1c2 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0b4d5d3632e0d376d9512ea8ea262f31f75c132b488dd7870f472acae709a865  janet-1.23.0.tar.gz
+sha256  5bf9b680adbc5511835aec3787117df37032eef796e1664edbbcfd540b6acaf3  janet-1.25.0.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 070eae1cf..284e6c264 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.23.0
+JANET_VERSION = 1.25.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

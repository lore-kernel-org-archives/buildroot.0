Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF136C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E05460E08;
	Wed, 26 Oct 2022 21:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E05460E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AyNiv0_wUqp; Wed, 26 Oct 2022 21:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CE660E05;
	Wed, 26 Oct 2022 21:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CE660E05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 923491BF31D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D7E48132F
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7E48132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNBqoUybQPnY for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:21:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2FF9812B9
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2FF9812B9
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:21:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j15so18101195wrq.3
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 14:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61xnkPATqv2VSqZ0xdv0wx2NscTSfofVTTDj4Ac91BQ=;
 b=sFBC6ShymIUcO0uE9xNLcNyWVtmBVQi/YP1Mal8otC8apDLodEVfeDeAoVF59TG5rn
 0XSENeQxcOz4lvDcGRX3qN3HM+6Ghah9Wx5bRy+HkFiAFWWl4mGT0aKmkuXaIEpMqaS9
 /vgmlWwMCV/9oGAft4dtxXyFhCJaj6z+0VSMNd5Xz2M088skRH4ftp2t7QZzO2BSmkct
 aJdWZMjcF4l3/uO82E+ciSkKlfW7A9aUz2KmNh83GlUBf0axWSvzsFXnWOBwNgGDdDgm
 uTvicXxbqtF7QMgehp6VKaUA58JKnNLC0YiKmQUy5eVqa7Pll8fxVY5ShV/c6eDfMckm
 1Jsg==
X-Gm-Message-State: ACrzQf1GsVsUGYXPZ3g7UMo9A9GBqA+ddw5Hi31wpL1PQNVeBh2QqoBO
 pmM9oOOauqTvtAGZJgSOQXd4uoz5pzo=
X-Google-Smtp-Source: AMsMyM48uq1i+qjXl33j+8py63YskGJOseOi693zmOz56A85dtoXJHN8HANhwAsZCTXjw0I10vh9Ew==
X-Received: by 2002:a5d:6c6f:0:b0:22e:3fdf:4b27 with SMTP id
 r15-20020a5d6c6f000000b0022e3fdf4b27mr30211904wrz.150.1666819310830; 
 Wed, 26 Oct 2022 14:21:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 a2-20020a056000050200b0023662245d3csm6250965wrf.95.2022.10.26.14.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:21:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 23:21:22 +0200
Message-Id: <20221026212122.592457-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=61xnkPATqv2VSqZ0xdv0wx2NscTSfofVTTDj4Ac91BQ=;
 b=aysVE5bswTJ1RVGoV2By9Ss8QDzbK2mA5vFXaAWYehkwGfiC2h+l2cgyN47Sb9G5OJ
 vpYfN6BCIoP2awlaVN/E+JisDPp9T+NZKUGa0doByGzTbmDiC4x3+FcKT53Y9tyTlDe+
 bRa0Z0UWfLAz8pgY6A4WLpR+RE1VSGuU/Am2WJDac4oFFdX417RvS719IdVaDe3Nv7UF
 o5L9I8HayRMF59Axvkn/BxlTFi4mhETuirLx6PTlppCQcQPKVtHjWrlfyV6p5dk/DYlI
 vOpUunU8iuSuLfzRRwkwPbDF6VOy0XR8hwTOomAfRkwuZZPeCbqjfkPKp6aQ/bmPjhli
 F1og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aysVE5bs
Subject: [Buildroot] [PATCH 1/1] package/faad2: bump to version 2.10.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/knik0/faad2/releases/tag/2.10.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index 2eb11d73aa..3a9c36df00 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c6d9636c96f95c7d736f097d418829ced8ec6dbd899cc6cc82b728480a84bfb  faad2-2.10.0.tar.gz
+sha256  4c16c71295ca0cbf7c3dfe98eb11d8fa8d0ac3042e41604cfd6cc11a408cf264  faad2-2.10.1.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index d085c814bd..eecab35af8 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.10.0
-FAAD2_SITE = $(call github,knik0,faad2,$(subst .,_,$(FAAD2_VERSION)))
+FAAD2_VERSION = 2.10.1
+FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
 FAAD2_CPE_ID_VENDOR = audiocoding
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

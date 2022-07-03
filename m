Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED28AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 16:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AB1841517;
	Sun,  3 Jul 2022 16:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AB1841517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRHuSj5sOz4R; Sun,  3 Jul 2022 16:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 117D94055D;
	Sun,  3 Jul 2022 16:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 117D94055D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3801BF2BE
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 16:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4872B82505
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 16:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4872B82505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2TuHalcjHpc for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 16:34:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6F082457
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B6F082457
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 16:34:43 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id u20so6632483iob.8
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 09:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkI+PA/6TE0Efjnq3e42omD0WgMQqxP7S+NkcrWeCXY=;
 b=0rHNaxqfPv9CnVwRDMdn6pjITdh2PXGS8gCt8QbTiv5D+WdaCPa7h/92fCI2hGWPmh
 QvzaTnb20D1tfwnTPzC+a9rjSMDL5JWJuYcy8i92+cblwkQI+FlPPI/wZ7GY7A2PHRxN
 DGeg11RaqUQh3KIPuZNvWWWbfS1zL4xxBdGQeYaDrKPs3Ppm2T/T5SMpN6xHxr1H77IH
 H6V/bamZF3Bg5kubIs9XEnzssuwLPnLgzxieKjgOEbuA1M0SZBge7VjhMWREn//l/7zj
 Dq5udDEYqpGHKphi4sVzp29/hPSvngWJ5L93eErjGWLc5CAlqD9TaWawDQ9RNgWUtxKs
 BwkQ==
X-Gm-Message-State: AJIora+6y2LPy4WAII3Ed+sjSnTnTUEBhCNsMwsOgZ16MjC/D4oiISdl
 C2TnmwWSL0XSNutC3/NANna3GGe278Xiig==
X-Google-Smtp-Source: AGRyM1vtFjtzVHXfmTazWIqo/FHz71IVebq7GOMtDPEiyhZw7yxYudmkGO4j+F/5QgIqyl6q23kpGw==
X-Received: by 2002:a5d:9d9f:0:b0:678:74c7:1e51 with SMTP id
 ay31-20020a5d9d9f000000b0067874c71e51mr2353933iob.18.1656866082103; 
 Sun, 03 Jul 2022 09:34:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-222.hlrn.qwest.net.
 [71.218.105.222]) by smtp.gmail.com with ESMTPSA id
 d5-20020a026045000000b0033c836fe144sm10393610jaf.85.2022.07.03.09.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 09:34:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Jul 2022 10:34:39 -0600
Message-Id: <20220703163439.1042681-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkI+PA/6TE0Efjnq3e42omD0WgMQqxP7S+NkcrWeCXY=;
 b=GV7Ic5dh7JQ86R0jBl4yPzIU63V8QFlEL5AnFBFvYsCJphokhRYQ/9N71xpgV5YLlE
 KtvHH7DNoecq2M09pWW5X5KSZMAOUxuyisb4UVbl0R9RWv0MNrm552/5aRohGMSNcz5V
 vmj855tsYeyT6/5drN96pstEnFP16BSg3SGYzx5oWV/IWEne07/ujZy1wOXHUAmxp26n
 8t2Z7C43k/ewafBdj9CKVEA/uPQJtQjD3FLUYzIUDS7vIRWWc3RYGTvOqPZqGpVYtgzA
 UlUXEUY6MBFcKGC/kVg3zwrVBAktClWP2ontco9k/6QFmDgZiEJxdR4ZkfhykX7NPtqD
 ngSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GV7Ic5dh
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.63.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 33bd8b6eb9..1133bed046 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.62.2/meson-0.62.2.tar.gz.asc
-sha256  a7669e4c4110b06b743d57cc5d6432591a6677ef2402139fe4f3d42ac13380b0  meson-0.62.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.63.0/meson-0.63.0.tar.gz.asc
+sha256  3b51d451744c2bc71838524ec8d96cd4f8c4793d5b8d5d0d0a9c8a4f7c94cd6f  meson-0.63.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 8bc7848705..880dfffcf1 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.62.2
+MESON_VERSION = 0.63.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

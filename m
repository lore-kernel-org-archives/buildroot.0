Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2311DC433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC73B817E4;
	Sun,  9 Oct 2022 16:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC73B817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JW3RryV1AFnv; Sun,  9 Oct 2022 16:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B95E81756;
	Sun,  9 Oct 2022 16:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B95E81756
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48ACF1BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 237F24063F
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 237F24063F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqUwKPRXcist for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB6C0400D8
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB6C0400D8
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:55 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j4so13610698lfk.0
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jNHwtqYA5Mu/VlVHMXffnTOZRKspZsasqL8a3QdqGU=;
 b=l0zVBRbjFoeRtQ7lGrMtmuBY2hPwWmO30YPwDTpXxLbRYkAtKsyT6pufmp3M/r4r5i
 ewUYTxEB4LveMkmpFzUD+uyS5YePZcPsc5Rwi9h/J8b6u/cMBNcIwD9ugjVGqQcG/0X9
 OpFH2O9IUI82WpaVQNkK4i4p2hG+gd37eNbJu925TjlWaT7Cci4oAfgyk8fk9+RIRI/c
 bv+s2ZSPNBedOHlsfKn+YmhWmNU6d6bMdewEzkMKj0NWEMSBQ0HzLWIBvhElc9ZeUBXJ
 BGQUICUcdmrm4QvwGN2IZjKoW2+lhe3UmsWMzKR2YgbpdU8yYyROfh17UZOU/W+C1mc/
 1a7Q==
X-Gm-Message-State: ACrzQf3qnPwSjA7+4ERXRHSrETA9P7jbmMtUhVjLZWMv0o3757mCqBkL
 rBdAa1ZNbh3ew/yC9eOFMOxG3PLuRT4=
X-Google-Smtp-Source: AMsMyM5PQQWeNrrFooTEzaQexuXsyY0TiqyIx02PU04YLb606AukiFo1BAmP1kWHMVMtt/6pphRWXg==
X-Received: by 2002:a05:6512:54d:b0:4a2:5c54:73e8 with SMTP id
 h13-20020a056512054d00b004a25c5473e8mr5011577lfl.594.1665331193434; 
 Sun, 09 Oct 2022 08:59:53 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:53 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:33 +0200
Message-Id: <20221009155938.2041695-6-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9jNHwtqYA5Mu/VlVHMXffnTOZRKspZsasqL8a3QdqGU=;
 b=GQsyQwurJS9plghIaNoEywXboUH+RWWKocgzeL1eSqkbeKa3/GCYH+V4VKqqIgnPDC
 gGuMq4/rmpA6AJa5tbK3sSiIYUg5LJxKEef5BYuahX2FuTG3vt0YwZeAQUO1oQzgwICH
 j0zccnnVYfiYWIh1ZKszBFTDt6rEHKb8KiFZ4hjMz1Yuv/O+RuhAA4MqLXxZ2NVn/QKN
 PdDqqzeVsncBXUQ5OLS7dpTIUtsMsaGjukTmG+HTBMcyftnexvFapr5eWMxhazYd1kCp
 xbVJ85JF6MjeErBtqFxwTpNxotu84gsZ40iWQf3bgLp8OAL0YyAgd5OHDBQ2cWxlw6m3
 ScvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GQsyQwur
Subject: [Buildroot] [PATCH 5/9] package/s6-linux-utils: bump to v2.6.0.0
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
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0.
 - s6-fillurandompool has been replaced with the new rngseed program.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/s6-linux-utils/s6-linux-utils.hash | 4 ++--
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 27e7eb7b7a..c932a4363a 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  c300dbf36b533083f82c6827830c55ce34bfc6cd493c782f207d199669a345ba  s6-linux-utils-2.5.1.5.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  6c7132734a0c8287002ee6910c469f175a97d766a8023c0c33af8ba92643ed59  s6-linux-utils-2.6.0.0.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 995ff1b855..ffa3ffac5b 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.5.1.5
+S6_LINUX_UTILS_VERSION = 2.6.0.0
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

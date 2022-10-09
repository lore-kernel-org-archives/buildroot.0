Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6951DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022FA40996;
	Sun,  9 Oct 2022 16:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022FA40996
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZjUx_L2xNVg; Sun,  9 Oct 2022 16:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1FE0408C4;
	Sun,  9 Oct 2022 16:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FE0408C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 043451BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0FC64063F
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0FC64063F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDD0d93xqG4y for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38CB400D8
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D38CB400D8
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id by36so10843760ljb.4
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hCTjk7ZWNmVsq7D9Gys+UxGI6t4hD8997KmivBaT9E=;
 b=lU+FdYaOx3xGgtoI003zQSDVxYRuU6C4k/G/8Fo3RAkx9YhjVNYlZUmBjaYzHFhpO2
 /NmrdEW7lFTyvutJjYk3Jah7jpOpi6E6bA95lUXvNLWsF9D+0FcbHD5yNiXMPhIuyHNd
 NwzNg1hPNkcE5EyqnEeaSIzV3HIChfHfaEVgRPhzpT4lcqORLbwAfmsxvSSsdSr7kKJj
 K/3MjbaiCI+Mtwh3eiqgYo0Qx2eJnKOQNGzS78kuyjOGc+UKLMdzB/eXFbRuCuG5Kz0t
 pTNBBn6hyP06hvNHCyNS1qRpOjbxx221uZRKMQgH6+eXdXth6ADEEQ8AhKQUVmXc5Qx3
 nD9Q==
X-Gm-Message-State: ACrzQf03/OmFxALYU2Bqm6ckou//YUQLdjN5woPpg9+jPUfvJfj5KGEc
 kzUCP9TCEkl/blCeAnSFq5iFkbAlR0s=
X-Google-Smtp-Source: AMsMyM6lmB0IWpLAObQy9U5F1Yo6Cu6LCuE14jFJ5rlUOd7UhYkyCftNwuc3eKARfKpLDJBhBA118A==
X-Received: by 2002:a2e:950:0:b0:26e:9991:31f6 with SMTP id
 77-20020a2e0950000000b0026e999131f6mr1671069ljj.133.1665331189412; 
 Sun, 09 Oct 2022 08:59:49 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:49 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:32 +0200
Message-Id: <20221009155938.2041695-5-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7hCTjk7ZWNmVsq7D9Gys+UxGI6t4hD8997KmivBaT9E=;
 b=b5Y90cheGwqTk6LIfU81nXWY6AOUmEE8B0vRWVP7/njVwTFfwolwOzAQmvDHXj9DuQ
 pB2qhfmtG+V1T0fgQWiM6MG5KHu2fLqzfArBgcJzWnM2ldGaFAvhMegGZZB9CAD2R8SK
 AviIS4S2r72Yrn8SmCum8vOA3HRq/eVsjJ+41WWwIkTPecNIxV34xOlPDz0V8XZMZSRo
 mY2tD1guBY+MCnunw9EEjyWu4hxYFh8rjJJmm1NgK4OtGEw0VeBXDW2pPjl2/RMWqdOE
 c4Re64etd4EdK95j3U7ImabzakgI4U95gcaybdG3yx7d7jFUko5fn5jxpU/9osG1Pu4m
 RZZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b5Y90che
Subject: [Buildroot] [PATCH 4/9] package/s6: bump to v2.11.1.2
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

 - execline optional dependency bumped to 2.9.0.1.
 - skalibs dependency bumped to 2.12.0.0.
 - nsss optional dependency bumped to 0.2.0.1.
 - s6-svwait now supports the -r and -R options, to wait for service restarts.
 - The s6/lock.h, s6/supervise.h and s6/fdholder.h headers replace their
   previous versions that had an extra s6 prefix.
 - New binaries: s6-svlink, s6-svunlink, and s6-socklog.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/s6/s6.hash | 4 ++--
 package/s6/s6.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index a829700d97..3c5ce4265a 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  1d21373151704150df0e8ed199f097f6ee5d2befb9a68aca4f20f3862e5d8757  s6-2.10.0.3.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  6c1474be3e889dac392cee307abe015cd4be0c85c725c84ea7f184f0e34503a2  s6-2.11.1.2.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index ead82d7eaf..78962ed159 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.10.0.3
+S6_VERSION = 2.11.1.2
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

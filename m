Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E6DECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AAF6415FC;
	Fri, 26 Aug 2022 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AAF6415FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBGqQtwnymsk; Fri, 26 Aug 2022 21:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085F3415F8;
	Fri, 26 Aug 2022 21:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 085F3415F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 672281BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 419C36079E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419C36079E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mip_MTqGRlbm for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 21:14:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20FB66079D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20FB66079D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 21:14:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v16so442721wrm.8
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 14:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Gki2hWMmRrzpKH9tFbOzmiXiDqTArfQBrz0l+ualujA=;
 b=fMfrPO0AYjhr0bleMo9Z1r+joDd+AusN99PwY1Y4ZkYtICbtUlPGF7ZsA8BVmr2AJ9
 29IhW2NkpkFZo9E+UxxtvhHFmQ/7S0u3Dm22zvNvekD04GJkwIUZG2LwARx5UxQl5p1v
 YlkRSV7XU/wCK2RiKzxtTb/neP9et7m90gSwj0pbWcWDEw16Qw8cgA2HiabQs/OTX59C
 epdMu7zF+cAPADyU9cSe/rhmn8+Q5aOojvfOzs8q5f5C31+FhcgI+KL1RYThW8zhnOHt
 oGjRiX5kovMx6iLqMEIK183eru2sbnDiIxOHKQTW47chNvjJbssWtAc0rJuCza7zbRvA
 gPXQ==
X-Gm-Message-State: ACgBeo2qXrftxrZkAUZ+uGqYB7ppvm3ZFVMwsA6zPZIMmVw/qBy9QO7m
 EHqeMv8hA+cRdcthyyrJHoKrSkXYfzM=
X-Google-Smtp-Source: AA6agR7nefPTiMC+qj3sGa4RzKnveOhYRFxSVl/p0QvnO2rbukaovQuBxWHfgLV1Y+ChhJfwCcRbVQ==
X-Received: by 2002:a05:6000:1882:b0:225:7556:f3da with SMTP id
 a2-20020a056000188200b002257556f3damr746004wri.459.1661548495145; 
 Fri, 26 Aug 2022 14:14:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003a317ee3036sm837255wms.2.2022.08.26.14.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 14:14:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 23:14:51 +0200
Message-Id: <20220826211451.33719-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Gki2hWMmRrzpKH9tFbOzmiXiDqTArfQBrz0l+ualujA=;
 b=MxiP8VgSNHRK47k1Q/luuwQz/Fsv7xQl/wA9RT0dMUQS6bDnEJCozf45lIO9GyHvxY
 W7XdXjUcvYnJ2UYKbYJTafimLY3OZvWSREp3HM1DlGrsHyvvHrdIFOne5x7FzlIiBeuw
 SNF6pYc5bu3SXGFKEw3D5W02Y+4Z9nQLN2cYUJENtWYv6ZgzWXvmjkgybOWbiGNH6tqY
 Tv3e8ht+yC7TMxSUhViVXsCsMApzqhWk5c8TXhAWRcc/lu93vBvL+IaC57DtHHmLTSjO
 M03b5+LhIYfevZ8opJsYO2TICzVUuLmWMeT9EF6Z4Irrhr79igdcEID3+mt8MBveMoQs
 xgjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MxiP8VgS
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: security bump to version
 1.3.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-46828: In libtirpc before 1.3.3rc1, remote attackers could
exhaust the file descriptors of a process that uses libtirpc because
idle TCP connections are mishandled. This can, in turn, lead to an
svc_run infinite loop without accepting new connections.

https://sourceforge.net/projects/libtirpc/files/libtirpc/1.3.3/Release-1.3.3.txt/download

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 56c1d9de3f..1efc3e47e2 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  51d75be0e5acc094a888f40042b23e128d163cb5  libtirpc-1.3.2.tar.bz2
+sha1  6e52c39148494e4836e2d5d4f28b11ddfa65394b  libtirpc-1.3.3.tar.bz2
 # Locally computed
-sha256  e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd  libtirpc-1.3.2.tar.bz2
+sha256  6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3  libtirpc-1.3.3.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 9d3c4b5a94..179adc97d0 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.2
+LIBTIRPC_VERSION = 1.3.3
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

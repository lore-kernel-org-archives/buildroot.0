Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08C5ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7424260ADE;
	Sat, 17 Sep 2022 21:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7424260ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2VzUMIP67D3; Sat, 17 Sep 2022 21:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E7960AC0;
	Sat, 17 Sep 2022 21:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E7960AC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01D0B1BF3CE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D16DC83E6F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D16DC83E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VzrYkYax-OC9 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:25:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF1783E66
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDF1783E66
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:25:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso2059554wma.1
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dGrKWmosON97W8kfGdj7QHoqc0jSWbIQq2vjgDW7fRQ=;
 b=k1ljPa/6Ylp9aXonvsbqGzgVQkSfIG1kZEuUlpW9e+Y3HQJoLYxq8hkC5I18NZbEtq
 BaYHELhDzkHgDDLI0yIZ2puQqee5T0+Oj5WjbvE3iEFdiIpvbee5zKdmyCTonSs8EQrl
 WUXlM7M4ClTyBtvY8Lt6JjvL4VqHR1gTYr5PxhiBxyRxcAuXPLGw5Phxr1jaYyL1eBk0
 YydMO/6KNb/wBzBFq9XFlReOOJI8TRI+lk5WG0p1lmYyXBRZvn8zxcvSJFpM2JB2G0AV
 SjDHSxy1y94mE52TICxTrFs334hioBzHorlO5+vnmAOFmjCfY3L1ik5APTHBJA3s10Ko
 eXbg==
X-Gm-Message-State: ACrzQf1Kr7KTZfUaUayUA/siPQq9BblyiuePhZzK/6cfdWkCMg4SzGVl
 4Y/chrAxxz/8Dc2UnE0taXrekX66mNA=
X-Google-Smtp-Source: AMsMyM74jk7vZIdj1FQ56Vv62ur/gAI4B14R4LVa3/SwWH+FFqcZxKvQ7p5s8uMkTd8tFeIqt9yBMg==
X-Received: by 2002:a05:600c:2608:b0:3b4:8dac:342a with SMTP id
 h8-20020a05600c260800b003b48dac342amr7363041wma.102.1663449953614; 
 Sat, 17 Sep 2022 14:25:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b003b49aa8083esm7109860wmz.42.2022.09.17.14.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 14:25:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 23:25:51 +0200
Message-Id: <20220917212551.268739-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=dGrKWmosON97W8kfGdj7QHoqc0jSWbIQq2vjgDW7fRQ=;
 b=TvowY+XsKfiTqUM8xXt9qzHHG5LMzG4WOIg4JH9ONOBOBCDQg6DKkB7JblQD/vo0a+
 PEiXe+PurAz8D8kkrcIsHpGRLCiUV636Nsmu78fXVgGPO7CIjVKlZCECOADuRp6esPSl
 t7+bR0Xd/EGIoZpndy0iuyhipk+zSCeQA/8pDyqcPERQTQMLjchd9eyy1saib0diRDZF
 snAxmZbKQhqtoDZNDvMt2BHQuYe+74QSsMUEqf6QaL0lz44cmpF1CK+V2ajR8Lpvcmgf
 ssBWkbjMac0wPXwineG0HBm78vbFrYPQRo9oZ66gkg895S/wKhfR60MeyfDwQsoRkWx1
 tzHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TvowY+Xs
Subject: [Buildroot] [PATCH 1/1] package/liburcu: bump to version 0.13.2
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/urcu/userspace-rcu/blob/v0.13.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburcu/liburcu.hash | 4 ++--
 package/liburcu/liburcu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 1968c3784e..bed765dd6f 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.13.1.tar.bz2.sha256
-sha256  3213f33d2b8f710eb920eb1abb279ec04bf8ae6361f44f2513c28c20d3363083  userspace-rcu-0.13.1.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.13.2.tar.bz2.sha256
+sha256  1213fd9f1b0b74da7de2bb74335b76098db9738fec5d3cdc07c0c524f34fc032  userspace-rcu-0.13.2.tar.bz2
 
 # Hash for license files
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 895dd6bb66..d7776c61ec 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.13.1
+LIBURCU_VERSION = 0.13.2
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F1CC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 13:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42EB418A6;
	Fri, 12 Aug 2022 13:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D42EB418A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaIAJVZv8sNr; Fri, 12 Aug 2022 13:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A5641750;
	Fri, 12 Aug 2022 13:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99A5641750
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0821BF280
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 803D440BCF
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 803D440BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E3gEk8HhejL8 for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 13:03:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57A7C400D1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57A7C400D1
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:03:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso4305269wmc.1
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 06:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=h5lRU3Ig3uueEMmOCOGbCP3ikWRoJNAEloC4opFxEBk=;
 b=spxW2cUxXUp5C72HUopWG77guAnuVCchvMq0USVuATZsztnSFiCx9c6SOU0PQVAhem
 5PG2fxAHevzRkYfgkJHGeXxf4lIZxKx9XN18KDcl2ewJGPDSOvxS/jdq8BsueykCkqIC
 oK0jvEkA7ULfwdqzWG45Bts5ke3DbEwcbgy8fnr4rcvFJwh9ciWlZgNq9UaAIvV1bkN4
 Swp/O8h7jgHaamdzSY0RNVrDbKaAMwO9x3Cpz4zOMqpGY946x5WrsXI4gpVf3I3tOBBv
 rK6wQteaTZNQy+TsYXbgOitlP7Jp4+UqTPnBtg2xk8bXhGDrG31xX7JcrLGtW3hBA84c
 wwnQ==
X-Gm-Message-State: ACgBeo0HSUW5tIh9OIRiZ0/86DVD7KWF7Nvy9fGkJsaffrhwc5Fkwm1D
 ZVz2c1ILDHuquGmJE3OowueN2fOyX0Q=
X-Google-Smtp-Source: AA6agR5YVLAcrb5Qpbzt65mUqT+zT7KV4ORBMhh3HH+xH9Io0h103Y9NlIYCawPsvJvb0SuVLa6R6A==
X-Received: by 2002:a05:600c:5108:b0:3a5:c1b5:ba88 with SMTP id
 o8-20020a05600c510800b003a5c1b5ba88mr4689749wms.204.1660309415093; 
 Fri, 12 Aug 2022 06:03:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b005f8c665f94b38664.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:5f8c:665f:94b3:8664])
 by smtp.gmail.com with ESMTPSA id
 c14-20020adffb4e000000b0021f0af83142sm1926971wrs.91.2022.08.12.06.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 06:03:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 15:03:31 +0200
Message-Id: <20220812130331.98237-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=h5lRU3Ig3uueEMmOCOGbCP3ikWRoJNAEloC4opFxEBk=;
 b=oLqFI1C+laF1YULc1LaSDJASEjI5peif2Qp/f6u/2Hc5bOk/R1Xfq91+AFGbmrk1wK
 dgO+8wJZtSBepuTkmVziLYJMZsNjCEf0YmGn2LO79ALzyxFxXX8aapfDXitttphuisur
 yiOXdK/mbA7/xhPJEyGGiyPedFMbA01hwIif7nExF3V/Pz/U828AqKR1SPfLu8i9h5VT
 sf0gKRiGSW+koxqMsEDCurgvAmxRKSn0D+28cTnewhj0Ve5UDd5KI7NRo3a5M9iqmbdh
 mljJk1rye86VlFtBtS7iqo4u+dVM8D+XviP5IFaoCsxQVgr/p1MBitRyiFi3XU0pZ/Gd
 4shw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oLqFI1C+
Subject: [Buildroot] [PATCH 1/1] package/hawktracer: fix build without
 threads
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

Fix the following build failure without threads raised since the
addition of the package in commit
94d8764ef938936aa5432f1f13bd1b2d8b62a159:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8/lib/platform/linux/cpu_usage.c:5:10: fatal error: pthread.h: No such file or directory
    5 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7edc29e21e441e66ad7c4df1673e506950930913

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eLists.txt-fix-build-without-threads.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/hawktracer/0001-CMakeLists.txt-fix-build-without-threads.patch

diff --git a/package/hawktracer/0001-CMakeLists.txt-fix-build-without-threads.patch b/package/hawktracer/0001-CMakeLists.txt-fix-build-without-threads.patch
new file mode 100644
index 0000000000..bb7146da5c
--- /dev/null
+++ b/package/hawktracer/0001-CMakeLists.txt-fix-build-without-threads.patch
@@ -0,0 +1,36 @@
+From a6aeacbef008ef7e4b014c028430e52c2e2f9361 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Aug 2022 14:51:33 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without threads
+
+Fix the following build failure without threads:
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/build/hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8/lib/platform/linux/cpu_usage.c:5:10: fatal error: pthread.h: No such file or directory
+    5 | #include <pthread.h>
+      |          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7edc29e21e441e66ad7c4df1673e506950930913
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/amzn/hawktracer/pull/86]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dbbdc2f..a38ff8f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -35,7 +35,7 @@ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
+ 
+ # PLATFORM FEATURES
+ include(platform_features)
+-define_platform_feature(CPU_USAGE "cpu_usage.c" DEFAULT)
++define_platform_feature(CPU_USAGE "cpu_usage.c" ${ENABLE_THREADS})
+ define_platform_feature(MEMORY_USAGE "memory_usage.c" DEFAULT)
+ define_platform_feature(ALLOC_HOOKS "alloc_hooks.c" OFF)
+ 
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

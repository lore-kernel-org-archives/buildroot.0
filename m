Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12087C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 15:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9356B82BC0;
	Tue, 21 Feb 2023 15:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9356B82BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EesvgBvatg0Y; Tue, 21 Feb 2023 15:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAAAD8266D;
	Tue, 21 Feb 2023 15:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAAAD8266D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94E6D1BF390
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E1248266D
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E1248266D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnPJRlnzZ_O3 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 15:11:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6E0822D7
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E6E0822D7
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 15:11:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so3803322wms.1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 07:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qlO0E29+V56+cl+5PsgMIQjvaIyxxPUT1uprawMIYo8=;
 b=zmykSbYFALtF5p0a+zMcWqaLkOAjfoTywg9JPm9bcTzYVIyHUexAXl2VIqkPLraSVl
 BNc/haOBXAnqmYNjMOXFpAdpGmEmnrcsSck51s7Stkx0JZ7/TPxCADTT6gyBkLFfuIoc
 1PxP50KhuhK9WB9TAGPiSgGDR83I/iXKaKOEzkPdYqaNmCBbxPEAjVYdrRPlTDT9Ut68
 zEdFY8LzaZClQEpTC2ASxYs/gk3+GYZbnO4UaXSN6YijAWYVOsDF8BF39POGv3o8Ovw3
 ied2ylglh0Jh7e6/C+FJ/N6okCbValCEbPkbHkVVvM4pHorPscvgSMw9Hva+cfcrDh3+
 78OQ==
X-Gm-Message-State: AO0yUKWbsVDUU9S/CtdK9cjvmYz9R94bE1nD2pB+8qmhTZ43jFv8MW3i
 JVyHe3638NvNxCZJtUesPJ2FCGd72J8=
X-Google-Smtp-Source: AK7set8KpnazOWFLjoQX24jdUMyy/2R73eW9wWayws5YRs1S4FC3I1ENPl/0gy88Sn5NI8LKDWRn4Q==
X-Received: by 2002:a05:600c:510a:b0:3e8:490b:e286 with SMTP id
 o10-20020a05600c510a00b003e8490be286mr782617wms.14.1676992291112; 
 Tue, 21 Feb 2023 07:11:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm4859748wml.43.2023.02.21.07.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:11:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 16:11:28 +0100
Message-Id: <20230221151128.1926887-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qlO0E29+V56+cl+5PsgMIQjvaIyxxPUT1uprawMIYo8=;
 b=etFgcMXPGzvGlSUibWsmVAUC1WlUTzndht6xXCXYRmDh2KiT144A6exuiHSU7Sr4MZ
 Or3UPyQd7RRdLgsPybUr2tjtG1UDNTypCIrf2t+Kzouyj3SscfFSVLYYe5s+7hf7l5Lh
 799p1IxTD09+2fn/Hn01Z9GasCA/JN4/9ZHJNYCjPl8ypZgRHawOwQGSHCpw802S9/Zh
 Ji2YB67UyMZqohierTCPTnwAIwETGk6KW/AyrBbspCtJ3cCRZioaJ5+giPHqgaaOkMqg
 fLUO5+pl3kTjV6DDY6U0jEPaXsNX3biIssJrXYssudk2kzckBtZfCQiuHtmysh7NtM3+
 1ShA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=etFgcMXP
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: fix build without threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 22.11 in commit 6f848c068f8ab0cc67fb48582e00221158ddc8cb:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/src/data_tag.c:17:
/home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/include/mongoose.h:407:10: fatal error: pthread.h: No such file or directory
  407 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9f1677fc5a4568be0b9c121060c5d821ac2ae21b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...r-Fix-mongoose-build-without-threads.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch

diff --git a/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch b/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
new file mode 100644
index 0000000000..85bc45147a
--- /dev/null
+++ b/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
@@ -0,0 +1,42 @@
+From 707b51ecbc5598eed2fb67962232bf3fe0e96f81 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Dec 2022 21:30:54 +0100
+Subject: [PATCH] minor: Fix mongoose build without threads (#2291)
+
+Fix the following build failure without threads:
+
+In file included from /home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/src/data_tag.c:17:
+/home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/include/mongoose.h:407:10: fatal error: pthread.h: No such file or directory
+  407 | #include <pthread.h>
+      |          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9f1677fc5a4568be0b9c121060c5d821ac2ae21b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/707b51ecbc5598eed2fb67962232bf3fe0e96f81]
+---
+ include/mongoose.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mongoose.h b/include/mongoose.h
+index 1173b3fc7..b111ea34e 100644
+--- a/include/mongoose.h
++++ b/include/mongoose.h
+@@ -404,7 +404,6 @@ unsigned int sleep(unsigned int seconds);
+ #include <math.h>
+ #include <netdb.h>
+ #include <netinet/in.h>
+-#include <pthread.h>
+ #include <signal.h>
+ #include <stdarg.h>
+ #include <stdbool.h>
+@@ -4658,6 +4657,7 @@ size_t mg_fwrite(const void *ptr, size_t size, size_t count, FILE *f);
+ #endif /* MG_ENABLE_FILESYSTEM */
+ 
+ #if MG_ENABLE_THREADS
++#include <pthread.h>
+ /*
+  * Starts a new detached thread.
+  * Arguments and semantics are the same as pthead's `pthread_create()`.
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

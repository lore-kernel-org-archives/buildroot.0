Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D59C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 14:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39E340C10;
	Fri, 12 Aug 2022 14:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39E340C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjCygsl1IVBE; Fri, 12 Aug 2022 14:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07648404AE;
	Fri, 12 Aug 2022 14:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07648404AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F36741BF5AE
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 14:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD234418FB
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 14:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD234418FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_rOYrCrckK5 for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 14:39:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A44C410AC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A44C410AC
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 14:39:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id p10so1420287wru.8
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 07:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FcttjswkFKVKk9dGqrMLOw5HwNyjfLc1c9S4XK3mEcs=;
 b=5yvPV2sNeVWhXcuMmKr2o3ovd/pZyVklJUzjjvFHrHpjQ/4ftPFPQKXfqdzzjM5ba0
 Jqfn2HiSueDR5QAt9v5ogFTWRqnNmzkBdbrsM94Kv58/PvNU0oHxP/CzQdpnWogvRiYR
 wKFWLmemxzQXN7yx3x8f4jpq/uafQGM/M6YC0JEKbAri1aXEMM+b6Pe0kI67b/JOb3j5
 iHlWSvqM3NSvWmHyxUl0esAHHEQEtMzdW11jR0OnI3Diq8hg3f3tlUQHBTc4EMaOspHI
 Wikxdu47DpxXQpLP0ZOrqtUPe189I4454KM6ZUxJdNS1GdpfEBOyctka5EbYVtyvofOg
 P6Vg==
X-Gm-Message-State: ACgBeo1t4FjOkkQC2pGshX+CEjCD1ni6lKYT+5UyGkzQpxOh3XE+2Ncs
 wQM8gBjmPJs6s1M+yWcX4xxPc9DlDGM=
X-Google-Smtp-Source: AA6agR4HqA4cMvyAKUUTG9OrXWemcLAuN2uDa2XPVRFf7RMZSSogJk8ZFXORsHHSo2QroPAHfN4QZg==
X-Received: by 2002:a5d:6102:0:b0:220:6382:eab1 with SMTP id
 v2-20020a5d6102000000b002206382eab1mr2300187wrt.539.1660315143092; 
 Fri, 12 Aug 2022 07:39:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b000246974a2e4403fc.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:246:974a:2e44:3fc])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adff147000000b0021e491fd250sm2075520wro.89.2022.08.12.07.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:39:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 16:38:59 +0200
Message-Id: <20220812143859.130116-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=FcttjswkFKVKk9dGqrMLOw5HwNyjfLc1c9S4XK3mEcs=;
 b=bBpJNU0/mqkPMeRSXmZUg0MYpoRbhNSuTjPBm6QCOMfhSg2zGIq2RqULPWoMNsKQzz
 cGmORCRaxfz2hfL2qusEvuH1HdNiqGFjOJpwBsqJCZba4tNcnyYlyu956fR+2DnO/u1y
 YnOdOU9guOhutawSwMegWSJUJ7fn4XTHTs3aYiMywLnf8pXm2u9D2RVJsn5m47C+4jcD
 L7cnQmScmb9KAcRTkbNTVm1RRE4yExt5QSwHvMmNoL9EsxDgy3OAmCLkkaD5t9PpY8J1
 gyiNrveMABUwdrJWW5L/gHMuvBJUFYwKSMWdgy2rL4yyQYQXoLLZfz/Hq5hfj2KlL53r
 xJJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bBpJNU0/
Subject: [Buildroot] [PATCH v2,
 1/1] package/hawktracer: fix build without threads
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
Changes v1 -> v2:
 - Update patch to avoid a build failure on macos

 ...eatures.cmake-fix-DENABLE_CPU_USAGE_.patch | 38 +++++++++++++++++++
 package/hawktracer/hawktracer.mk              |  8 +++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch

diff --git a/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch b/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch
new file mode 100644
index 0000000000..5c8e6e9e65
--- /dev/null
+++ b/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch
@@ -0,0 +1,38 @@
+From 65e78e2b972e2fab76b18732941ae611ec782dee Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Aug 2022 14:51:33 +0200
+Subject: [PATCH] cmake/platform_features.cmake: fix
+ -DENABLE_CPU_USAGE_FEATURE=OFF
+
+Fix -DENABLE_CPU_USAGE_FEATURE=OFF to allow the user to disable
+CPU_USAGE and avoid the following build failure without threads:
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
+ cmake/platform_features.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/platform_features.cmake b/cmake/platform_features.cmake
+index 1abbd41..8d7cfd9 100644
+--- a/cmake/platform_features.cmake
++++ b/cmake/platform_features.cmake
+@@ -18,7 +18,7 @@ macro(_validate_feature_enabled FEATURE_NAME VARIABLE)
+ endmacro(_validate_feature_enabled)
+ 
+ macro(define_platform_feature FEATURE_NAME FEATURE_DEFAULT_FILE DEFAULT_ENABLE)
+-    if (NOT "${DEFAULT_ENABLE}" STREQUAL "OFF" OR "${ENABLE_${FEATURE_NAME}_FEATURE}" STREQUAL "ON")
++    if (NOT "${DEFAULT_ENABLE}" STREQUAL "OFF" AND NOT "${ENABLE_${FEATURE_NAME}_FEATURE}" STREQUAL "OFF")
+         set(OPTION_VALUE ON)
+     else()
+         set(OPTION_VALUE OFF)
+-- 
+2.35.1
+
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
index f4654b2274..a14e2e2528 100644
--- a/package/hawktracer/hawktracer.mk
+++ b/package/hawktracer/hawktracer.mk
@@ -36,9 +36,13 @@ endif
 
 # Enable threads support if supported by toolchain
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=ON
+HAWKTRACER_CONF_OPTS += \
+	-DENABLE_CPU_USAGE_FEATURE=ON \
+	-DENABLE_THREADS=ON
 else
-HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=OFF
+HAWKTRACER_CONF_OPTS += \
+	-DENABLE_CPU_USAGE_FEATURE=OFF \
+	-DENABLE_THREADS=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

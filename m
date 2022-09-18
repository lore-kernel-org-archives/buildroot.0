Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89530C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 15:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F237441B7D;
	Sun, 18 Sep 2022 15:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F237441B7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5R5o1pjaDISY; Sun, 18 Sep 2022 15:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA2CE418D6;
	Sun, 18 Sep 2022 15:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2CE418D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6251BF301
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48E6D60B57
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48E6D60B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zu-6XpGScUEg for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 15:38:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15FA5605AE
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15FA5605AE
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 15:38:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z6so10962280wrq.1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=DW/JLiFr+FZO7FBAY6jM8otBXhQIGXIojsR87BOv56k=;
 b=YbA4dY/GmoyC8+9m+k3mQtBOZigekvkmazSC3rhdB9hXkpwkesxAOmKwQvQzY2Esk2
 6VwDVrCNDJxY/Lhng7R2D1LXrOQ0hkZP5GEuxcl+zuW792tg7Ce+blx71Gjg/dl70uZ0
 IUYgQ4/hDEPHPS4hfLTeYf3anPiDuHCu1mDPe6p2sMvfVnHc60oMA18nZtfoVPAmxrJW
 5SCXN+1J50ltxkPm4Fy5eehkiAu65DfXBwm9fESc1+C324h6utMoUGPIprB7FzBa4xKt
 DYoZEXDtkwYepzbTPzWK2DQE3zXZSyUKxfrxYxDidWe9Z2Lej7v1xjuLSsf0u2H4zcN+
 JmGw==
X-Gm-Message-State: ACrzQf2vAAp6HmM5W96OKQjO7uYOyK46r15+hJWHbGPzpDQOT7/wRgsM
 tFsTjs5bpigsV9gQ8Ql1oGIlwoNOT1o=
X-Google-Smtp-Source: AMsMyM7HVeGVtKd8SgEolioMRceMY4XncWYJyuJHeFY9dwAMxguoZZydc9q+nAPCqGohLaOWuMfnuA==
X-Received: by 2002:a5d:464e:0:b0:228:c179:6b0a with SMTP id
 j14-20020a5d464e000000b00228c1796b0amr7985879wrs.402.1663515516633; 
 Sun, 18 Sep 2022 08:38:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003a62052053csm13158937wmg.18.2022.09.18.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 08:38:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 17:38:31 +0200
Message-Id: <20220918153831.9741-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=DW/JLiFr+FZO7FBAY6jM8otBXhQIGXIojsR87BOv56k=;
 b=PsScXSFr5brlDKVHwJBv+TsXKuyF7rKXT4n7/JFA28dZmRsp9WkirjN3pS5+RTUJFQ
 z/wCGj9mpHmPo91t/U4nOAfLueVqNDvb52GA6W7PBvrya4yuEws3dZJInBvh2fHo4TfQ
 BDKnGvb3Mf/Epi+VDo/6vD4uBe2Daqdcc+swJVkrqYUe1NJanJh82fhCjBYG+SHj5qyu
 EGiTW6mTjQM2T1pFhEof1WpkH87nxObVqd9KEQu6LS7/9smnpi3HKuPOxm7UnfJBFaTL
 oPepfITLmy2IjxwbV4D7JMxZFHsXlcqw/QRTISavuPdyIAl2bJvRdrIlL/n1pemPDuvx
 kBTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PsScXSFr
Subject: [Buildroot] [PATCH 1/1] package/hawkracer: bump to latest git commit
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

Drop patch (merged upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eatures.cmake-fix-DENABLE_CPU_USAGE_.patch | 38 -------------------
 package/hawktracer/hawktracer.hash            |  2 +-
 package/hawktracer/hawktracer.mk              |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch

diff --git a/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch b/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch
deleted file mode 100644
index 5c8e6e9e65..0000000000
--- a/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 65e78e2b972e2fab76b18732941ae611ec782dee Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Aug 2022 14:51:33 +0200
-Subject: [PATCH] cmake/platform_features.cmake: fix
- -DENABLE_CPU_USAGE_FEATURE=OFF
-
-Fix -DENABLE_CPU_USAGE_FEATURE=OFF to allow the user to disable
-CPU_USAGE and avoid the following build failure without threads:
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/build/hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8/lib/platform/linux/cpu_usage.c:5:10: fatal error: pthread.h: No such file or directory
-    5 | #include <pthread.h>
-      |          ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/7edc29e21e441e66ad7c4df1673e506950930913
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/amzn/hawktracer/pull/86]
----
- cmake/platform_features.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/platform_features.cmake b/cmake/platform_features.cmake
-index 1abbd41..8d7cfd9 100644
---- a/cmake/platform_features.cmake
-+++ b/cmake/platform_features.cmake
-@@ -18,7 +18,7 @@ macro(_validate_feature_enabled FEATURE_NAME VARIABLE)
- endmacro(_validate_feature_enabled)
- 
- macro(define_platform_feature FEATURE_NAME FEATURE_DEFAULT_FILE DEFAULT_ENABLE)
--    if (NOT "${DEFAULT_ENABLE}" STREQUAL "OFF" OR "${ENABLE_${FEATURE_NAME}_FEATURE}" STREQUAL "ON")
-+    if (NOT "${DEFAULT_ENABLE}" STREQUAL "OFF" AND NOT "${ENABLE_${FEATURE_NAME}_FEATURE}" STREQUAL "OFF")
-         set(OPTION_VALUE ON)
-     else()
-         set(OPTION_VALUE OFF)
--- 
-2.35.1
-
diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
index 87aa67c4b6..47a8b35b6b 100644
--- a/package/hawktracer/hawktracer.hash
+++ b/package/hawktracer/hawktracer.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b6c7fdfbe8178bc7ba49ef840ec18a92d1488ad73ac9f64d2a09042410ad3ef4  hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8.tar.gz
+sha256  a48e26082fd644222d4a20ecfd5a34700865cf572d41b7eac5b0c8242fef9c5f  hawktracer-2ec19d71923344148928ef45fce549eda67030a4.tar.gz
 sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
index a14e2e2528..fd635e350d 100644
--- a/package/hawktracer/hawktracer.mk
+++ b/package/hawktracer/hawktracer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAWKTRACER_VERSION = e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8
+HAWKTRACER_VERSION = 2ec19d71923344148928ef45fce549eda67030a4
 HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
 HAWKTRACER_LICENSE = MIT
 HAWKTRACER_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

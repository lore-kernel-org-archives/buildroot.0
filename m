Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BA6C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A890D40283;
	Sun, 14 Aug 2022 10:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A890D40283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbBTMVU6ZJ6a; Sun, 14 Aug 2022 10:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B781B4019B;
	Sun, 14 Aug 2022 10:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B781B4019B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37C361BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13ED34019B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13ED34019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pdJHjFEL8C9 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37691400D8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37691400D8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6CEE08741C; Sun, 14 Aug 2022 09:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:05:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 648174ad369e8a71e579bf507fb6792efe809a15
X-Git-Newrev: d312d0ff9dd464e6c3416452f3b4941be1c10703
X-Patchwork-Hint: ignore
Message-Id: <20220814095106.6CEE08741C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hawktracer: fix build without
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d312d0ff9dd464e6c3416452f3b4941be1c10703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since the
addition of the package in commit
94d8764ef938936aa5432f1f13bd1b2d8b62a159:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8/lib/platform/linux/cpu_usage.c:5:10: fatal error: pthread.h: No such file or directory
    5 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7edc29e21e441e66ad7c4df1673e506950930913

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...orm_features.cmake-fix-DENABLE_CPU_USAGE_.patch | 38 ++++++++++++++++++++++
 package/hawktracer/hawktracer.mk                   |  8 +++--
 2 files changed, 44 insertions(+), 2 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773DFC61DF7
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 21:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C04B1408A0;
	Thu, 23 Nov 2023 21:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04B1408A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4H64dm7lQICU; Thu, 23 Nov 2023 21:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA65540247;
	Thu, 23 Nov 2023 21:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA65540247
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE4E1BF3AF
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 21:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23B0240247
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 21:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B0240247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XtlraIhEHEpI for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 21:53:00 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC37740235
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 21:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC37740235
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso13683405e9.0
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 13:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700776377; x=1701381177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b1V/UYbVghVyPX3kGzxoVdLsrdWVHVDz13av18TdGqA=;
 b=QEgwmO11//EgyV33+jPipTjVUKA7nKysiII8rXjHLNxF2uFw0aA7VqyRQkgIgd8N3W
 neVQk4mbUKr7uTk3ulV3EaD43LbItyB2LGg7kWyjE2lHpGztwzpNdUsDEkcLL+V2Pr9c
 J0DWZfetoTMegAEjOZmPcLgzodIn2eULTQmo1kuMyPO3ZDlWatVFAIvFWhuSnq22UYNz
 aMpddnSPZh+Q2UgDw2eCLVZyeOoRtGYBkNcFqK+vJH3QrXpH29k57j8UsIdUIZ5GLkSf
 CbT9fzG4LuVJxlGs2J/2EwJGR7Skg8Ff+YLHBjVPbhvLDyFiGHQB8dKTuSICKCYYnTSO
 un7A==
X-Gm-Message-State: AOJu0YxVgevpxSYfPGJic192yg6JTcyB5EtFWAy+THhKuZFi+Lk08l21
 svypJXNENntfKDcw6E50j7Vdic9YzOo=
X-Google-Smtp-Source: AGHT+IHa74MS5a8vchLYzi6hjzEqeacj3VhuGTu48VbmE9zt/7OwzSz7dCsHyJrjPubbtIIvYGNZ6g==
X-Received: by 2002:a05:600c:34ce:b0:401:c7ec:b930 with SMTP id
 d14-20020a05600c34ce00b00401c7ecb930mr3506053wmq.10.1700776376756; 
 Thu, 23 Nov 2023 13:52:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c198d00b0040841e79715sm3120766wmq.27.2023.11.23.13.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 13:52:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 22:52:50 +0100
Message-ID: <20231123215250.486862-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700776377; x=1701381177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b1V/UYbVghVyPX3kGzxoVdLsrdWVHVDz13av18TdGqA=;
 b=cO9HTaPH53N/6ZDGS0lyK6cgDv2dWsjaEo1muiIj+CjkUM5VTgsHtHAaXUAkIKAI2O
 jnaniFQHNGrM04VZV+h8vXC4+lJAYjy6O6MbcegB/i5cqPtmzGJ0LJdqghRKfiO+87NN
 0TdLApYrz6WExleLG9YCsRl/TT7mMxkT5dQ/rmbrIwdem8RQ/9X0lqRUhQxt62da++iz
 yQenwAD+7qmlNnWgThRu3tCb2pTQe7X9fQ6nS/DCu0Rlajg07lT3gGqpJZRdDpCTTR6/
 hbiO5yBJ8B+EKbLBpHBbdmv43R3g6AxO6KhtoOnbrdJQTKfr5J9QKF8al0OOEtdSwmvh
 1cGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cO9HTaPH
Subject: [Buildroot] [PATCH 1/1] package/oatpp: fix uclibc build
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since the addition of the
package in commit d5bba26801b352f591451cf73e0b7509de0e6850:

In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
                 from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
/home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
  359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
      |                                                                                             ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...base-Environment.hpp-include-cstdarg.patch | 37 +++++++++++++++++++
 package/oatpp/oatpp.mk                        |  6 +++
 2 files changed, 43 insertions(+)
 create mode 100644 package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch

diff --git a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
new file mode 100644
index 0000000000..f02215d8a9
--- /dev/null
+++ b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
@@ -0,0 +1,37 @@
+From b3e8930ccbaeeb77a4cd8b0fffbe52a208aa9a29 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Nov 2023 22:45:56 +0100
+Subject: [PATCH] src/oatpp/core/base/Environment.hpp: include cstdarg
+
+Include cstdarg to fix the following build failure with uclibc-ng:
+
+In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
+                 from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
+/home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
+  359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
+      |                                                                                             ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/oatpp/oatpp/pull/895
+---
+ src/oatpp/core/base/Environment.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/oatpp/core/base/Environment.hpp b/src/oatpp/core/base/Environment.hpp
+index fd77a5c6..05d5c949 100644
+--- a/src/oatpp/core/base/Environment.hpp
++++ b/src/oatpp/core/base/Environment.hpp
+@@ -29,6 +29,7 @@
+ #include "./Compiler.hpp"
+ #include "./Config.hpp"
+ 
++#include <cstdarg>
+ #include <cstdio>
+ #include <atomic>
+ #include <mutex>
+-- 
+2.42.0
+
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
index 621a549023..c8b0c9694a 100644
--- a/package/oatpp/oatpp.mk
+++ b/package/oatpp/oatpp.mk
@@ -13,4 +13,10 @@ OATPP_INSTALL_STAGING = YES
 # Only builds a static lib and headers
 OATPP_INSTALL_TARGET = NO
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
+OATPP_CONF_OPTS += -DOATPP_COMPAT_BUILD_NO_SET_AFFINITY=OFF
+else
+OATPP_CONF_OPTS += -DOATPP_COMPAT_BUILD_NO_SET_AFFINITY=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

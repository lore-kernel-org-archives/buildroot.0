Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0BAC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 13:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8327429F6;
	Wed, 17 May 2023 13:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8327429F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hLHsJSA8JO8; Wed, 17 May 2023 13:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2F59429E4;
	Wed, 17 May 2023 13:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2F59429E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA63B1BF487
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 13:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D9CA415D6
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 13:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D9CA415D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yF2Ia0zTHZri for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 13:04:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31AA0409AC
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31AA0409AC
 for <buildroot@buildroot.org>; Wed, 17 May 2023 13:04:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-510b4e488e4so1355665a12.3
 for <buildroot@buildroot.org>; Wed, 17 May 2023 06:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684328675; x=1686920675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTHUVr2oarl39MoDNwje+ZezqMHclGRbTMJXuQftWZQ=;
 b=X5JNw8pHcUg+1tvP3sNsxb7KrcU0Ay9PHjhGDXxTzSVOhObydzysXsCexQUG2Z/kz3
 Jp3ulkyQ+cUN0ub97klu5wMHuRdCRLsYXOV0Rm7cI+ijY9t9wf2ypasNiu7LAeFaeSMX
 9n2CPcVPm73C1S4/p4U88qlHszzmIXnjJ/ubg4lUNu5Nn+WuUgA1+YNfjVpTIjv3ueD1
 AEH8OEVMgYCBeA41djfq8Z3RkOvLCEo4ZxCrXQO9K5UKDHwAJ90n36+egyJZWxgwQzJ7
 j1E7so565Vb6HvnsgV4FGDuuv289FFO/zR3RICFWg7k7X9XH1UOitwarEp+Odsf4Ka0K
 wpuQ==
X-Gm-Message-State: AC+VfDzLo4FP1ouwX+qkqBuzpmlmjbH6JeSaH5JnSl14o3A1SIXCUJ3g
 4y0V6IsBjjyywYWvn109ZbsXh16DQKk6cw==
X-Google-Smtp-Source: ACHHUZ5oF+e1Ke+Ay4UfGo6+qweGEG/b1YX8K34P/PZg9xqPvco0oNSgs3GA/w48/FGdgKz3roZqyA==
X-Received: by 2002:a17:906:9b8f:b0:96a:6c3:5e72 with SMTP id
 dd15-20020a1709069b8f00b0096a06c35e72mr27355481ejc.10.1684328674606; 
 Wed, 17 May 2023 06:04:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:d0d:f903:7c5:c782])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a17090632d200b009661f07db93sm12206929ejk.223.2023.05.17.06.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:04:34 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 17 May 2023 15:04:27 +0200
Message-Id: <20230517130430.2868648-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/fluent-bit: use the system provided
 LuaJIT
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luajit was not used at all when it was selected, instead fluent-bit
recompiled it without taking care of the complexities that were
handled in the luajit package. Fix this by linking dynamically to the
buildroot provided version.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...-the-system-provided-LuaJIT-if-found.patch | 62 +++++++++++++++++++
 package/fluent-bit/fluent-bit.mk              |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch

diff --git a/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
new file mode 100644
index 0000000000..9f6f4d0ebb
--- /dev/null
+++ b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
@@ -0,0 +1,62 @@
+From 4f8eb7bb5a39d83374806928b7a5b622136ef055 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 28 Apr 2023 10:25:16 +0200
+Subject: [PATCH] build: use the system provided LuaJIT if found
+
+e.g. buildroot has logic to build luajit,
+so if pkg_check_modules can find a suitable version,
+then use that one if -DFLB_PREFER_SYSTEM_LIBS=Yes.
+
+Upstream: https://github.com/fluent/fluent-bit/pull/7286
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ CMakeLists.txt     | 12 +++++++++++-
+ src/CMakeLists.txt |  2 +-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9af783c79..0601b7c18 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -123,6 +123,7 @@ option(FLB_TESTS_INTERNAL_FUZZ "Enable internal fuzz tests"    No)
+ option(FLB_TESTS_OSSFUZZ       "Enable OSS-Fuzz build"         No)
+ option(FLB_MTRACE              "Enable mtrace support"         No)
+ option(FLB_POSIX_TLS           "Force POSIX thread storage"    No)
++option(FLB_PREFER_SYSTEM_LIBS  "Prefer system installed libraries" No)
+ option(FLB_INOTIFY             "Enable inotify support"       Yes)
+ option(FLB_SQLDB               "Enable SQL embedded DB"       Yes)
+ option(FLB_HTTP_SERVER         "Enable HTTP Server"           Yes)
+@@ -1003,7 +1004,16 @@ endif()
+ # LuaJIT (Scripting Support)
+ # ==========================
+ if(FLB_LUAJIT)
+-  include(cmake/luajit.cmake)
++  if(FLB_PREFER_SYSTEM_LIBS)
++    find_package(PkgConfig)
++    pkg_check_modules(LUAJIT luajit>=2.1.0)
++  endif()
++  if(LUAJIT_FOUND)
++    include_directories(${LUAJIT_INCLUDE_DIRS})
++  else()
++    include(cmake/luajit.cmake)
++    set(LUAJIT_LIBRARIES "libluajit")
++  endif()
+   FLB_DEFINITION(FLB_HAVE_LUAJIT)
+ endif()
+ 
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 06a206dd4..8b66ddd22 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -220,7 +220,7 @@ endif()
+ if(FLB_LUAJIT)
+   set(extra_libs
+     ${extra_libs}
+-    "libluajit")
++    ${LUAJIT_LIBRARIES})
+ endif()
+ 
+ if(FLB_SQLDB)
+-- 
+2.34.1
+
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 319815f056..60a1d06dbf 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -20,6 +20,7 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_RELEASE=Yes \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
+	-DFLB_PREFER_SYSTEM_LIBS=Yes \
 	-DFLB_BACKTRACE=No
 
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

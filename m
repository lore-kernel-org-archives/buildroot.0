Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D515CC001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 09:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB3D5415A6;
	Sun, 23 Jul 2023 09:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3D5415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cRAAsIVMHUo; Sun, 23 Jul 2023 09:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A8541578;
	Sun, 23 Jul 2023 09:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A8541578
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7866A1BF589
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51C9D8272D
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C9D8272D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Giws9sRCejFf for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 09:23:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 550708229D
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 09:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 550708229D
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf15bso31595295e9.1
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 02:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690104205; x=1690709005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jsXK90hsAUr302EPZczwRim8Scgy9/SL5gVIg9CegHc=;
 b=BHj663hORcL7MWfaPgQI5atFbMHoL5l0nYmzcU9xVV7b4d5vbf0bAVRX5JPRvniYc9
 Cd+XOX4ims4umQb9mYXl5e/koF0Kwuq2KcCNIoJSjP11CCJOai6EdIcakzaksrggCKBe
 fm3mwemXgA09RfDYWVY4dWw6GQbUdn01OnOWlzJlIQpCaYqemI7v98AlUUbdAGWG7YhL
 VyfBVOgSj8fRrA7zK5lzM1yYKhu23WEddeVipZ0NvF04+hX5i4Kn79yztrpIEgQho1Ju
 X5XbCkEBFST7u2RkdrRxNpxFk8nOBK2oHOMbU8pUJxvO7t2/NVNhiHqhvCBn1U2OcEhF
 g6Vg==
X-Gm-Message-State: ABy/qLYcQQ3uVLBupK8vpsmJz0V5PYVdTGs0nEtUu/ihQ0yOJ1+ARMGf
 ztU+EWs3b2JL7X6o6z4pUlPK1u0MWmB2zQ==
X-Google-Smtp-Source: APBJJlG5qS7zTWaoMBvIq1pAPCwpkM88MdsBQC4q2Wh6Q5w5Akbq8/QMBvTIT0Qwqy3R4QIlDz3/pA==
X-Received: by 2002:adf:cf02:0:b0:314:2c17:d921 with SMTP id
 o2-20020adfcf02000000b003142c17d921mr5047282wrj.38.1690104204770; 
 Sun, 23 Jul 2023 02:23:24 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb68:2f00:f09c:126e:2c9c:1d2b])
 by smtp.gmail.com with ESMTPSA id
 o8-20020adfeac8000000b003143b7449ffsm9124728wrn.25.2023.07.23.02.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 02:23:24 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 11:23:12 +0200
Message-Id: <20230723092314.129079-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723092314.129079-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
 <20230723092314.129079-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/4] package/fluent-bit: use the system
 provided LuaJIT
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
v2: No change.
v3: No change.
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
index 6cfa601614..b26ec2b0b6 100644
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

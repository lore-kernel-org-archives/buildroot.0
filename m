Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF69FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 14:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 436454093D;
	Sun, 26 Dec 2021 14:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4hZ0oN5QcPT; Sun, 26 Dec 2021 14:30:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93DE34092E;
	Sun, 26 Dec 2021 14:30:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AFA91BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 14:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79BDD60D7F
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 14:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUTMdK7UcIy9 for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 14:30:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6820E60D79
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 14:30:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a9so27198566wrr.8
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 06:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3pJyMMaoV/eXsnPV5GXMpOYEzLNLO5QFVeVegHeFqfM=;
 b=EM1W5u8UtLUDF66a9mP5lnvg3cIsiAoWbVwMAWbHWKH0ddlMt9TLUGSxZqEneBAa+u
 AknRl1AFi/vhPR9McvML653np+3/u2oItbDgRN3RBUCkk2YgAnjiouQkH0xuKv2shV95
 UU7nhiu3fz+qnHOhdxHBlOw6M8kyPpYqZ9VGHS7pnDoKlXHy22zRJDJHV75FssRhfOSK
 13sqjjdTplqSAa/ZbZxo2uhWkNuymlSg8LbM7A7VNHQQR/wrCW1SAoVe6yZlehhdSw70
 RyJwr6tOF+nHpt7roPKc/HTBo93ip07gHwU4HD0hUpb1qKZjD+cM7nT3clDMODErFGfh
 Wb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3pJyMMaoV/eXsnPV5GXMpOYEzLNLO5QFVeVegHeFqfM=;
 b=sv+1R6WzOODgZTU8WIkK1+Eu5uZVdDj3HOVV9CBOQHtNps6OmP264Php28T2kNHAYY
 wCfWqmPr+Nm0PRJ46MhX4ER5ofgnjL0zZhCeq0lnyvZozKEYfpSxRfAyz5FwTJQXIrwG
 VQ8idsMBvpKf2kxxJy5l462z591rOUFDLORA6QW4hKnlQXBqeVROB98uyXZ9QbW8emua
 lsnu9Fmiyx7TkWA8XUmq78rcU7BUyyAMgBeapZF1hBtnm4D6ftG+HFNXMUXm79GqnTdE
 f7/5l72Kf6oAN9HYPpA97+k2VuTiYBOFiQ2+T0dpHvwBdbbhFjHzuXaxMh5KI8owOrpB
 1ybw==
X-Gm-Message-State: AOAM5305+p/MXfoBSYYX98qJXOV2vvlLtzcjzCGyO1X9YxMwJlnhLmwN
 2KxXuDiuCvbhvh5dBDx4T3R0/jqgcfHBfg==
X-Google-Smtp-Source: ABdhPJx37vkbTMw7alAY+1JOdy120zOaF8V9Hi8P3kSrhgR301qcpTE+Eeiw6yTi2MC1yIs5iYx2gA==
X-Received: by 2002:a05:6000:382:: with SMTP id
 u2mr10280071wrf.331.1640529010376; 
 Sun, 26 Dec 2021 06:30:10 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id r9sm11734849wmq.18.2021.12.26.06.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 06:30:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 15:29:22 +0100
Message-Id: <20211226142922.611043-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: fix build with gcc 4.8
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

Fix the following build failure with gcc 4.8 raised since bump to
version 21.12 in commit 84b29ef40baf408b8b22085b336967aca83212db:

arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'

Fixes:
 - http://autobuild.buildroot.org/results/bea144f267215cd2dc27f235d6e3fb0adedb33ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...inor-Fix-a-compiler-flag-needs-GCC-7.patch | 27 +++++++++++++++
 ....c-fix-build-without-__has_attribute.patch | 34 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
 create mode 100644 package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch

diff --git a/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch b/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
new file mode 100644
index 0000000000..dd3debf7ee
--- /dev/null
+++ b/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
@@ -0,0 +1,27 @@
+From 2010e8f949ab7b4555b99dbf184e149a3f33df46 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Fri, 24 Dec 2021 11:03:06 +0100
+Subject: [PATCH] minor: Fix a compiler flag needs GCC 7
+
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/2010e8f949ab7b4555b99dbf184e149a3f33df46]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a3f11ac99..bfa6595ca 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -74,7 +74,9 @@ if(("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU" OR "${CMAKE_C_COMPILER_ID}" MATCHES
+     ADD_DEFINITIONS(-pedantic)
+     ADD_DEFINITIONS(-Wshadow)
+     ADD_DEFINITIONS(-Wmissing-prototypes)
+-    ADD_DEFINITIONS(-Wimplicit-fallthrough)
++    if("${CMAKE_C_COMPILER_ID}" MATCHES "Clang" OR NOT "7.0.0" VERSION_GREATER CMAKE_C_COMPILER_VERSION)
++        ADD_DEFINITIONS(-Wimplicit-fallthrough)
++    endif()
+     #ADD_DEFINITIONS(-Wfloat-equal)
+     #ADD_DEFINITIONS(-Wbad-function-cast)
+     #ADD_DEFINITIONS(-Wdocumentation)
diff --git a/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch b/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch
new file mode 100644
index 0000000000..683754845f
--- /dev/null
+++ b/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch
@@ -0,0 +1,34 @@
+From 1b74826f155406f86846d5c97b3534aab87cf6da Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Dec 2021 15:21:39 +0100
+Subject: [PATCH] src/optparse.c: fix build without __has_attribute
+
+Fix build failure without __has_attribute (e.g. gcc 4.8) which is raised
+since
+https://github.com/merbanan/rtl_433/commit/6c8af75c757712bd58b169317795484a72e9a16c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/merbanan/rtl_433/pull/1918]
+---
+ src/optparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/optparse.c b/src/optparse.c
+index aa3d0b53..b5e2d37e 100644
+--- a/src/optparse.c
++++ b/src/optparse.c
+@@ -232,9 +232,11 @@ int atoi_time(char const *str, char const *error_hint)
+             }
+             // intentional fallthrough
+ #if defined(__GNUC__) || defined(__clang__)
++#if defined __has_attribute
+ #if __has_attribute(fallthrough)
+             __attribute__((fallthrough));
+ #endif
++#endif
+ #endif
+         case ':':
+             ++colons;
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

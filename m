Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD55C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 19:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA67418E5;
	Mon, 25 Jul 2022 19:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA67418E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qap4MKIv10Je; Mon, 25 Jul 2022 19:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B17414CA;
	Mon, 25 Jul 2022 19:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B17414CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 562BD1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FF9E82A28
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF9E82A28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLZoQaDcYl8S for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 19:19:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96AD782A0B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96AD782A0B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 19:19:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v13so9582847wru.12
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/ANiNeFA1yqKd/TRW3ioOpeDtOTctD8OhlF2JUkL78=;
 b=jXvkSqyfzTdOcA8KOx2Is/GMCccOHLaKxC2S26Q3DvRx33MO7JOcOFxmbAPiufrDeP
 SjZOpVafhs8Xmzcr96bErx9cK9q67XyJqD+gULEKVUzQfsolOs/RoYu8yuHmsi9ZULuA
 uPcvLTajvcxYlemb+kGMl6ufKZFIo6Vcs+osfDJCLtpmq5LhQsOZrLEqLxnxfvV7Wfa4
 vMD9nqguGcFlTeqeS/ynrjq+CXwNr8A9OHx5QfN91N8Se+9Bll0Pdvp8Pq/ifvqZ86dX
 71C0TLKnuenU+NOjV8FJSg1LmyKtt3352x3lsLqkdpgw0WxqowiJJTiLOqm4qQULN8TL
 DmpA==
X-Gm-Message-State: AJIora8F8tokxu6QzIpb86gtMPD85RBkHSFyDq6K2tUhdtdqpCaKR2DP
 utKGz4dyU/M7IQCeJEa5KQqOlTNTX2M=
X-Google-Smtp-Source: AGRyM1vyNQ1VFkep2pMdYC4xbM/nIgAXZvyvy/KVt/wiKkg5jiIM97u68pWScf6FA3F+LsZohPa/Aw==
X-Received: by 2002:a05:6000:15c1:b0:21e:8048:1b1a with SMTP id
 y1-20020a05600015c100b0021e80481b1amr6421165wry.370.1658776751414; 
 Mon, 25 Jul 2022 12:19:11 -0700 (PDT)
Received: from kali.home (2a01cb0120169d0bf78f966f9fb21656.ipv6.abo.wanadoo.fr.
 [2a01:cb01:2016:9d0b:f78f:966f:9fb2:1656])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adff845000000b0021dd08ad8d7sm12998814wrq.46.2022.07.25.12.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 12:19:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 21:19:08 +0200
Message-Id: <20220725191908.27040-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/ANiNeFA1yqKd/TRW3ioOpeDtOTctD8OhlF2JUkL78=;
 b=Z5eTVzeGijGA4up7wDF4ZfChFh0x4up6yS0GqcGmj4VUOmqO2Xhl8+Jwbdjy07I+hi
 /JzZ3D82P6Kp2Mv96kYcHVfrFVNrAYRlaP249r1YBXloAtUeu9rSJiS1lDiSYwWYn4ch
 +OuJ7EEd2ntljAlAx4wQYkwFep5EdQrI5H6hNiH+o85FWDi4G/k5jX5U9YiPbOhQzfOd
 Ve0eIoWO5HEVa+pQdYvHo9aCMCQ4B31qb4gvCRwXh9S/OtgOoo6VX7AX633Y6DzMghX3
 OMA06dvE731aKj/1fR6Nr+OC1fNYHbrME/I1FuV5mw9Qrvz/3OkkMZg8DAgjwtUg3FGY
 Kw0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z5eTVzeG
Subject: [Buildroot] [PATCH 2/2] package/dump1090: bump to version 7.2
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

- Switch to active fork as https://github.com/mutability/dump1090, a
  fork of https://github.com/MalcolmRobb/dump1090 is no longer
  maintained
- Update license to GPL-2.0+:
  https://github.com/flightaware/dump1090/commit/e02a2cdd44eae33173bc86fe4043eb6ff4f05b6f
- Drop patch (not needed thanks to
  https://github.com/flightaware/dump1090/commit/0793c64ee8ebbcea86b7a9dc71c7e28ec08db618)
- librtlsdr is now optional
- hackrf is a new optional dependency
- disable CPUFeatures
- ncurses is mandatory since
  https://github.com/flightaware/dump1090/commit/f6b1b94c7dca1b407b8e4f02ef3206e3ca3ad28f
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-dump1090.h-fix-build-with-gcc-10.patch | 72 -------------------
 package/dump1090/Config.in                    | 10 +--
 package/dump1090/dump1090.hash                |  6 +-
 package/dump1090/dump1090.mk                  | 29 ++++++--
 4 files changed, 28 insertions(+), 89 deletions(-)
 delete mode 100644 package/dump1090/0001-dump1090.h-fix-build-with-gcc-10.patch

diff --git a/package/dump1090/0001-dump1090.h-fix-build-with-gcc-10.patch b/package/dump1090/0001-dump1090.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index eeda03bcf0..0000000000
--- a/package/dump1090/0001-dump1090.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 02153cb0b2d1083dcd587798d9ef7ce963739622 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 19 Aug 2020 18:46:17 +0200
-Subject: [PATCH] dump1090.h: fix build with gcc 10
-
-Fix the following build failures on gcc 10 (where -fno-common is enabled
-by default):
-
-/home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interactive.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: multiple definition of `Modes'; /home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interactive.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: multiple definition of `Modes'; dump1090.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: first defined here
-
-/home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interactive.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:238: multiple definition of `tDF'; dump1090.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:238: first defined here
-/home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: view1090.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/88dc97fcaa649014edb3b54a5dd4bd8ec4715bbd
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MalcolmRobb/dump1090/pull/96]
----
- dump1090.c | 3 +++
- dump1090.h | 4 ++--
- view1090.c | 3 +++
- 3 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/dump1090.c b/dump1090.c
-index 60882fc..1482224 100644
---- a/dump1090.c
-+++ b/dump1090.c
-@@ -29,6 +29,9 @@
- //
- #include "coaa.h"
- #include "dump1090.h"
-+
-+struct modes Modes;
-+
- //
- // ============================= Utility functions ==========================
- //
-diff --git a/dump1090.h b/dump1090.h
-index 9ad4de0..283e760 100644
---- a/dump1090.h
-+++ b/dump1090.h
-@@ -235,10 +235,10 @@ struct stDF {
-     uint64_t         llTimestamp;                // Timestamp at which the this packet was received
-     uint32_t         addr;                       // Timestamp at which the this packet was received
-     unsigned char    msg[MODES_LONG_MSG_BYTES];  // the binary
--} tDF;
-+};
- 
- // Program global state
--struct {                             // Internal state
-+extern struct modes {                             // Internal state
-     pthread_t       reader_thread;
- 
-     pthread_mutex_t data_mutex;      // Mutex to synchronize buffer access
-diff --git a/view1090.c b/view1090.c
-index 0b9b8b9..cc072fc 100644
---- a/view1090.c
-+++ b/view1090.c
-@@ -29,6 +29,9 @@
- //
- #include "coaa.h"
- #include "view1090.h"
-+
-+struct modes Modes;
-+
- //
- // ============================= Utility functions ==========================
- //
--- 
-2.27.0
-
diff --git a/package/dump1090/Config.in b/package/dump1090/Config.in
index 8f17929235..897ad46679 100644
--- a/package/dump1090/Config.in
+++ b/package/dump1090/Config.in
@@ -1,13 +1,7 @@
 config BR2_PACKAGE_DUMP1090
 	bool "dump1090"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # librtlsdr
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librtlsdr -> libusb
-	select BR2_PACKAGE_LIBRTLSDR
+	select BR2_PACKAGE_NCURSES
 	help
 	  Dump1090 is a simple Mode S decoder for RTLSDR devices
 
-	  https://github.com/MalcolmRobb/dump1090
-
-comment "dump1090 needs a toolchain w/ threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	  https://github.com/flightaware/dump1090
diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index fbbf21a015..ebfa831eab 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,5 @@
 # Locally computed
-sha256 72c1a94f3e6788af1e72b8cac13bb53e0989fe02cd13e191133f5519d2a2fefb  dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe.tar.gz
-sha256 29046ef7ee0b7b127bcc64faf135035820906dea2b379b2efcfc119131a39f7a  anet.h
+sha256  dfcf57b19f43e0262b1a03b0dc5069a9ddc48427d85378b7ef52fb4e74911eef  dump1090-7.2.tar.gz
+
+# Hash for license file
+sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 69fd67948c..82eaaf2cb8 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,15 +4,30 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = bff92c4ad772a0a8d433f788d39dae97e00e4dbe
-DUMP1090_SITE = $(call github,MalcolmRobb,dump1090,$(DUMP1090_VERSION))
-DUMP1090_LICENSE = BSD-3-Clause
-# no real license file
-DUMP1090_LICENSE_FILES = anet.h
-DUMP1090_DEPENDENCIES = host-pkgconf librtlsdr
+DUMP1090_VERSION = 7.2
+DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
+DUMP1090_LICENSE = GPL-2.0+
+DUMP1090_LICENSE_FILES = LICENSE
+DUMP1090_DEPENDENCIES = host-pkgconf ncurses
+DUMP1090_MAKE_OPTS = BLADERF=no CPUFEATURES=no LIMESDR=no
+
+ifeq ($(BR2_PACKAGE_HACKRF),y)
+DUMP1090_DEPENDENCIES += hackrf
+DUMP1090_MAKE_OPTS += HACKRF=yes
+else
+DUMP1090_MAKE_OPTS += HACKRF=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
+DUMP1090_DEPENDENCIES += librtlsdr
+DUMP1090_MAKE_OPTS += RTLSDR=yes
+else
+DUMP1090_MAKE_OPTS += RTLSDR=no
+endif
 
 define DUMP1090_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr \
+		-C $(@D) $(DUMP1090_MAKE_OPTS)
 endef
 
 define DUMP1090_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

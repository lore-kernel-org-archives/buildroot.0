Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753C7C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 19:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0E18331B;
	Mon, 25 Jul 2022 19:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0E18331B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dO4Ny0TksCwE; Mon, 25 Jul 2022 19:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C35AC832C2;
	Mon, 25 Jul 2022 19:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C35AC832C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 959551BF2A1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EF2B4015E
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF2B4015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0n5oy8xwWB-3 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 19:20:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F73E4012B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F73E4012B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 19:20:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so10055434wme.0
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPnkQET3EBf9HEfvRYjh1406CvQl/SV6GMclELFj2Uw=;
 b=jZULSAtLdR3OhLYbRylB1+CB4ikJhsGLm4RS9NRsXlYsQuAks1BjujkW2Fv6ltdMjR
 o480dbA3wzQklflxZUVZ9cFF8AG9whE0cSJwaNAYY6JHnOqpa+qQy1QxmUugbplanyE+
 zvfHM2fbfzte2JKj+0NfxpQYIvuGX+KRfqdR8qabKbSu6EQ2kA6zO5xptIdVvcq2n8RI
 LfZqho8Rr654UuLL2ptdXvJMG5kel6aPt4uUOGlMgSOaSF5uq8vMw41jZToHfgmxb3dZ
 MbB0tmbl0x83OPI/CLGUzZISgF1RHjmpTHv8FoeQ7xDvwqdAJYSOE4E7G12qBv/5e+D7
 9NdQ==
X-Gm-Message-State: AJIora8MOR+ubaUmfi02/jkU4CR5D/Q0LfUvZHI3QQimqpv69phURTlR
 Vxdy2HuiLnrMxihBRTUrq6Lm3SimTjM=
X-Google-Smtp-Source: AGRyM1uAHMkf+s+kHjC3IRksdD0B6CvpfaC8Ym1NJVBD3U5pKBYx9cyauVDuEKEqY/MttygKjtYV4w==
X-Received: by 2002:a7b:c8da:0:b0:3a2:ffd2:8059 with SMTP id
 f26-20020a7bc8da000000b003a2ffd28059mr9527181wml.169.1658776839677; 
 Mon, 25 Jul 2022 12:20:39 -0700 (PDT)
Received: from kali.home (2a01cb0120169d0bf78f966f9fb21656.ipv6.abo.wanadoo.fr.
 [2a01:cb01:2016:9d0b:f78f:966f:9fb2:1656])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adfb609000000b0021e519eba9bsm12535712wre.42.2022.07.25.12.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 12:20:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 21:20:35 +0200
Message-Id: <20220725192035.27119-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPnkQET3EBf9HEfvRYjh1406CvQl/SV6GMclELFj2Uw=;
 b=Eup5hhh+8zY/gbK+Owthb6T7OLvyGd33hLh7iNsMAYAy+EFHK1mPD2wITvePNSdYTJ
 oMCXnQ/QFoKPx1qlB08/l+KgPdgfoCCuCndm3/LMwNWI7Rea5WsHuaA9bWSLqvV1xxRA
 UXH8U4T6uzvNioiBoa+zhuHc3RhMpaGYqZsvfwUp5yHRsaAEZvAma3aH+CSkRIcIO8X9
 dOR6mzRcZjB+rdb0SOCES8a6MiDBsWqlMUcqi6UKkGjnhsSbxPzR2vRDh0tx6jdMTQoX
 xOatEzR4KCRw9TwbxLBYqkYyIPQr/zXNpQYu0F2taHqTmB7BHMIgdyDDwcbh7yl14OCr
 otyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Eup5hhh+
Subject: [Buildroot] [PATCH v2,1/1] package/dump1090: bump to version 7.2
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
Changes v1 -> v2:
 - Fix patch number

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

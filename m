Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FED0C46467
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 18:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD4E5400CC;
	Thu, 19 Jan 2023 18:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD4E5400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeE05tDUqV6q; Thu, 19 Jan 2023 18:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67BD40481;
	Thu, 19 Jan 2023 18:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67BD40481
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 354061BF33E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 106A841D09
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106A841D09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjBxBGx_IIQd for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 18:47:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3065E41D08
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3065E41D08
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 18:47:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id k16so2283009wms.2
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IYmnl5yF3O7OGK6UPzwXdNUXyuIyFWwfKTtHy998DK4=;
 b=ps4F1n7ZW4u6wrtXUboS4daBfqbXdntPQKYpVKqmXUy27jjB8GeQi0ThmaXhArY3U1
 sD0YjXALEtxNc3kYkyVUvQAHUAhCKv7pew5u5XRpxI1ZzujPMfIK0TDkD/wBoQcHpmGT
 eLNT3/4/0JymBs4Gi/a+E8BFbHKytPeRxa0tHd5uUG6lcotgyn01Enp7rpnVN4EXIKsE
 YxV7A4nN9It8U8Wx2z1CN22ajt6ElB/J/Uf2FBCI1QOQXWn81nSIcjtPibbWYmgy81Kh
 qi357Wq+OOnbXnfgrKgQtg1sZ3xYWIr3sdFnLADKTyqPcLiaiY8Dc3M9eI7zq0Iylyub
 yrsQ==
X-Gm-Message-State: AFqh2kpRf3pS/trTPijtwwEDW60cIdoyjRWaGgRC6bRnKj4tVK/xin6i
 sK6QHyRp/nmK+0gf1dPw8VG0YJMQlNo=
X-Google-Smtp-Source: AMrXdXs63GbZFBpyJVE+1VhAur2mDBwZLw1vnsBjB3c1s0pmvyn+e0nxyHMFtGGzYbOJOYW7AccuNA==
X-Received: by 2002:a05:600c:4687:b0:3db:2e06:4091 with SMTP id
 p7-20020a05600c468700b003db2e064091mr495176wmo.37.1674154075787; 
 Thu, 19 Jan 2023 10:47:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bg14-20020a05600c3c8e00b003dab40f9eafsm7310506wmb.35.2023.01.19.10.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:47:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 19:47:52 +0100
Message-Id: <20230119184752.3067-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IYmnl5yF3O7OGK6UPzwXdNUXyuIyFWwfKTtHy998DK4=;
 b=JJFeJhnwTrs6pzlP/Weth1MMe2WLG/y15HBbVo2dqnukRmNB9/TahlPwuYYy/EyXxI
 HPWa5KebKzaWxVWGjAp8a60OU/5AcWauCGJRgx08/oKr0laQRKMBsdlEW3Y/QnV0GB9r
 DdIKy4S1FjBfWTN06ZBYCBx8LhvD3o4R1AFRoM8vRxAEvBZufX3C04/2rSmX006gbvs6
 J3NbAchGTOR2h0HLtX0+lXfxIRpwkMH+GpnJZ2qSko9HhV+LIhDNNvGUCuUU6Pzu0jaE
 DNAWWKZfRNpbUbk8+T3kmW2YRlcWQxfHVwHrz6KBCb4uf1/7yV3mqKASQBu46tL8D7g0
 ATAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JJFeJhnw
Subject: [Buildroot] [PATCH 1/1] package/flashrom: bump to version 1.2.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/flashrom/flashrom/compare/v1.2...v1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...kefile-Fix-building-on-AArch64-NixOS.patch | 95 -------------------
 package/flashrom/flashrom.hash                |  4 +-
 package/flashrom/flashrom.mk                  |  2 +-
 3 files changed, 3 insertions(+), 98 deletions(-)
 delete mode 100644 package/flashrom/0001-Makefile-Fix-building-on-AArch64-NixOS.patch

diff --git a/package/flashrom/0001-Makefile-Fix-building-on-AArch64-NixOS.patch b/package/flashrom/0001-Makefile-Fix-building-on-AArch64-NixOS.patch
deleted file mode 100644
index f835172e61..0000000000
--- a/package/flashrom/0001-Makefile-Fix-building-on-AArch64-NixOS.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From da6b3b70cb852dd8e9f9e21aef95fa83e7f7ab0d Mon Sep 17 00:00:00 2001
-From: Pyry Kontio <pyry.kontio@drasa.eu>
-Date: Mon, 6 Jul 2020 12:57:35 +0900
-Subject: [PATCH] Makefile: Fix building on AArch64 NixOS
-
-The parsing of the output of archtest.c produced an unexpected
-value on AArch64 NixOS. For example, the make variable ARCH was set to:
-
-```
-bit outside of fd_set selected
-arm
-```
-
-This made the arch and OS checks fail.
-
-This commit simplifies the parsing, making it more robust.
-
-The C files archtest.c, endiantest.c and os.h used to set the
-TARGET_OS, ARCH and ENDIAN variables, respectively, output
-the result of the test as the final line, so just extracting
-the final line and removing double quoting is enough.
-
-This commit also fixes a bug with debug_shell lacking escaping
-single quotes, which prevented using the single quote in the
-debug_shell calls. It used to work by accident before this fix;
-the line in the call happened to contain a balanced pair of double
-quotes and lacked other characters that needed escaping, which
-didn't break the debug_shell, but this was accidental and very
-brittle.
-
-Signed-off-by: Pyry Kontio <pyry.kontio@drasa.eu>
-Change-Id: Iaa4477a71e758cf9ecad2c22f3b77bc6508a3510
-Reviewed-on: https://review.coreboot.org/c/flashrom/+/43140
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: Angel Pons <th3fanbus@gmail.com>
-
-[Retrieved from:
-https://github.com/flashrom/flashrom/commit/da6b3b70cb852dd8e9f9e21aef95fa83e7f7ab0d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index f3f7717e2..e475cbdbd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -83,7 +83,8 @@ dummy_for_make_3_80:=$(shell printf "Build started on %s\n\n" "$$(date)" >$(BUIL
- 
- # Provide an easy way to execute a command, print its output to stdout and capture any error message on stderr
- # in the build details file together with the original stdout output.
--debug_shell = $(shell export LC_ALL=C ; { echo 'exec: export LC_ALL=C ; { $(1) ; }' >&2;  { $(1) ; } | tee -a $(BUILD_DETAILS_FILE) ; echo >&2 ; } 2>>$(BUILD_DETAILS_FILE))
-+debug_shell = $(shell export LC_ALL=C ; { echo 'exec: export LC_ALL=C ; { $(subst ','\'',$(1)) ; }' >&2; \
-+    { $(1) ; } | tee -a $(BUILD_DETAILS_FILE) ; echo >&2 ; } 2>>$(BUILD_DETAILS_FILE))
- 
- ###############################################################################
- # General OS-specific settings.
-@@ -106,7 +107,8 @@ endif
- # IMPORTANT: The following line must be placed before TARGET_OS is ever used
- # (of course), but should come after any lines setting CC because the line
- # below uses CC itself.
--override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
-+override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null \
-+    | tail -1 | cut -f 2 -d'"'))
- 
- ifeq ($(TARGET_OS), Darwin)
- override CPPFLAGS += -I/opt/local/include -I/usr/local/include
-@@ -490,8 +492,10 @@ endif
- # IMPORTANT: The following line must be placed before ARCH is ever used
- # (of course), but should come after any lines setting CC because the line
- # below uses CC itself.
--override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
--override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | grep -v '^\#'))
-+override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null \
-+    | tail -1 | cut -f 2 -d'"'))
-+override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null \
-+    | tail -1))
- 
- # Disable the internal programmer on unsupported architectures (everything but x86 and mipsel)
- ifneq ($(ARCH)-little, $(filter $(ARCH),x86 mips)-$(ENDIAN))
-@@ -1299,12 +1303,12 @@ compiler: featuresavailable
- 	@printf "Target arch is "
- 	@# FreeBSD wc will output extraneous whitespace.
- 	@echo $(ARCH)|wc -w|grep -q '^[[:blank:]]*1[[:blank:]]*$$' ||	\
--		( echo "unknown. Aborting."; exit 1)
-+		( echo "unknown (\"$(ARCH)\"). Aborting."; exit 1)
- 	@printf "%s\n" '$(ARCH)'
- 	@printf "Target OS is "
- 	@# FreeBSD wc will output extraneous whitespace.
- 	@echo $(TARGET_OS)|wc -w|grep -q '^[[:blank:]]*1[[:blank:]]*$$' ||	\
--		( echo "unknown. Aborting."; exit 1)
-+		( echo "unknown (\"$(TARGET_OS)\"). Aborting."; exit 1)
- 	@printf "%s\n" '$(TARGET_OS)'
- ifeq ($(TARGET_OS), libpayload)
- 	@$(CC) --version 2>&1 | grep -q coreboot || \
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 97df4fe9a4..2ab463d93a 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-v1.2.tar.bz2.asc
-sha256  e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b  flashrom-v1.2.tar.bz2
+# https://download.flashrom.org/releases/flashrom-v1.2.1.tar.bz2.asc
+sha256  89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65  flashrom-v1.2.1.tar.bz2
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 5554082bca..dd505987ed 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.2
+FLASHROM_VERSION = 1.2.1
 FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

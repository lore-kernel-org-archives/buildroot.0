Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A5C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 19:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B023641B72;
	Thu, 29 Feb 2024 19:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9wgKombHdkG; Thu, 29 Feb 2024 19:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D75E41B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D75E41B7F;
	Thu, 29 Feb 2024 19:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD401BF3C8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECB0982BF4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 19:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1b99X0jb4ZP for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 19:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91DEA82B8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91DEA82B8C
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91DEA82B8C
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 19:22:05 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d2305589a2so16122341fa.1
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 11:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709234522; x=1709839322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EWdAR2vQGvQM3f8LznGSYsCDHfKmVpBavuVYxPWn1ZI=;
 b=o4cimCIWG4T4LVhCafUyypXJ77ICEmA80AhZLZeqXrNfcWR/tIcYLNlXDJr/JmWzRU
 M8GYjLiTcq2tpLeLbOTU7ZlNxJs7vfGHpApkHAJx+yapPLea8Cmenap4A4FLVSL48bye
 wHFwtzUFqUmz6pdd6x5QPqhsYrM3IfCgW77nUpBnu9BVAXhN3y0KjSb9pUWNMGW28ZHS
 YyPsTuw8lXm/9NbG1i5C0MgLIRIQ3jAwZknKdq1gFPQY0nvbC+Fpqzjed3hzRsMo/O16
 2o0mYiLysOjUAtsoLD97AgKaq9tlMyhXWX825BfUQB71nn4d5nC76ZFBH/Qi1BTQDVOz
 j36w==
X-Gm-Message-State: AOJu0Yy2WhflsnmbpRiSMDrwgpXrH1UOWUolj03HLVX4y6A01iv8MD7u
 Zta2FDK8x0NqnBtDmtFOPDxzi5XbPComT48rlELz4FBvaqU5upQDj55xiERfpx4=
X-Google-Smtp-Source: AGHT+IF7bwg1a852IpxleSFbZ0FF0DhRYfHgi9V1X0msvUneXgskLkW3e59PAe0MMjtKJqI5v6z2Yw==
X-Received: by 2002:a05:651c:b09:b0:2d2:ca44:e233 with SMTP id
 b9-20020a05651c0b0900b002d2ca44e233mr2719103ljr.4.1709234522230; 
 Thu, 29 Feb 2024 11:22:02 -0800 (PST)
Received: from nibiru.. ([2a00:1370:8186:6f6:bd11:68a8:5d4c:6728])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a2e9cd4000000b002ce04e9d944sm295380ljj.69.2024.02.29.11.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 11:22:01 -0800 (PST)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 22:21:38 +0300
Message-ID: <20240229192138.21843-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709234522; x=1709839322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EWdAR2vQGvQM3f8LznGSYsCDHfKmVpBavuVYxPWn1ZI=;
 b=D93ibv6vZUOttgTgQUpPKjNHXDCvLDoJx6wRRYxns9DE2xQhg2VHx7pg1dGYYPhAHq
 oERAowWqV4UVXcWRo+f4Vav2sIj56SYX5zbwLYYS3uAssmjzZ9nNFJHlQ+2Ht045QMXV
 mWGSSj8SJakNcSapq2taUourGT0mv/TcwAI+wzlfdVRoEctM+EDPeHg/xw/RRlkyjlxW
 ss+oCv96C9JOCGirHMhgMhjRBMJ6A0nS5kFR+s+ahKet2X1O1NTFF5pQ3UFG2TpFBKDO
 HFaYgQWtQ00HJdDnkME1CJQPn6FRyh9v9pmbdoZWnWSrQaR2AdxRRn5OvZ+dE1Ax2FnL
 NfmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D93ibv6v
Subject: [Buildroot] [PATCH 1/1] package/basu: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

basu is the sd-bus library, extracted from systemd.

Some projects rely on the sd-bus library for DBus support. However not
all systems have systemd or elogind installed. This library provides
just sd-bus (and the busctl utility).

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...ble-stack-protection-for-Buildroot-p.patch | 39 +++++++++++++++++++
 ...-F_ADD_SEALS-definition-from-missing.patch | 34 ++++++++++++++++
 package/basu/Config.in                        | 23 +++++++++++
 package/basu/basu.hash                        |  4 ++
 package/basu/basu.mk                          | 28 +++++++++++++
 7 files changed, 130 insertions(+)
 create mode 100644 package/basu/0001-meson.build-Disable-stack-protection-for-Buildroot-p.patch
 create mode 100644 package/basu/0002-memfd-util.c-Use-F_ADD_SEALS-definition-from-missing.patch
 create mode 100644 package/basu/Config.in
 create mode 100644 package/basu/basu.hash
 create mode 100644 package/basu/basu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bfe91f064..a869c7b42d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2779,6 +2779,7 @@ F:	package/systemd
 F:	support/scripts/pkg-stats
 
 N:	Sergey Bobrenok <bobrofon@gmail.com>
+F:	package/basu/
 F:	package/sdbus-cpp/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..5b89d895d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2086,6 +2086,7 @@ menu "Other"
 	source "package/armadillo/Config.in"
 	source "package/atf/Config.in"
 	source "package/avro-c/Config.in"
+	source "package/basu/Config.in"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/belr/Config.in"
diff --git a/package/basu/0001-meson.build-Disable-stack-protection-for-Buildroot-p.patch b/package/basu/0001-meson.build-Disable-stack-protection-for-Buildroot-p.patch
new file mode 100644
index 0000000000..34dd3b16b9
--- /dev/null
+++ b/package/basu/0001-meson.build-Disable-stack-protection-for-Buildroot-p.patch
@@ -0,0 +1,39 @@
+From 6133c87299bce32c13dcf1692842ea5f2890c5ad Mon Sep 17 00:00:00 2001
+From: Sergey Bobrenok <bobrofon@gmail.com>
+Date: Wed, 28 Feb 2024 16:29:17 +0300
+Subject: [PATCH] meson.build: Disable stack protection for Buildroot packaging
+
+In Buildroot, the SSP flags are passed via the wrapper, and only flags
+supported by the toolchain will be used. So the SSP flags can be
+safely removed from the build files.
+
+Fixes:
+  src/basic/libbasic.a.p/log.c.o: in function `write_to_console.isra.0':
+  log.c:(.text.write_to_console.isra.0+0x154): undefined reference to `__stack_chk_fail_local'
+
+Upstream: N/A [Buildroot specific]
+
+Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
+---
+ meson.build | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 6f79707..51fd400 100644
+--- a/meson.build
++++ b/meson.build
+@@ -75,9 +75,6 @@ possible_cc_flags = [
+         '-fdiagnostics-show-option',
+         '-fno-strict-aliasing',
+         '-fvisibility=hidden',
+-        '-fstack-protector',
+-        '-fstack-protector-strong',
+-        '--param=ssp-buffer-size=4',
+ ]
+ 
+ # --as-needed and --no-undefined are provided by meson by default,
+
+base-commit: 684a41d68cfbb05e38aacb60a8548e21ddfbecdb
+-- 
+2.43.2
+
diff --git a/package/basu/0002-memfd-util.c-Use-F_ADD_SEALS-definition-from-missing.patch b/package/basu/0002-memfd-util.c-Use-F_ADD_SEALS-definition-from-missing.patch
new file mode 100644
index 0000000000..69e899279f
--- /dev/null
+++ b/package/basu/0002-memfd-util.c-Use-F_ADD_SEALS-definition-from-missing.patch
@@ -0,0 +1,34 @@
+From 8e4960e8b9d11d9be96e83b02bd3b08178ddce1b Mon Sep 17 00:00:00 2001
+From: Sergey Bobrenok <bobrofon@gmail.com>
+Date: Wed, 28 Feb 2024 20:42:19 +0300
+Subject: [PATCH basu] memfd-util.c: Use F_ADD_SEALS definition from missing.h
+
+uClibc and glibc (until version 2.27, 2018) implementations don't
+support F_ADD_SEALS and other F_SEAL_xxx flags.
+'missing.h' was removed from 'memfd-util.c' in 37dbb2fcb ("Remove
+useless includes").
+
+Upstream: https://lists.sr.ht/~emersion/public-inbox/patches/49899
+
+Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
+---
+ src/basic/memfd-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/memfd-util.c b/src/basic/memfd-util.c
+index 89893ba..7e535c6 100644
+--- a/src/basic/memfd-util.c
++++ b/src/basic/memfd-util.c
+@@ -7,6 +7,7 @@
+ 
+ #include "alloc-util.h"
+ #include "memfd-util.h"
++#include "missing.h"
+ 
+ int memfd_set_sealed(int fd) {
+ #if defined(__FreeBSD__) && __FreeBSD__ < 13
+
+base-commit: 684a41d68cfbb05e38aacb60a8548e21ddfbecdb
+-- 
+2.44.0
+
diff --git a/package/basu/Config.in b/package/basu/Config.in
new file mode 100644
index 0000000000..5875aa7775
--- /dev/null
+++ b/package/basu/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_BASU
+	bool "basu"
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_WCHAR # uchar.h
+	depends on BR2_ENABLE_LOCALE # locale_t
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_add_and_fetch
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # F_ADD_SEALS
+	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
+	help
+	  basu is the sd-bus library, extracted from systemd.
+
+	  Some projects rely on the sd-bus library for DBus support.
+	  However not all systems have systemd or elogind installed.
+	  This library provides just sd-bus (and the busctl utility).
+
+	  https://git.sr.ht/~emersion/basu
+
+comment "basu needs a toolchain w/ wchar, locale, threads, headers >= 3.17"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/basu/basu.hash b/package/basu/basu.hash
new file mode 100644
index 0000000000..f369286337
--- /dev/null
+++ b/package/basu/basu.hash
@@ -0,0 +1,4 @@
+# From https://git.sr.ht/~emersion/basu/refs/v0.2.1
+sha256  d9b373a9fcb5d5eb5f6c1c56355f76edb7f2f52bc744570e80604e83455a19bd  basu-0.2.1.tar.gz
+# Locally computed:
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/basu/basu.mk b/package/basu/basu.mk
new file mode 100644
index 0000000000..7bd1923646
--- /dev/null
+++ b/package/basu/basu.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# basu
+#
+################################################################################
+
+BASU_VERSION = 0.2.1
+BASU_SITE = https://git.sr.ht/~emersion/basu/refs/download/v$(BASU_VERSION)
+BASU_INSTALL_STAGING = YES
+BASU_LICENSE = LGPL-2.1+
+BASU_LICENSE_FILES = LICENSE.LGPL2.1
+BASU_DEPENDENCIES = host-gperf
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+BASU_DEPENDENCIES += libcap
+BASU_CONF_OPTS += -Dlibcap=enabled
+else
+BASU_CONF_OPTS += -Dlibcap=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+BASU_DEPENDENCIES += audit
+BASU_CONF_OPTS += -Daudit=enabled
+else
+BASU_CONF_OPTS += -Daudit=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

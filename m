Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56530C67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 15:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF3A4060E;
	Sat,  6 Apr 2024 15:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6W6c6XGYAVm; Sat,  6 Apr 2024 15:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA774055F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA774055F;
	Sat,  6 Apr 2024 15:43:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1251BF335
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 15:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4A04046B
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 15:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biDqWqFWmVXZ for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 15:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=chinhuat@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 527FD41910
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 527FD41910
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 527FD41910
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 15:43:28 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1e2987e9d06so26313845ad.2
 for <buildroot@buildroot.org>; Sat, 06 Apr 2024 08:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712418207; x=1713023007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pyo7XDS8R9rT8nGoRVAhOBAiJKu0ii3Jz+pbQQYokdg=;
 b=UDK4zGiomUnzvt44SNX4yGMeJiYdc8abbH/w0BQpy71fqMhW1emqXkBwRCJ6B2jEMe
 3ZFTCJXMD2Eq65jLm9SKeWNjT/Se3YVtnMMQg/4PG3qFr4W6fpCx4/dXgnQIYTHKVwnn
 JhuyBUq9aMqd261udwqa3iqv5oFVfGK5Tu82TziM50BUBxzd7ic9/A7iIE7H73x9x+ii
 wnmb4c6Kiex5cuXR57KpAPp6H8tk9gpkkEYQK1wQ4Lph0w8Avi9uMwbOGNEMrLOCXFGQ
 pHP7mciZAPUIlo4HS5/lGyI25/VB4vKQamq5eg5/B92440KXeIeZcWVJjD7J6LDIxSbF
 6IPQ==
X-Gm-Message-State: AOJu0YwuenePrp7qSOq/YTjLiHDlMAz88Q9aHqh6F8bW+OyJv1bowkSH
 DkyyrwGkuJKMLArFuPCidYLtJ1UYkVwIxwIEMgGJgkBnZAXeQyDnJl+H1YU54kU=
X-Google-Smtp-Source: AGHT+IGIdQ/57+HAtxYBrbABiG/oryXn8sTKxGf8x+8or+i+Wx0SvaBAOoc+qpSxDTgwBtYgBz21wA==
X-Received: by 2002:a17:902:cecf:b0:1de:f93f:4410 with SMTP id
 d15-20020a170902cecf00b001def93f4410mr5127480plg.8.1712418206756; 
 Sat, 06 Apr 2024 08:43:26 -0700 (PDT)
Received: from NUC7CJYS.. ([175.144.129.205]) by smtp.gmail.com with ESMTPSA id
 k12-20020a170902c40c00b001d8edfec673sm3552513plk.214.2024.04.06.08.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Apr 2024 08:43:26 -0700 (PDT)
From: Chin Huat Ang <chinhuat@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Apr 2024 23:43:08 +0800
Message-Id: <20240406154308.3336009-1-chinhuat@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712418207; x=1713023007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pyo7XDS8R9rT8nGoRVAhOBAiJKu0ii3Jz+pbQQYokdg=;
 b=VcDiZ5fI1aVGiqYbGsQ4Q1mTLdAGHk8gAnxU5pgy1UX7z3WT55pIAZJrOgLeAj0Z1J
 wnyTjugZuL5sLL/BjCtwU7LqT3OFRhYVNzjP54QiqHERVCkEUkMeZYqsM85tvYA5FjfV
 wp9x1eDu5GlPXduIJO6Ecdb6GIROWedHRfOCXRh7cnKyH+72zeUDv66r7X2rPZuhH6Lg
 XT3YUxvYxzsqpRdJT1Z/rFJ9OnYy2bw+5pr3pg1FuXokG10zzhhSS0SE8Ine4XN1EgXT
 6p9xAVrfeufL3K50vzsZQiuSD/IUQBHQfSRaW+0ELLNIKfkT8/my7Xp/UUNB23P5YV6O
 6Vnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VcDiZ5fI
Subject: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47,
 add Y2038 config option
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
Cc: Chin Huat Ang <chinhuat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc introduced UCLIBC_USE_TIME64 config since v1.0.46 which enables
64-bit date and time handling on 32-bit targets to solve Y2038 issue.
As of v1.0.47, most 32-bit buildroot/uClibc targets appear to support
64-bit date/time.

Here we add the equivalent BR2_UCLIBC_USE_TIME64 package config which
is only meant for 32-bit target architectures. This config is disabled
by default as it has only been sanity tested. When disabled, uClibc's
Y2038 issue can be easily reproduced/observed on 32-bit targets:

  # uname -a; date -s @2147483647; date +%s; sleep 1; date; date +%s
  Linux buildroot 6.1.44 #1 SMP Sat Apr  6 19:05:05 +08 2024 armv7l GNU/Linux
  Tue Jan 19 03:14:07 UTC 2038
  2147483647
  Fri Dec 13 20:45:52 UTC 1901
  -2147483648

With BR2_UCLIBC_USE_TIME64=y, the Y2038 issue goes away:

  # uname -a; date -s @2147483647; date +%s; sleep 1; date; date +%s
  Linux buildroot 6.1.44 #1 SMP Sat Apr  6 17:43:14 +08 2024 armv7l GNU/Linux
  Tue Jan 19 03:14:07 UTC 2038
  2147483647
  Tue Jan 19 03:14:08 UTC 2038
  2147483648

The following 32-bit target architectures have been sanity tested:

  - ARMv7-A Cortex-A9 on qemu_arm_vexpress_defconfig
  - Generic MIPS32R2 on qemu_mips32r2_malta_defconfig
  - i386/Pentium Pro on qemu_x86_defconfig
  - Xtensa on qemu_xtensa_lx60_defconfig

Git shortlog of other changes (tags/v1.0.45..tags/v1.0.47):

Dmitry Chestnykh (23):
      Fix redefinition of _GNU_SOURCE.
      ld.so: Add support of DT_RELR relocation format.
      libc: Fix dns-related build issues.
      Add extra `-shared` to link.so command.
      Fix broken compilation of uClibc-ng.
      Rename `reloc_addr` to suppress `-Wshadow` warning.
      Introduce time64 support.
      xtensa: Add time64 support.
      ldso: Remove unneeded semicolons.
      Remove unneeded comparisons.
      Add support for using time64 on big-endian machines.
      Add time64 support for PowerPC.
      Refactor `ts32_struct` and `TO_ITS64_P`.
      Add time64 support for MIPS32.
      Fix *stat() and *stat64() when the time is beyond year 2038.
      ldso: Use statx() when time64 is enabled.
      libc: always redirect *stat() family to statx() with time64 enabled.
      libc: Pass 64bit-only time structures to syscalls.
      Add time64 support to OpenRISC.
      Add time64 support for sparc.
      libc: restore correct definition of semid_ds struct.
      libc: Remove 32bit timespec structures everywhere.
      Add time64 support to ARC.

Frank Mehnert (1):
      ldso: add null-pointer check

Marcus Haehnel (4):
      Remove duplicate semicolons
      libm/w_j0f.c: Call correct ieee754 function
      libpthread: Remove no longer valid attribute_unused
      libpthread/linuxthreads: add missing string.h include in condvar.c

Marius Melzer (2):
      Fix -Wgnu-designator clang warnings
      Fix -Wnon-literal-null-conversion clang warning

Paul Cercueil (3):
      sys/stat.h: Make S_ISSOCK() available if __USE_XOPEN2K
      sys/stat.h: Make fchmod() available if __USE_XOPEN2K
      features.h: Rework _DEFAULT_SOURCE

Sven Linker (3):
      Avoid fall-through if file matching temporary name exists
      libc: Fix some unused parameter warnings
      Replace null subtraction with cast

Waldemar Brodkorb (25):
      c6x: fix duplicate include
      add newline at end of file
      fix c6x toolchain compile
      remove symlink
      riscv32: decouple from riscv64
      riscv32: add ldso support, enable time64.
      riscv32: add basic support for NPTL
      microblaze: enable time64
      superh: enable time64
      m68k: enable time64
      x86: enable time64
      update MAINTAINERS
      bump version for 1.0.46 release
      add reallocarray from musl
      add explicit_bzero from musl
      riscv64: sync with glibc, fix all TLS errors in uClibc-ng-test
      riscv64: page size is 4096, reported by sorear
      riscv64: sync with glibc clone.S
      riscv64: clone behaves like on aarch64, fixes tst-basic3, reported by sorear
      riscv64: add atomic.h, fixes tst-cond16, suggested by sorear
      riscv32: sync with riscv64
      riscv64: enable CTORS, fixes C++ applications, found by sorear
      riscv: fix pread64/pwrite64 users like git, suggested by sorear
      riscv: add __UCLIBC_ABORT_INSTRUCTION__, suggested by sorear
      bump version for 1.0.47 release

Signed-off-by: Chin Huat Ang <chinhuat@gmail.com>
---
 package/uclibc/Config.in   |  9 +++++++++
 package/uclibc/uclibc.hash |  4 ++--
 package/uclibc/uclibc.mk   | 14 +++++++++++++-
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2555487f06..475bca14f0 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -120,6 +120,15 @@ config BR2_UCLIBC_INSTALL_UTILS
 	  You can save ~32 KiB in target space by disabling them since
 	  they're normally not needed.
 
+config BR2_UCLIBC_USE_TIME64
+	bool "Use 64-bit date and time functions (Y2038-ready)"
+	depends on !BR2_ARCH_IS_64
+	default n
+	help
+	  Enabling this option for 32-bit targets will configure
+	  uClibc with config UCLIBC_USE_TIME64=y which enables 64-bit
+	  date and time handling to support date/time beyond Y2038.
+
 # Mapping from the Buildroot architecture configuration options to the
 # uClibc architecture names.
 config BR2_UCLIBC_TARGET_ARCH
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index ae1f3178d9..a10ceab54c 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.45.tar.xz.sha256
-sha256  c2f4c6b6e19d7c9c226992a3746efd7ab932040463c15ee0bc8f4132b5777ac4  uClibc-ng-1.0.45.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.47.tar.xz.sha256
+sha256  29a4d684a06da344ee3ee09acc2ca7649d592ae3ff848f698145c46def05efcb  uClibc-ng-1.0.47.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 88623840bf..3ca541bcda 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.45
+UCLIBC_VERSION = 1.0.47
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
@@ -371,6 +371,17 @@ else
 UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_ENABLE_OPT,HAVE_SHARED)
 endif
 
+#
+# time64
+#
+
+ifeq ($(BR2_UCLIBC_USE_TIME64),y)
+UCLIBC_TIME64_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_USE_TIME64)
+else
+UCLIBC_TIME64_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_USE_TIME64)
+endif
+
+
 #
 # Commands
 #
@@ -423,6 +434,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
 	$(UCLIBC_SHARED_LIBS_CONFIG)
+	$(UCLIBC_TIME64_CONFIG)
 endef
 
 define UCLIBC_BUILD_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

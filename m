Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8D5E7718F
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 08:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E26600BB;
	Fri, 27 Dec 2024 08:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8JIuYQuSfnX; Fri, 27 Dec 2024 08:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA57607DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA57607DA;
	Fri, 27 Dec 2024 08:13:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C996757
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 08:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E72AA40218
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 08:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ7Fh848cFaW for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 08:13:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 443D740306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 443D740306
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 443D740306
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 08:13:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso1289019866b.1
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 00:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735287230; x=1735892030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2jMExBP4Xr0I+2U44l8Xj37+0eYEYPCfmoD94HQ46o=;
 b=XbACY6Jv9FPU0BNb2/ksTgBmv2HQW9klYTWkkkLO2HXaHOe8XR4nMEAiLgwdbhn6hc
 V++bCl5Rg6jp8WeAGcEk08/l1WyjbN4BTSpAe8LN467dYe6nNXEjXoB/TKdhWVXlok3Q
 VR5qwiJLdSThKodvtVX7SgaQ2Oh+ap6a2JkhbDq3Jsq5BzU/AumN3bvTYwOeqnMexX89
 L3NUZgcpO/yDLuQj5EBXak78f8Vm5dzQnwB8/mfOpspRt94TkpMH3atRrc/0kRNBenV8
 ziZg68T5vRiFWXMpk29i/2KenxvHiN3I1+SSC1j1SSdPcuahZEpZcG4oY3ANsq6lM8Hu
 lAIA==
X-Gm-Message-State: AOJu0YzHI99FTmZjB6uS7BUd8B2/wfrDQb6OCeAbAuEEtLA0qdebj/v1
 DSrtYf9JOT87kiPboUlS8txsHsgpgJ4JCSDky6lLejRcI10JzyngmaGmlQ==
X-Gm-Gg: ASbGnctIHSy+nlISWIVC3J+YjnEblwF11/TMt0bN9krQDl+vwjbcIHqKbghLEa3DRPn
 Eu4x6e1t/le5eA3gFgJluCPAoBEr3PS43mOfMFhuGFpK6ztzS1Lv2JTEZazOFQItidrpRTysMR4
 j9Cus1z/pgQgLVsBN8a6zuW3PjQNdpt48Am9K5qwR8yRHE3TS/2DvPrl8jzRNqrs0QpLxrpc/bG
 QE5l4Jc0tlrTxuoF8E2mZYhZBdrDXiWtzzGhvaxln1iMglwWoNKwwkjPM8f4vgMh36Y6pLmR435
 EVQmtjLAEY+dwhVzgTaYnNDWraGejorsYELVwQ==
X-Google-Smtp-Source: AGHT+IEI//JHy/DEgW8TcCrOJA/+NsV6VnVpqAcQwgQoucKojJPI3uowjK1mddp4NnMWNtnrANNJxw==
X-Received: by 2002:a17:907:724b:b0:aa6:7737:1991 with SMTP id
 a640c23a62f3a-aac2702ae51mr2693315266b.2.1735287229741; 
 Fri, 27 Dec 2024 00:13:49 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e8954bfsm1096626466b.60.2024.12.27.00.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 00:13:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 09:13:42 +0100
Message-Id: <20241227081342.2415503-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1735287230; x=1735892030; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r2jMExBP4Xr0I+2U44l8Xj37+0eYEYPCfmoD94HQ46o=;
 b=QC3T2XiZWGXA9q/xzivUhZVLpMgDgwazaWk6flV0gMXtOntoQZxURTuWoCWsIQ1wz0
 cWykWzea4bOMD8gbV4hjaG8gfack8iFG8hGk/MrYXFOIqHLbiPHgOSf8yfehLsrGPV1M
 mQuMO920Q2jWqM0t7JcmjNioprqQPWv0OQTb+mPznn6F0PstO+J90bdDVh1SI899C9bf
 jT6jCmdvmqHyHkCJItJ2nGd+xmsmZr3rBCaKGx1kTZy55Eh994Vf2asKsJi8v5vAQUQI
 oYno8nCVog+qxTeCbjUrLkLXJwPDbwbyAfJWvZaP6XOFRhxa2xLCFI5LBW8pCkUmxKya
 nLGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QC3T2XiZ
Subject: [Buildroot] [PATCH] package/kmod: bump to version 33
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove an upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...able-implementation-for-basename-API.patch | 134 ------------------
 package/kmod/kmod.hash                        |   2 +-
 package/kmod/kmod.mk                          |   2 +-
 3 files changed, 2 insertions(+), 136 deletions(-)
 delete mode 100644 package/kmod/0002-Use-portable-implementation-for-basename-API.patch

diff --git a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
deleted file mode 100644
index 26f108d66e..0000000000
--- a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Dec 2023 17:35:59 -0800
-Subject: [PATCH] Use portable implementation for basename API
-
-musl has removed the non-prototype declaration of basename from
-string.h [1] which now results in build errors with clang-17+ compiler
-
-Implement GNU basename behavior using strchr which is portable across libcs
-
-Fixes
-../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-71 | "Commands:\n", basename(argv[0]));
-| ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Suggested-by: Rich Felker
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream: https://github.com/kmod-project/kmod/pull/32
-Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
----
- libkmod/libkmod-config.c | 2 +-
- shared/util.c            | 4 ++--
- shared/util.h            | 7 +++++++
- testsuite/testsuite.c    | 2 +-
- tools/depmod.c           | 2 +-
- tools/kmod.c             | 4 ++--
- 6 files changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
-index e83621b3..8aa555a4 100644
---- a/libkmod/libkmod-config.c
-+++ b/libkmod/libkmod-config.c
-@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
- 	bool is_single = false;
-
- 	if (name == NULL) {
--		name = basename(path);
-+		name = gnu_basename(path);
- 		is_single = true;
- 	}
-
-diff --git a/shared/util.c b/shared/util.c
-index e2bab83a..0e16670e 100644
---- a/shared/util.c
-+++ b/shared/util.c
-@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
-
- char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
- {
--	char *modname;
-+	const char *modname;
-
--	modname = basename(path);
-+	modname = gnu_basename(path);
- 	if (modname == NULL || modname[0] == '\0')
- 		return NULL;
-
-diff --git a/shared/util.h b/shared/util.h
-index c4a3916b..073dc5a7 100644
---- a/shared/util.h
-+++ b/shared/util.h
-@@ -5,6 +5,7 @@
- #include <stdbool.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <time.h>
-@@ -76,6 +77,12 @@ do {						\
- 	__p->__v = (val);			\
- } while(0)
-
-+static _always_inline_ const char *gnu_basename(const char *s)
-+{
-+  const char *p = strrchr(s, '/');
-+  return p ? p+1 : s;
-+}
-+
- static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
- {
- 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
-diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
-index 318343ac..aafc9873 100644
---- a/testsuite/testsuite.c
-+++ b/testsuite/testsuite.c
-@@ -70,7 +70,7 @@ static void help(void)
-
- 	printf("Usage:\n"
- 	       "\t%s [options] <test>\n"
--	       "Options:\n", basename(progname));
-+	       "Options:\n", gnu_basename(progname));
-
- 	for (itr = options, itr_short = options_short;
- 				itr->name != NULL; itr++, itr_short++)
-diff --git a/tools/depmod.c b/tools/depmod.c
-index 43fc354a..cfb15b11 100644
---- a/tools/depmod.c
-+++ b/tools/depmod.c
-@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
- 	if (name != NULL)
- 		namelen = strlen(name);
- 	else {
--		name = basename(dir);
-+		name = gnu_basename(dir);
- 		namelen = strlen(name);
- 		dirlen -= namelen + 1;
- 	}
-diff --git a/tools/kmod.c b/tools/kmod.c
-index 55689c07..df91e5c6 100644
---- a/tools/kmod.c
-+++ b/tools/kmod.c
-@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
- 			"Options:\n"
- 			"\t-V, --version     show version\n"
- 			"\t-h, --help        show this help\n\n"
--			"Commands:\n", basename(argv[0]));
-+			"Commands:\n", gnu_basename(argv[0]));
-
- 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
- 		if (kmod_cmds[i]->help != NULL) {
-@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
- 	const char *cmd;
- 	size_t i;
-
--	cmd = basename(argv[0]);
-+	cmd = gnu_basename(argv[0]);
-
- 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
- 		if (streq(kmod_compat_cmds[i]->name, cmd))
diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index f4b01b20a2..46a2d538ad 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  f5a6949043cc72c001b728d8c218609c5a15f3c33d75614b78c79418fcf00d80  kmod-31.tar.xz
+sha256  dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc  kmod-33.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index d83fb85a3e..dfdd17b955 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 31
+KMOD_VERSION = 33
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

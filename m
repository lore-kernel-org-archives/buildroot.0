Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1558CCA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 18:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82D6411E6;
	Fri, 15 Aug 2025 18:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEK7NqF7jQHT; Fri, 15 Aug 2025 18:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B6F411EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B6F411EA;
	Fri, 15 Aug 2025 18:25:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 636E5196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 499E1814EE
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k42Tkr_w6gMO for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 18:25:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29FA98135D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29FA98135D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29FA98135D
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:25:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b04f8b5so11408645e9.1
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 11:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755282323; x=1755887123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmQ3OSxHGWJ8fa9sGgOkBzTmcmDrUd0dWtMTzYdaf9o=;
 b=B8XbocsLWp3inB7PzyiUP/IcAGHGfPfLFjvSArPYZwmnXs8IefSX1r5w3OGgsTTvKp
 +oJiNcR6R0hunjcRST5EK9EhgHYAbRYA46wSrx/vxsmi1n3+8v2Otu+ZztPw29GRIMYg
 c74tGvaGLaGDQImRlwMo1j5WHGu/uEFNkZRvoF6/sHRssJ/1O0TyLST3KSb84I7HHgwz
 ljl2Eg/tUhsYBaC6wLanzt9dRzBPQz9X/L+Fsp+Lp6BG5Hz7Yzo4vMAbznVP/NPPUzK8
 BtKIkWDHZAO6XkTWFMMVoeL+1+gesqsmcllFWfDO6ndc8YzFTln6xnSLFI1JEfS50IYQ
 4x8Q==
X-Gm-Message-State: AOJu0YzKcrs3GlJwpPVa3qH+QJxSn2XQGxunCD5xFkN8TbDQDZ75WSCj
 pjtnT1y7ElPiTb47nMHl1KTAAyRukINIBOJTq2b1cSQwpM5xG+8n2QxDdQucEsC9
X-Gm-Gg: ASbGncszd7nWATYIaGDLyn9K/REkoEdpyzrk2dyHlq+pdrQYe83j0ebz7spy2xNObaC
 gH0bW1COYucKRR53jgJmOK+nM8xfLrmbSGsOBMB72a4AWlKtP/I1nlS9pup7E8fQNddA9hawI4P
 y7caHrjGpjtxfByy1fcf4uRdEx9sXFKK5I/d7q0ZAudzVb/39AYpSube/VQ+xMzq9E+JJADozIu
 3khA58ZmO50GnMspWmoWKgsHdBr6RLtRwNZ3Tdt5XbQ5VrOvZvOHxxutYwTqH/FTJV3nAUpXEz6
 ksWTjA4uniC/vbE93v1qZ2wxv7KT+21Bw8+ko+SKrhC+82/SHP53aS4I8wMTWZZw/kLkMpX+f8L
 bG8v/thX6pCwcMjqGUVGI0bmHxhJSgc2zjiSc9HyB6uIGvg==
X-Google-Smtp-Source: AGHT+IENGFqbb6NnA7BdybX3kty3B3bMLHDNpn/w+IVhMr2T8nm27Jb1omFaNYZrARXKHngkLLISHA==
X-Received: by 2002:a05:600c:4f91:b0:450:d37d:7c with SMTP id
 5b1f17b1804b1-45a2678420fmr1412745e9.21.1755282322430; 
 Fri, 15 Aug 2025 11:25:22 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a66esm66286525e9.0.2025.08.15.11.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 11:25:22 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 15 Aug 2025 20:25:18 +0200
Message-Id: <20250815182518.761210-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755282323; x=1755887123; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LmQ3OSxHGWJ8fa9sGgOkBzTmcmDrUd0dWtMTzYdaf9o=;
 b=L9dggcrvsDm4zDq9xvl1lWUqCtt7CQJXDOaOhRJVYnBWdtSKPz4BCEKnOW7zDPmTLA
 /joT/RusNbrGAuPgxK/yLNTdyp9qQqipuQ7F5TQdO+bRIQ/cprzGJxpI/ixbSU7ylLiJ
 1TV8LXSvcgu0mvrh/UN78qd++5MHu0gwK/7ZfxiclmyXtLEwx46SIFNt1x4+GnLC/FaL
 ovrByyq8aexn6NEAR7wM3zzRanB8sV/Wf0IdlUroljpdK2ec3xZrhNU4QKG5STcOcy5y
 0c1GA+ZY+DVnvJ9UGCs9KbTsO4sHNEmN40f1YEfT5E4nvg1vZLlIrErBxooynppyDrIk
 1iSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L9dggcrv
Subject: [Buildroot] [PATCH] package/apparmor: bump to version 4.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updating also the companion libapparmor library and removing upstreamed
patch.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/apparmor/apparmor.hash                |  4 +-
 package/apparmor/apparmor.mk                  |  4 +-
 ...e-a-portable-version-of-gnu-basename.patch | 44 -------------------
 package/libapparmor/libapparmor.hash          |  4 +-
 package/libapparmor/libapparmor.mk            |  7 +--
 5 files changed, 10 insertions(+), 53 deletions(-)
 delete mode 100644 package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 190045cd65..ef7dd81aaf 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
-sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
+sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 20dbce6f97..febd1d5eb0 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the libapparmor package
-APPARMOR_VERSION_MAJOR = 3.1
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).7
+APPARMOR_VERSION_MAJOR = 4.1
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
 APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.gz
 APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARMOR_VERSION)
 APPARMOR_DL_SUBDIR = apparmor
diff --git a/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch b/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
deleted file mode 100644
index c068279853..0000000000
--- a/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a Mon Sep 17 00:00:00 2001
-From: Jules Maselbas <jmaselbas@zdiv.net>
-Date: Thu, 16 May 2024 12:01:00 +0200
-Subject: [PATCH] libapparamor: Define a portable version of gnu basename
-
-Since musl 1.2.5, basename(3) prototype is only provided in libgen.h
-(as mandated by POSIX) and not in strings.h. Also there is a major
-difference between the gnu basename and the one defined in libgen.h,
-the latter modify the argument string making them incompatible.
-
-Fix this by defining a portable version of basename using strchr.
-
-Upstream: https://gitlab.com/apparmor/apparmor/-/commit/7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- libraries/libapparmor/testsuite/test_multi.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/libraries/libapparmor/testsuite/test_multi.c b/libraries/libapparmor/testsuite/test_multi.c
-index 578629500..7f37966ec 100644
---- a/libraries/libapparmor/testsuite/test_multi.c
-+++ b/libraries/libapparmor/testsuite/test_multi.c
-@@ -1,5 +1,3 @@
--#define _GNU_SOURCE /* for glibc's basename version */
--
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -7,6 +5,12 @@
- 
- #include <aalogparse.h>
- 
-+static const char *basename(const char *path)
-+{
-+	const char *p = strrchr(path, '/');
-+	return p ? p + 1 : path;
-+}
-+
- int print_results(aa_log_record *record);
- 
- int main(int argc, char **argv)
--- 
-GitLab
-
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 68b0468ae3..d0603c0a3a 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
-sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
+sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 91c22ad35b..05be0150a8 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -5,19 +5,20 @@
 ################################################################################
 
 # When updating the version here, please also update the apparmor package
-LIBAPPARMOR_VERSION_MAJOR = 3.1
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).7
+LIBAPPARMOR_VERSION_MAJOR = 4.1
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
 LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
 
-LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
+LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf host-autoconf-archive
 LIBAPPARMOR_SUBDIR = libraries/libapparmor
 LIBAPPARMOR_INSTALL_STAGING = YES
 
 # no configure in tarball
 LIBAPPARMOR_AUTORECONF = YES
+LIBAPPARMOR_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 
 # Most AppArmor tools will want to link to the static lib.
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

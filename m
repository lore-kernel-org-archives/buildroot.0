Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D139CC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 18:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6DF141287;
	Sat, 25 Jan 2025 18:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLMgZHfO3sU7; Sat, 25 Jan 2025 18:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B2114127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B2114127F;
	Sat, 25 Jan 2025 18:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E08BF941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 18:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B91E86072A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 18:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSBMIPyfo-cM for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 18:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.51;
 helo=mail-wm1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71C5860643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C5860643
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71C5860643
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 18:21:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso20102015e9.3
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 10:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737829312; x=1738434112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mFKM+cAeefZxLWY+VVtNmUXSE8ZLhYY4qKa5MSwSW3s=;
 b=CY45LKjKBPmGg2WsBYGhujwSFGGVYwgJL6kiEnoSfkH3qZuX29k5Qfc/5etuh7QSXC
 O800B+kSYjA3RiQFnHW6Rh6Uff4mo05/2YrypeNcm5d+K1zXbBFjXkfnuph/YPZp+csS
 ibapiX36iuLWKNiIShrjkqJHvEcBYmGAay2XDxCM491LfmdQK8dVOjUXgC8929y6Jrpu
 ZDx+NLipgAYf9BlrgVx2wAMsVcRHjkykV+7hZg9Dd7QzM0hUXm8I9sxwDHk5L6h5cGcp
 Z8HfzVCJrMuGibUJQmgdOZakPm6pHFyMpa0CZ37kt0/mLh/hHFQ0JYOMeUxzBdV5YGEf
 P6vQ==
X-Gm-Message-State: AOJu0YxLNcljgBFWmWQOU1SuSJ520B2j9nAnly7kO1V5mybhaFvPB3/V
 7IW3a4wFwEecMzIiz3blRWN7mJflslg5oCNXTDcALUiepVBJxTAUHSc1zw==
X-Gm-Gg: ASbGncuhZLvK5UnXWZ3j6c9ZrScI18FaN9IfGTWtwXI7sBD0TQ5Kd8zEwIPDT2tcJS3
 YnL058fcHAHS6iIdwjKCWWfARvVmP//RqT+dk14gFJwVTtuHC+UOFmBcYWB3YIp39lCLjOGow+n
 /0lUS7Zxt6L3QtU3aRb0qwCMjvZ0q3RWjKmQhxA/V7ha9lI6UCHRRzSIntHP6Hji5+qPW8rGYEO
 xHGAB4YHhxa3+lO/ey3AeiH35p8skdXmR4RM5RFrN/lLaPlWGjPw2GvvYK9E2ldoUW1AkLgQCmf
 VGuMc9UtgqWEgwgtBlA=
X-Google-Smtp-Source: AGHT+IHUm9rzN7oQ7/6lcntGJT3H4Vg3lav+jcnU9EihqwZoeHB48y3r2tuGHzK3O9NUVJq8hErD7A==
X-Received: by 2002:a05:600c:1c21:b0:434:fd01:2e5f with SMTP id
 5b1f17b1804b1-438914391bbmr335711105e9.29.1737829311356; 
 Sat, 25 Jan 2025 10:21:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:d6b3:de43:1b55:ca])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9990sm70998805e9.29.2025.01.25.10.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 10:21:50 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 25 Jan 2025 19:21:48 +0100
Message-ID: <20250125182148.234260-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/fontconfig: bump to 2.16.0
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

Announcements:
 2.16.0: https://lists.freedesktop.org/archives/fontconfig/2025-January/007143.html
 2.15.0: https://lists.freedesktop.org/archives/fontconfig/2023-December/007064.html

Some notes:

- The hash is no longer part of the announcement but
  can instead be found in the release archive.

- Switched to meson while at it.

- Dropped the patch, since it's part of the autotools.

- Dropped some configs args, --with-arch, --disable-static,
  since meson now handles the arch, and disable static as
  it has most probably not been needed anymore for years.
  Was part of commit dd4faf6f6f3fb32657b5d0c4fb72d15a7f571b2e.
  "cairo: add host version"

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...read-as-a-dependency-of-a-static-lib.patch | 43 -------------------
 package/fontconfig/fontconfig.hash            |  4 +-
 package/fontconfig/fontconfig.mk              | 16 +++----
 3 files changed, 7 insertions(+), 56 deletions(-)
 delete mode 100644 package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch

diff --git a/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch b/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch
deleted file mode 100644
index c6aa514534..0000000000
--- a/package/fontconfig/0001-add-pthread-as-a-dependency-of-a-static-lib.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 40ec04a8bf36dd8d0aa3da98b167792ce2dcd114 Mon Sep 17 00:00:00 2001
-From: Silvan Scherrer <silvan.scherrer@aroa.ch>
-Date: Sun, 20 Sep 2020 12:52:08 +0200
-Subject: [PATCH] add pthread as a dependency of a static lib
-
-Downloaded from https://trac.netlabs.org/ports/changeset/2220
-
-Upstream: https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/121
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac     | 2 ++
- fontconfig.pc.in | 4 ++--
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f3189a7..594d6fd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -690,6 +690,8 @@ fi
- have_pthread=false
- if test "$os_win32" = no; then
- 	AX_PTHREAD([have_pthread=true])
-+	AC_SUBST(PTHREAD_CFLAGS)
-+	AC_SUBST(PTHREAD_LIBS)
- fi
- if $have_pthread; then
- 	LIBS="$PTHREAD_LIBS $LIBS"
-diff --git a/fontconfig.pc.in b/fontconfig.pc.in
-index 61b35fb..f823bac 100644
---- a/fontconfig.pc.in
-+++ b/fontconfig.pc.in
-@@ -14,5 +14,5 @@ Version: @VERSION@
- Requires: @PKGCONFIG_REQUIRES@
- Requires.private: @PKGCONFIG_REQUIRES_PRIVATELY@
- Libs: -L${libdir} -lfontconfig
--Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@
--Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@
-+Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@ @PTHREAD_LIBS@
-+Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@ @PTHREAD_CFLAGS@
--- 
-2.27.0
-
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index a4f87caf1e..b9c95d40b2 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/fontconfig/2023-January/006950.html
-sha256  dba695b57bce15023d2ceedef82062c2b925e51f5d4cc4aef736cf13f60a468b  fontconfig-2.14.2.tar.xz
+# From https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.16.0.tar.xz.sha256sum
+sha256  6a33dc555cc9ba8b10caf7695878ef134eeb36d0af366041f639b1da9b6ed220  fontconfig-2.16.0.tar.xz
 
 # Locally calculated
 sha256  51a51aa9823704fd90bccc616cdd17ebabb5b2b3e9cbde886ca02c7002288067  COPYING
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 11758a4c80..b60086c9c8 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.14.2
+FONTCONFIG_VERSION = 2.16.0
 FONTCONFIG_SITE = https://www.freedesktop.org/software/fontconfig/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
-# 0001-add-pthread-as-a-dependency-of-a-static-lib.patch
-FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
@@ -21,12 +19,8 @@ FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
 
 FONTCONFIG_CONF_OPTS = \
-	--with-arch=$(GNU_TARGET_NAME) \
-	--with-cache-dir=/var/cache/fontconfig \
-	--disable-docs
+	-Dcache-dir=/var/cache/fontconfig \
+	-Ddoc=disabled
 
-HOST_FONTCONFIG_CONF_OPTS = \
-	--disable-static
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

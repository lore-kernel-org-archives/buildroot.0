Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB14AC27C47
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 15:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA3341532;
	Sat, 28 Oct 2023 15:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA3341532
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ar7eaKoSY4NB; Sat, 28 Oct 2023 15:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C567840396;
	Sat, 28 Oct 2023 15:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C567840396
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B25901BF362
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C2DD40347
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C2DD40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CNmYJQY27PL for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 15:34:56 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FBFA40324
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 15:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FBFA40324
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40859c464daso24100475e9.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 08:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698507294; x=1699112094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4B20iu2LyyOIuk5Ilc1SqMBM4Bbre8TYNjks68R4uQ=;
 b=es+f6nCb9bVjaWdUlesx6O+03Wpob1bx6WIYE3ivxExLM1Kh+/ycvixdRTvhNedwF7
 6dNsJO7Aaz+Ayv9V336DvAN0teuHNL4XqnWSN8ED2haxXeN5o2YrTqJGz+DWtt6HAdDu
 sbt8D7iL6YGjETJlLaEiTnTwkEfZHtdkSLcHRSg/cfggqrb3Lw6OmPYb7srAyq4VwhtX
 6RQ7E37fDUWs9v4m3NycG9MMyEFeBLeerTeUiN4f8TvOrFmGUpSt6OhbPVKwH/DpkXc/
 v1zCL/FeMySwRYD+wff/1oCa2Ke5FwSXzlcmMLpNf3nt9VPxlcvPFDfH5a4jCzGPCV5U
 Nk7w==
X-Gm-Message-State: AOJu0YzuW6MtHwiyXEmXkisBye1JB9EbHpuS8CjqXEz19drAGDFBhmBR
 vD8PrG8WztkwbB1dWdT2LYuh7s/53Vc=
X-Google-Smtp-Source: AGHT+IE5j65KpW13GY1oFj3z74X5L/qakJhdtnylFA3kEdgJtdBEcV1q/VzydEjloMhzrJpx7fb4kg==
X-Received: by 2002:a05:600c:3148:b0:409:85d:5a6e with SMTP id
 h8-20020a05600c314800b00409085d5a6emr5024128wmo.29.1698507293612; 
 Sat, 28 Oct 2023 08:34:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b00401b242e2e6sm7781514wmq.47.2023.10.28.08.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 08:34:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 17:34:48 +0200
Message-ID: <20231028153448.142511-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028153448.142511-1-fontaine.fabrice@gmail.com>
References: <20231028153448.142511-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698507294; x=1699112094; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4B20iu2LyyOIuk5Ilc1SqMBM4Bbre8TYNjks68R4uQ=;
 b=BEi3rQYEsS21UaSRFNS87JucQYdNRDxuj4j5ENTPEOkghGIZ0/xU15ylSl9ItvzMa1
 zI3gWXkuP/ETFIKfIScXOqnyZBRv4lDP5U+JvvOrfEcaq5tiYhZ+5T7WUlIo6uZuJMY8
 YejNnIIPralACa2QWgvjKDApwuMixDBmx7/RfrWR4UvQEoN5As4wuXz1DSFqfgk5NHvz
 Dlfqt63Hw5IlSEgxNjR3uBV8z9PXHHZ0mXq/DuPteDPvI7zISwhYjN/4AuDojAnMCWIx
 bMz+XJqDChz7MecoCEhAXiPDzdm+oXmx/UwTzYnWIEFUGOPwWUjzmPNZbAIfbg0EyDNm
 xz4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BEi3rQYE
Subject: [Buildroot] [PATCH 2/2] package/zchunk: security bump to version
 1.3.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- tests can be disabled since version 1.2.3 and
  https://github.com/zchunk/zchunk/commit/e2e3d6b14e944530837db43dd73413ce84a1e1f5
- docs can be disabled since version 1.2.3 and
  https://github.com/zchunk/zchunk/commit/af6c10e8be324d1194982c6a8db001f72d50dbf6
- Fix CVE-2023-46228: zchunk before 1.3.2 has multiple integer overflows
  via malformed zchunk files to lib/comp/comp.c, lib/comp/zstd/zstd.c,
  lib/dl/multipart.c, or lib/header.c.

https://github.com/zchunk/zchunk/compare/1.2.2...1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |   2 -
 ...rgp-standalone-wrap-and-find_library.patch | 106 ------------------
 ...002-zck-declare-write_data-as-static.patch |  34 ------
 package/zchunk/zchunk.hash                    |   2 +-
 package/zchunk/zchunk.mk                      |   3 +-
 5 files changed, 3 insertions(+), 144 deletions(-)
 delete mode 100644 package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
 delete mode 100644 package/zchunk/0002-zck-declare-write_data-as-static.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 894810bab1..7f12a9a3b4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1540,8 +1540,6 @@ package/ympd/0002-added-forward-declarations.patch Upstream
 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch Upstream
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch Upstream
 package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch Upstream
-package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch Upstream
-package/zchunk/0002-zck-declare-write_data-as-static.patch Upstream
 package/zic/0001-remove-dependency-check-on-version-file.patch Upstream
 package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch Upstream
 package/zip/0002-configure-Don-t-use-host-CPP.patch Upstream
diff --git a/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
deleted file mode 100644
index 6c9cdba3ad..0000000000
--- a/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 473c97cda44b95f5cea08a0cdd566e602df564db Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 21 Apr 2022 14:24:01 -0600
-Subject: [PATCH] meson: fix argp-standalone wrap and find_library
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-473c97cda44b95f5cea08a0cdd566e602df564db]
----
- .github/workflows/main.yml       | 27 ---------------------------
- meson.build                      |  6 +++---
- subprojects/argp-standalone.wrap |  7 +++++++
- 3 files changed, 10 insertions(+), 30 deletions(-)
- create mode 100644 subprojects/argp-standalone.wrap
-
-diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
-index c49806f..35667af 100644
---- a/.github/workflows/main.yml
-+++ b/.github/workflows/main.yml
-@@ -35,25 +35,11 @@ jobs:
-     steps:
-       - uses: actions/checkout@v2
- 
--      - uses: actions/checkout@v2
--        with:
--          repository: wolfv/argp-standalone
--          path: argp-standalone
--
-       - name: Install mamba
-         uses: mamba-org/provision-with-micromamba@main
-         with:
-           environment-file: .github/environment.yml
- 
--      - name: Compile argp-standalone
--        shell: cmd /C CALL {0}
--        run: |
--          CALL micromamba activate zchunk_test_env
--          cd argp-standalone
--          meson setup builddir
--          meson compile -C builddir --prefix=%CONDA_PREFIX%\Library
--          meson install -C builddir
--
-       - name: Compile zchunk
-         shell: cmd /C CALL {0}
-         run: |
-@@ -75,11 +61,6 @@ jobs:
-     steps:
-       - uses: actions/checkout@v2
- 
--      - uses: actions/checkout@v2
--        with:
--          repository: wolfv/argp-standalone
--          path: argp-standalone
--
-       - uses: actions/setup-python@v1
-         with:
-           python-version: '3.x'
-@@ -87,14 +68,6 @@ jobs:
-       - name: Install meson and ninja
-         run: pip install meson ninja
- 
--      - name: Compile argp-standalone
--        shell: cmd /C CALL {0}
--        run: |
--          cd argp-standalone
--          meson setup builddir
--          meson compile -C builddir
--          meson install -C builddir
--
-       - name: Compile zchunk
-         shell: cmd /C CALL {0}
-         run: |
-diff --git a/meson.build b/meson.build
-index 1c6b32d..aa7dd25 100644
---- a/meson.build
-+++ b/meson.build
-@@ -58,10 +58,10 @@ endif
- 
- # argp-standalone dependency (if required)
- if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
--    if fs.is_dir(join_paths([get_option('prefix'), 'include']))
--        inc += include_directories(join_paths([get_option('prefix'), 'include']))
-+    argplib = cc.find_library('argp', has_headers : ['argp.h'], required: false)
-+    if not argplib.found()
-+        argplib = dependency('argp-standalone')
-     endif
--    argplib = cc.find_library('argp', dirs : join_paths([get_option('prefix'), 'lib']))
- else
-     argplib = dependency('', required : false)
- endif
-diff --git a/subprojects/argp-standalone.wrap b/subprojects/argp-standalone.wrap
-new file mode 100644
-index 0000000..14c0b63
---- /dev/null
-+++ b/subprojects/argp-standalone.wrap
-@@ -0,0 +1,7 @@
-+[wrap-git]
-+directory = argp-standalone-1.4.1
-+url = https://github.com/argp-standalone/argp-standalone.git
-+revision = 21855f34ec9997c37e1a08cd69497336513a5800
-+
-+[provide]
-+dependency_names = argp-standalone
--- 
-2.25.1
-
diff --git a/package/zchunk/0002-zck-declare-write_data-as-static.patch b/package/zchunk/0002-zck-declare-write_data-as-static.patch
deleted file mode 100644
index 3c48ab3d50..0000000000
--- a/package/zchunk/0002-zck-declare-write_data-as-static.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 4 May 2022 16:32:48 -0600
-Subject: [PATCH] zck: declare write_data as static
-
-This needs to be declared static to avoid a symbol conflict:
-io.c:(.text+0xe8): multiple definition of `write_data'; src/zck.p/zck.c.o:zck.c:(.text+0x1f4): first defined here
-
-Fixes:
- - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc]
----
- src/zck.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/zck.c b/src/zck.c
-index 7727479..83b2630 100644
---- a/src/zck.c
-+++ b/src/zck.c
-@@ -159,7 +159,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state) {
- 
- static struct argp argp = {options, parse_opt, args_doc, doc};
- 
--void write_data(zckCtx *zck, char *data, ssize_t in_size) {
-+static void write_data(zckCtx *zck, char *data, ssize_t in_size) {
-     if(zck_write(zck, data, in_size) < 0) {
-         LOG_ERROR("%s", zck_get_error(zck));
-         exit(1);
--- 
-2.25.1
-
diff --git a/package/zchunk/zchunk.hash b/package/zchunk/zchunk.hash
index fa097d4ae0..15103a9ea0 100644
--- a/package/zchunk/zchunk.hash
+++ b/package/zchunk/zchunk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bc36f13b1bcb2ab52d046bfc3ec04a9bd1f89b070b4e8fca52eded235a583526  zchunk-1.2.2.tar.gz
+sha256  4d923d32af7db33f3c0a6655b258e857a2ca564912cf85ddce14e9b1b7d495bf  zchunk-1.3.2.tar.gz
 sha256  3c6a4fd5a93cacec6bf694d0537246bc15a95a274f5c5301749754e56d27b797  LICENSE
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index 2acdaba3a1..39d51ac352 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-ZCHUNK_VERSION = 1.2.2
+ZCHUNK_VERSION = 1.3.2
 ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_CPE_ID_VENDOR = zchunk
 ZCHUNK_INSTALL_STAGING = YES
+ZCHUNK_CONF_OPTS = -Ddocs=false -Dtests=false
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 ZCHUNK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBFEC2D0CB
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 06:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F331B40D99;
	Thu, 15 May 2025 06:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUm3w2X5bsHe; Thu, 15 May 2025 06:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A8A40DB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A8A40DB6;
	Thu, 15 May 2025 06:03:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBAC813D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCBEC607C3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIMHEYtQMUjs for <buildroot@buildroot.org>;
 Thu, 15 May 2025 06:02:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B40D960859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40D960859
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B40D960859
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:02:57 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-54b10594812so540676e87.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 23:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747288975; x=1747893775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJPfrNClXb5z3zmlF1GawIkPN56DTJcZlrZRpdt+YQc=;
 b=QkQnTXlZM7GPLQRWnqrxrVRGkhiqHcDj809XV+8tV2RYksoB3wxPlsEkhkBPD1mCjb
 TQdWDal9Mf1IU++yxEvZzulDY/q3TjhTG9c5gdSNJX2qELCQF1ODRJQ/szBlKQ/COVdo
 dvHRus9viuZj/3UtbWGtJcnBPiNzJv5uhK70sO98gfLNhzi7EIssNnm2dcEvzQ3CgnNW
 Q2d/ITcK9nkp38bW5M6rHfQs3gW7OQgDAu9pWJUmBsAYInWV99vCkuw2KwNUyVdO1DwS
 uHVPEs2dwRbraMkzLlQiZTIo4owbioTr8rHyRquKr3JXk+3QA42n6rPMfdxPbretDOxK
 tXzg==
X-Gm-Message-State: AOJu0YyMp2MNBj3btt80gxDIUV+u5VTChN5k41GhRNBH06Yotfz2clqu
 4JM3z0jAXOVBV8TeY3nmoOrDVSDytIVlJIoS8zLBbdOKH2etqhpCPP1tGA==
X-Gm-Gg: ASbGncuy8ENRPHs3Scab83Fj625o3hYtCrOtq40912DmaA5j39y1CP+TSrfqqKZIzDK
 0dnctttLlB57BV7SXRWZ9W+lUiZxyge8LI6pUy5CFpy364B9J1YRcJQ63K/2U04EmH0gI3fWW3q
 Skziw2uNE3cIGIWPMr4qxnhbR+uZ4Lngvc92fc+xY8/Fimen5tnZIMQTjepfkO/ssvizTvHdxIp
 mekzn0GqExCX8tUyy9OthqxhUtRQ0fjOkOwgJ7IG66upRxhvY0ILBVuFxYZR+PcanASyXiihX16
 AAiVS9WWnVW7odGheL553LjPEcvbYrc4adqtrdlbI9iNxl02r4MPLOd9riV4MlO3duJOrgExsav
 h/3lPIw==
X-Google-Smtp-Source: AGHT+IHmOzkmDdQsdIEW79w6JggNqoH3xnWyqcGPCVfVgFqiJHyiSVJdL1MIOG4nkOECZ0A2dS+7Vw==
X-Received: by 2002:a05:6512:3191:b0:54e:a309:bf3f with SMTP id
 2adb3069b0e04-550d61e1e0cmr2309325e87.57.1747288975156; 
 Wed, 14 May 2025 23:02:55 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bf22csm2482814e87.169.2025.05.14.23.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 23:02:54 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 15 May 2025 08:02:42 +0200
Message-ID: <20250515060244.1890635-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747288975; x=1747893775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aJPfrNClXb5z3zmlF1GawIkPN56DTJcZlrZRpdt+YQc=;
 b=mDcn6/Kze2I2kb3GduKnL8+6ubNxAuk2RZdNAu2bPWdwGgfLoEEH3z66Rb4LINufM/
 m+TjbGb9J0A/7OBrMfKOnGZZlfHWZH9mVMtLsuKaMNwFHqL84vwQY4cZwOrWwQ3VQaF/
 6wn4xGijmv3Sj2z/HzUYEbYruLJ7yAohKnAObd6KgHSAC/bM6mnnpso3504XQ320z8w8
 d+o7hCMMnCYIgxRxt6t9BQskyEa4LuJ6G3PIFHrcS5OjfAsP2owCZYxh04MZTikr7bU2
 5QJfuntotTV2WeVypIdfSXDwZokZe2s9S9+cY6jEmfwXCLrEetteSow3tl29+5TD/FT7
 YHbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mDcn6/Kz
Subject: [Buildroot] [PATCH v2 1/1] package/mariadb: bump version to 10.11.11
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

Fixes:
Build with gcc-15 was fixed upstream in 10.11.11:

https://github.com/MariaDB/server/commit/1d6f857

Remove patch, since the problem was fixed upstream:

https://github.com/MariaDB/server/commit/4375245

After bumping the version to 10.11.11 the configuration step failed for target:

CMake Error: try_run() invoked in cross-compiling mode, please set the following cache variables appropriately:
   HAVE_SYSTEM_LIBFMT_EXITCODE (advanced)

To fx this problem we set HAVE_SYSTEM_LIBFMT_EXITCODE=0.

Fix legal-info after changes to README.md.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v1 -> v2:
  - fix target build by setting HAVE_SYSTEM_LIBFMT_EXITCODE=0
  - fix legal-info after changes to README.md
  - improve commit message
  - link to v1: https://patchwork.ozlabs.org/project/buildroot/patch/20250514220736.1380151-1-roykollensvendsen@gmail.com/

 ...le-failure-fmt-use-incompatible-with.patch | 35 -------------------
 package/mariadb/mariadb.hash                  |  6 ++--
 package/mariadb/mariadb.mk                    |  5 +--
 3 files changed, 6 insertions(+), 40 deletions(-)
 delete mode 100644 package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch

diff --git a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch b/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
deleted file mode 100644
index b6c8807f44..0000000000
--- a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 69935c10b95fc7f7a2e1c3ed02831958e1a9b6a4 Mon Sep 17 00:00:00 2001
-From: Daniel Black <daniel@mariadb.org>
-Date: Wed, 22 May 2024 17:43:17 +1000
-Subject: [PATCH] MDEV-34206 compile failure: fmt use incompatible with
- libfmt-10.2.[2]+
-
-Upstream libfmt commit https://github.com/fmtlib/fmt/commit/d70729215fba1d54862e407b626abf86ddf409bf
-now requires the format function to be const.
-
-Adjust the function prototype so it is const and can compile.a
-
-Signed-off-by: Daniel Black <daniel@mariadb.org>
-[Julien: add SoB line with the original patch author name]
-Upstream: https://github.com/MariaDB/server/commit/4375245d5d9f01cabb6e3fd6c637535e724eae38
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- sql/item_strfunc.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sql/item_strfunc.cc b/sql/item_strfunc.cc
-index 4bbf36ec1cf..2ad8a9b3ce5 100644
---- a/sql/item_strfunc.cc
-+++ b/sql/item_strfunc.cc
-@@ -1392,7 +1392,7 @@ bool Item_func_sformat::fix_length_and_dec(THD *thd)
- namespace fmt {
-   template <> struct formatter<String>: formatter<string_view> {
-     template <typename FormatContext>
--    auto format(String c, FormatContext& ctx) -> decltype(ctx.out()) {
-+    auto format(String c, FormatContext& ctx) const -> decltype(ctx.out()) {
-       string_view name = { c.ptr(), c.length() };
-       return formatter<string_view>::format(name, ctx);
-     };
--- 
-2.46.0
-
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index fd73cca4f3..05340c1faa 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,6 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.11.6
-sha512  3d77f7be4a26d5a36af56150a5f8ed5e21adeed9bc8ea1bd694e47a25a571bd73468eada7c96e0dfe5a6c81bef625abf71a56d228cf43a738e555e3c0d824a6a  mariadb-10.11.6.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.11
+sha512  d9c154207a9f435ce08d5fbfe31814a739e577c656ef9996cf7e60c2cad8b4c07e2de8d94b6191fefa2b5cbde56437b586f85f144d3b4fcec8533449ed8411ac  mariadb-10.11.11.tar.gz
 
 # Hash for license files
-sha256  2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f805ff91a  README.md
+sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
 sha256  240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 1dcf6568da..0d872442f2 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.6
+MARIADB_VERSION = 10.11.11
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
@@ -27,7 +27,8 @@ MARIADB_DEPENDENCIES = \
 
 MARIADB_CONF_OPTS += \
 	-DWITH_LIBFMT=system \
-	-DWITH_PCRE=system
+	-DWITH_PCRE=system \
+	-DHAVE_SYSTEM_LIBFMT_EXITCODE=0
 
 # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
 MARIADB_CONF_OPTS += -DWITH_READLINE=ON
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

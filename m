Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B540AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:24:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FCE61184
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82FCE61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5395C60AE4;
	Mon, 20 Sep 2021 19:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtOUAv9zBheI; Mon, 20 Sep 2021 19:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE6B60AE5;
	Mon, 20 Sep 2021 19:24:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8C411BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5DF880F32
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfHE4fmDkzSb for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:24:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9723C80F2D
 for <buildroot@busybox.net>; Mon, 20 Sep 2021 19:24:38 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q26so32693468wrc.7
 for <buildroot@busybox.net>; Mon, 20 Sep 2021 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qovlxdwoBag91LPh50YI5GgKq1DsbZ5nfqT240x89Vk=;
 b=cq2Dx3ueb5m9PPiRyeJjvfp+B9Dq076AWERjdcgOuP1Y0d87VYhcGN4dpdVybxVPey
 h1sBiYiYe80iJIbWI9F57Uu5qsVqJmsfa7cQ2+889gCjsOahftwAigHaTpXUultioP4D
 V7KhYF9802pn+jtBXLs7F9FZXNCowdj0/JYC+tjq7OTyIE1leoh0kElkoi/0w/3U6SVO
 1c2bzYu0n1T2OnaczJhhqMFt5bQPGvLOBGhmO0dbcv1bqB+Nd80WIY+UZfQVNFa1bHnE
 i46wIoAdlZha6WQbZsotRTVq83eLJ6zAE8uJlseUDaSXa0yn5lBbhNHWV+U9eCKJ8t/e
 aqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qovlxdwoBag91LPh50YI5GgKq1DsbZ5nfqT240x89Vk=;
 b=HHodpM7xZjKr9JvTfIekNrItDE9WsvXyd4OUXk5haaGgRNmYiPBBzeMqczaOxEzTWz
 bDjacdR6sovrHJWtAxeWt/NrT6faeU3e42/vFIGPCaldnLx6XnvnSwZWuEsMAUE/3KGa
 OE8QwPdDd6iR8kPLO0wcKIcLhQqvbmRevFkgLh1lDfXbMJtz/cQxMDkFGGnFtnwHvwe7
 6UR7nA5AZmWH7TVl226eNXWqXgnhtsCGxB9I5NLt3esaMjaqyJMZ/KKPrg4DFyncFUXI
 PcRNcETDQP4CzzzIPwsM7gCNliyEATHanCsLXYVL2b7BQGPRGf8clYi/omGHPztS3208
 GHjg==
X-Gm-Message-State: AOAM531H0ICvEiAyqA8dlpBatWk+/fYvL/hw2fwUHNI0+0T6dsSNHcQ6
 vGUwsO0bvCq9p/A5xLdAP2Td15uK15Y=
X-Google-Smtp-Source: ABdhPJz1g52bhQorOfUUcQiAomsjdRJLduN6k4q9N84D266im0AqjoOyU6Yp+vO0VIx86X6v+yPFYg==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr662511wmh.133.1632165876888; 
 Mon, 20 Sep 2021 12:24:36 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id b6sm15555261wrh.4.2021.09.20.12.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:24:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 20 Sep 2021 21:24:27 +0200
Message-Id: <20210920192428.2784913-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gdbm: bump to version 1.21
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

remove useless patch (tested with gcc 10.3.1)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gdbm/0001-fix-build-with-gcc-10.patch | 96 -------------------
 package/gdbm/Config.in                        |  2 +-
 package/gdbm/gdbm.hash                        | 10 +-
 package/gdbm/gdbm.mk                          |  2 +-
 4 files changed, 7 insertions(+), 103 deletions(-)
 delete mode 100644 package/gdbm/0001-fix-build-with-gcc-10.patch

diff --git a/package/gdbm/0001-fix-build-with-gcc-10.patch b/package/gdbm/0001-fix-build-with-gcc-10.patch
deleted file mode 100644
index cd1417c81..000000000
--- a/package/gdbm/0001-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 9fecb6ce056f25837dffac95260d5a80b9f468c0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 19 Aug 2020 10:37:07 +0200
-Subject: [PATCH] fix build with gcc 10
-
-Move initialisation of global variables to main functions to fix the
-following build failure with gcc 10:
-
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x2c): multiple definition of `parseopt_program_args'; gdbm_dump.o:(.data.rel.local+0x28): first defined here
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x30): multiple definition of `parseopt_program_doc'; gdbm_dump.o:(.data.rel.local+0x2c): first defined here
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x2c): multiple definition of `parseopt_program_args'; gdbm_load.o:(.data.rel.local+0xa0): first defined here
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./libgdbmapp.a(parseopt.o):(.bss+0x30): multiple definition of `parseopt_program_doc'; gdbm_load.o:(.data.rel.local+0xa4): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/d09b5368bb624df629296359a5abcdd37ba61e9e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to Sergey Poznyakoff <gray@gnu.org>]
----
- src/gdbm_dump.c | 5 +++--
- src/gdbm_load.c | 5 +++--
- src/gdbmtool.c  | 5 +++--
- 3 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/src/gdbm_dump.c b/src/gdbm_dump.c
-index 82fb5af..67574ac 100644
---- a/src/gdbm_dump.c
-+++ b/src/gdbm_dump.c
-@@ -19,8 +19,6 @@
- # include "gdbmapp.h"
- # include "gdbmdefs.h"
- 
--char *parseopt_program_doc = "dump a GDBM database to a file";
--char *parseopt_program_args = "DB_FILE [FILE]";
- struct gdbm_option optab[] = {
-   { 'H', "format", "binary|ascii|0|1", N_("select dump format") },
-   { 0 }
-@@ -36,6 +34,9 @@ main (int argc, char **argv)
-   char *dbname, *filename;
-   FILE *fp;
- 
-+  parseopt_program_doc = "dump a GDBM database to a file";
-+  parseopt_program_args = "DB_FILE [FILE]";
-+
- #ifdef HAVE_SETLOCALE
-   setlocale (LC_ALL, "");
- #endif
-diff --git a/src/gdbm_load.c b/src/gdbm_load.c
-index 2d96ada..1b2739c 100644
---- a/src/gdbm_load.c
-+++ b/src/gdbm_load.c
-@@ -29,8 +29,6 @@ int mode;
- uid_t owner_uid;
- gid_t owner_gid;
- 
--char *parseopt_program_doc = "load a GDBM database from a file";
--char *parseopt_program_args = "FILE [DB_FILE]";
- struct gdbm_option optab[] = {
-   { 'r', "replace", NULL, N_("replace records in the existing database") },
-   { 'm', "mode", N_("MODE"), N_("set file mode") },
-@@ -100,6 +98,9 @@ main (int argc, char **argv)
-   int cache_size = 0;
-   int block_size = 0;
-   
-+  parseopt_program_doc = "load a GDBM database from a file";
-+  parseopt_program_args = "FILE [DB_FILE]";
-+
- #ifdef HAVE_SETLOCALE
-   setlocale (LC_ALL, "");
- #endif
-diff --git a/src/gdbmtool.c b/src/gdbmtool.c
-index bbadbae..69bc3b1 100644
---- a/src/gdbmtool.c
-+++ b/src/gdbmtool.c
-@@ -1535,8 +1535,6 @@ command_lookup (const char *str, struct locus *loc, struct command **pcmd)
-   return found->tok;
- }
- 
--char *parseopt_program_doc = N_("examine and/or modify a GDBM database");
--char *parseopt_program_args = N_("DBFILE [COMMAND [ARG ...]]");
- 
- enum {
-   OPT_LEX_TRACE = 256,
-@@ -2053,6 +2051,9 @@ main (int argc, char *argv[])
-   char *source = NULL;
-   instream_t input = NULL;
-   
-+  parseopt_program_doc = N_("examine and/or modify a GDBM database");
-+  parseopt_program_args = N_("DBFILE [COMMAND [ARG ...]]");
-+
-   set_progname (argv[0]);
- #if GDBM_DEBUG_ENABLE
-   gdbm_debug_printer = debug_printer;
--- 
-2.27.0
-
diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index 3646bd058..6c668722d 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_GDBM
 	  GNU dbm is a set of database routines that use extensible
 	  hashing. It works similar to the standard UNIX dbm routines.
 
-	  http://www.gnu.org/software/gdbm/gdbm.html
+	  https://www.gnu.org/software/gdbm/gdbm.html
diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index 8de9f6368..f68a16e2f 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2018-10/msg00006.html
-md5 988dc82182121c7570e0cb8b4fcd5415  gdbm-1.18.1.tar.gz
-sha1 4a923ebfac06bb05c1c7699b206719e06a938f0d  gdbm-1.18.1.tar.gz
+# From https://www.gnu.org.ua/software/gdbm/download.html
+md5  a285c6e2dfed78668664c0555a7d202b  gdbm-1.21.tar.gz
+sha1  f6eec6113f04a4b5fd2c1cfead10e7d65c8f3d89  gdbm-1.21.tar.gz
 # Locally computed
-sha256 86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f745b91dc  gdbm-1.18.1.tar.gz
-sha256 690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
+sha256  b0b7dbdefd798de7ddccdd8edf6693a30494f7789777838042991ef107339cc2  gdbm-1.21.tar.gz
+sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 084a7769f..3c52d1254 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.18.1
+GDBM_VERSION = 1.21
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

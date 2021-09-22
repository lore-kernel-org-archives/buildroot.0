Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E216C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:41:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A0EC61211
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A0EC61211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA366407A2;
	Wed, 22 Sep 2021 09:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNIQDLXF1W5X; Wed, 22 Sep 2021 09:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1359C4078C;
	Wed, 22 Sep 2021 09:41:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D36A1BF35C
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CCED4078C
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPKTyAEZvA5w for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 09:41:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86C1240784
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 09:41:23 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c1so2193820pfp.10
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 02:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZOft44cVV7NTqy8UryreGJ17TY/cd46EW+vMRlvxGA=;
 b=Rv4lxOVjDEd6CpD9wgBjdmKa4S+IeoN4SpeWCuEx3y9pLAGL5JY4mqxO5QfBHRtE/e
 HSMFpYowvu6VNVH7do0/pfORaQ/GppdAYW7kan0hoZjmhoP6kRcDQnSo05fwQD7VaREu
 J2/lfIMaIxnsvdVwW/8A9iKIFhb93RiwOWnE0wHJY8CT5cyQdU1fkRaMqDANcNbNJpKC
 IXXwouC+JiNRSzcS++bHSPuNLqgKPLUrCxbhNG1wH+iirfJw+SNfSx2zBbG9r/4mL883
 xn8zbkFEVnyA9z4Wlbu+MKN4cJ3F3JjYfuzdbJ6FSan1DTglGXMKXIvtaeLzfXU5nFV0
 D9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZOft44cVV7NTqy8UryreGJ17TY/cd46EW+vMRlvxGA=;
 b=p417/Ig2fCbpi/Mi9bpmsbh/FwFpTKhA/CVItXJxu0bga69CB3BzdPnnLshFFqF9e5
 D9my6QC4Z39I2ZcCXw37ngFRir8ZbxJmoQ5+WpUiSld8TmmTaj+jmiPyVEDoZLz3PzgX
 KHnJF5sfmmo4+HErK2UD7Eer3aPXZzzG/n/mDnvuf3P4w24IMqrD7a3Bwfk2UytjjH2t
 BpgDwm9oitmzyEV9RTOu2fygiWFw4o+3Z/lKVJnAxa8KZiNTxpyJxdGvEgKoaZEwVClh
 +d6Y3x4dZQQpdcj2CWvmqtSL5P9dyd2pWCFzipdYoejb5bFhfz58LTkG3eLWqrv9VIMr
 uGZQ==
X-Gm-Message-State: AOAM531fQnRoUt876MLAhfkju9S0j7pPRdsw7UdgO9EGIOeWcPSnbwST
 OmiJLTiiSpreCc/lPf6HclV8MD4bAlYzmw==
X-Google-Smtp-Source: ABdhPJx2voKC0S51LFqJ7lhas7nfOILveFnsM3FVT2LV3m8IvWLyJfthXY2NFVUd2FCGLI6N9wbrlA==
X-Received: by 2002:a62:7ccf:0:b0:444:9264:dbcd with SMTP id
 x198-20020a627ccf000000b004449264dbcdmr27994740pfc.50.1632303682633; 
 Wed, 22 Sep 2021 02:41:22 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:45c1:823f:9f7c:20d])
 by smtp.gmail.com with ESMTPSA id i7sm2133080pgp.39.2021.09.22.02.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:41:22 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:41:13 +1200
Message-Id: <20210922094113.1166868-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/syslog-ng: Bump version to 3.34.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update to syslog-ng-3.34.1. Drop patch that has been applied upstream.
Update version in config file.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 ...ules-diskq-dqtool.c-fix-static-build.patch | 33 -------------------
 package/syslog-ng/syslog-ng.conf              |  2 +-
 package/syslog-ng/syslog-ng.hash              |  2 +-
 package/syslog-ng/syslog-ng.mk                |  2 +-
 4 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch

diff --git a/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
deleted file mode 100644
index 3332b12e9e..0000000000
--- a/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 04c8fe720d09bd6e53c4bcea9ad72ff131925ce6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 23 Jul 2021 18:41:29 +0200
-Subject: [PATCH] modules/diskq/dqtool.c: fix static build
-
-Fix the following static build failure:
-
-/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x2c): multiple definition of `verbose_flag'; modules/diskq/dqtool.o:(.sbss+0x4): first defined here
-/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x30): multiple definition of `debug_flag'; modules/diskq/dqtool.o:(.sbss+0x8): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/syslog-ng/syslog-ng/commit/04c8fe720d09bd6e53c4bcea9ad72ff131925ce6]
----
- modules/diskq/dqtool.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/modules/diskq/dqtool.c b/modules/diskq/dqtool.c
-index 6105f2ec68..50be452453 100644
---- a/modules/diskq/dqtool.c
-+++ b/modules/diskq/dqtool.c
-@@ -49,8 +49,6 @@ gchar *persist_file_path;
- gchar *assign_persist_name;
- gboolean relocate_all;
- gboolean display_version;
--gboolean debug_flag;
--gboolean verbose_flag;
- gboolean assign_help;
- 
- static GOptionEntry cat_options[] =
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 4d1526b812..55d01501cb 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.33
+@version: 3.34
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index df8002341c..99ed363eca 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0b786a06077b9150191d714f45a1b4b3792952cb58163a3af336f074da9fb14b  syslog-ng-3.33.2.tar.gz
+sha256  cece39ec1c68c88d493705e0a528b83d038da384e89d4838393ccc75f62a2d4c  syslog-ng-3.34.1.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 765e886b12..f37e7c2ea5 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.33.2
+SYSLOG_NG_VERSION = 3.34.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

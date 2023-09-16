Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09966CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C57A82C61;
	Sat, 16 Sep 2023 12:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C57A82C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UnjK6iTBWZTr; Sat, 16 Sep 2023 12:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E637F82BC3;
	Sat, 16 Sep 2023 12:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E637F82BC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB3701BF578
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0A1740AFF
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0A1740AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5rRRfMGmm3d for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:51:39 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 625764013C
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 625764013C
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-401187f8071so19923175e9.0
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 05:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694868697; x=1695473497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e2gzHR5w+pbto5fgHhvj2tKwFVHP2QE4w2CjNQoSNF4=;
 b=ncNOghSykDDeTQv825ClexeY26Sa68zgL4y0W0qjoAQHFA3IKNbroGieBaiB4Lu5Ju
 adt74lOSz8QcjIhg2oWt5rD2vQ1Ivir1/V1lFFI9Y7OFqV8DVEsgAjvXSq3ei7XNNGXu
 ANLTM8oFaluygNvruVMWKWJet8zys+uCUN3tBXCu+p+hCLR+pnmMaqcrg4Q2P9s9qSbE
 mVGs4pzdk3Nl8zaKN9quJyekcTEBlki7VImvmEgxASnLncCgu4AOHrO4nspoNn30GDCe
 ew4HqB/WTAHdMzlQpYESAAOJYSScasND2V89xgaLkmxXvgGSXiZldfIHmgHq2E4hwT/i
 PjdQ==
X-Gm-Message-State: AOJu0YxJvkcqjloLO/NncEX/13IPbiHBsaGUEAeH3P6A5R2OLv3DeRES
 gZB/lWGvSFcpiEKs1JRY+WedTeOA5eE=
X-Google-Smtp-Source: AGHT+IFeW0Bol+zl+6vs5xeEEpmLcdLDWYxpKrvXek7rteNV2/jUXCz4fLYe2gghOonSj7pCDtCDNA==
X-Received: by 2002:a05:600c:b4b:b0:401:c7ec:b930 with SMTP id
 k11-20020a05600c0b4b00b00401c7ecb930mr5271766wmr.10.1694868696870; 
 Sat, 16 Sep 2023 05:51:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j5-20020a5d6045000000b0032008f99216sm362819wrt.96.2023.09.16.05.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 05:51:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 14:51:32 +0200
Message-Id: <20230916125132.1509289-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694868697; x=1695473497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e2gzHR5w+pbto5fgHhvj2tKwFVHP2QE4w2CjNQoSNF4=;
 b=a/Z1dR13TKPPhYEMnmf5Aj2qGU3XgOS6iBc9osSMcHqsqeypUSMlGQ3lU6h8fxPxDg
 z/55kEJ5FYMg7Lm3dSm3RV+ROX7wS8nczTltEyQAi1P+DKMFSYBH9IqU/H3FrDClsBlC
 g/vwUp9YvxapSDo2F1mRzdgPZOiyuv54RNcHWRQtDLGOcyZ9HfytYiSWBCUINckxh5af
 WaqqAF/iUUCSb4riyGEMHJ7hhbGMOtVlMcaqQA+ESRrgcTi7Td3DlZuX7zscwubgebK4
 vPe4/CvrK1vviH9YVEpFwI6QUF0LsrxUvMqbzYQajANjDVMaXW6pDikhdvQ/cm6F3KEB
 zNvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a/Z1dR13
Subject: [Buildroot] [PATCH 1/1] package/conmon: fix libseccomp shared build
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
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch and disable libseccomp when building statically to avoid the
following build failure raised since commit
29834d8a12d984e8efe05398c5aaa6a61f7880e0:

src/seccomp_notify.c: In function 'seccomp_notify_plugins_load':
src/seccomp_notify.c:136:42: warning: implicit declaration of function 'dlopen'; did you mean 'popen'? [-Wimplicit-function-declaration]
  136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
      |                                          ^~~~~~
      |                                          popen
src/seccomp_notify.c:136:53: error: 'RTLD_NOW' undeclared (first use in this function)
  136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
      |                                                     ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/13d3b46990720bba8621c922b5dce54ab650e96d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-remove-unused-dlfcn.h-header-file.patch | 26 -------------------
 package/conmon/conmon.mk                      |  2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 package/conmon/0001-remove-unused-dlfcn.h-header-file.patch

diff --git a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch b/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
deleted file mode 100644
index 14f817942e..0000000000
--- a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e28634a0e847a14c58482f962bc9b1d69937387f Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 12 Aug 2023 12:53:37 +0200
-Subject: [PATCH] remove unused dlfcn.h header file
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/containers/conmon/issues/443
----
- src/seccomp_notify.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
-index 8d34d9d..2a8371d 100644
---- a/src/seccomp_notify.c
-+++ b/src/seccomp_notify.c
-@@ -7,7 +7,6 @@
- 
- #include <errno.h>
- #include <sys/ioctl.h>
--#include <dlfcn.h>
- #include <sys/wait.h>
- #include <sys/mount.h>
- #include <signal.h>
--- 
-2.39.2
-
diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 29deb2af47..50807f8c6a 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -11,7 +11,7 @@ CONMON_LICENSE_FILES = LICENSE
 
 CONMON_DEPENDENCIES = host-pkgconf libglib2
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+ifeq ($(BR2_PACKAGE_LIBSECCOMP):$(BR2_STATIC_LIBS),y:)
 CONMON_DISABLE_SECCOMP = 0
 CONMON_DEPENDENCIES += libseccomp
 else
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

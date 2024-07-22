Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F9BC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE5CF404D7;
	Mon, 22 Jul 2024 12:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NL07O-mtKXb1; Mon, 22 Jul 2024 12:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD82401AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FD82401AE;
	Mon, 22 Jul 2024 12:30:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076E01BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E51605AC
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NQXKREe1U6g for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D316C605A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D316C605A5
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D316C605A5
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:29:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so29770375e9.1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 05:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721651395; x=1722256195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aFctz2o8zB5RjXgI09tEoDi7VBrxCMlZag+9MfPy5vc=;
 b=Y+1Svz0wG1Srzb4kTy955jaf3mCLWDnZWMtv5TXaWHri/74O471hGmy/njSbgxp4X4
 ACcf4kOPJUeQEPFpwqgPz73FyqMbibafHCNwrp3EXhTm/6zrQ6GjeIrOa6UUpbz5CBYG
 Ozwdlk3jU9tf18LhR71Wpm/MMSiprqiEG0406I7J2tnLe0PAxuQdFStuty2W7gmF9LLV
 TlyQhoVFC3UKZCCf99Q4UqWA5NfGJ0IlDGHDg9CNGb/iQj4SpVYwseuzf0lnDUbwezMj
 fX/4C9KuKue2NphbxvBC+WytJ9W65FmrbW2q4bWaqiVxcaHXcg24OZMJL017V2SG8trz
 4DYQ==
X-Gm-Message-State: AOJu0YzpbflPMvARjR4bOw0hrM/mqmHG179KjZguRKJxQv1NV2cOgUgP
 mvsIbiLY1KqtX3kxGqvWAQpJ+PpwsLK67ZYSbfF4voqOXVcuSfcqvOUKyA==
X-Google-Smtp-Source: AGHT+IHou1fJ3SdQ/bUHx2vbCEV6rAr3u11fd8EJlaI2YCgWe65JfwW86oV/6O/OBK+JtBNlgNKozg==
X-Received: by 2002:a05:600c:35d4:b0:426:593c:9361 with SMTP id
 5b1f17b1804b1-427dc569cb0mr45988635e9.26.1721651395178; 
 Mon, 22 Jul 2024 05:29:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d692977asm126948185e9.31.2024.07.22.05.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 05:29:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:29:41 +0200
Message-ID: <20240722122941.63050-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721651395; x=1722256195; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aFctz2o8zB5RjXgI09tEoDi7VBrxCMlZag+9MfPy5vc=;
 b=WrPtlLgnDdUE8Utt+Xnk8rd8Ccm40Qh3t/64cXRuYPuUIQyBgDZpenL0wXHYub/O1I
 xkVqGbvndIiK9f2Hw/fBw3s3JzO9lqEMsrmoTJraD+ve2r9/Wjo5E1s9P3PLwt5VNQlI
 wwODhp3rlYyOSyzNvAfJoOCQqb3RBOsh1hmCo1f5BR8v6jzVYGe/9HnmvM4TnM6cda4d
 qKsqykRIJNcHMvqJt71NFlhPZZvtdex05Ajc6iTUQpC8knUHT9oTwqIufMxe/MTcKHEH
 N+TRaN1chJPixxnFQHbH4ZZajN/KK710KSPo3BlgNaqNFwrjBpyUlOLyiqFZQHRMzq3v
 X5+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WrPtlLgn
Subject: [Buildroot] [PATCH 1/1] package/bandwidthd: fix build with gcc >= 14
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
Cc: Nathaniel Roach <nroach44@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 14:

parser.c: In function 'yyparse':
parser.c:1196:16: error: implicit declaration of function 'yylex' [-Wimplicit-function-declaration]
 1196 |       yychar = yylex ();
      |                ^~~~~

While at it, update Upstream tag of first patch

Fixes:
 - http://autobuild.buildroot.org/results/33364071de4e5e51a2ac2337b82d145f71e0e64a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...c-bandwidthd.h-fix-build-with-gcc-10.patch |  2 +-
 ...2-src-parser.y-fix-build-with-gcc-14.patch | 36 +++++++++++++++++++
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 66d427ae68..757c9a3c0d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -342,7 +342,6 @@ package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
 package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch lib_patch.Upstream
-package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/bash/0001-input.h-add-missing-include-on-stdio.h.patch lib_patch.Upstream
 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch lib_patch.Upstream
 package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch lib_patch.Upstream
diff --git a/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch b/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
index e7d0dec8d6..727e18ea84 100644
--- a/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
+++ b/package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch
@@ -15,7 +15,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/6308c8ee38b6017215038d47c009b238113bd36f
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nroach44/bandwidthd/pull/1]
+Upstream: https://github.com/nroach44/bandwidthd/commit/dde68ed77114d7b19bfed3068edefc9dc0644445
 ---
  src/bandwidthd.h | 4 ++--
  src/graph.c      | 1 +
diff --git a/package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch b/package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..d31070855c
--- /dev/null
+++ b/package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch
@@ -0,0 +1,36 @@
+From 96f5ad56b1bb872c2c24f0c83d06d94ae2936838 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 22 Jul 2024 14:08:45 +0200
+Subject: [PATCH] src/parser.y: fix build with gcc >= 14
+
+Fix the following build failure with gcc >= 14:
+
+parser.c: In function 'yyparse':
+parser.c:1196:16: error: implicit declaration of function 'yylex' [-Wimplicit-function-declaration]
+ 1196 |       yychar = yylex ();
+      |                ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/33364071de4e5e51a2ac2337b82d145f71e0e64a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/nroach44/bandwidthd/pull/3
+---
+ src/parser.y | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/parser.y b/src/parser.y
+index d9acc10..15ce61c 100644
+--- a/src/parser.y
++++ b/src/parser.y
+@@ -11,6 +11,7 @@
+ #include <arpa/inet.h>
+ #include "bandwidthd.h"
+ 
++extern int yylex (void);
+ extern unsigned int SubnetCount;
+ extern struct SubnetData SubnetTable[];
+ extern struct config config;
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

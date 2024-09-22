Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CB3CF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 02:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF0E440531;
	Sun, 22 Sep 2024 02:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgvGA5NuXp3S; Sun, 22 Sep 2024 02:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 628974032A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 628974032A;
	Sun, 22 Sep 2024 02:40:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42CDD1BF419
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31AFC81365
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEjb_3sv-kFv for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 02:40:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 388D981302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 388D981302
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 388D981302
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:40:36 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2068a7c9286so33665845ad.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726972835; x=1727577635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bY2ua/EGpX3prEdyN/yoAAZxVVkW36q0hPmJtnyDBnY=;
 b=LxZ1RnZ/iCwJxrhf4H6O9xKFsRgQKl7DI53YQ0xo0az3zhHX8yMylI+WRdHfEgqEtQ
 zc4tvt5VCMP99OrLSCoP1NQjmUQM2KfYkKW7jvRvmXXfynSXZga7DHaU3P27MQTpEXSk
 phb+jlMvtUIG9g/M7hhIAFLY86k/4i59HYKZ0IsPkCEh11r7yqXI/jVj/UnR7q3/OxIE
 JOkdKnXXN7rgU634CEBfRjj3DnVzIVuDAoB0RjvkTFvdlG1W578TfhEoKgeX1RjuI6c1
 vvE4nsguN4JpUO6ameyDUbTGWNg4AlZoBh//MWvkx+JI8CPvVLaLpBa9rqcM0OcIv5xD
 CUTQ==
X-Gm-Message-State: AOJu0YyyY4hpwYpDMnyrPu/oNknLRBTc48azHdDOjP2c/k3gKj2R4iyu
 buPa866bghKRd0X7o03N6BqF0lblhrJgRG6b+peLvfKk9vtScpccqQ9PpcmnVuk=
X-Google-Smtp-Source: AGHT+IFOA6U0CUa3XjhNkpUBirE9q5LGG2XBaah0mBAENyfgINd/D/EWMe8LgQ/tMExAd10GEgiVfw==
X-Received: by 2002:a17:903:1c9:b0:206:99a8:525f with SMTP id
 d9443c01a7336-208d8338b2dmr144161555ad.4.1726972835081; 
 Sat, 21 Sep 2024 19:40:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2600:8802:2a05:9000:19d8:5269:4572:b863])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2079460254dsm114225655ad.114.2024.09.21.19.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 19:40:34 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 19:40:31 -0700
Message-Id: <20240922024031.2620153-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726972835; x=1727577635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bY2ua/EGpX3prEdyN/yoAAZxVVkW36q0hPmJtnyDBnY=;
 b=GTvNh12T1ODkN2jdd7DWkz+X9Vf+uw5l8ODqwI1F6LEeEtp3Ep3d6VmZKmaZ2Foalb
 PQenvhU/8+HbK0qguDSvN3rzlNKv+weoOja+gn/uBmNPKEVKosRoTCrGUnMfxrsSKlZI
 UhlNLTGTGwkHnDdm6Ii3JwPfoWkDleQGYDB7DEPBvJ4hbRC0aNDWQ1n0pFxPUINxuDMx
 wdBI0Cz+RNR3GX4VqOWSiE30SilOd+Fo4zAkd+ZdO6pIR+xTx/8U21T+69Nh7npqKV36
 SUH7+JRgtm0TO2eCG9h7SXS1kUhth5TozeLIXJoyJwvgGV+Actpl+wgZwVhU3DLaSrVX
 N3xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GTvNh12T
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.16
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://github.com/pikvm/ustreamer/compare/v6.11...v6.16

Drop upstream patch 0001-src-libs-types.h-include-sys-types.h.patch.
(https://github.com/pikvm/ustreamer/pull/273/commits/0ce1d6e1f61dfbebae35a9c3a8a77c69ee43a8b0)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 ...src-libs-types.h-include-sys-types.h.patch | 36 -------------------
 package/ustreamer/ustreamer.hash              |  2 +-
 package/ustreamer/ustreamer.mk                |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch

diff --git a/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch b/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
deleted file mode 100644
index 82fe596963..0000000000
--- a/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6c24c9ea610e7cc0e47d1e7124697098d5ef365e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 May 2024 19:56:49 +0200
-Subject: [PATCH] src/libs/types.h: include sys/types.h (#273)
-
-Include sys/types.h to avoid the following uclibc build failure since
-version 5.52 and
-https://github.com/pikvm/ustreamer/commit/2d6716aa4762151f0fb1b900d3cd3295d328cab6:
-
-In file included from libs/base64.h:25,
-                 from libs/base64.c:23:
-libs/types.h:30:9: error: unknown type name 'ssize_t'
-   30 | typedef ssize_t sz;
-      |         ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/pikvm/ustreamer/commit/6c24c9ea610e7cc0e47d1e7124697098d5ef365e
----
- src/libs/types.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libs/types.h b/src/libs/types.h
-index 54e42325..b35bbaea 100644
---- a/src/libs/types.h
-+++ b/src/libs/types.h
-@@ -24,6 +24,7 @@
- #include <stdio.h>
- #include <stdbool.h>
- #include <stdint.h>
-+#include <sys/types.h>
- 
- 
- typedef long long sll;
diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 7c70f0195f..7a03b21b86 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80ab01eeaa81c7d8e9c7f62304287d176fd729cb12ca5adb2e181b5a3da79216  ustreamer-6.11.tar.gz
+sha256  88ac5e99c56729fecba2cf7f63b690a126dcaef420e2cce9c25c66c55c097f64  ustreamer-6.16.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 5b73e387d6..2944827083 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.11
+USTREAMER_VERSION = 6.16
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

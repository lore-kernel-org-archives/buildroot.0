Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52542C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED26C84CE6;
	Wed,  1 Nov 2023 17:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED26C84CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4wfRK5SR04a; Wed,  1 Nov 2023 17:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFBF184CE8;
	Wed,  1 Nov 2023 17:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFBF184CE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDD961BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5459431FD
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5459431FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_djFiKRxtj1 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:45:27 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75AA24329D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75AA24329D
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4084095722aso427795e9.1
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 10:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698860725; x=1699465525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZWQWyizJMs6+qbpMYLKa093Rn8Ng5lo5903ZjOJ9od4=;
 b=xVfiI3af8EfnsVLypWO3l8tb4zRmBISo2xIcM0WO8KhQfYkcFeiDG8UuayjceHNZAM
 GjQo9np3pDMu1jY9nkhO6wUmGvzsU45y1ptQS1FIA4Ry3TZah2YkhtFpphFxYTvlPE5c
 ZSv9tWMvuw9nvz267rPt3NibJGF5cjhPtNku8lrwzIs+E5jh43LyKawYGNd6tIeVmumT
 SyVdgE6nG0RIWYJ6HCJ+znjgi1SYl0qvE8+eTPPq0/PEE+gsnqcrwJqTZdTpS8vzsYnr
 zBOgCajvbR9ACNhQspBmqMfnE4DibT1i1QCA/tgBTZzVoiomB73dtevKhfGC/Unsyvt1
 57oQ==
X-Gm-Message-State: AOJu0YzfPvvDjFhrkxWzh7ZYyKnVV5lQeugEMdn12001tQQlYtwbW4NK
 JVFNTD4fYombm4EgKLOAgrzBnZtI4vE=
X-Google-Smtp-Source: AGHT+IE3EattFBlIzSKAVdlp6euhBYY3Pnw6DfGGVK2t6vM6Y9wnb2KH9i38Vk+EoMnKRbWx7Kbtmw==
X-Received: by 2002:a05:600c:46d1:b0:405:3a3d:6f53 with SMTP id
 q17-20020a05600c46d100b004053a3d6f53mr13970480wmo.3.1698860724966; 
 Wed, 01 Nov 2023 10:45:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fm15-20020a05600c0c0f00b003fee6e170f9sm307654wmb.45.2023.11.01.10.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 10:45:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 18:45:19 +0100
Message-ID: <20231101174519.3808-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698860725; x=1699465525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWQWyizJMs6+qbpMYLKa093Rn8Ng5lo5903ZjOJ9od4=;
 b=lNximf3UcZ605Q1bGltCtb97cBM32z0srqfZ81Oqmf/nOOo+zdl/cQlppNcYySgekI
 iarSNaezqnfs8pMYmcli1e82ZlVhadKiKPWUh7cQQQgBHrKfwsk0Ur581v+OmP/UAI+s
 CXog6/9X+gZP8au6y6q4Wijik972GWwzJWsqfDZdPTi4RdMmWnI/GQtamC5LJcqTGRfL
 3euBtRc/c6lzTd5c7KR/fKNTb4xO+n51IBrfVKaM8H8rPD1kUYOmZy4BsE8n9p/RuGxL
 uzEaE4x/MgGFqKgfThK9oyCEWNF1ikingWZjfqA9m/+RJpkjS4dxnNPaeIq+BVqMOy94
 jCYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lNximf3U
Subject: [Buildroot] [PATCH 1/1] package/conmon: fix static build
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

Fix the following static build failure raised since commit
8144dd1b4cca2d5c89e329b0497f49f512c9caed which fixed dynamic build but
broke static build:

src/seccomp_notify.c:10:10: fatal error: dlfcn.h: No such file or directory
   10 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rc-seccomp_notify.c-fix-static-build.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch

diff --git a/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch b/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch
new file mode 100644
index 0000000000..afffa909c8
--- /dev/null
+++ b/package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch
@@ -0,0 +1,44 @@
+From 6cfcea9a16017f2a49cd792d39ebd9c86395946a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 1 Nov 2023 16:45:21 +0100
+Subject: [PATCH] src/seccomp_notify.c: fix static build
+
+Fix the following static build failure raised even when seccomp is
+disabled:
+
+src/seccomp_notify.c:10:10: fatal error: dlfcn.h: No such file or directory
+   10 | #include <dlfcn.h>
+      |          ^~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/containers/conmon/issues/462
+---
+ src/seccomp_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
+index 8d34d9d..bf738ea 100644
+--- a/src/seccomp_notify.c
++++ b/src/seccomp_notify.c
+@@ -7,7 +7,6 @@
+ 
+ #include <errno.h>
+ #include <sys/ioctl.h>
+-#include <dlfcn.h>
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ #include <signal.h>
+@@ -19,6 +18,7 @@
+ 
+ #ifdef USE_SECCOMP
+ 
++#include <dlfcn.h>
+ #include <sys/sysmacros.h>
+ #include <linux/seccomp.h>
+ #include <seccomp.h>
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

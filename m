Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440ABC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B334D41E93;
	Sat,  4 Nov 2023 15:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B334D41E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsSoM75Vd-BL; Sat,  4 Nov 2023 15:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AF9E41E78;
	Sat,  4 Nov 2023 15:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF9E41E78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 194E51BF285
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F9960F4D
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3F9960F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7IpeFW5SLSH for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:59:03 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0780C60BBC
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0780C60BBC
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso23888155e9.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 08:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699113540; x=1699718340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pitMxhih/OjJ6s5J7XrfUr8xY9/L/2NkophBtleRAv4=;
 b=rythzHNwp7ijRKHoEmrCr84vvacxAd1pOgYvjW0rwj8vVX1Ns5dUtWuTEGgyxg8Z6s
 Ln+MvmDzIgC1hopIFRp6jL/U9wrv00Xou3iRdKfjbSGpqpwjor/GwUL/bSr2Sr3U0VmO
 BaMRXmFeavK0FRRg5c7THf8bb17HbWVvG0Xl9I+0pSOksD/Kc423qDUvSWRgi9U/msy+
 jv0QdmyeezVwuEWUqDcaxgEQgINy51M972cfp93sert1mYs+rRSX7akP5Rdk0whJoXW/
 WH5sAo8beuGeYhCR6EYGWrH58qh9dBVpHi4I4rjCqEtokrni0YSQOuPVHUXTL9i/1Pg0
 rSCg==
X-Gm-Message-State: AOJu0YwDFXFEtHjlNTsvIjtpaPQFlLvbMmWHTFs6KFulT+/9Zu+OKyrG
 6phSxDaZXncnv7VERbCePj75vkfkb/o=
X-Google-Smtp-Source: AGHT+IFgJ2INpVjeVLSlFmliqmrwxK047m43LaAYmaieI1sz4SXI2Gwb88umB3hw/3qTUKu/EqmLFQ==
X-Received: by 2002:a05:600c:154b:b0:406:4573:81d2 with SMTP id
 f11-20020a05600c154b00b00406457381d2mr19484584wmg.39.1699113540028; 
 Sat, 04 Nov 2023 08:59:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o7-20020a5d6847000000b0032f7e832cabsm4677058wrw.90.2023.11.04.08.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 08:58:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 16:58:57 +0100
Message-ID: <20231104155857.110364-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699113540; x=1699718340; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pitMxhih/OjJ6s5J7XrfUr8xY9/L/2NkophBtleRAv4=;
 b=Ry70QFIK00PorNu/KHzUKo+uDt56r87aBtD8TIejiJ3vrfEe1WDigqLJQIS2IVDf3O
 AhdbMAUqYsG1c8cxqS8wiuVgjBV3gdsgbZSPDNzV2PnFPjy6YMlTQtYkaTqckvvtJ/JR
 m7jWNjPXhJzr7t68/MBGpCMzxv3upIU7XgxEJmTNRLt8NKDJY1Dp4X5jv//QKE9Y9gTi
 mOz7YRvPH6SnHHyxv3DtGDkGPEpAihROkewdilgR66JoBKGyLy27ruYKNdE2synqScbi
 zbLnorEHgkvF/75WeJkGH+bIm46nsn8I5JLUnAES1jsgefPhxmkSL82m528qmWUDHhbp
 LcoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ry70QFIK
Subject: [Buildroot] [PATCH 1/1] package/ltrace: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since commit
bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc:

checking host system type... mips-buildroot-linux-musl

Fixes:
 - http://autobuild.buildroot.org/results/a3a5c46e8562d3f091a9b4b205322168fbf9d16b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ltrace/0004-fix-musl-build.patch | 71 ++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/ltrace/0004-fix-musl-build.patch

diff --git a/package/ltrace/0004-fix-musl-build.patch b/package/ltrace/0004-fix-musl-build.patch
new file mode 100644
index 0000000000..0dceb08ec3
--- /dev/null
+++ b/package/ltrace/0004-fix-musl-build.patch
@@ -0,0 +1,71 @@
+From 2070162fef54fceeb62fd2a6989dde4948f807d7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 2 Nov 2023 16:59:41 +0100
+Subject: [PATCH] fix musl build
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: unsent yet
+---
+ configure.ac                   | 1 +
+ sysdeps/linux-gnu/mips/plt.c   | 2 ++
+ sysdeps/linux-gnu/ppc/regs.c   | 2 ++
+ sysdeps/linux-gnu/xtensa/plt.c | 2 ++
+ 4 files changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c83dd02..8015f0d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,6 +33,7 @@ AC_CANONICAL_HOST
+ 
+ case "${host_os}" in
+     linux-gnu*) HOST_OS="linux-gnu" ;;
++    linux-musl*) HOST_OS="linux-gnu" ;;
+     linux-uclibc*) HOST_OS="linux-gnu" ;;
+     *)		AC_MSG_ERROR([unkown host-os ${host_os}]) ;;
+ esac
+diff --git a/sysdeps/linux-gnu/mips/plt.c b/sysdeps/linux-gnu/mips/plt.c
+index c7c10ac..ab96961 100644
+--- a/sysdeps/linux-gnu/mips/plt.c
++++ b/sysdeps/linux-gnu/mips/plt.c
+@@ -23,7 +23,9 @@
+ 
+ #include <sys/ptrace.h>
+ #include <errno.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <gelf.h>
+ #include <inttypes.h>
+ #include <string.h>
+diff --git a/sysdeps/linux-gnu/ppc/regs.c b/sysdeps/linux-gnu/ppc/regs.c
+index 40d7e7a..71a0d35 100644
+--- a/sysdeps/linux-gnu/ppc/regs.c
++++ b/sysdeps/linux-gnu/ppc/regs.c
+@@ -27,7 +27,9 @@
+ #include <sys/ptrace.h>
+ #include <asm/ptrace.h>
+ #include <errno.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ 
+ #include "proc.h"
+ #include "common.h"
+diff --git a/sysdeps/linux-gnu/xtensa/plt.c b/sysdeps/linux-gnu/xtensa/plt.c
+index dd0a0f1..b281510 100644
+--- a/sysdeps/linux-gnu/xtensa/plt.c
++++ b/sysdeps/linux-gnu/xtensa/plt.c
+@@ -19,7 +19,9 @@
+  */
+ 
+ #include <errno.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#endif
+ #include <gelf.h>
+ #include <inttypes.h>
+ #include <string.h>
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

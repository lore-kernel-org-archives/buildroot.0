Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFB7D7494F
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 00:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9CD260823;
	Wed, 30 Oct 2024 00:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuPGgrxGPpzG; Wed, 30 Oct 2024 00:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A65607E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A65607E4;
	Wed, 30 Oct 2024 00:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B272D4EC0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 00:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0499607E4
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 00:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsUS-nn5L0qK for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 00:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82F15607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82F15607D9
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82F15607D9
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 00:20:29 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7209415ca51so1160732b3a.2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730247628; x=1730852428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lfI5GWFS+1l3fRy9VtdIB/0M5qJRReL//4Li6X1w/XM=;
 b=gFuX5cAwDNKLp9M073hdrtrtXjLpMepF/hmmiN/DDG13eig5AZWZEJOppZaj1L0yIA
 uHHszgW07Fv4SMkYY53Kd/Xrg1BRCaXC6GweCeqaMccTuQV0WccrS6o6m0JlE9zBuB6s
 hPZ/0UpovpwfNWm498/qt0rLiV5Wn/d8YqUDS9NAKwHyKbDT31tax0Y9658vNNn6XkkG
 rtSiHJAis8/nl46hVRruBp5/KHcpmEd2hexYxIFRwvTdm01vaZdbVmkEq4zZXbZC9eEI
 84doK0sCN6G+Ci6scqmFPVsa3slZ7e76dZWZIWYpXtDB8iwdYiu7P4wjFTHF6elBNyKg
 hqyQ==
X-Gm-Message-State: AOJu0YzoUyfybcqPc1eEzZY1LwM6jCfskHXxo7k98Kdi3Gb4xrtFul0g
 7gFc0XuqjdVSs3XMRzHYXUVl7lfscWIZ7UrP5KbLo17xcXYR2uC56IQreywN
X-Google-Smtp-Source: AGHT+IHRrgu7bW0y5XVCLAQC6qOK+XVL+v47IbaiSTwFPlHY6I8WqguXUlm/7soSSaAqu3bmzv31Kg==
X-Received: by 2002:a05:6a00:194e:b0:720:aa27:2e45 with SMTP id
 d2e1a72fcca58-720aa2736f8mr2548511b3a.14.1730247628122; 
 Tue, 29 Oct 2024 17:20:28 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a0b7c5sm8221706b3a.139.2024.10.29.17.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 17:20:27 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Wed, 30 Oct 2024 08:20:18 +0800
Message-ID: <20241030002020.73963-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730247628; x=1730852428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lfI5GWFS+1l3fRy9VtdIB/0M5qJRReL//4Li6X1w/XM=;
 b=ciXthSTbQp4bbYOFKKMlNdHk7AOIy+mef8EAUKtbPHvW9l+v3dAf7f2DXfqOcpslRI
 2emSU1t/FmK8dCKQLZtlgMJykZiRX3GmuhXd9ZQDZ4+Y9d8DguFIBysZbBkB/Grebzsu
 82F2f18smtpOaOzyGL41aGF9dK/ndPDWPBD1JyDOoN4HZPuR1dmDYHYyz1SFASes7IBu
 NRd5QtI+B40PuE0G0ogYomTwLrJUr/I2VhFUaySqwBdo1KRijLFz+/jZ8xEZllv9REqN
 T7PpwnBGb0Yver5xcQAZ5U0tUUV/BQtLmJwAIK+JY/qGx22ukSAtK9FMQ1cpa8T4ad3E
 BZ1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ciXthSTb
Subject: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

The previous build setup would check for pidfd_open using
AC_CHECK_FUNC and would be incorrectly reported as true.

Also, if pidfd_open() and __NR_pidfd_open were not present,
pidwait would silently not be built.

So, changes:
 compile a small programin using pidfd_open to test it properly
 conditionally try to find NR_pidfd_open if the function fails
 complain if neither are present
 have --disable-pidwait configure option so you are explicit in
 not wanting and knowing you wont get pidwait

Backport patch from upstream:
https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 ...03-build-sys-Fix-pidfd_open-checking.patch | 99 +++++++++++++++++++
 package/procps-ng/procps-ng.mk                |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch

diff --git a/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch b/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch
new file mode 100644
index 0000000000..bf89a07a20
--- /dev/null
+++ b/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch
@@ -0,0 +1,99 @@
+From ae7b0eb069f4add363e8c4d01833a06c3f5ee842 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Mon, 30 Sep 2024 17:26:01 +1000
+Subject: [PATCH] build-sys: Fix pidfd_open checking
+
+The previous build setup would check for pidfd_open using
+AC_CHECK_FUNC and would be incorrectly reported as true.
+
+Also, if pidfd_open() and __NR_pidfd_open were not present,
+pidwait would silently not be built.
+
+So, changes:
+ compile a small programin using pidfd_open to test it properly
+ conditionally try to find NR_pidfd_open if the function fails
+ complain if neither are present
+ have --disable-pidwait configure option so you are explicit in
+ not wanting and knowing you wont get pidwait
+
+References:
+ #352
+ commit d9c3e3676d86094abaa239b3218f57bf49d70b4f
+ commit 17f94796a9b3c4f1ff28829107a82107dcb362b4
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553
+
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+[Scott: backported to version 4.0.4]
+---
+ configure.ac | 45 ++++++++++++++++++++++++++++++---------------
+ 1 file changed, 30 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fec27e3f..0719fcd1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,21 +170,6 @@ AC_TRY_COMPILE([#include <errno.h>],
+ 		AC_MSG_RESULT(yes),
+ 		AC_MSG_RESULT(no))
+ 
+-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=yes], [
+-  AC_MSG_CHECKING([for __NR_pidfd_open])
+-  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+-#include <sys/syscall.h>
+-#ifndef __NR_pidfd_open
+-#error __NR_pidfd_open not defined
+-#endif
+-    ])], [enable_pidwait=yes], [enable_pidwait=no])
+-  AC_MSG_RESULT([$enable_pidwait])
+-])
+-if test "$enable_pidwait" = yes; then
+-  AC_DEFINE([ENABLE_PIDWAIT], [1], [Enable pidwait])
+-fi
+-AM_CONDITIONAL([BUILD_PIDWAIT], [test x$enable_pidwait = xyes])
+-
+ dnl watch8bit must be before the AC_ARG_WITH set as it sets up ncurses
+ AC_SUBST([WITH_WATCH8BIT])
+ AC_ARG_ENABLE([watch8bit],
+@@ -321,6 +306,36 @@ AC_ARG_ENABLE([pidof],
+ )
+ AM_CONDITIONAL(BUILD_PIDOF, test "x$enable_pidof" = xyes)
+ 
++# If pidwait is enabled, we need either pidfd_open() or __NR_pidfd_open need to be defined
++# Cannot use AC_CHECK_FUNC as it (incorrectly) passes with pidfd_open missing
++AC_ARG_ENABLE([pidwait],
++  AS_HELP_STRING([--disable-pidwait], [do not build pidwait]),
++  [], [
++    enable_pidwait=yes
++    AC_DEFINE(ENABLE_PIDWAIT, 1, [enable pidwait])
++  ]
++)
++AM_CONDITIONAL(BUILD_PIDWAIT, test "x$enable_pidwait" = xyes)
++AC_MSG_CHECKING([for pidfd_open()])
++AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[ [pidfd_open(1,1)]]])],
++  have_pidfd_open=yes; AC_MSG_RESULT([yes]) ,
++  have_pidfd_open=no; AC_MSG_RESULT([no])
++  )
++
++AS_IF([[test "x$enable_pidwait" = xyes -a "x$have_pidfd_open" = xno]],
++   AC_MSG_CHECKING([for __NR_pidfd_open])
++   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
++#include <sys/syscall.h>
++#ifndef __NR_pidfd_open
++#error __NR_pidfd_open not defined
++#endif
++      ])],
++      AC_MSG_RESULT([yes]),
++      AC_MSG_RESULT([no])
++      AC_MSG_ERROR([Neither pidfd_open or __NR_pidfd_open found. Disable pidwait with configure option --disable-pidwait])
++    )
++   ,[])
++
+ AC_ARG_ENABLE([kill],
+   AS_HELP_STRING([--disable-kill], [do not build kill]),
+   [], [enable_kill=yes]
+-- 
+2.43.0
+
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index c5185c2c8a..666c635ccc 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -16,6 +16,7 @@ PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
 # Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
 # Applying 0002-fix-ncurses-h-include.patch touches configure.ac
+# Applying 0003-build-sys-Fix-pidfd_open-checking.patch touches configure.ac
 PROCPS_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

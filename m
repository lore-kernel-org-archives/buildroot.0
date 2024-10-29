Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C591D5B874
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 05:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1B3407B6;
	Tue, 29 Oct 2024 05:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeHEU5zxYGwG; Tue, 29 Oct 2024 05:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFEFC407A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEFC407A4;
	Tue, 29 Oct 2024 05:33:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C4AAEE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 05:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B012160A3B
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 05:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-p4XCI53mrJ for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 05:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 808DC60907
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808DC60907
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 808DC60907
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 05:33:54 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-20e6981ca77so54162805ad.2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730180033; x=1730784833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mOxJ8ORbKPY7346Tso3Tr6/UmlMCXH+QXmsC3J7vdPc=;
 b=cutG9tFVMi32Y2Uza6RGF6Nxxt43vKvqH9+ySM0zorQ/iK0HK8uVhnvv237XjfDlkf
 yPMAlLI5SM0w2hK/rqJo/uSw+8XYjBqFwLRiGxnFCQJWhUc+EnPDrgfnKDxZURUTHHFi
 Hxr0UgpcMGrEqJj+TLUGSHi47jhhlPbWiIcFinPaUZT1Ggv4/HU+qktX77n+5GiisWJX
 Xg/DAWjUTM77Ad9F2ZleLaRkpL5MN+vNu1Z8dxBzwGfv/oJPWdNMAD0NAMc6wM4t8vPT
 6XEWp+lVaacHtFCo0asxke8ld/7WfmoAfP7Li5iJQKJU86rlXZxM2o0uGBUySZpQg+Ar
 GUFw==
X-Gm-Message-State: AOJu0YwoJ7zQ8ZgD4xLT4dHVAg21TWnwgDLsigVjz5FQ8+bonFIX5BRO
 NVY/sYvzbFuqMmXKpuCL4tQDKSP54jA9jSG8pPEseScR1ivYK7XBPeytT3Cv
X-Google-Smtp-Source: AGHT+IED9HtldnALrnEeyYK8rbfipSwHTljvcgTpPXcgWQVo5IlWfVOXW4B5yuMUL4Cd5g5G+NmCtw==
X-Received: by 2002:a05:6a20:c999:b0:1d9:2694:44c7 with SMTP id
 adf61e73a8af0-1d9a840c6b1mr13649169637.23.1730180033123; 
 Mon, 28 Oct 2024 22:33:53 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057931785sm6687869b3a.50.2024.10.28.22.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 22:33:52 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Tue, 29 Oct 2024 13:33:36 +0800
Message-ID: <20241029053338.766690-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730180033; x=1730784833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mOxJ8ORbKPY7346Tso3Tr6/UmlMCXH+QXmsC3J7vdPc=;
 b=dr5QpqO89+wLSB2sANE9OPxtE3GUhNlHEK8gm+JyzKXmhzhXzJxxRmNTu082kZ8TBl
 dBIxBD54k2xd8TGBkHVXs4KXgxWUI6jVe4x/04gsrrYky5wgvHLGIETnxumHHLMC5fEQ
 dz/Uo8bBQswO0Asg1FoXGCF+z5WRC8T8nQiZ884gEvq+eR7wARy/wvM+CKb4gGtfa8Md
 Is6LE6MFX85XqR6yrHqL/ztunJZ/J9qE810Z6KPnuVx4aprg65esXErnSvOvqaOwe2U5
 3oldMuhlmCgMxRI0p/g3VJHqxLOtSJFkILWU7TFBmnAa2wNe4D1PmHWPKkXK288MgQIQ
 rwHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dr5QpqO8
Subject: [Buildroot] [PATCH] package/procps-ng: fix build without
 __NR_pidfd_open and pidfd_open() found
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

Backport patch from upstream:
https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553

Add new configure option, allow disable build pidwait explicitly to avoid errors.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 ...03-build-sys-Fix-pidfd_open-checking.patch | 99 +++++++++++++++++++
 package/procps-ng/Config.in                   |  8 ++
 package/procps-ng/procps-ng.mk                |  5 +
 3 files changed, 112 insertions(+)
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
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 7af0e97fb4..17bc437fff 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -17,4 +17,12 @@ config BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP
 	  Disable modern top layout, return to original top with
 	  detailed cpu usage.
 
+config BR2_PACKAGE_PROCPS_NG_DISABLE_PIDWAIT
+	bool "Do not build pidwait"
+	help
+	  Disable pidwait with configure option --disable-pidwait
+	  explicitly. If pidwait is enabled, we need either pidfd_open()
+	  or __NR_pidfd_open need to be defined, the option can avoid
+	  errors when the condition is not met.
+
 endif
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index c5185c2c8a..2db638c508 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -16,6 +16,7 @@ PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
 # Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
 # Applying 0002-fix-ncurses-h-include.patch touches configure.ac
+# Applying 0003-build-sys-Fix-pidfd_open-checking.patch touches configure.ac
 PROCPS_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
@@ -60,6 +61,10 @@ ifeq ($(BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP),y)
 PROCPS_NG_CONF_OPTS += --disable-modern-top
 endif
 
+ifeq ($(BR2_PACKAGE_PROCPS_NG_DISABLE_PIDWAIT),y)
+PROCPS_NG_CONF_OPTS += --disable-pidwait
+endif
+
 # Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.
 define PROCPS_NG_INSTALL_INIT_OPENRC
 	@:
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

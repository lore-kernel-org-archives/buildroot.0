Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2DEC021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 15:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2617040DE9;
	Tue, 25 Feb 2025 15:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvW4xMZKAUop; Tue, 25 Feb 2025 15:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC13340DFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC13340DFD;
	Tue, 25 Feb 2025 15:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 368242DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 15:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3187881F43
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 15:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFnCeCnNuAgC for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 15:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B4BE81F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4BE81F05
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B4BE81F05
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 15:51:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85DA41814B9; Tue, 25 Feb 2025 16:51:06 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 16:50:38 +0100
Message-ID: <20250225155040.3209582-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; t=1740498667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8jdm5CLKVHQF49WX4YItOnPgyPKR/l5uPf+xqKcSCgY=;
 b=m3z13FnnV0HjPMFKWAa2XcUEu5bkNLfDiNeI4Py9VuVlrkhNpr97Vqc/dQR9+43ehVDszC
 FwBJtbLWM8DW/F8rRTA7W5urdaifqdLmPkqhqYV14ansrOnU16cqctl3+/S5kHoGv4A98i
 /mtys5AIIDdHj9v436L+LhGp0LEfX8M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=m3z13Fnn
Subject: [Buildroot] [PATCH] package/procps-ng: fix build with missing
 pidfd_open
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

port back patch introduced shortly after the 4.0.5 release.

Fixes:
  checking for __NR_pidfd_open... no
  configure: error: Neither pidfd_open or __NR_pidfd_open found. Disable pidwait with configure option --disable-pidwait

happening with this defconfig:

BR2_arm=y
BR2_cortex_a15_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_PACKAGE_PROCPS_NG=y

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...provide-definition-for-nr-pidfd_open.patch | 57 +++++++++++++++++++
 package/procps-ng/procps-ng.mk                |  3 +
 2 files changed, 60 insertions(+)
 create mode 100644 package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch

diff --git a/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch b/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch
new file mode 100644
index 0000000000..9c83124311
--- /dev/null
+++ b/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch
@@ -0,0 +1,57 @@
+From 90a0ddcd64c2d43dc2c2c856b1b42b5cae6b8a44 Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+Date: Wed, 11 Dec 2024 14:53:33 -0800
+Subject: [PATCH] pgrep: provide definition for __NR_pidfd_open if needed
+
+We already implement pidfd_open() ourselves if libc doesn't provide it.
+Let's also provide our own definition of __NR_pidfd_open in case the
+kernel headers don't contain it.
+
+This way, pgrep can provide its full capabilities after being built
+against older kernel headers (for increased compatibility) but being run
+on systems with newer kernels.
+
+Signed-off-by: Markus Mayer <mmayer@broadcom.com>
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/90a0ddcd64c2d43dc2c2c856b1b42b5cae6b8a44
+Signed-off: Michael Nosthoff <buildroot@heine.tech>
+---
+ configure.ac | 2 +-
+ src/pgrep.c  | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1e984b12..14ba3ad7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -325,7 +325,7 @@ AS_IF([[test "x$enable_pidwait" = xyes -a "x$have_pidfd_open" = xno]],
+    AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+ #include <sys/syscall.h>
+ #ifndef __NR_pidfd_open
+-#error __NR_pidfd_open not defined
++#warning __NR_pidfd_open not defined; using our definition
+ #endif
+       ])],
+       AC_MSG_RESULT([yes]),
+diff --git a/src/pgrep.c b/src/pgrep.c
+index 2c6b06b8..6fc25dd4 100644
+--- a/src/pgrep.c
++++ b/src/pgrep.c
+@@ -874,6 +874,15 @@ static int signal_option(int *argc, char **argv)
+ }
+
+ #if defined(ENABLE_PIDWAIT) && !defined(HAVE_PIDFD_OPEN)
++
++#ifndef __NR_pidfd_open
++#ifdef __alpha__
++#define __NR_pidfd_open 544
++#else
++#define __NR_pidfd_open 434
++#endif
++#endif
++
+ static int pidfd_open (pid_t pid, unsigned int flags)
+ {
+ 	return syscall(__NR_pidfd_open, pid, flags);
+--
+GitLab
+
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index f4eadcb547..56fe1790c3 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -14,6 +14,9 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
+# Applying 0001-pgrep-provide-definition-for-nr-pidfd_open.patch touches configure.ac
+PROCPS_NG_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

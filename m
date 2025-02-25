Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03B2C021BB
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 19:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A2D54076A;
	Tue, 25 Feb 2025 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcoKpzkQwmTO; Tue, 25 Feb 2025 19:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F7E740D70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7E740D70;
	Tue, 25 Feb 2025 19:59:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB7D92DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A63E980D2F
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYHiBi9sakfY for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 19:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD9B80BDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBD9B80BDE
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:59:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC1F287A8B; Tue, 25 Feb 2025 19:59:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 20:55:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c73fb46fea066fe2b1b02ba71cfd5a77c62e08f0
X-Git-Newrev: 0aa1b043dfa3ac2b9d8970cdf25349f77ab31458
X-Patchwork-Hint: ignore
Message-Id: <20250225195939.AC1F287A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng: fix build with missing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0aa1b043dfa3ac2b9d8970cdf25349f77ab31458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...grep-provide-definition-for-nr-pidfd_open.patch | 57 ++++++++++++++++++++++
 package/procps-ng/procps-ng.mk                     |  3 ++
 2 files changed, 60 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11CFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6732E81948;
	Sat, 19 Mar 2022 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2lNjZEwZZnN; Sat, 19 Mar 2022 21:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A60082425;
	Sat, 19 Mar 2022 21:51:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D16891BF32A
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 21:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF5EB607B5
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 21:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yt2FWbskcjgF for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 21:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEC2160701
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 21:51:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 073DF83EE8; Sat, 19 Mar 2022 21:42:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 22:49:54 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 696eb52d74206beaa55f67bf32dcc89c887cc9ca
X-Git-Newrev: 23fb7bbc00e22e90cf65997f4aae4a28c1ba4f6d
X-Patchwork-Hint: ignore
Message-Id: <20220319214213.073DF83EE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openssh: fix
 '-fzero-call-used-regs' option support detection
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1320050440596148611=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1320050440596148611==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=23fb7bbc00e22e90cf65997f4aae4a28c1ba4f6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- add upstream patch ([1]) to fix '-fzero-call-used-regs' gcc compiler option
  support detection

- add autoreconf as the patch touches m4/openssh.m4

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=14651

  bitmap.c: In function ‘reserve’:
  bitmap.c:98:1: sorry, unimplemented: ‘-fzero-call-used-regs’ not supported on this target
     98 | }
        | ^

[1] https://github.com/openssh/openssh-portable/commit/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 66fd92a4ce0599ee8c59b9ba95bf0f2c6ec74c43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ection-of-fzero-call-used-regs-all-suppor.patch | 38 ++++++++++++++++++++++
 package/openssh/openssh.mk                         |  4 +++
 2 files changed, 42 insertions(+)

diff --git a/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch b/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch
new file mode 100644
index 0000000000..ce5c5539ff
--- /dev/null
+++ b/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch
@@ -0,0 +1,38 @@
+From b5fee5fe98f708c1dc61a1564db35eacadbfe8b3 Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Thu, 24 Feb 2022 16:04:18 +0000
+Subject: [PATCH] Improve detection of -fzero-call-used-regs=all support
+
+GCC doesn't tell us whether this option is supported unless it runs into
+the situation where it would need to emit corresponding code.
+
+[Upstream: https://github.com/openssh/openssh-portable/commit/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ m4/openssh.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/m4/openssh.m4 b/m4/openssh.m4
+index 4f9c379..8c33c70 100644
+--- a/m4/openssh.m4
++++ b/m4/openssh.m4
+@@ -14,6 +14,8 @@ AC_DEFUN([OSSH_CHECK_CFLAG_COMPILE], [{
+ 	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ #include <stdlib.h>
+ #include <stdio.h>
++/* Trivial function to help test for -fzero-call-used-regs */
++void f(int n) {}
+ int main(int argc, char **argv) {
+ 	(void)argv;
+ 	/* Some math to catch -ftrapv problems in the toolchain */
+@@ -21,6 +23,7 @@ int main(int argc, char **argv) {
+ 	float l = i * 2.1;
+ 	double m = l / 0.5;
+ 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
++	f(0);
+ 	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
+ 	/*
+ 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
+-- 
+2.35.1
+
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0e0d59e6ab..84add9563d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -12,6 +12,10 @@ OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
+
+# patch touching m4/openssh.m4
+OPENSSH_AUTORECONF = YES
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \

--===============1320050440596148611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1320050440596148611==--

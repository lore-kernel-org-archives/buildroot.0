Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6AFE65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FCB360B00;
	Sun,  1 Feb 2026 18:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjIc3qF2qqPV; Sun,  1 Feb 2026 18:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB2660B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971276;
	bh=5KNbEJdUYWHC4YdmV2C5sJDe0A0ZGpnhELbJAC/g2RU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YV+gZnL1DCh6wj4txEyPQy+vUDfmR8PCaei10AeVRuFmk8fR8dug/r0SfqZert+Mk
	 PHitCMKYwNxYyFnD10gndNKXTd6O8NdMN+JRS7Okc/DyMDmI9X4wVIRibepJzt6EXa
	 PdtqvoETcdK2cA/rBmq6RF1/FPEtOaNGKof/CmlmAXOu4DWY2RqvsIcm2lCgS8D/CY
	 5yKbN5ZouY/WESxVNva6aaoE/RhSihryZjM4kvLkGRsSQupKHk3wwfrw1N3xAysMjK
	 99hre6VMOqHeAKZVgsEmecImbL7fsm3e7up2Pvf8KqczyO9GycMsfVWVyq5QOCZrFi
	 wrxZzfwmk/Avg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB2660B3F;
	Sun,  1 Feb 2026 18:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EEE4D23E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2EC24004E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIkrYrjRkCCR for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9639640022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9639640022
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9639640022
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:41:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AEE28A4C547A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 19:41:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46026)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcNd-000000007jq-2J0b
 for buildroot@buildroot.org; Sun, 01 Feb 2026 18:41:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Feb 2026 19:41:05 +0100
Message-ID: <20260201184105.3516843-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971265;
 bh=Gv5dY8QorLkC2NaIgce3Ff+rWtw7NLhwWoFZYUnJp4g=;
 h=From:To:Subject:Date:From;
 b=agU9M3pYxcz6S7nYZuLfKgb2pEvU6iJbNMd7DkCBKkKAyvfBGWBs5n3MzBeG0cJQQ
 39+oair3U3NZxGptTBDTnuhUPJ8jfgK39NxQ0+HJNaFwYSNUyjkLPvHvpsQNRA5kVK
 f4FAqpmg4kp1iRvHvgudVDcyjVcpiv8gKn+qsJxLQhTXynRuGGUm8n9S8ccwKZtTp5
 PGK8wbL02y4KKDicNRr6WZjpbFtHU5DYnL4y947RJ3nnIX3x1sMSLAhS5f/ErRFBd0
 RT7uJgHMHkGHYclZGT86c5B3QDbyb5Ua/dsuke/TDF09T3v1t7oiidRi7TDpKnYi6D
 8sirrcJmV61Mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=agU9M3pY
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: bump version to 4.0.6
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

https://gitlab.com/procps-ng/procps/-/blob/v4.0.6/NEWS

Removed patch which is included in this release.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...provide-definition-for-nr-pidfd_open.patch | 57 -------------------
 package/procps-ng/procps-ng.hash              |  8 +--
 package/procps-ng/procps-ng.mk                |  7 +--
 3 files changed, 6 insertions(+), 66 deletions(-)
 delete mode 100644 package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch

diff --git a/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch b/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch
deleted file mode 100644
index 9c83124311..0000000000
--- a/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 90a0ddcd64c2d43dc2c2c856b1b42b5cae6b8a44 Mon Sep 17 00:00:00 2001
-From: Markus Mayer <mmayer@broadcom.com>
-Date: Wed, 11 Dec 2024 14:53:33 -0800
-Subject: [PATCH] pgrep: provide definition for __NR_pidfd_open if needed
-
-We already implement pidfd_open() ourselves if libc doesn't provide it.
-Let's also provide our own definition of __NR_pidfd_open in case the
-kernel headers don't contain it.
-
-This way, pgrep can provide its full capabilities after being built
-against older kernel headers (for increased compatibility) but being run
-on systems with newer kernels.
-
-Signed-off-by: Markus Mayer <mmayer@broadcom.com>
-Upstream: https://gitlab.com/procps-ng/procps/-/commit/90a0ddcd64c2d43dc2c2c856b1b42b5cae6b8a44
-Signed-off: Michael Nosthoff <buildroot@heine.tech>
----
- configure.ac | 2 +-
- src/pgrep.c  | 9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1e984b12..14ba3ad7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -325,7 +325,7 @@ AS_IF([[test "x$enable_pidwait" = xyes -a "x$have_pidfd_open" = xno]],
-    AC_COMPILE_IFELSE([AC_LANG_SOURCE([
- #include <sys/syscall.h>
- #ifndef __NR_pidfd_open
--#error __NR_pidfd_open not defined
-+#warning __NR_pidfd_open not defined; using our definition
- #endif
-       ])],
-       AC_MSG_RESULT([yes]),
-diff --git a/src/pgrep.c b/src/pgrep.c
-index 2c6b06b8..6fc25dd4 100644
---- a/src/pgrep.c
-+++ b/src/pgrep.c
-@@ -874,6 +874,15 @@ static int signal_option(int *argc, char **argv)
- }
-
- #if defined(ENABLE_PIDWAIT) && !defined(HAVE_PIDFD_OPEN)
-+
-+#ifndef __NR_pidfd_open
-+#ifdef __alpha__
-+#define __NR_pidfd_open 544
-+#else
-+#define __NR_pidfd_open 434
-+#endif
-+#endif
-+
- static int pidfd_open (pid_t pid, unsigned int flags)
- {
- 	return syscall(__NR_pidfd_open, pid, flags);
---
-GitLab
-
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 21c661192c..8877099145 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5  90803e64f51f192f3325d25c3335d057  procps-ng-4.0.5.tar.xz
-sha1  a36b8ab95950addb4b34251fcf23195c45a63eda  procps-ng-4.0.5.tar.xz
+md5  20c23dc3dd1569a2bb1d1fa93de213ed  procps-ng-4.0.6.tar.xz
+sha1  6e23f716a86dbec3174c05bdc23a02aa72ac3185  procps-ng-4.0.6.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-4.0.5.tar.xz.asc
-sha256  c2e6d193cc78f84cd6ddb72aaf6d5c6a9162f0470e5992092057f5ff518562fa  procps-ng-4.0.5.tar.xz
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-4.0.6.tar.xz.asc
+sha256  67bea6fbc3a42a535a0230c9e891e5ddfb4d9d39422d46565a2990d1ace15216  procps-ng-4.0.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 56fe1790c3..ffd76eeb91 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 4.0.5
+PROCPS_NG_VERSION = 4.0.6
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
-PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
+PROCPS_NG_SITE = https://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_CPE_ID_VALID = YES
@@ -14,9 +14,6 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
-# Applying 0001-pgrep-provide-definition-for-nr-pidfd_open.patch touches configure.ac
-PROCPS_NG_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

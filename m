Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45099C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F014D60A5B;
	Sun, 18 May 2025 17:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mx-YV1GxdzNu; Sun, 18 May 2025 17:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 201C660ADD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 201C660ADD;
	Sun, 18 May 2025 17:37:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A515EE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B0D860AA0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSRyqPk1SyNF for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C04B60A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C04B60A5B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C04B60A5B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:37:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 250F0A4C2059
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:37:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42414)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGhwm-000000002H4-1Sm1
 for buildroot@buildroot.org; Sun, 18 May 2025 17:37:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:37:12 +0200
Message-Id: <20250518173712.2148059-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747589833;
 bh=1+YN3nOXimg5fr9YeiYcvBlvJ15rufc+t/FBcahMznw=;
 h=From:To:Subject:Date:From;
 b=kyd3c4H+ecLvuyJ9+aqr21qQKL+10ZiukP93woritEROMGrDQYHARsX4N9ZNISQsj
 yYo3buvjQfe/2PLmO+Uun/jPumk/WtLl0xiFdI90lJHWo9kuZR8zmnkQV1ctXj+JAK
 1mDfBovyGFvwK9mMVTtzji8bCPkb62pE/thmJX1gUfDq1P4gq6ZLqI0qpFH09fdw3C
 XN1mY38NDeroR/N5u4BRCfU+6hAlQ1PnWBuP345ZGpvTJj59PHk8CdEcqDuEoe153Y
 9u+bya/NR+vZA6snA+N/w5qiiEP4YTXXkj0/JUMiDkoWh0sgnGhHwYi5nkVUiEpS1m
 05C1rKd8aGB9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=kyd3c4H+
Subject: [Buildroot] [PATCH 1/1] package/sudo: bump version to 1.9.16p2
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

Removed patch which is included in this release.

Updated license hash due to copyright year bump and whitespace fixes:
https://github.com/sudo-project/sudo/commits/SUDO_1_9_16p2/LICENSE.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...e-fix-build-without-precess_vm_readv.patch | 41 -------------------
 package/sudo/sudo.hash                        |  4 +-
 package/sudo/sudo.mk                          |  4 +-
 3 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch

diff --git a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch b/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
deleted file mode 100644
index 446f1d1797..0000000000
--- a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 17 Feb 2024 17:52:45 +0100
-Subject: [PATCH] src/exec_ptrace: fix build without precess_vm_readv()
-
-Commit 32f4b98f6b4a (sudo frontend: silence most -Wconversion warnings.)
-broke the build on C libraries that miss process_vm_readv(), like
-uClibc-ng.
-
-Indeed, the ssize_t nwritten is declared guarded by HAVE_PROCESS_VM_READV,
-but is then re-assigned and used a few lines below, outside any guard.
-
-Fix that by always declaring the object, as it is always needed.
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/sudo-project/sudo/commit/5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c
----
- src/exec_ptrace.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
-index 9dd36c275..3d44b82e2 100644
---- a/src/exec_ptrace.c
-+++ b/src/exec_ptrace.c
-@@ -878,11 +878,12 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
-     unsigned long addr, unsigned long strtab)
- {
-     const unsigned long strtab0 = strtab;
-+    ssize_t nwritten;
-     size_t i;
-     debug_decl(ptrace_write_vec, SUDO_DEBUG_EXEC);
-
- #ifdef HAVE_PROCESS_VM_READV
--    ssize_t nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-+    nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-     if (nwritten != -1 || errno != ENOSYS)
- 	debug_return_ssize_t(nwritten);
- #endif /* HAVE_PROCESS_VM_READV */
---
-2.43.0
-
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 066d3b9de6..ed4e527f36 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558  sudo-1.9.15p5.tar.gz
+sha256  976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c  sudo-1.9.16p2.tar.gz
 # Locally calculated
-sha256  ea33b3971e8e4d9657cd6794a952aaa71b22bd16745f1645455b6ead010e0a28  LICENSE.md
+sha256  a6e4ec823f2ba58f840b0ff5fc5459e4893f46a91bbcd6b2a2d91315de5a2d2b  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7961a99002..1fe713ab2d 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.15
-SUDO_VERSION_MINOR = p5
+SUDO_VERSION_MAJOR = 1.9.16
+SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

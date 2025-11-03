Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D187CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F24D24068B;
	Mon,  3 Nov 2025 20:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pzj9rELKGFXt; Mon,  3 Nov 2025 20:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F11406A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F11406A2;
	Mon,  3 Nov 2025 20:31:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0126A222
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E788A40459
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 20:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TItodSKa6-ZX for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 20:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A15BC40421
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A15BC40421
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A15BC40421
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 20:31:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0D68A4C5F00;
 Mon,  3 Nov 2025 21:31:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56444)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vG1DV-000000001By-0t3y;
 Mon, 03 Nov 2025 20:31:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 21:31:53 +0100
Message-ID: <20251103203153.213444-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762201913;
 bh=89c+ob/P68is8To2MGgDV2ywvHJD4BExLJekfSczyUc=;
 h=From:To:Cc:Subject:Date:From;
 b=F14bVTPz8LYyrh8B5pS11j9XsH028IvQGBzGwQRsuPIJyzT22SU1m34tnk7E7vj5k
 PUPpOS6065WP7No3soLo0d0ZMtC+JcuAoJzQXubbbe/L6cxlyKTId3BppH+RwPXohX
 n5jV0TuHh/UG8OVqyL1g0bm+TiIj/jPfTkQLoPlTZvIL7pMiK64bMLolljIfm21ZTh
 7k+NmtIH4MUxZT3hp/UajoLfHsqUYTZ7mxOOzSpfwRrBK2yY1Io6RsciYJERwzI2fQ
 5k/VBOEJt86jLFxcB4IxMGc6S4FPh5jQMVc45V8bMGPSMtaL6x2uK2pDBEKCg9jN6O
 lqaIy3W2J7oTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=F14bVTPz
Subject: [Buildroot] [PATCH 1/1] package/libcap: bump version to 2.77
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

Release notes:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.mr55t4z9vzea

Removed all patches because they are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-PSX-support-for-microblaze-arc-and-.patch | 56 ----------------
 ...-Support-for-__xtensa__-architecture.patch | 65 -------------------
 package/libcap/libcap.hash                    |  2 +-
 package/libcap/libcap.mk                      |  2 +-
 4 files changed, 2 insertions(+), 123 deletions(-)
 delete mode 100644 package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch
 delete mode 100644 package/libcap/0002-Support-for-__xtensa__-architecture.patch

diff --git a/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch b/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch
deleted file mode 100644
index 3f569d6d2c..0000000000
--- a/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 7a2eee56607218d017af8d26c2c41dba83629708 Mon Sep 17 00:00:00 2001
-From: "Andrew G. Morgan" <morgan@kernel.org>
-Date: Thu, 17 Apr 2025 20:20:09 -0700
-Subject: [PATCH] First attempt at PSX support for microblaze, arc and
- openrisc.
-
-I found some confusing macrology for openrisc. I'm optimistic that
-this is recognized with the __or1k__ gcc macro.
-
-See for details:
-
-  https://bugzilla.kernel.org/show_bug.cgi?id=219915
-
-Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-Upstream: https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=7a2eee56607218d017af8d26c2c41dba83629708
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- psx/psx_calls.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/psx/psx_calls.c b/psx/psx_calls.c
-index 9662fbd..8195964 100644
---- a/psx/psx_calls.c
-+++ b/psx/psx_calls.c
-@@ -48,7 +48,8 @@
-     || defined(__mips__) || defined(__loongarch__) \
-     || defined(__powerpc__) || defined(__s390__) || defined(__riscv) \
-     || defined(__alpha__) || defined(__hppa__) || defined(__sh__) \
--    || defined(__m68k__) || defined(__sparc__)
-+    || defined(__m68k__) || defined(__sparc__) || defined(__arc__) \
-+    || defined(__microblaze__) || defined(__or1k__)
- 
- #undef _NSIG
- #undef _NSIG_BPW
-@@ -69,7 +70,8 @@
- 
- #if defined(__x86_64__) || defined(__i386__) \
-     || defined(__arm__) \
--    || defined(__powerpc__)
-+    || defined(__powerpc__) \
-+    || defined(__arc__)
- /* field used */
- #define SA_RESTORER  0x04000000
- #endif /* architectures that use SA_RESTORER */
-@@ -201,6 +203,8 @@ static void psx_posix_syscall_actor(int signum, siginfo_t *info, void *ignore) {
- 	    __asm__ __volatile__("\npsx_restorer:\n\tmov r7,#173\n\tswi 0\n");
- #elif defined(__powerpc__)
- 	    __asm__ __volatile__("\npsx_restorer:\n\tli 0, 172\n\tsc\n");
-+#elif defined(__arc__)
-+	    __asm__ __volatile__("\npsx_restorer:\n\tmov r8, 139\n\ttrap_s 0\n");
- #else
- #error "unsupported architecture - https://bugzilla.kernel.org/show_bug.cgi?id=219687"
- #endif /* supported architectures */
--- 
-2.49.0
-
diff --git a/package/libcap/0002-Support-for-__xtensa__-architecture.patch b/package/libcap/0002-Support-for-__xtensa__-architecture.patch
deleted file mode 100644
index a81a1952aa..0000000000
--- a/package/libcap/0002-Support-for-__xtensa__-architecture.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 9421f4ff93c341482d3aa4a0cd57aba1978bdd62 Mon Sep 17 00:00:00 2001
-From: "Andrew G. Morgan" <morgan@kernel.org>
-Date: Sat, 19 Apr 2025 08:00:23 -0700
-Subject: [PATCH] Support for __xtensa__ architecture.
-
-It looks like __xtensa__ defines SA_RESTORER, but my read of the
-kernel code suggests that signal handling does not require it be
-set. Specifically, if the SA_RESTORER flag is not set, the kernel
-inserts a sys_rt_sigreturn call into the stack frame.
-
-Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-Upstream: 6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- psx/psx_calls.c | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/psx/psx_calls.c b/psx/psx_calls.c
-index 8195964..aff105f 100644
---- a/psx/psx_calls.c
-+++ b/psx/psx_calls.c
-@@ -49,7 +49,8 @@
-     || defined(__powerpc__) || defined(__s390__) || defined(__riscv) \
-     || defined(__alpha__) || defined(__hppa__) || defined(__sh__) \
-     || defined(__m68k__) || defined(__sparc__) || defined(__arc__) \
--    || defined(__microblaze__) || defined(__or1k__)
-+    || defined(__microblaze__) || defined(__or1k__) \
-+    || defined(__xtensa__)
- 
- #undef _NSIG
- #undef _NSIG_BPW
-@@ -69,8 +70,7 @@
- #define _NSIG_WORDS  (_NSIG / _NSIG_BPW)
- 
- #if defined(__x86_64__) || defined(__i386__) \
--    || defined(__arm__) \
--    || defined(__powerpc__) \
-+    || defined(__arm__) || defined(__powerpc__) \
-     || defined(__arc__)
- /* field used */
- #define SA_RESTORER  0x04000000
-@@ -78,8 +78,9 @@
- 
- #if defined(SA_RESTORER) \
-     || defined(__aarch64__) \
--    || defined(__m68k__) || defined(__sh__) || defined(__sparc__) \
--    || defined(__s390__) || defined(__sparc__)
-+    || defined(__m68k__) || defined(__sh__) \
-+    || defined(__s390__) || defined(__sparc__) \
-+    || defined(__xtensa__)
- /* field defined */
- #define _HAS_SA_RESTORER   void *sa_restorer;
- #else
-@@ -93,7 +94,7 @@ typedef struct {
- #define sigset_t psx_sigset_t
- 
- struct psx_sigaction {
--#if defined(__m68k__) || defined(__alpha__)
-+#if defined(__m68k__) || defined(__alpha__) || defined(__xtensa__)
-     void *sa_handler;
-     sigset_t sa_mask;
-     unsigned long sa_flags;
--- 
-2.49.0
-
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 68c331f2b4..1925060235 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f  libcap-2.76.tar.xz
+sha256  897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52  libcap-2.77.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index b4158a5be8..37ccdc22b4 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.76
+LIBCAP_VERSION = 2.77
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

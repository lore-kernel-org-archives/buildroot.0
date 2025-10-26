Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1A5CCD193
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 10:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C0260F9F;
	Sun, 26 Oct 2025 10:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvbQgNZDgwqo; Sun, 26 Oct 2025 10:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9223260F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9223260F94;
	Sun, 26 Oct 2025 10:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6894215F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AB7A40487
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meV9gQF62pBT for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 10:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7FE540079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7FE540079
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7FE540079
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:29:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CA64A4C43FC
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 11:29:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36394)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCy06-000000004u8-0h61
 for buildroot@buildroot.org; Sun, 26 Oct 2025 10:29:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 11:29:25 +0100
Message-ID: <20251026102925.1361128-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761474566;
 bh=049PNmzVLcad4yH0o7ODRR0uFsSskLTorR7fBzHb+RQ=;
 h=From:To:Subject:Date:From;
 b=N1ctdruO/Dy4gefwowO055MRp6vPDTgZilxetQEJhLUGIzYEdhnkMCIE1280IqmJ4
 xs8b3BEX7nJyl8ywrKaprFd2baNuL5l/fz+NBUPRYHjVsKkNgb2W2kppZY0HgMti/L
 BUGBeEewAeNUZzQnqhkj41wVDxcGzdRcFMDlHIZZUBgZoG74IOD7rbS5WDqWOfp3Ek
 X8KUttvnet5q9wdJihrh5bjqOhRvEKGhcuQeAz5zuKKD9n9I34ZtGSxLqbFj5BFS/k
 Ck99AJfz2lgRZAJcbFxk2wZPeNQd2kAMrUfKS7sqHdV6xJO0X95EmPJJqnQpfpPJLJ
 7SQ67ApBcfvdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=N1ctdruO
Subject: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.194
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

Release notes:
https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=922a15cce7163b2bee605a26132d833dc0c29074;hb=eb7f17d5016a75c6fdb6431aff1c1804d8c290e4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ckends-guard-asm-perf_regs.h-include.patch | 53 -------------------
 package/elfutils/elfutils.hash                |  4 +-
 package/elfutils/elfutils.mk                  |  2 +-
 3 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch

diff --git a/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch b/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
deleted file mode 100644
index 76c604510b..0000000000
--- a/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d05241ce690018548857199bd34d7734c7164679 Mon Sep 17 00:00:00 2001
-From: Serhei Makarov <serhei@serhei.io>
-Date: Mon, 5 May 2025 12:08:55 -0400
-Subject: [PATCH] PR32930 backends/: guard asm/perf_regs.h include
-
-asm/perf_regs.h is an arch-specific linux include, not present on
-architectures like hppa and m68k that lack perf_events support.
-
-Only one place we need to fix; others already guard the include by
-architecture, or use architecture-independent headers (e.g.
-linux/perf_events.h).
-
-* backends/libebl_PERF_FLAGS.h: Only include asm/perf_regs.h on
-  architectures where we use it.
-
-Signed-off-by: Serhei Makarov <serhei@serhei.io>
-Upstream: d05241ce690018548857199bd34d7734c7164679
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- backends/libebl_PERF_FLAGS.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/backends/libebl_PERF_FLAGS.h b/backends/libebl_PERF_FLAGS.h
-index 2ed45f0f..51c20ea6 100644
---- a/backends/libebl_PERF_FLAGS.h
-+++ b/backends/libebl_PERF_FLAGS.h
-@@ -32,8 +32,12 @@
- #define _LIBEBL_PERF_FLAGS_H 1
- 
- #if defined(__linux__)
-+/* XXX Need to exclude __linux__ arches without perf_regs.h. */
-+#if defined(__x86_64__) || defined(__i386__)
-+/* || defined(other_architecture)... */
- # include <asm/perf_regs.h>
- #endif
-+#endif
- 
- #if defined(_ASM_X86_PERF_REGS_H)
- /* See the code in x86_initreg_sample.c for list of required regs and
-@@ -49,8 +53,8 @@
-    see the code in tools/perf/util/intel-pt.c intel_pt_add_gp_regs()
-    and note how regs are added in the same order as the perf_regs.h enum.  */
- #else
--/* Since asm/perf_regs.h gives the register layout for a different arch,
--   we can't unwind x86_64 frames.  */
-+/* Since asm/perf_regs.h is absent, or gives the register layout for a
-+   different arch, we can't unwind i386 and x86_64 frames. */
- #define PERF_FRAME_REGISTERS_I386 0
- #define PERF_FRAME_REGISTERS_X86_64 0
- #endif
--- 
-2.50.1
-
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 8a132f3a1c..933420d1dd 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.193/sha512.sum
-sha512  557e328e3de0d2a69d09c15a9333f705f3233584e2c6a7d3ce855d06a12dc129e69168d6be64082803630397bd64e1660a8b5324d4f162d17922e10ddb367d76  elfutils-0.193.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.194/sha512.sum
+sha512  5d00502f61b92643bf61dc61da4ddded36c423466388d992bcd388c5208761b8ed9db1a01492c085cd0984eef30c08f895a8e307e78e0df8df40b56ae35b78a5  elfutils-0.194.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 712e69570b..554a60003f 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.193
+ELFUTILS_VERSION = 0.194
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

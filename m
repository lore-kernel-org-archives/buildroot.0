Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F110CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 08:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35D2261013;
	Mon, 18 Aug 2025 08:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lby5QdzufidW; Mon, 18 Aug 2025 08:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 566B461B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 566B461B0B;
	Mon, 18 Aug 2025 08:45:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD1E75
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 661D161B0B
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T94iK_DHB64A for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 08:45:33 +0000 (UTC)
X-Greylist: delayed 412 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 08:45:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CA2A61013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA2A61013
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CA2A61013
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:45:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BF0C0C6B3A8
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:38:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 32302606A6
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:38:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 630E61C2282BF; 
 Mon, 18 Aug 2025 10:38:28 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Aug 2025 10:38:25 +0200
Message-ID: <20250818083826.2770186-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755506317; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ha3R8SwA4L6dUhfKqZVD/D/XMhTh3X+ge2PDR3o6nQQ=;
 b=ty4cv0p8jAlGg/porj6nG2cEusRKPfCnfCk7VYkXyNq69gFQM4MYJP9YKg8PgfyM39WDmv
 HP/7b2K8EeWqppMV/mf7wRDESlQe1wjhWTfOXjU7gKxSYH7qFOyv6Kuk/tJEclWwM/rgJ1
 yt19tbKltPvdZNEa7ODdcs20aVed6V7C9RzKze4bDGPLjNYrtL4yMbLamahRBqPvGO4GCu
 SM8xZjCZMzA0+LxazZ/21ACxJQhAbxPQyDYOubHE0tJTVicyxNIgUG1FCdEOU1e70i5qlV
 qgW1xP7MTVfaOEtnFRNtHLVaK+xHyayxaJPrc1nEwJIL3DXD8kfIJ3zo3yTURA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ty4cv0p8
Subject: [Buildroot] [PATCH] package/elfutils: fix build after 0.193 version
 bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 0.193 version bump done in commit
c7508a23242aae7a80f22acc4473da25f7f9e96d broke the build on numerous
CPU architectures. Let's take a patch from upstream's main branch to
fix the issue.

Fixes:

  https://autobuild.buildroot.net/results/3b005f7afec386f6fa4237f427f73367d55bb211/ (sparc64)
  https://autobuild.buildroot.net/results/a6b1d5078abdd6c8def93aaffa2e67573250da3e/ (m68k)
  https://autobuild.buildroot.net/results/45305cc2be3b255740808ee1f3486d1a10abfbb4/ (microblaze)
  and a bunch more

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ckends-guard-asm-perf_regs.h-include.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch

diff --git a/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch b/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
new file mode 100644
index 0000000000..76c604510b
--- /dev/null
+++ b/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
@@ -0,0 +1,53 @@
+From d05241ce690018548857199bd34d7734c7164679 Mon Sep 17 00:00:00 2001
+From: Serhei Makarov <serhei@serhei.io>
+Date: Mon, 5 May 2025 12:08:55 -0400
+Subject: [PATCH] PR32930 backends/: guard asm/perf_regs.h include
+
+asm/perf_regs.h is an arch-specific linux include, not present on
+architectures like hppa and m68k that lack perf_events support.
+
+Only one place we need to fix; others already guard the include by
+architecture, or use architecture-independent headers (e.g.
+linux/perf_events.h).
+
+* backends/libebl_PERF_FLAGS.h: Only include asm/perf_regs.h on
+  architectures where we use it.
+
+Signed-off-by: Serhei Makarov <serhei@serhei.io>
+Upstream: d05241ce690018548857199bd34d7734c7164679
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ backends/libebl_PERF_FLAGS.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/backends/libebl_PERF_FLAGS.h b/backends/libebl_PERF_FLAGS.h
+index 2ed45f0f..51c20ea6 100644
+--- a/backends/libebl_PERF_FLAGS.h
++++ b/backends/libebl_PERF_FLAGS.h
+@@ -32,8 +32,12 @@
+ #define _LIBEBL_PERF_FLAGS_H 1
+ 
+ #if defined(__linux__)
++/* XXX Need to exclude __linux__ arches without perf_regs.h. */
++#if defined(__x86_64__) || defined(__i386__)
++/* || defined(other_architecture)... */
+ # include <asm/perf_regs.h>
+ #endif
++#endif
+ 
+ #if defined(_ASM_X86_PERF_REGS_H)
+ /* See the code in x86_initreg_sample.c for list of required regs and
+@@ -49,8 +53,8 @@
+    see the code in tools/perf/util/intel-pt.c intel_pt_add_gp_regs()
+    and note how regs are added in the same order as the perf_regs.h enum.  */
+ #else
+-/* Since asm/perf_regs.h gives the register layout for a different arch,
+-   we can't unwind x86_64 frames.  */
++/* Since asm/perf_regs.h is absent, or gives the register layout for a
++   different arch, we can't unwind i386 and x86_64 frames. */
+ #define PERF_FRAME_REGISTERS_I386 0
+ #define PERF_FRAME_REGISTERS_X86_64 0
+ #endif
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

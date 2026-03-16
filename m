Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65149F53D90
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 20:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1784241055;
	Mon, 16 Mar 2026 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7z8hVA8xA4hM; Mon, 16 Mar 2026 20:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4C84105A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773692081;
	bh=bSPSGbo8Hkv0SrK9Th0bWOQwknsa/HuNogtpe+tVWkw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=s2B4DObR2VzuxMYws2tgOnj1aMADuDBe/l/myQtTaaJF3VSr26fDaPUWKAiXWk6tz
	 xzJbqrm5Y8mJyYbWB9Z9Zp5Zg9tAWc6fJVP3G2rfsbLZybq4iNGDWB+lmU920WOK+G
	 Iq78dNjHSg1X9F7PRF63JT7AxWHk3UCE7gJFkniCjNXqgs0dM/tV7FNl1ELhy9IHhj
	 X5lPmqWyQ8LlMs4kRfw+lATqfgHpxViOTQPRtXUr7qcuvbNxaiFAcrhFZw+KhV+9I/
	 rO+axrZRV5TotWDxlBUldjFQYOjZndtLAnSsNnPL0Y8v+CdT+ctLSfM6YYSCA7uYCO
	 cnIQx6rvShfvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4C84105A;
	Mon, 16 Mar 2026 20:14:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 775593BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68BFA4105A
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofsiKgvCIfl8 for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 20:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36EF241055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36EF241055
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36EF241055
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:14:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 18DAA19F574;
 Mon, 16 Mar 2026 21:14:33 +0100 (CET)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 16 Mar 2026 21:14:20 +0100
Message-ID: <20260316201420.798780-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773692075;
 bh=8Mq8w/bXEm/i+6uS+WIuTTXuhWiElTEjJprEP1HgJxo=;
 h=From:To:Cc:Subject:Date:From;
 b=vG4ZvFMfQyZtDrumOcLt+N4h3vqfq88d0nv2eE+nj+aE/5zs5YwikLO99Rb7h4pi1
 p06tS60ZpTSEXtkevXsla8TQPxA5I+azF7+WFwjVCp37DXXNnTzHwUIVr4NRrWQq4p
 2F6gF2RSH1b5CzyBPe9FXIBi2lr8Pc8hZPmO7vxjUv0x0hcUeN+laHMSL9MQnUea48
 5IbORtHyCNl6qljZUzzKJxziQ0+f9imctzAn8MTQYYrT8VBIAgrDsGglV949NT3Vn8
 1+/+bGv3h0hJvaUclwPDVd7MYTKcfQZg2VI/BtL995cBFxNI/FOXJM0/pTdSScTJrC
 W42GuWceu5Ivg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vG4ZvFMf
Subject: [Buildroot] [PATCH 1/1] package/zfs: add patch to fix build with
 uclibc >= 1.0.57
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uclibc 1.0.57 added a statx() syscall wrapper in upstream commit [1].

zfs fail to build with uclibc 1.0.57 (not yet in Buildroot), because:
1. uclibc <fcntl.h> internally includes <sys/stat.h>, and
2. a zfs test redefines a statx() wrapper with a slightly different
   prototype.

In that case, zfs fails to compile with error:

    tests/zfs-tests/cmd/statx.c:58:1: error: conflicting types for 'statx'; have 'int(int,  const char *, int,  unsigned int,  void *)'

Issue has been reported upstream at [2].

This commit adds a package patch to fix that issue.

[1] https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32
[2] https://github.com/openzfs/zfs/pull/18316

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This patch is meant to be applied before updating uclibc:
https://patchwork.ozlabs.org/project/buildroot/patch/aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de/
---
 ...ts-cmd-statx.c-avoid-statx-conflicts.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch

diff --git a/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch b/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
new file mode 100644
index 0000000000..98f905aa48
--- /dev/null
+++ b/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
@@ -0,0 +1,49 @@
+From d363aafe0a773cd55890a385694cf05cb6225c5a Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 15 Mar 2026 13:18:07 +0100
+Subject: [PATCH] tests/zfs-tests/cmd/statx.c: avoid statx() conflicts
+
+With some libc, such as uclibc >= 1.0.57, the libc defines the statx()
+function, while also internally including <sys/stat.h> (from <fcntl.h>
+from example), which results to a compilation error due to conflicting
+types.
+
+This commit fixes the issue by only defining the statx() prototype only
+if the libc was detected not to have a working statx() wrapper, and
+explicitly include the <sys/stat.h> otherwise.
+
+Upstream: Discussed in: https://github.com/openzfs/zfs/pull/18316#issuecomment-4062904581
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ tests/zfs-tests/cmd/statx.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/zfs-tests/cmd/statx.c b/tests/zfs-tests/cmd/statx.c
+index 1acc7e58c..c292fdbdf 100644
+--- a/tests/zfs-tests/cmd/statx.c
++++ b/tests/zfs-tests/cmd/statx.c
+@@ -34,6 +34,9 @@
+  * statx() may be available in the kernel, but not in the libc, so we build
+  * our own wrapper if we can't link one.
+  */
++#ifdef HAVE_STATX
++#include <sys/stat.h>
++#endif
+ 
+ #ifndef __NR_statx
+ #if defined(__x86_64__)
+@@ -54,9 +57,11 @@
+ #endif /* __NR_statx */
+ 
+ 
++#ifndef HAVE_STATX
+ int
+ statx(int, const char *, int, unsigned int, void *)
+     __attribute__((weak));
++#endif
+ 
+ static inline int
+ _statx(int fd, const char *path, int flags, unsigned int mask, void *stx)
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

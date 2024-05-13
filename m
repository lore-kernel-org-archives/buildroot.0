Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EADDC25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 08:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567636087C;
	Mon, 13 May 2024 08:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlsrfaOLoaLv; Mon, 13 May 2024 08:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A88D6608F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A88D6608F2;
	Mon, 13 May 2024 08:17:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 118D41BF86C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 08:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2189404C4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 08:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb5VOmq4AFFJ for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 08:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B53440150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B53440150
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B53440150
 for <buildroot@buildroot.org>; Mon, 13 May 2024 08:17:12 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C13633520794; Mon, 13 May 2024 10:17:09 +0200 (CEST)
Date: Mon, 13 May 2024 10:17:09 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkHMhbT9Nq1M32sV@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715588229; bh=wy/lBilqJ7YuqeywdjDT+2ntaAEBjRsYz1YbSkD+AQ8=;
 h=Date:From:To:Subject:From;
 b=IgOkxJcVeI5SF4keBScn5/cDRVvfK5ISHEV9ApKD9RPHIa0gpKhVfmkXL7Q2HnXYa
 5tO5pqvsvrZ2YX3CcMLYPTawJ6fyQhsPRKolXpB2EJchD7SMpp6+nLEDQ5nWauiNmx
 oGB/JvQ5YZDT4VpGAJc8NYbpYxGs6DwxpMbeewkmsWqY9Sy6d3abe6Z7gMfLGbe1mY
 sRjRz31zOHu6OwPfYVykdXKAg9chpYQi7d2agRfGxPy/pqgxdMkx6az678dLw8juD6
 XvaoAGl7eCum+E0vuCZIzXCf9oLjYqJJcSeWOgUd4waQVdlVQOhgxSQLI6a7VJrXn7
 ayF3UNGbOFNIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=IgOkxJcV
Subject: [Buildroot] [PATCH] package/uclibc: fix compile with gcc 14.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add missing header file.

Fixes:
 http://autobuild.buildroot.net/results/e022040c15e1b1aebc539a0ca0e00b5a1888ccfe

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-futimesat-add-missing-header.patch   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/uclibc/0001-futimesat-add-missing-header.patch

diff --git a/package/uclibc/0001-futimesat-add-missing-header.patch b/package/uclibc/0001-futimesat-add-missing-header.patch
new file mode 100644
index 0000000000..f8af3290fa
--- /dev/null
+++ b/package/uclibc/0001-futimesat-add-missing-header.patch
@@ -0,0 +1,26 @@
+From 4bcf25e75df857806623ff80924675bf849a60d2 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 8 May 2024 10:08:08 +0200
+Subject: [PATCH] futimesat: add missing header
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=4bcf25e75df857806623ff80924675bf849a60d2
+---
+ libc/sysdeps/linux/common/futimesat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libc/sysdeps/linux/common/futimesat.c b/libc/sysdeps/linux/common/futimesat.c
+index fd19fea7c..bf36550dd 100644
+--- a/libc/sysdeps/linux/common/futimesat.c
++++ b/libc/sysdeps/linux/common/futimesat.c
+@@ -7,6 +7,7 @@
+  */
+ 
+ #include <sys/syscall.h>
++#include <sys/stat.h>
+ #include <sys/time.h>
+ 
+ #ifdef __NR_futimesat
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
